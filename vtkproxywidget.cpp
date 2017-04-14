#include "vtkproxywidget.h"
#include "eventfilter.h"

#include <vtkImageData.h>
#include <QVTKWidget.h>

#include <QPainter>
#include <QStyleOptionGraphicsItem>
#include <QGraphicsSceneResizeEvent>
#include <QDebug>
#include <QGraphicsScene>

static QImage vtkImageDataToQImage(vtkImageData* imageData)
{
    if (!imageData)
        return QImage();

    /// \todo retrieve just the UpdateExtent
    int width = imageData->GetDimensions()[0];
    int height = imageData->GetDimensions()[1];
    QImage image(width, height, QImage::Format_RGB32);
    QRgb* rgbPtr = reinterpret_cast<QRgb*>(image.bits()) + width * (height-1);
    unsigned char* colorsPtr = reinterpret_cast<unsigned char*>(
                imageData->GetScalarPointer());
    // mirror vertically
    for(int row = 0; row < height; ++row) {
        for (int col = 0; col < width; ++col) {
            // Swap rgb
            *(rgbPtr++) = QColor(colorsPtr[0], colorsPtr[1], colorsPtr[2]).rgb();
            colorsPtr +=  3;
        }
        rgbPtr -= width * 2;
    }
    return image;
}

VtkProxyWidget::VtkProxyWidget(QGraphicsItem *parent, Qt::WindowFlags wFlags)
{

}

void VtkProxyWidget::setWidget(QWidget* widget)
{
    m_vtkWidget = qobject_cast<QVTKWidget*>(widget);
    QGraphicsProxyWidget::setWidget(widget);

    EventFilter* ef = new EventFilter(this);
    ef->addFilteredObject(m_vtkWidget);
    m_vtkWidget->installEventFilter(ef);
    connect(ef, &EventFilter::filterEvent, [this] (QObject*, QEvent* e) {
       if (e->type() == QEvent::Paint ||
           e->type() == QEvent::MouseMove ||
           e->type() == QEvent::MouseButtonDblClick ||
           e->type() == QEvent::Wheel ||
           e->type() == QEvent::MouseButtonPress ||
           e->type() == QEvent::MouseButtonRelease)
           update();
    });
}

QWidget* VtkProxyWidget::widget() const
{
    return m_vtkWidget;
}

void VtkProxyWidget::paint(QPainter *painter, const QStyleOptionGraphicsItem *option, QWidget *widget)
{
    Q_UNUSED(widget)
    if (!m_vtkWidget)
        return;

    const QRect exposedWidgetRect = (option->exposedRect & rect()).toAlignedRect();
    if (exposedWidgetRect.isEmpty())
        return;

    vtkImageData* imgData = m_vtkWidget->cachedImage();
    QPixmap pixmap = QPixmap::fromImage(vtkImageDataToQImage(imgData));

    painter->drawPixmap(exposedWidgetRect, pixmap);
}

void VtkProxyWidget::resizeEvent(QGraphicsSceneResizeEvent *event)
{
    QGraphicsProxyWidget::resizeEvent(event);

    if (m_vtkWidget)
        m_vtkWidget->setFixedSize(size().toSize());
}



