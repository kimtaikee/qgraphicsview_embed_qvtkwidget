#ifndef VTKPROXYWIDGET_H
#define VTKPROXYWIDGET_H

#include <QGraphicsProxyWidget>

class QVTKWidget;
class VtkProxyWidget : public QGraphicsProxyWidget
{
    Q_OBJECT
public:
    explicit VtkProxyWidget(QGraphicsItem *parent = Q_NULLPTR, Qt::WindowFlags wFlags = Qt::WindowFlags());

    void setWidget(QWidget* widget);
    QWidget* widget() const;

    void paint(QPainter *painter, const QStyleOptionGraphicsItem *option, QWidget *widget);

protected:
    void resizeEvent(QGraphicsSceneResizeEvent *event) Q_DECL_OVERRIDE;
    void wheelEvent(QGraphicsSceneWheelEvent *event) Q_DECL_OVERRIDE;

protected:
    QVTKWidget* m_vtkWidget = nullptr;
};

#endif // VTKPROXYWIDGET_H
