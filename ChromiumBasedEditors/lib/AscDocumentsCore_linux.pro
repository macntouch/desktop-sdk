QT -= core
QT -= gui

TARGET = ascdocumentscore
TEMPLATE = lib

CONFIG += shared
CONFIG += plugin

QMAKE_CXXFLAGS += -fPIC

CONFIG += core_static_link_libstd

CORE_ROOT_DIR = $$PWD/../../../core
PWD_ROOT_DIR = $$PWD
include($$CORE_ROOT_DIR/Common/base.pri)

CONFIG -= debug_and_release debug_and_release_target
#QMAKE_CXXFLAGS_RELEASE -= -Zc:strictStrings

QMAKE_LFLAGS += -Wl,--rpath=./
QMAKE_LFLAGS += -static-libstdc++ -static-libgcc

linux-g++:contains(QMAKE_HOST.arch, x86_64):{
    PLATFORM_BUILD = linux_64
    message(linux64)
}
linux-g++:!contains(QMAKE_HOST.arch, x86_64):{
    PLATFORM_BUILD = linux_32
    message(linux32)
}

CONFIG(debug, debug|release) {
    DESTINATION_BUILD_OBJ = $$PWD/build/$$PLATFORM_BUILD/Debug/obj
    DESTINATION_BUILD_MOC = $$PWD/build/$$PLATFORM_BUILD/Debug/moc
    DESTINATION_BUILD_QMAKE = $$PWD/build/$$PLATFORM_BUILD/Debug
    DESTINATION_BUILD = $$PWD/../../../core/build/lib/$$PLATFORM_BUILD
    message(debug)
} else {
    DESTINATION_BUILD_OBJ = $$PWD/build/$$PLATFORM_BUILD/Release/obj
    DESTINATION_BUILD_MOC = $$PWD/build/$$PLATFORM_BUILD/Release/moc
    DESTINATION_BUILD_QMAKE = $$PWD/build/$$PLATFORM_BUILD/Release
    DESTINATION_BUILD = $$PWD/../../../core/build/lib/$$PLATFORM_BUILD
    message(release)
}

DESTDIR     = $$DESTINATION_BUILD
OBJECTS_DIR = $$DESTINATION_BUILD_OBJ
MOC_DIR     = $$DESTINATION_BUILD_MOC

# common projects --------------------------------------
#zlib
CONFIG += build_all_zlib build_zlib_as_sources
include($$PWD/../../../core/OfficeUtils/OfficeUtils.pri)
#hunspell

DEFINES += HUNSPELL_STATIC
CONFIG += building_hunspell
include($$PWD/../../../core/DesktopEditor/hunspell-1.3.3/src/qt/hunspell.pri)

#graphics
#include($$PWD/../../../core/DesktopEditor/Qt_build/graphics/project/graphics.pri)

DEFINES += \
    PDFREADER_USE_DYNAMIC_LIBRARY \
    DJVU_USE_DYNAMIC_LIBRARY \
    XPS_USE_DYNAMIC_LIBRARY \
    HTMLRENDERER_USE_DYNAMIC_LIBRARY

LIBS += -L$$PWD/../../../core/build/lib/$$PLATFORM_BUILD -lgraphics -llibxml -lLicenceManager
LIBS += -L$$PWD/../../../core/build/lib/$$PLATFORM_BUILD -lPdfReader -lPdfWriter -lDjVuFile -lXpsFile -lHtmlRenderer
# ------------------------------------------------------

####################  BOOST  ###########################

CONFIG += core_boost_libs
CONFIG += core_boost_fpic
include($$CORE_ROOT_DIR/Common/3dParty/boost/boost.pri)

########################################################

CONFIG += link_pkgconfig c++11
PKGCONFIG += glib-2.0 gdk-2.0 gtkglext-1.0 atk cairo gtk+-unix-print-2.0

LIBS += -lcurl

DEFINES += \
    LINUX \
    _LINUX \
    _LINUX_QT

DEFINES += QT_NO_SIGNALS_SLOTS_KEYWORDS

DEFINES += \
    "__STD_C" \
    "USING_CEF_SHARED" \
    "NDEBUG"

INCLUDEPATH += \
    src/cef/linux

LIBS += -L$$PWD/../../../core/build/cef/$$PLATFORM_BUILD -lcef

