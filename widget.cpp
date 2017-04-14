#include "widget.h"
#include "ui_widget.h"
#include "vtkproxywidget.h"

#include <vtkCubeSource.h>
#include <vtkPolyDataMapper.h>
#include <vtkActor.h>
#include <vtkRenderer.h>
#include <vtkSmartPointer.h>
#include <vtkRenderWindow.h>
#include <vtkImageData.h>
#include <vtkCamera.h>

#include <QVTKWidget.h>
#include <QtCharts/QChartView>
#include <QtCharts/QChart>
#include <QtCharts/QStackedBarSeries>
#include <QtCharts/QHorizontalBarSeries>
#include <QtCharts/QBarSet>

using namespace QtCharts;

template <class T>
auto createSourceActor()
{
    vtkSmartPointer<T> source = vtkSmartPointer<T>::New();

    vtkSmartPointer<vtkPolyDataMapper> mapper = vtkSmartPointer<vtkPolyDataMapper>::New();
    mapper->SetInputConnection(source->GetOutputPort());

    vtkSmartPointer<vtkActor> actor = vtkSmartPointer<vtkActor>::New();
    actor->SetMapper(mapper);
    return actor;
}

Widget::Widget(QWidget *parent) :
    QWidget(parent),
    m_ui(new Ui::Widget)
{
    m_ui->setupUi(this);
    setWindowTitle(tr("QGraphicsView embeds QVTKWidget Demo"));

    QGraphicsScene* scene = new QGraphicsScene(this);
    m_ui->graphicsView->setScene(scene);

    // Create chart
    m_chart = new QChart();
    m_chart->setBackgroundBrush(QBrush(Qt::lightGray));
    m_chart->setFlag(QGraphicsItem::ItemIsMovable);
    m_chart->resize(QSize(400, 400));
    m_chart->setPos(10, 10);
    scene->addItem(m_chart);

    QStackedBarSeries* sbs = new QStackedBarSeries(this);
    QStackedBarSeries* sbs2 = new QStackedBarSeries(this);

    QBarSet* bs1 = new QBarSet("Test 1", this);
    bs1->append(QList<qreal>() << 0.4 << 0.7 << 0.1 << 1.1 << 5.4);
    sbs->append(bs1);

    QBarSet* bs2 = new QBarSet("Test 2", this);
    bs2->append(QList<qreal>() << 0.6 << 2.3 << 6.5 << 8.7 << 0.4);
    sbs->append(bs2);
    sbs2->append(bs2);

    m_chart->addSeries(sbs);
    m_chart->addSeries(sbs2);

    QHorizontalBarSeries* hbs = new QHorizontalBarSeries(this);
    hbs->append(bs1);
    hbs->append(bs2);
    m_chart->addSeries(hbs);
    m_chart->createDefaultAxes();

    /// Create 3D window
    QVTKWidget* vtkWidget = new QVTKWidget();
    vtkWidget->resize(QSize(300, 300));

    vtkWidget->setAttribute(Qt::WA_PaintOnScreen, true);
    vtkWidget->setStyleSheet("border: 1px solid black;");
    vtkSmartPointer<vtkRenderer> renderer = vtkSmartPointer<vtkRenderer>::New();
    vtkWidget->GetRenderWindow()->AddRenderer(renderer);
    renderer->AddActor(createSourceActor<vtkCubeSource>());

    VtkProxyWidget* proxyWidget = new VtkProxyWidget();
    scene->addItem(proxyWidget);
    proxyWidget->setWidget(vtkWidget);
    proxyWidget->setPos(50, 50);

    // when moving chart under vtkwidget, we need update vtkproxywidget explicity
    connect(m_chart, &QGraphicsObject::xChanged, [=] {
        proxyWidget->update();
    });

    connect(m_chart, &QGraphicsObject::yChanged, [=] {
        proxyWidget->update();
    });

    renderer->ResetCamera();
}

Widget::~Widget()
{
    delete m_ui;
}
