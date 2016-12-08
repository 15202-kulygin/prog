#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QTimer>



namespace Ui {
class MainWindow;
}

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit MainWindow(QWidget *parent = 0);
    ~MainWindow();

private slots:
    void on_Step_clicked();
    void on_NSteps_clicked();
    void overflowedTime();

    void on_Start_clicked();

    void on_Stop_clicked();

    void on_Clear_clicked();

private:
    Ui::MainWindow *ui;
    QTimer * timer;
};

#endif // MAINWINDOW_H