HEADERS += \
    src/cef/linux/cefclient/browser/binding_test.h \
    src/cef/linux/cefclient/browser/browser_window.h \
    src/cef/linux/cefclient/browser/browser_window_osr_gtk.h \
    src/cef/linux/cefclient/browser/browser_window_std_gtk.h \
    src/cef/linux/cefclient/browser/bytes_write_handler.h \
    src/cef/linux/cefclient/browser/client_app_browser.h \
    src/cef/linux/cefclient/browser/client_handler.h \
    src/cef/linux/cefclient/browser/client_handler_osr.h \
    src/cef/linux/cefclient/browser/client_handler_std.h \
    src/cef/linux/cefclient/browser/client_types.h \
    src/cef/linux/cefclient/browser/dialog_handler_gtk.h \
    src/cef/linux/cefclient/browser/dialog_test.h \
    src/cef/linux/cefclient/browser/geometry_util.h \
    src/cef/linux/cefclient/browser/main_context.h \
    src/cef/linux/cefclient/browser/main_context_impl.h \
    src/cef/linux/cefclient/browser/main_message_loop.h \
    src/cef/linux/cefclient/browser/main_message_loop_std.h \
    src/cef/linux/cefclient/browser/osr_dragdrop_events.h \
    src/cef/linux/cefclient/browser/osr_renderer.h \
    src/cef/linux/cefclient/browser/preferences_test.h \
    src/cef/linux/cefclient/browser/print_handler_gtk.h \
    src/cef/linux/cefclient/browser/resource.h \
    src/cef/linux/cefclient/browser/resource_util.h \
    src/cef/linux/cefclient/browser/root_window.h \
    src/cef/linux/cefclient/browser/root_window_gtk.h \
    src/cef/linux/cefclient/browser/root_window_manager.h \
    src/cef/linux/cefclient/browser/scheme_test.h \
    src/cef/linux/cefclient/browser/temp_window.h \
    src/cef/linux/cefclient/browser/temp_window_x11.h \
    src/cef/linux/cefclient/browser/test_runner.h \
    src/cef/linux/cefclient/browser/urlrequest_test.h \
    src/cef/linux/cefclient/browser/window_test.h \
    src/cef/linux/cefclient/browser/response_filter_test.h \
    src/cef/linux/cefclient/common/client_app.h \
    src/cef/linux/cefclient/common/client_app_other.h \
    src/cef/linux/cefclient/common/client_switches.h \
    src/cef/linux/cefclient/common/scheme_test_common.h \
    src/cef/linux/cefclient/renderer/client_app_renderer.h \
    src/cef/linux/cefclient/renderer/client_renderer.h \
    src/cef/linux/cefclient/renderer/performance_test.h \
    src/cef/linux/cefclient/renderer/performance_test_setup.h \
    src/cef/linux/include/base/internal/cef_atomicops_atomicword_compat.h \
    src/cef/linux/include/base/internal/cef_atomicops_x86_gcc.h \
    src/cef/linux/include/base/internal/cef_bind_internal.h \
    src/cef/linux/include/base/internal/cef_callback_internal.h \
    src/cef/linux/include/base/internal/cef_lock_impl.h \
    src/cef/linux/include/base/internal/cef_raw_scoped_refptr_mismatch_checker.h \
    src/cef/linux/include/base/internal/cef_thread_checker_impl.h \
    src/cef/linux/include/base/cef_atomic_ref_count.h \
    src/cef/linux/include/base/cef_atomicops.h \
    src/cef/linux/include/base/cef_basictypes.h \
    src/cef/linux/include/base/cef_bind.h \
    src/cef/linux/include/base/cef_bind_helpers.h \
    src/cef/linux/include/base/cef_build.h \
    src/cef/linux/include/base/cef_callback.h \
    src/cef/linux/include/base/cef_callback_forward.h \
    src/cef/linux/include/base/cef_callback_helpers.h \
    src/cef/linux/include/base/cef_callback_list.h \
    src/cef/linux/include/base/cef_cancelable_callback.h \
    src/cef/linux/include/base/cef_lock.h \
    src/cef/linux/include/base/cef_logging.h \
    src/cef/linux/include/base/cef_macros.h \
    src/cef/linux/include/base/cef_move.h \
    src/cef/linux/include/base/cef_platform_thread.h \
    src/cef/linux/include/base/cef_ref_counted.h \
    src/cef/linux/include/base/cef_scoped_ptr.h \
    src/cef/linux/include/base/cef_string16.h \
    src/cef/linux/include/base/cef_template_util.h \
    src/cef/linux/include/base/cef_thread_checker.h \
    src/cef/linux/include/base/cef_thread_collision_warner.h \
    src/cef/linux/include/base/cef_trace_event.h \
    src/cef/linux/include/base/cef_tuple.h \
    src/cef/linux/include/base/cef_weak_ptr.h \
    src/cef/linux/include/capi/cef_app_capi.h \
    src/cef/linux/include/capi/cef_auth_callback_capi.h \
    src/cef/linux/include/capi/cef_base_capi.h \
    src/cef/linux/include/capi/cef_browser_capi.h \
    src/cef/linux/include/capi/cef_browser_process_handler_capi.h \
    src/cef/linux/include/capi/cef_callback_capi.h \
    src/cef/linux/include/capi/cef_client_capi.h \
    src/cef/linux/include/capi/cef_command_line_capi.h \
    src/cef/linux/include/capi/cef_context_menu_handler_capi.h \
    src/cef/linux/include/capi/cef_cookie_capi.h \
    src/cef/linux/include/capi/cef_dialog_handler_capi.h \
    src/cef/linux/include/capi/cef_display_handler_capi.h \
    src/cef/linux/include/capi/cef_dom_capi.h \
    src/cef/linux/include/capi/cef_download_handler_capi.h \
    src/cef/linux/include/capi/cef_download_item_capi.h \
    src/cef/linux/include/capi/cef_drag_data_capi.h \
    src/cef/linux/include/capi/cef_drag_handler_capi.h \
    src/cef/linux/include/capi/cef_find_handler_capi.h \
    src/cef/linux/include/capi/cef_focus_handler_capi.h \
    src/cef/linux/include/capi/cef_frame_capi.h \
    src/cef/linux/include/capi/cef_geolocation_capi.h \
    src/cef/linux/include/capi/cef_geolocation_handler_capi.h \
    src/cef/linux/include/capi/cef_jsdialog_handler_capi.h \
    src/cef/linux/include/capi/cef_keyboard_handler_capi.h \
    src/cef/linux/include/capi/cef_life_span_handler_capi.h \
    src/cef/linux/include/capi/cef_load_handler_capi.h \
    src/cef/linux/include/capi/cef_menu_model_capi.h \
    src/cef/linux/include/capi/cef_navigation_entry_capi.h \
    src/cef/linux/include/capi/cef_origin_whitelist_capi.h \
    src/cef/linux/include/capi/cef_parser_capi.h \
    src/cef/linux/include/capi/cef_path_util_capi.h \
    src/cef/linux/include/capi/cef_print_handler_capi.h \
    src/cef/linux/include/capi/cef_print_settings_capi.h \
    src/cef/linux/include/capi/cef_process_message_capi.h \
    src/cef/linux/include/capi/cef_process_util_capi.h \
    src/cef/linux/include/capi/cef_render_handler_capi.h \
    src/cef/linux/include/capi/cef_render_process_handler_capi.h \
    src/cef/linux/include/capi/cef_request_capi.h \
    src/cef/linux/include/capi/cef_request_context_capi.h \
    src/cef/linux/include/capi/cef_request_context_handler_capi.h \
    src/cef/linux/include/capi/cef_request_handler_capi.h \
    src/cef/linux/include/capi/cef_resource_bundle_capi.h \
    src/cef/linux/include/capi/cef_resource_bundle_handler_capi.h \
    src/cef/linux/include/capi/cef_resource_handler_capi.h \
    src/cef/linux/include/capi/cef_response_capi.h \
    src/cef/linux/include/capi/cef_response_filter_capi.h \
    src/cef/linux/include/capi/cef_scheme_capi.h \
    src/cef/linux/include/capi/cef_ssl_info_capi.h \
    src/cef/linux/include/capi/cef_stream_capi.h \
    src/cef/linux/include/capi/cef_string_visitor_capi.h \
    src/cef/linux/include/capi/cef_task_capi.h \
    src/cef/linux/include/capi/cef_trace_capi.h \
    src/cef/linux/include/capi/cef_urlrequest_capi.h \
    src/cef/linux/include/capi/cef_v8_capi.h \
    src/cef/linux/include/capi/cef_values_capi.h \
    src/cef/linux/include/capi/cef_web_plugin_capi.h \
    src/cef/linux/include/capi/cef_xml_reader_capi.h \
    src/cef/linux/include/capi/cef_zip_reader_capi.h \
    src/cef/linux/include/internal/cef_export.h \
    src/cef/linux/include/internal/cef_linux.h \
    src/cef/linux/include/internal/cef_logging_internal.h \
    src/cef/linux/include/internal/cef_ptr.h \
    src/cef/linux/include/internal/cef_string.h \
    src/cef/linux/include/internal/cef_string_list.h \
    src/cef/linux/include/internal/cef_string_map.h \
    src/cef/linux/include/internal/cef_string_multimap.h \
    src/cef/linux/include/internal/cef_string_types.h \
    src/cef/linux/include/internal/cef_string_wrappers.h \
    src/cef/linux/include/internal/cef_thread_internal.h \
    src/cef/linux/include/internal/cef_time.h \
    src/cef/linux/include/internal/cef_trace_event_internal.h \
    src/cef/linux/include/internal/cef_types.h \
    src/cef/linux/include/internal/cef_types_linux.h \
    src/cef/linux/include/internal/cef_types_wrappers.h \
    src/cef/linux/include/wrapper/cef_byte_read_handler.h \
    src/cef/linux/include/wrapper/cef_closure_task.h \
    src/cef/linux/include/wrapper/cef_helpers.h \
    src/cef/linux/include/wrapper/cef_message_router.h \
    src/cef/linux/include/wrapper/cef_resource_manager.h \
    src/cef/linux/include/wrapper/cef_stream_resource_handler.h \
    src/cef/linux/include/wrapper/cef_xml_object.h \
    src/cef/linux/include/wrapper/cef_zip_archive.h \
    src/cef/linux/include/cef_app.h \
    src/cef/linux/include/cef_auth_callback.h \
    src/cef/linux/include/cef_base.h \
    src/cef/linux/include/cef_browser.h \
    src/cef/linux/include/cef_browser_process_handler.h \
    src/cef/linux/include/cef_callback.h \
    src/cef/linux/include/cef_client.h \
    src/cef/linux/include/cef_command_line.h \
    src/cef/linux/include/cef_context_menu_handler.h \
    src/cef/linux/include/cef_cookie.h \
    src/cef/linux/include/cef_dialog_handler.h \
    src/cef/linux/include/cef_display_handler.h \
    src/cef/linux/include/cef_dom.h \
    src/cef/linux/include/cef_download_handler.h \
    src/cef/linux/include/cef_download_item.h \
    src/cef/linux/include/cef_drag_data.h \
    src/cef/linux/include/cef_drag_handler.h \
    src/cef/linux/include/cef_find_handler.h \
    src/cef/linux/include/cef_focus_handler.h \
    src/cef/linux/include/cef_frame.h \
    src/cef/linux/include/cef_geolocation.h \
    src/cef/linux/include/cef_geolocation_handler.h \
    src/cef/linux/include/cef_jsdialog_handler.h \
    src/cef/linux/include/cef_keyboard_handler.h \
    src/cef/linux/include/cef_life_span_handler.h \
    src/cef/linux/include/cef_load_handler.h \
    src/cef/linux/include/cef_menu_model.h \
    src/cef/linux/include/cef_navigation_entry.h \
    src/cef/linux/include/cef_origin_whitelist.h \
    src/cef/linux/include/cef_pack_resources.h \
    src/cef/linux/include/cef_pack_strings.h \
    src/cef/linux/include/cef_parser.h \
    src/cef/linux/include/cef_path_util.h \
    src/cef/linux/include/cef_print_handler.h \
    src/cef/linux/include/cef_print_settings.h \
    src/cef/linux/include/cef_process_message.h \
    src/cef/linux/include/cef_process_util.h \
    src/cef/linux/include/cef_render_handler.h \
    src/cef/linux/include/cef_render_process_handler.h \
    src/cef/linux/include/cef_request.h \
    src/cef/linux/include/cef_request_context.h \
    src/cef/linux/include/cef_request_context_handler.h \
    src/cef/linux/include/cef_request_handler.h \
    src/cef/linux/include/cef_resource_bundle.h \
    src/cef/linux/include/cef_resource_bundle_handler.h \
    src/cef/linux/include/cef_resource_handler.h \
    src/cef/linux/include/cef_response.h \
    src/cef/linux/include/cef_response_filter.h \
    src/cef/linux/include/cef_scheme.h \
    src/cef/linux/include/cef_ssl_info.h \
    src/cef/linux/include/cef_stream.h \
    src/cef/linux/include/cef_string_visitor.h \
    src/cef/linux/include/cef_task.h \
    src/cef/linux/include/cef_trace.h \
    src/cef/linux/include/cef_urlrequest.h \
    src/cef/linux/include/cef_v8.h \
    src/cef/linux/include/cef_values.h \
    src/cef/linux/include/cef_version.h \
    src/cef/linux/include/cef_web_plugin.h \
    src/cef/linux/include/cef_xml_reader.h \
    src/cef/linux/include/cef_zip_reader.h \
    src/cef/linux/libcef_dll/cpptoc/app_cpptoc.h \
    src/cef/linux/libcef_dll/cpptoc/base_cpptoc.h \
    src/cef/linux/libcef_dll/cpptoc/browser_process_handler_cpptoc.h \
    src/cef/linux/libcef_dll/cpptoc/client_cpptoc.h \
    src/cef/linux/libcef_dll/cpptoc/completion_callback_cpptoc.h \
    src/cef/linux/libcef_dll/cpptoc/context_menu_handler_cpptoc.h \
    src/cef/linux/libcef_dll/cpptoc/cookie_visitor_cpptoc.h \
    src/cef/linux/libcef_dll/cpptoc/cpptoc.h \
    src/cef/linux/libcef_dll/cpptoc/delete_cookies_callback_cpptoc.h \
    src/cef/linux/libcef_dll/cpptoc/dialog_handler_cpptoc.h \
    src/cef/linux/libcef_dll/cpptoc/display_handler_cpptoc.h \
    src/cef/linux/libcef_dll/cpptoc/domvisitor_cpptoc.h \
    src/cef/linux/libcef_dll/cpptoc/download_handler_cpptoc.h \
    src/cef/linux/libcef_dll/cpptoc/drag_handler_cpptoc.h \
    src/cef/linux/libcef_dll/cpptoc/end_tracing_callback_cpptoc.h \
    src/cef/linux/libcef_dll/cpptoc/find_handler_cpptoc.h \
    src/cef/linux/libcef_dll/cpptoc/focus_handler_cpptoc.h \
    src/cef/linux/libcef_dll/cpptoc/geolocation_handler_cpptoc.h \
    src/cef/linux/libcef_dll/cpptoc/get_geolocation_callback_cpptoc.h \
    src/cef/linux/libcef_dll/cpptoc/jsdialog_handler_cpptoc.h \
    src/cef/linux/libcef_dll/cpptoc/keyboard_handler_cpptoc.h \
    src/cef/linux/libcef_dll/cpptoc/life_span_handler_cpptoc.h \
    src/cef/linux/libcef_dll/cpptoc/load_handler_cpptoc.h \
    src/cef/linux/libcef_dll/cpptoc/navigation_entry_visitor_cpptoc.h \
    src/cef/linux/libcef_dll/cpptoc/pdf_print_callback_cpptoc.h \
    src/cef/linux/libcef_dll/cpptoc/print_handler_cpptoc.h \
    src/cef/linux/libcef_dll/cpptoc/read_handler_cpptoc.h \
    src/cef/linux/libcef_dll/cpptoc/render_handler_cpptoc.h \
    src/cef/linux/libcef_dll/cpptoc/render_process_handler_cpptoc.h \
    src/cef/linux/libcef_dll/cpptoc/request_context_handler_cpptoc.h \
    src/cef/linux/libcef_dll/cpptoc/request_handler_cpptoc.h \
    src/cef/linux/libcef_dll/cpptoc/resource_bundle_handler_cpptoc.h \
    src/cef/linux/libcef_dll/cpptoc/resource_handler_cpptoc.h \
    src/cef/linux/libcef_dll/cpptoc/resolve_callback_cpptoc.h \
    src/cef/linux/libcef_dll/cpptoc/response_filter_cpptoc.h \
    src/cef/linux/libcef_dll/cpptoc/run_file_dialog_callback_cpptoc.h \
    src/cef/linux/libcef_dll/cpptoc/scheme_handler_factory_cpptoc.h \
    src/cef/linux/libcef_dll/cpptoc/set_cookie_callback_cpptoc.h \
    src/cef/linux/libcef_dll/cpptoc/string_visitor_cpptoc.h \
    src/cef/linux/libcef_dll/cpptoc/task_cpptoc.h \
    src/cef/linux/libcef_dll/cpptoc/urlrequest_client_cpptoc.h \
    src/cef/linux/libcef_dll/cpptoc/v8accessor_cpptoc.h \
    src/cef/linux/libcef_dll/cpptoc/v8handler_cpptoc.h \
    src/cef/linux/libcef_dll/cpptoc/web_plugin_info_visitor_cpptoc.h \
    src/cef/linux/libcef_dll/cpptoc/web_plugin_unstable_callback_cpptoc.h \
    src/cef/linux/libcef_dll/cpptoc/write_handler_cpptoc.h \
    src/cef/linux/libcef_dll/ctocpp/auth_callback_ctocpp.h \
    src/cef/linux/libcef_dll/ctocpp/before_download_callback_ctocpp.h \
    src/cef/linux/libcef_dll/ctocpp/binary_value_ctocpp.h \
    src/cef/linux/libcef_dll/ctocpp/browser_ctocpp.h \
    src/cef/linux/libcef_dll/ctocpp/browser_host_ctocpp.h \
    src/cef/linux/libcef_dll/ctocpp/callback_ctocpp.h \
    src/cef/linux/libcef_dll/ctocpp/command_line_ctocpp.h \
    src/cef/linux/libcef_dll/ctocpp/context_menu_params_ctocpp.h \
    src/cef/linux/libcef_dll/ctocpp/cookie_manager_ctocpp.h \
    src/cef/linux/libcef_dll/ctocpp/ctocpp.h \
    src/cef/linux/libcef_dll/ctocpp/dictionary_value_ctocpp.h \
    src/cef/linux/libcef_dll/ctocpp/domdocument_ctocpp.h \
    src/cef/linux/libcef_dll/ctocpp/domnode_ctocpp.h \
    src/cef/linux/libcef_dll/ctocpp/download_item_callback_ctocpp.h \
    src/cef/linux/libcef_dll/ctocpp/download_item_ctocpp.h \
    src/cef/linux/libcef_dll/ctocpp/drag_data_ctocpp.h \
    src/cef/linux/libcef_dll/ctocpp/file_dialog_callback_ctocpp.h \
    src/cef/linux/libcef_dll/ctocpp/frame_ctocpp.h \
    src/cef/linux/libcef_dll/ctocpp/geolocation_callback_ctocpp.h \
    src/cef/linux/libcef_dll/ctocpp/jsdialog_callback_ctocpp.h \
    src/cef/linux/libcef_dll/ctocpp/list_value_ctocpp.h \
    src/cef/linux/libcef_dll/ctocpp/menu_model_ctocpp.h \
    src/cef/linux/libcef_dll/ctocpp/navigation_entry_ctocpp.h \
    src/cef/linux/libcef_dll/ctocpp/post_data_ctocpp.h \
    src/cef/linux/libcef_dll/ctocpp/post_data_element_ctocpp.h \
    src/cef/linux/libcef_dll/ctocpp/print_dialog_callback_ctocpp.h \
    src/cef/linux/libcef_dll/ctocpp/print_job_callback_ctocpp.h \
    src/cef/linux/libcef_dll/ctocpp/print_settings_ctocpp.h \
    src/cef/linux/libcef_dll/ctocpp/process_message_ctocpp.h \
    src/cef/linux/libcef_dll/ctocpp/request_callback_ctocpp.h \
    src/cef/linux/libcef_dll/ctocpp/request_context_ctocpp.h \
    src/cef/linux/libcef_dll/ctocpp/request_ctocpp.h \
    src/cef/linux/libcef_dll/ctocpp/response_ctocpp.h \
    src/cef/linux/libcef_dll/ctocpp/resource_bundle_ctocpp.h \
    src/cef/linux/libcef_dll/ctocpp/run_context_menu_callback_ctocpp.h \
    src/cef/linux/libcef_dll/ctocpp/scheme_registrar_ctocpp.h \
    src/cef/linux/libcef_dll/ctocpp/sslcert_principal_ctocpp.h \
    src/cef/linux/libcef_dll/ctocpp/sslinfo_ctocpp.h \
    src/cef/linux/libcef_dll/ctocpp/stream_reader_ctocpp.h \
    src/cef/linux/libcef_dll/ctocpp/stream_writer_ctocpp.h \
    src/cef/linux/libcef_dll/ctocpp/task_runner_ctocpp.h \
    src/cef/linux/libcef_dll/ctocpp/urlrequest_ctocpp.h \
    src/cef/linux/libcef_dll/ctocpp/v8context_ctocpp.h \
    src/cef/linux/libcef_dll/ctocpp/v8exception_ctocpp.h \
    src/cef/linux/libcef_dll/ctocpp/v8stack_frame_ctocpp.h \
    src/cef/linux/libcef_dll/ctocpp/v8stack_trace_ctocpp.h \
    src/cef/linux/libcef_dll/ctocpp/v8value_ctocpp.h \
    src/cef/linux/libcef_dll/ctocpp/value_ctocpp.h \
    src/cef/linux/libcef_dll/ctocpp/web_plugin_info_ctocpp.h \
    src/cef/linux/libcef_dll/ctocpp/xml_reader_ctocpp.h \
    src/cef/linux/libcef_dll/ctocpp/zip_reader_ctocpp.h \
    src/cef/linux/libcef_dll/wrapper/cef_browser_info_map.h \
    src/cef/linux/libcef_dll/transfer_util.h \
    src/cef/linux/libcef_dll/wrapper_types.h

