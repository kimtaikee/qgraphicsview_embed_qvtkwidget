CONFIG(debug, debug|release) {
    DEBUG_RELEASE = debug
} else {
    DEBUG_RELEASE = release
}

VTKVER = "7.1"
win32-msvc*:contains(QMAKE_HOST.arch, x86): {
    VTKPATH = "E:/VTK71"
}
win32-msvc*:contains(QMAKE_HOST.arch, x86_64): {
    VTKPATH = "E:/VTK71_64"
}
win32-g++:contains(QMAKE_HOST.arch, x86): {
    VTKPATH = "E:/VTK71"
    DEBUG_RELEASE = "mingw"
}

INCLUDEPATH *= $$VTKPATH/$${DEBUG_RELEASE}/include/vtk-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkGUISupportQtSQL-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkIOSQL-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtksqlite-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkViewsQt-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkViewsInfovis-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkGeovisCore-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkViewsContext2D-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkViewsCore-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkInteractionImage-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkInteractionWidgets-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkRenderingQt-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkGUISupportQt-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkRenderingVolumeOpenGL2-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkIOExport-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkRenderingContextOpenGL2-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkDomainsChemistryOpenGL2-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkRenderingOpenGL2-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkRenderingAnnotation-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkChartsCore-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkRenderingVolume-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkIOParallel-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkIOMINC-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkFiltersParallelImaging-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkRenderingLOD-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkRenderingLabel-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkRenderingContext2D-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkInfovisLayout-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkIOInfovis-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkIOImport-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkFiltersParallel-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkFiltersHybrid-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkRenderingImage-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkDomainsChemistry-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkRenderingFreeType-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkInteractionStyle-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkRenderingCore-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkInfovisCore-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkFiltersFlowPaths-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkFiltersModeling-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkFiltersGeneric-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkIOExodus-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkIOAMR-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkFiltersExtraction-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkFiltersSources-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkFiltersSMP-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkIOParallelXML-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkFiltersHyperTree-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkFiltersAMR-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkFiltersTexture-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkIONetCDF-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkParallelCore-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkImagingHybrid-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkFiltersImaging-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkImagingMorphological-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkImagingStencil-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkFiltersStatistics-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkImagingStatistics-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkIOLSDyna-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkIOImage-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkFiltersGeneral-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkIOXML-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkIOPLY-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkIOMovie-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkIOXMLParser-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkFiltersSelection-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkIOGeometry-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkFiltersGeometry-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkImagingGeneral-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkIOLegacy-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkImagingColor-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkImagingFourier-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkImagingSources-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkFiltersCore-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkImagingCore-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkIOCore-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkIOEnSight-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkImagingMath-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkFiltersProgrammable-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkFiltersVerdict-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkIOVideo-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkCommonExecutionModel-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkCommonComputationalGeometry-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkCommonColor-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkCommonDataModel-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkCommonMisc-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkCommonTransforms-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkCommonMath-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkCommonSystem-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkCommonCore-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkexoIIc-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkNetCDF_cxx-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkNetCDF-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkhdf5_hl-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkhdf5-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtktiff-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkproj4-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkfreetype-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkjpeg-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkmetaio-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkjsoncpp-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtksys-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtklibxml2-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkoggtheora-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkverdict-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkglew-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkpng-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkalglib-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkDICOMParser-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkexpat-$$VTKVER
LIBS += -L$$VTKPATH/$${DEBUG_RELEASE}/lib -lvtkzlib-$$VTKVER


