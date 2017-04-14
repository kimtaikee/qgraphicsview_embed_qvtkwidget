#ifndef WIDGET_H
#define WIDGET_H

#include <QWidget>

#define vtkRenderingCore_AUTOINIT 3(vtkInteractionStyle,vtkRenderingFreeType,vtkRenderingOpenGL2)
#define vtkRenderingVolume_AUTOINIT 1(vtkRenderingVolumeOpenGL2)

#include <vtkAutoInit.h>
#include <vtkSmartPointer.h>

VTK_MODULE_INIT(vtkRenderingOpenGL2)
VTK_MODULE_INIT(vtkInteractionStyle)
VTK_MODULE_INIT(vtkRenderingFreeType)
VTK_MODULE_INIT(vtkRenderingVolumeOpenGL2)

namespace Ui {
class Widget;
}

namespace QtCharts {
    class QChartView;
    class QChart;
}

class Widget : public QWidget
{
    Q_OBJECT

public:
    explicit Widget(QWidget *parent = 0);
    ~Widget();

private:
    Ui::Widget *m_ui;

    QtCharts::QChart* m_chart = nullptr;
};

#endif // WIDGET_H