SOURCES += \
    src/cef/linux/cefclient/browser/binding_test.cc \
    src/cef/linux/cefclient/browser/browser_window.cc \
    src/cef/linux/cefclient/browser/browser_window_osr_gtk.cc \
    src/cef/linux/cefclient/browser/browser_window_std_gtk.cc \
    src/cef/linux/cefclient/browser/bytes_write_handler.cc \
    src/cef/linux/cefclient/browser/client_app_browser.cc \
    src/cef/linux/cefclient/browser/client_app_delegates_browser.cc \
    src/cef/linux/cefclient/browser/client_handler.cc \
    src/cef/linux/cefclient/browser/client_handler_osr.cc \
    src/cef/linux/cefclient/browser/client_handler_std.cc \
    src/cef/linux/cefclient/browser/dialog_handler_gtk.cc \
    src/cef/linux/cefclient/browser/dialog_test.cc \
    src/cef/linux/cefclient/browser/geometry_util.cc \
    src/cef/linux/cefclient/browser/main_context.cc \
    src/cef/linux/cefclient/browser/main_context_impl.cc \
    src/cef/linux/cefclient/browser/main_context_impl_posix.cc \
    src/cef/linux/cefclient/browser/main_message_loop.cc \
    src/cef/linux/cefclient/browser/main_message_loop_std.cc \
src/cef/linux/cefclient/browser/resource_util.cc \
src/cef/linux/cefclient/browser/root_window_create.cc \
src/cef/linux/cefclient/browser/root_window_views.cc \
src/cef/linux/cefclient/browser/views_window.cc \
    src/cef/linux/cefclient/browser/osr_renderer.cc \
    src/cef/linux/cefclient/browser/preferences_test.cc \
    src/cef/linux/cefclient/browser/print_handler_gtk.cc \
    src/cef/linux/cefclient/browser/resource_util_linux.cc \
    src/cef/linux/cefclient/browser/resource_util_posix.cc \
    src/cef/linux/cefclient/browser/root_window.cc \
    src/cef/linux/cefclient/browser/root_window_gtk.cc \
    src/cef/linux/cefclient/browser/root_window_manager.cc \
    src/cef/linux/cefclient/browser/scheme_test.cc \
    src/cef/linux/cefclient/browser/temp_window_x11.cc \
    src/cef/linux/cefclient/browser/test_runner.cc \
    src/cef/linux/cefclient/browser/urlrequest_test.cc \
    src/cef/linux/cefclient/browser/window_test.cc \
src/cef/linux/cefclient/browser/window_test_runner.cc \
src/cef/linux/cefclient/browser/window_test_runner_gtk.cc \
src/cef/linux/cefclient/browser/window_test_runner_views.cc \
    src/cef/linux/cefclient/browser/response_filter_test.cc \
    src/cef/linux/cefclient/common/client_app.cc \
    src/cef/linux/cefclient/common/client_app_delegates_common.cc \
    src/cef/linux/cefclient/common/client_app_other.cc \
    src/cef/linux/cefclient/common/client_switches.cc \
    src/cef/linux/cefclient/common/scheme_test_common.cc \
    src/cef/linux/cefclient/renderer/client_app_delegates_renderer.cc \
    src/cef/linux/cefclient/renderer/client_app_renderer.cc \
    src/cef/linux/cefclient/renderer/client_renderer.cc \
    src/cef/linux/cefclient/renderer/performance_test.cc \
    src/cef/linux/cefclient/renderer/performance_test_tests.cc \
    src/cef/linux/libcef_dll/base/cef_atomicops_x86_gcc.cc \
    src/cef/linux/libcef_dll/base/cef_bind_helpers.cc \
    src/cef/linux/libcef_dll/base/cef_callback_helpers.cc \
    src/cef/linux/libcef_dll/base/cef_callback_internal.cc \
    src/cef/linux/libcef_dll/base/cef_lock.cc \
    src/cef/linux/libcef_dll/base/cef_lock_impl.cc \
    src/cef/linux/libcef_dll/base/cef_logging.cc \
    src/cef/linux/libcef_dll/base/cef_ref_counted.cc \
    src/cef/linux/libcef_dll/base/cef_string16.cc \
    src/cef/linux/libcef_dll/base/cef_thread_checker_impl.cc \
    src/cef/linux/libcef_dll/base/cef_thread_collision_warner.cc \
    src/cef/linux/libcef_dll/base/cef_weak_ptr.cc \
    src/cef/linux/libcef_dll/cpptoc/app_cpptoc.cc \
    src/cef/linux/libcef_dll/cpptoc/base_cpptoc.cc \
    src/cef/linux/libcef_dll/cpptoc/browser_process_handler_cpptoc.cc \
    src/cef/linux/libcef_dll/cpptoc/client_cpptoc.cc \
    src/cef/linux/libcef_dll/cpptoc/completion_callback_cpptoc.cc \
    src/cef/linux/libcef_dll/cpptoc/context_menu_handler_cpptoc.cc \
    src/cef/linux/libcef_dll/cpptoc/cookie_visitor_cpptoc.cc \
    src/cef/linux/libcef_dll/cpptoc/delete_cookies_callback_cpptoc.cc \
    src/cef/linux/libcef_dll/cpptoc/dialog_handler_cpptoc.cc \
    src/cef/linux/libcef_dll/cpptoc/display_handler_cpptoc.cc \
    src/cef/linux/libcef_dll/cpptoc/domvisitor_cpptoc.cc \
    src/cef/linux/libcef_dll/cpptoc/download_handler_cpptoc.cc \
    src/cef/linux/libcef_dll/cpptoc/drag_handler_cpptoc.cc \
    src/cef/linux/libcef_dll/cpptoc/end_tracing_callback_cpptoc.cc \
    src/cef/linux/libcef_dll/cpptoc/find_handler_cpptoc.cc \
    src/cef/linux/libcef_dll/cpptoc/focus_handler_cpptoc.cc \
    src/cef/linux/libcef_dll/cpptoc/geolocation_handler_cpptoc.cc \
    src/cef/linux/libcef_dll/cpptoc/get_geolocation_callback_cpptoc.cc \
    src/cef/linux/libcef_dll/cpptoc/jsdialog_handler_cpptoc.cc \
    src/cef/linux/libcef_dll/cpptoc/keyboard_handler_cpptoc.cc \
    src/cef/linux/libcef_dll/cpptoc/life_span_handler_cpptoc.cc \
    src/cef/linux/libcef_dll/cpptoc/load_handler_cpptoc.cc \
    src/cef/linux/libcef_dll/cpptoc/navigation_entry_visitor_cpptoc.cc \
    src/cef/linux/libcef_dll/cpptoc/pdf_print_callback_cpptoc.cc \
    src/cef/linux/libcef_dll/cpptoc/print_handler_cpptoc.cc \
    src/cef/linux/libcef_dll/cpptoc/read_handler_cpptoc.cc \
    src/cef/linux/libcef_dll/cpptoc/render_handler_cpptoc.cc \
    src/cef/linux/libcef_dll/cpptoc/render_process_handler_cpptoc.cc \
    src/cef/linux/libcef_dll/cpptoc/request_context_handler_cpptoc.cc \
    src/cef/linux/libcef_dll/cpptoc/request_handler_cpptoc.cc \
    src/cef/linux/libcef_dll/cpptoc/resource_bundle_handler_cpptoc.cc \
    src/cef/linux/libcef_dll/cpptoc/resource_handler_cpptoc.cc \
    src/cef/linux/libcef_dll/cpptoc/resolve_callback_cpptoc.cc \
    src/cef/linux/libcef_dll/cpptoc/response_filter_cpptoc.cc \
    src/cef/linux/libcef_dll/cpptoc/run_file_dialog_callback_cpptoc.cc \
    src/cef/linux/libcef_dll/cpptoc/scheme_handler_factory_cpptoc.cc \
    src/cef/linux/libcef_dll/cpptoc/set_cookie_callback_cpptoc.cc \
    src/cef/linux/libcef_dll/cpptoc/string_visitor_cpptoc.cc \
    src/cef/linux/libcef_dll/cpptoc/task_cpptoc.cc \
    src/cef/linux/libcef_dll/cpptoc/urlrequest_client_cpptoc.cc \
    src/cef/linux/libcef_dll/cpptoc/v8accessor_cpptoc.cc \
    src/cef/linux/libcef_dll/cpptoc/v8handler_cpptoc.cc \
    src/cef/linux/libcef_dll/cpptoc/web_plugin_info_visitor_cpptoc.cc \
    src/cef/linux/libcef_dll/cpptoc/web_plugin_unstable_callback_cpptoc.cc \
    src/cef/linux/libcef_dll/cpptoc/write_handler_cpptoc.cc \
src/cef/linux/libcef_dll/cpptoc/views/browser_view_delegate_cpptoc.cc \
src/cef/linux/libcef_dll/cpptoc/views/button_delegate_cpptoc.cc \
src/cef/linux/libcef_dll/cpptoc/views/menu_button_delegate_cpptoc.cc \
src/cef/linux/libcef_dll/cpptoc/views/panel_delegate_cpptoc.cc \
src/cef/linux/libcef_dll/cpptoc/views/view_delegate_cpptoc.cc \
src/cef/linux/libcef_dll/cpptoc/views/textfield_delegate_cpptoc.cc \
src/cef/linux/libcef_dll/cpptoc/views/window_delegate_cpptoc.cc \
src/cef/linux/libcef_dll/cpptoc/download_image_callback_cpptoc.cc \
src/cef/linux/libcef_dll/cpptoc/menu_model_delegate_cpptoc.cc \
src/cef/linux/libcef_dll/ctocpp/image_ctocpp.cc \
src/cef/linux/libcef_dll/ctocpp/views/box_layout_ctocpp.cc \
src/cef/linux/libcef_dll/ctocpp/views/browser_view_ctocpp.cc \
src/cef/linux/libcef_dll/ctocpp/views/button_ctocpp.cc \
src/cef/linux/libcef_dll/ctocpp/views/display_ctocpp.cc \
src/cef/linux/libcef_dll/ctocpp/views/fill_layout_ctocpp.cc \
src/cef/linux/libcef_dll/ctocpp/views/label_button_ctocpp.cc \
src/cef/linux/libcef_dll/ctocpp/views/layout_ctocpp.cc \
src/cef/linux/libcef_dll/ctocpp/views/menu_button_ctocpp.cc \
src/cef/linux/libcef_dll/ctocpp/views/panel_ctocpp.cc \
src/cef/linux/libcef_dll/ctocpp/views/scroll_view_ctocpp.cc \
src/cef/linux/libcef_dll/ctocpp/views/textfield_ctocpp.cc \
src/cef/linux/libcef_dll/ctocpp/views/view_ctocpp.cc \
src/cef/linux/libcef_dll/ctocpp/views/window_ctocpp.cc \
    src/cef/linux/libcef_dll/ctocpp/auth_callback_ctocpp.cc \
    src/cef/linux/libcef_dll/ctocpp/before_download_callback_ctocpp.cc \
    src/cef/linux/libcef_dll/ctocpp/binary_value_ctocpp.cc \
    src/cef/linux/libcef_dll/ctocpp/browser_ctocpp.cc \
    src/cef/linux/libcef_dll/ctocpp/browser_host_ctocpp.cc \
    src/cef/linux/libcef_dll/ctocpp/callback_ctocpp.cc \
    src/cef/linux/libcef_dll/ctocpp/command_line_ctocpp.cc \
    src/cef/linux/libcef_dll/ctocpp/context_menu_params_ctocpp.cc \
    src/cef/linux/libcef_dll/ctocpp/cookie_manager_ctocpp.cc \
    src/cef/linux/libcef_dll/ctocpp/dictionary_value_ctocpp.cc \
    src/cef/linux/libcef_dll/ctocpp/domdocument_ctocpp.cc \
    src/cef/linux/libcef_dll/ctocpp/domnode_ctocpp.cc \
    src/cef/linux/libcef_dll/ctocpp/download_item_callback_ctocpp.cc \
    src/cef/linux/libcef_dll/ctocpp/download_item_ctocpp.cc \
    src/cef/linux/libcef_dll/ctocpp/drag_data_ctocpp.cc \
    src/cef/linux/libcef_dll/ctocpp/file_dialog_callback_ctocpp.cc \
    src/cef/linux/libcef_dll/ctocpp/frame_ctocpp.cc \
    src/cef/linux/libcef_dll/ctocpp/geolocation_callback_ctocpp.cc \
    src/cef/linux/libcef_dll/ctocpp/jsdialog_callback_ctocpp.cc \
    src/cef/linux/libcef_dll/ctocpp/list_value_ctocpp.cc \
    src/cef/linux/libcef_dll/ctocpp/menu_model_ctocpp.cc \
    src/cef/linux/libcef_dll/ctocpp/navigation_entry_ctocpp.cc \
    src/cef/linux/libcef_dll/ctocpp/post_data_ctocpp.cc \
    src/cef/linux/libcef_dll/ctocpp/post_data_element_ctocpp.cc \
    src/cef/linux/libcef_dll/ctocpp/print_dialog_callback_ctocpp.cc \
    src/cef/linux/libcef_dll/ctocpp/print_job_callback_ctocpp.cc \
    src/cef/linux/libcef_dll/ctocpp/print_settings_ctocpp.cc \
    src/cef/linux/libcef_dll/ctocpp/process_message_ctocpp.cc \
    src/cef/linux/libcef_dll/ctocpp/request_callback_ctocpp.cc \
    src/cef/linux/libcef_dll/ctocpp/request_context_ctocpp.cc \
    src/cef/linux/libcef_dll/ctocpp/request_ctocpp.cc \
    src/cef/linux/libcef_dll/ctocpp/response_ctocpp.cc \
    src/cef/linux/libcef_dll/ctocpp/resource_bundle_ctocpp.cc \
    src/cef/linux/libcef_dll/ctocpp/run_context_menu_callback_ctocpp.cc \
    src/cef/linux/libcef_dll/ctocpp/scheme_registrar_ctocpp.cc \
    src/cef/linux/libcef_dll/ctocpp/sslcert_principal_ctocpp.cc \
    src/cef/linux/libcef_dll/ctocpp/sslinfo_ctocpp.cc \
    src/cef/linux/libcef_dll/ctocpp/stream_reader_ctocpp.cc \
    src/cef/linux/libcef_dll/ctocpp/stream_writer_ctocpp.cc \
    src/cef/linux/libcef_dll/ctocpp/task_runner_ctocpp.cc \
    src/cef/linux/libcef_dll/ctocpp/urlrequest_ctocpp.cc \
    src/cef/linux/libcef_dll/ctocpp/v8context_ctocpp.cc \
    src/cef/linux/libcef_dll/ctocpp/v8exception_ctocpp.cc \
    src/cef/linux/libcef_dll/ctocpp/v8stack_frame_ctocpp.cc \
    src/cef/linux/libcef_dll/ctocpp/v8stack_trace_ctocpp.cc \
    src/cef/linux/libcef_dll/ctocpp/v8value_ctocpp.cc \
    src/cef/linux/libcef_dll/ctocpp/value_ctocpp.cc \
    src/cef/linux/libcef_dll/ctocpp/web_plugin_info_ctocpp.cc \
    src/cef/linux/libcef_dll/ctocpp/xml_reader_ctocpp.cc \
    src/cef/linux/libcef_dll/ctocpp/zip_reader_ctocpp.cc \
    src/cef/linux/libcef_dll/wrapper/cef_byte_read_handler.cc \
    src/cef/linux/libcef_dll/wrapper/cef_closure_task.cc \
    src/cef/linux/libcef_dll/wrapper/cef_message_router.cc \
    src/cef/linux/libcef_dll/wrapper/cef_resource_manager.cc \
    src/cef/linux/libcef_dll/wrapper/cef_stream_resource_handler.cc \
    src/cef/linux/libcef_dll/wrapper/cef_xml_object.cc \
    src/cef/linux/libcef_dll/wrapper/cef_zip_archive.cc \
    src/cef/linux/libcef_dll/wrapper/libcef_dll_wrapper.cc \
    src/cef/linux/libcef_dll/wrapper/libcef_dll_wrapper2.cc \
    src/cef/linux/libcef_dll/transfer_util.cc

INCLUDEPATH += \
    ../../../core/DesktopEditor/agg-2.4/include \
    ../../../core/DesktopEditor/freetype-2.5.2/include

HEADERS += \
    ./src/cookiesworker.h \
    ./src/cefwrapper/client_app.h \
    ./src/cefwrapper/client_renderer.h \
    ./src/cefwrapper/client_scheme.h \
    ./src/fileconverter.h \
    ./src/fileprinter.h

SOURCES += \
    ./src/cefwrapper/client_scheme_wrapper.cpp \
    ./src/cefwrapper/client_renderer_wrapper.cpp

HEADERS += \
    ./include/base.h \
    ./include/applicationmanager.h \
    ./include/keyboardchecker.h \
    ./include/spellchecker.h \
    ./include/cefapplication.h \
    ./include/cefview.h \
    ./include/applicationmanager_events.h

SOURCES += \
    ./src/applicationmanager.cpp \
    ./src/keyboardchecker.cpp \
    ./src/spellchecker.cpp \
    ./src/cefapplication.cpp \
    ./src/cefview.cpp \
    ./src/fileprinter.cpp

SOURCES += \
    ./../../../core/Common/OfficeFileFormatChecker2.cpp \
    ./../../../core/Common/3dParty/pole/pole.cpp \
    ./../../../core/HtmlRenderer/src/ASCSVGWriter.cpp
