DEFINES += \
    "V8_DEPRECATION_WARNINGS" \
    "_WIN32_WINNT=0x0602" \
    "WINVER=0x0602" \
    "WIN32" \
    "_WINDOWS" \
    "NOMINMAX" \
    "PSAPI_VERSION=1" \
    "_CRT_RAND_S" \
    "CERT_CHAIN_PARA_HAS_EXTRA_FIELDS" \
    "WIN32_LEAN_AND_MEAN" \
    "_ATL_NO_OPENGL" \
    "_HAS_EXCEPTIONS=0" \
    "_SECURE_ATL" \
    "CHROMIUM_BUILD" \
    "TOOLKIT_VIEWS=1" \
    "USE_AURA=1" \
    "USE_ASH=1" \
    "USE_DEFAULT_RENDER_THEME=1" \
    "USE_LIBJPEG_TURBO=1" \
    "ENABLE_ONE_CLICK_SIGNIN" \
    "ENABLE_PRE_SYNC_BACKUP" \
    "ENABLE_REMOTING=1" \
    "ENABLE_WEBRTC=1" \
    "ENABLE_PEPPER_CDMS" \
    "ENABLE_CONFIGURATION_POLICY" \
    "ENABLE_NOTIFICATIONS" \
    "ENABLE_HIDPI=1" \
    "ENABLE_EGLIMAGE=1" \
    "__STD_C" \
    "_CRT_SECURE_NO_DEPRECATE" \
    "_SCL_SECURE_NO_DEPRECATE" \
    "NTDDI_VERSION=0x06020000" \
    "_USING_V110_SDK71_" \
    "ENABLE_TASK_MANAGER=1" \
    "ENABLE_EXTENSIONS=1" \
    "ENABLE_PLUGIN_INSTALLATION=1" \
    "ENABLE_PLUGINS=1" \
    "ENABLE_SESSION_SERVICE=1" \
    "ENABLE_THEMES=1" \
    "ENABLE_AUTOFILL_DIALOG=1" \
    "ENABLE_BACKGROUND=1" \
    "ENABLE_GOOGLE_NOW=1" \
    "CLD_VERSION=2" \
    "CLD2_DATA_SOURCE=static" \
    "ENABLE_FULL_PRINTING=1" \
    "ENABLE_PRINTING=1" \
    "ENABLE_SPELLCHECK=1" \
    "ENABLE_CAPTIVE_PORTAL_DETECTION=1" \
    "ENABLE_APP_LIST=1" \
    "ENABLE_SETTINGS_APP=1" \
    "ENABLE_MANAGED_USERS=1" \
    "ENABLE_MDNS=1" \
    "ENABLE_SERVICE_DISCOVERY=1" \
    "ENABLE_WIFI_BOOTSTRAPPING=1" \
    "ENABLE_LOAD_COMPLETION_HACKS=1" \
    "USING_CEF_SHARED" \
    "__STDC_CONSTANT_MACROS" \
    "__STDC_FORMAT_MACROS" \
    "NDEBUG" \
    "NVALGRIND" \
    "DYNAMIC_ANNOTATIONS_ENABLED=0"

LIBS += -lwininet \
        -ldnsapi \
        -lversion \
        -lmsimg32 \
        -lws2_32 \
        -lusp10 \
        -lpsapi \
        -ldbghelp \
        -lwinmm \
        -lshlwapi \
        -lkernel32 \
        -lgdi32 \
        -lwinspool \
        -lcomdlg32 \
        -ladvapi32 \
        -lshell32 \
        -lole32 \
        -loleaut32 \
        -luser32 \
        -luuid \
        -lodbc32 \
        -lodbccp32 \
        -ldelayimp \
        -lcredui \
        -lnetapi32 \
        -lcomctl32 \
        -lrpcrt4 \
        -lgdiplus \
        -lUrlmon \
        -lOpenGL32

INCLUDEPATH += \
    $$PWD/src/cef/windows

HEADERS += \
    $$PWD/src/cef/windows/cefclient/browser/binding_test.h \
    $$PWD/src/cef/windows/cefclient/browser/browser_window.h \
    $$PWD/src/cef/windows/cefclient/browser/browser_window_osr_win.h \
    $$PWD/src/cef/windows/cefclient/browser/browser_window_std_win.h \
    $$PWD/src/cef/windows/cefclient/browser/bytes_write_handler.h \
    $$PWD/src/cef/windows/cefclient/browser/client_app_browser.h \
    $$PWD/src/cef/windows/cefclient/browser/client_handler.h \
    $$PWD/src/cef/windows/cefclient/browser/client_handler_osr.h \
    $$PWD/src/cef/windows/cefclient/browser/client_handler_std.h \
    $$PWD/src/cef/windows/cefclient/browser/client_types.h \
    $$PWD/src/cef/windows/cefclient/browser/dialog_test.h \
    $$PWD/src/cef/windows/cefclient/browser/geometry_util.h \
    $$PWD/src/cef/windows/cefclient/browser/main_context.h \
    $$PWD/src/cef/windows/cefclient/browser/main_context_impl.h \
    $$PWD/src/cef/windows/cefclient/browser/main_message_loop.h \
    $$PWD/src/cef/windows/cefclient/browser/main_message_loop_multithreaded_win.h \
    $$PWD/src/cef/windows/cefclient/browser/main_message_loop_std.h \
    $$PWD/src/cef/windows/cefclient/browser/osr_dragdrop_events.h \
    $$PWD/src/cef/windows/cefclient/browser/osr_dragdrop_win.h \
    $$PWD/src/cef/windows/cefclient/browser/osr_renderer.h \
    $$PWD/src/cef/windows/cefclient/browser/osr_window_win.h \
    $$PWD/src/cef/windows/cefclient/browser/preferences_test.h \
    $$PWD/src/cef/windows/cefclient/browser/resource.h \
    $$PWD/src/cef/windows/cefclient/browser/resource_util.h \
    $$PWD/src/cef/windows/cefclient/browser/response_filter_test.h \
    $$PWD/src/cef/windows/cefclient/browser/root_window.h \
    $$PWD/src/cef/windows/cefclient/browser/root_window_manager.h \
    $$PWD/src/cef/windows/cefclient/browser/root_window_win.h \
    $$PWD/src/cef/windows/cefclient/browser/scheme_test.h \
    $$PWD/src/cef/windows/cefclient/browser/temp_window.h \
    $$PWD/src/cef/windows/cefclient/browser/temp_window_win.h \
    $$PWD/src/cef/windows/cefclient/browser/test_runner.h \
    $$PWD/src/cef/windows/cefclient/browser/urlrequest_test.h \
    $$PWD/src/cef/windows/cefclient/browser/util_win.h \
    $$PWD/src/cef/windows/cefclient/browser/window_test.h \
    $$PWD/src/cef/windows/cefclient/common/client_app.h \
    $$PWD/src/cef/windows/cefclient/common/client_app_other.h \
    $$PWD/src/cef/windows/cefclient/common/client_switches.h \
    $$PWD/src/cef/windows/cefclient/common/scheme_test_common.h \
    $$PWD/src/cef/windows/cefclient/renderer/client_app_renderer.h \
    $$PWD/src/cef/windows/cefclient/renderer/client_renderer.h \
    $$PWD/src/cef/windows/cefclient/renderer/performance_test.h \
    $$PWD/src/cef/windows/cefclient/renderer/performance_test_setup.h \
    $$PWD/src/cef/windows/include/base/internal/cef_atomicops_x86_msvc.h \
    $$PWD/src/cef/windows/include/base/internal/cef_bind_internal.h \
    $$PWD/src/cef/windows/include/base/internal/cef_bind_internal_win.h \
    $$PWD/src/cef/windows/include/base/internal/cef_callback_internal.h \
    $$PWD/src/cef/windows/include/base/internal/cef_lock_impl.h \
    $$PWD/src/cef/windows/include/base/internal/cef_raw_scoped_refptr_mismatch_checker.h \
    $$PWD/src/cef/windows/include/base/internal/cef_thread_checker_impl.h \
    $$PWD/src/cef/windows/include/base/cef_atomic_ref_count.h \
    $$PWD/src/cef/windows/include/base/cef_atomicops.h \
    $$PWD/src/cef/windows/include/base/cef_basictypes.h \
    $$PWD/src/cef/windows/include/base/cef_bind.h \
    $$PWD/src/cef/windows/include/base/cef_bind_helpers.h \
    $$PWD/src/cef/windows/include/base/cef_build.h \
    $$PWD/src/cef/windows/include/base/cef_callback.h \
    $$PWD/src/cef/windows/include/base/cef_callback_forward.h \
    $$PWD/src/cef/windows/include/base/cef_callback_helpers.h \
    $$PWD/src/cef/windows/include/base/cef_callback_list.h \
    $$PWD/src/cef/windows/include/base/cef_cancelable_callback.h \
    $$PWD/src/cef/windows/include/base/cef_lock.h \
    $$PWD/src/cef/windows/include/base/cef_logging.h \
    $$PWD/src/cef/windows/include/base/cef_macros.h \
    $$PWD/src/cef/windows/include/base/cef_move.h \
    $$PWD/src/cef/windows/include/base/cef_platform_thread.h \
    $$PWD/src/cef/windows/include/base/cef_ref_counted.h \
    $$PWD/src/cef/windows/include/base/cef_scoped_ptr.h \
    $$PWD/src/cef/windows/include/base/cef_string16.h \
    $$PWD/src/cef/windows/include/base/cef_template_util.h \
    $$PWD/src/cef/windows/include/base/cef_thread_checker.h \
    $$PWD/src/cef/windows/include/base/cef_thread_collision_warner.h \
    $$PWD/src/cef/windows/include/base/cef_trace_event.h \
    $$PWD/src/cef/windows/include/base/cef_tuple.h \
    $$PWD/src/cef/windows/include/base/cef_weak_ptr.h \
    $$PWD/src/cef/windows/include/capi/cef_app_capi.h \
    $$PWD/src/cef/windows/include/capi/cef_auth_callback_capi.h \
    $$PWD/src/cef/windows/include/capi/cef_base_capi.h \
    $$PWD/src/cef/windows/include/capi/cef_browser_capi.h \
    $$PWD/src/cef/windows/include/capi/cef_browser_process_handler_capi.h \
    $$PWD/src/cef/windows/include/capi/cef_callback_capi.h \
    $$PWD/src/cef/windows/include/capi/cef_client_capi.h \
    $$PWD/src/cef/windows/include/capi/cef_command_line_capi.h \
    $$PWD/src/cef/windows/include/capi/cef_context_menu_handler_capi.h \
    $$PWD/src/cef/windows/include/capi/cef_cookie_capi.h \
    $$PWD/src/cef/windows/include/capi/cef_dialog_handler_capi.h \
    $$PWD/src/cef/windows/include/capi/cef_display_handler_capi.h \
    $$PWD/src/cef/windows/include/capi/cef_dom_capi.h \
    $$PWD/src/cef/windows/include/capi/cef_download_handler_capi.h \
    $$PWD/src/cef/windows/include/capi/cef_download_item_capi.h \
    $$PWD/src/cef/windows/include/capi/cef_drag_data_capi.h \
    $$PWD/src/cef/windows/include/capi/cef_drag_handler_capi.h \
    $$PWD/src/cef/windows/include/capi/cef_find_handler_capi.h \
    $$PWD/src/cef/windows/include/capi/cef_focus_handler_capi.h \
    $$PWD/src/cef/windows/include/capi/cef_frame_capi.h \
    $$PWD/src/cef/windows/include/capi/cef_geolocation_capi.h \
    $$PWD/src/cef/windows/include/capi/cef_geolocation_handler_capi.h \
    $$PWD/src/cef/windows/include/capi/cef_jsdialog_handler_capi.h \
    $$PWD/src/cef/windows/include/capi/cef_keyboard_handler_capi.h \
    $$PWD/src/cef/windows/include/capi/cef_life_span_handler_capi.h \
    $$PWD/src/cef/windows/include/capi/cef_load_handler_capi.h \
    $$PWD/src/cef/windows/include/capi/cef_menu_model_capi.h \
    $$PWD/src/cef/windows/include/capi/cef_navigation_entry_capi.h \
    $$PWD/src/cef/windows/include/capi/cef_origin_whitelist_capi.h \
    $$PWD/src/cef/windows/include/capi/cef_parser_capi.h \
    $$PWD/src/cef/windows/include/capi/cef_path_util_capi.h \
    $$PWD/src/cef/windows/include/capi/cef_print_handler_capi.h \
    $$PWD/src/cef/windows/include/capi/cef_print_settings_capi.h \
    $$PWD/src/cef/windows/include/capi/cef_process_message_capi.h \
    $$PWD/src/cef/windows/include/capi/cef_process_util_capi.h \
    $$PWD/src/cef/windows/include/capi/cef_render_handler_capi.h \
    $$PWD/src/cef/windows/include/capi/cef_render_process_handler_capi.h \
    $$PWD/src/cef/windows/include/capi/cef_request_capi.h \
    $$PWD/src/cef/windows/include/capi/cef_request_context_capi.h \
    $$PWD/src/cef/windows/include/capi/cef_request_context_handler_capi.h \
    $$PWD/src/cef/windows/include/capi/cef_request_handler_capi.h \
    $$PWD/src/cef/windows/include/capi/cef_resource_bundle_capi.h \
    $$PWD/src/cef/windows/include/capi/cef_resource_bundle_handler_capi.h \
    $$PWD/src/cef/windows/include/capi/cef_resource_handler_capi.h \
    $$PWD/src/cef/windows/include/capi/cef_response_capi.h \
    $$PWD/src/cef/windows/include/capi/cef_response_filter_capi.h \
    $$PWD/src/cef/windows/include/capi/cef_scheme_capi.h \
    $$PWD/src/cef/windows/include/capi/cef_ssl_info_capi.h \
    $$PWD/src/cef/windows/include/capi/cef_stream_capi.h \
    $$PWD/src/cef/windows/include/capi/cef_string_visitor_capi.h \
    $$PWD/src/cef/windows/include/capi/cef_task_capi.h \
    $$PWD/src/cef/windows/include/capi/cef_trace_capi.h \
    $$PWD/src/cef/windows/include/capi/cef_urlrequest_capi.h \
    $$PWD/src/cef/windows/include/capi/cef_v8_capi.h \
    $$PWD/src/cef/windows/include/capi/cef_values_capi.h \
    $$PWD/src/cef/windows/include/capi/cef_web_plugin_capi.h \
    $$PWD/src/cef/windows/include/capi/cef_xml_reader_capi.h \
    $$PWD/src/cef/windows/include/capi/cef_zip_reader_capi.h \
    $$PWD/src/cef/windows/include/internal/cef_export.h \
    $$PWD/src/cef/windows/include/internal/cef_logging_internal.h \
    $$PWD/src/cef/windows/include/internal/cef_ptr.h \
    $$PWD/src/cef/windows/include/internal/cef_string.h \
    $$PWD/src/cef/windows/include/internal/cef_string_list.h \
    $$PWD/src/cef/windows/include/internal/cef_string_map.h \
    $$PWD/src/cef/windows/include/internal/cef_string_multimap.h \
    $$PWD/src/cef/windows/include/internal/cef_string_types.h \
    $$PWD/src/cef/windows/include/internal/cef_string_wrappers.h \
    $$PWD/src/cef/windows/include/internal/cef_thread_internal.h \
    $$PWD/src/cef/windows/include/internal/cef_time.h \
    $$PWD/src/cef/windows/include/internal/cef_trace_event_internal.h \
    $$PWD/src/cef/windows/include/internal/cef_types.h \
    $$PWD/src/cef/windows/include/internal/cef_types_win.h \
    $$PWD/src/cef/windows/include/internal/cef_types_wrappers.h \
    $$PWD/src/cef/windows/include/internal/cef_win.h \
    $$PWD/src/cef/windows/include/wrapper/cef_byte_read_handler.h \
    $$PWD/src/cef/windows/include/wrapper/cef_closure_task.h \
    $$PWD/src/cef/windows/include/wrapper/cef_helpers.h \
    $$PWD/src/cef/windows/include/wrapper/cef_message_router.h \
    $$PWD/src/cef/windows/include/wrapper/cef_resource_manager.h \
    $$PWD/src/cef/windows/include/wrapper/cef_stream_resource_handler.h \
    $$PWD/src/cef/windows/include/wrapper/cef_xml_object.h \
    $$PWD/src/cef/windows/include/wrapper/cef_zip_archive.h \
    $$PWD/src/cef/windows/include/cef_app.h \
    $$PWD/src/cef/windows/include/cef_auth_callback.h \
    $$PWD/src/cef/windows/include/cef_base.h \
    $$PWD/src/cef/windows/include/cef_browser.h \
    $$PWD/src/cef/windows/include/cef_browser_process_handler.h \
    $$PWD/src/cef/windows/include/cef_callback.h \
    $$PWD/src/cef/windows/include/cef_client.h \
    $$PWD/src/cef/windows/include/cef_command_line.h \
    $$PWD/src/cef/windows/include/cef_context_menu_handler.h \
    $$PWD/src/cef/windows/include/cef_cookie.h \
    $$PWD/src/cef/windows/include/cef_dialog_handler.h \
    $$PWD/src/cef/windows/include/cef_display_handler.h \
    $$PWD/src/cef/windows/include/cef_dom.h \
    $$PWD/src/cef/windows/include/cef_download_handler.h \
    $$PWD/src/cef/windows/include/cef_download_item.h \
    $$PWD/src/cef/windows/include/cef_drag_data.h \
    $$PWD/src/cef/windows/include/cef_drag_handler.h \
    $$PWD/src/cef/windows/include/cef_find_handler.h \
    $$PWD/src/cef/windows/include/cef_focus_handler.h \
    $$PWD/src/cef/windows/include/cef_frame.h \
    $$PWD/src/cef/windows/include/cef_geolocation.h \
    $$PWD/src/cef/windows/include/cef_geolocation_handler.h \
    $$PWD/src/cef/windows/include/cef_jsdialog_handler.h \
    $$PWD/src/cef/windows/include/cef_keyboard_handler.h \
    $$PWD/src/cef/windows/include/cef_life_span_handler.h \
    $$PWD/src/cef/windows/include/cef_load_handler.h \
    $$PWD/src/cef/windows/include/cef_menu_model.h \
    $$PWD/src/cef/windows/include/cef_navigation_entry.h \
    $$PWD/src/cef/windows/include/cef_origin_whitelist.h \
    $$PWD/src/cef/windows/include/cef_pack_resources.h \
    $$PWD/src/cef/windows/include/cef_pack_strings.h \
    $$PWD/src/cef/windows/include/cef_parser.h \
    $$PWD/src/cef/windows/include/cef_path_util.h \
    $$PWD/src/cef/windows/include/cef_print_handler.h \
    $$PWD/src/cef/windows/include/cef_print_settings.h \
    $$PWD/src/cef/windows/include/cef_process_message.h \
    $$PWD/src/cef/windows/include/cef_process_util.h \
    $$PWD/src/cef/windows/include/cef_render_handler.h \
    $$PWD/src/cef/windows/include/cef_render_process_handler.h \
    $$PWD/src/cef/windows/include/cef_request.h \
    $$PWD/src/cef/windows/include/cef_request_context.h \
    $$PWD/src/cef/windows/include/cef_request_context_handler.h \
    $$PWD/src/cef/windows/include/cef_request_handler.h \
    $$PWD/src/cef/windows/include/cef_resource_bundle.h \
    $$PWD/src/cef/windows/include/cef_resource_bundle_handler.h \
    $$PWD/src/cef/windows/include/cef_resource_handler.h \
    $$PWD/src/cef/windows/include/cef_response.h \
    $$PWD/src/cef/windows/include/cef_response_filter.h \
    $$PWD/src/cef/windows/include/cef_runnable.h \
    $$PWD/src/cef/windows/include/cef_sandbox_win.h \
    $$PWD/src/cef/windows/include/cef_scheme.h \
    $$PWD/src/cef/windows/include/cef_ssl_info.h \
    $$PWD/src/cef/windows/include/cef_stream.h \
    $$PWD/src/cef/windows/include/cef_string_visitor.h \
    $$PWD/src/cef/windows/include/cef_task.h \
    $$PWD/src/cef/windows/include/cef_trace.h \
    $$PWD/src/cef/windows/include/cef_urlrequest.h \
    $$PWD/src/cef/windows/include/cef_v8.h \
    $$PWD/src/cef/windows/include/cef_values.h \
    $$PWD/src/cef/windows/include/cef_version.h \
    $$PWD/src/cef/windows/include/cef_web_plugin.h \
    $$PWD/src/cef/windows/include/cef_xml_reader.h \
    $$PWD/src/cef/windows/include/cef_zip_reader.h \
    $$PWD/src/cef/windows/libcef_dll/cpptoc/app_cpptoc.h \
    $$PWD/src/cef/windows/libcef_dll/cpptoc/base_cpptoc.h \
    $$PWD/src/cef/windows/libcef_dll/cpptoc/browser_process_handler_cpptoc.h \
    $$PWD/src/cef/windows/libcef_dll/cpptoc/client_cpptoc.h \
    $$PWD/src/cef/windows/libcef_dll/cpptoc/completion_callback_cpptoc.h \
    $$PWD/src/cef/windows/libcef_dll/cpptoc/context_menu_handler_cpptoc.h \
    $$PWD/src/cef/windows/libcef_dll/cpptoc/cookie_visitor_cpptoc.h \
    $$PWD/src/cef/windows/libcef_dll/cpptoc/cpptoc.h \
    $$PWD/src/cef/windows/libcef_dll/cpptoc/delete_cookies_callback_cpptoc.h \
    $$PWD/src/cef/windows/libcef_dll/cpptoc/dialog_handler_cpptoc.h \
    $$PWD/src/cef/windows/libcef_dll/cpptoc/display_handler_cpptoc.h \
    $$PWD/src/cef/windows/libcef_dll/cpptoc/domvisitor_cpptoc.h \
    $$PWD/src/cef/windows/libcef_dll/cpptoc/download_handler_cpptoc.h \
    $$PWD/src/cef/windows/libcef_dll/cpptoc/drag_handler_cpptoc.h \
    $$PWD/src/cef/windows/libcef_dll/cpptoc/end_tracing_callback_cpptoc.h \
    $$PWD/src/cef/windows/libcef_dll/cpptoc/find_handler_cpptoc.h \
    $$PWD/src/cef/windows/libcef_dll/cpptoc/focus_handler_cpptoc.h \
    $$PWD/src/cef/windows/libcef_dll/cpptoc/geolocation_handler_cpptoc.h \
    $$PWD/src/cef/windows/libcef_dll/cpptoc/get_geolocation_callback_cpptoc.h \
    $$PWD/src/cef/windows/libcef_dll/cpptoc/jsdialog_handler_cpptoc.h \
    $$PWD/src/cef/windows/libcef_dll/cpptoc/keyboard_handler_cpptoc.h \
    $$PWD/src/cef/windows/libcef_dll/cpptoc/life_span_handler_cpptoc.h \
    $$PWD/src/cef/windows/libcef_dll/cpptoc/load_handler_cpptoc.h \
    $$PWD/src/cef/windows/libcef_dll/cpptoc/navigation_entry_visitor_cpptoc.h \
    $$PWD/src/cef/windows/libcef_dll/cpptoc/pdf_print_callback_cpptoc.h \
    $$PWD/src/cef/windows/libcef_dll/cpptoc/print_handler_cpptoc.h \
    $$PWD/src/cef/windows/libcef_dll/cpptoc/read_handler_cpptoc.h \
    $$PWD/src/cef/windows/libcef_dll/cpptoc/render_handler_cpptoc.h \
    $$PWD/src/cef/windows/libcef_dll/cpptoc/render_process_handler_cpptoc.h \
    $$PWD/src/cef/windows/libcef_dll/cpptoc/request_context_handler_cpptoc.h \
    $$PWD/src/cef/windows/libcef_dll/cpptoc/request_handler_cpptoc.h \
    $$PWD/src/cef/windows/libcef_dll/cpptoc/resolve_callback_cpptoc.h \
    $$PWD/src/cef/windows/libcef_dll/cpptoc/response_filter_cpptoc.h \
    $$PWD/src/cef/windows/libcef_dll/cpptoc/resource_bundle_handler_cpptoc.h \
    $$PWD/src/cef/windows/libcef_dll/cpptoc/resource_handler_cpptoc.h \
    $$PWD/src/cef/windows/libcef_dll/cpptoc/run_file_dialog_callback_cpptoc.h \
    $$PWD/src/cef/windows/libcef_dll/cpptoc/scheme_handler_factory_cpptoc.h \
    $$PWD/src/cef/windows/libcef_dll/cpptoc/set_cookie_callback_cpptoc.h \
    $$PWD/src/cef/windows/libcef_dll/cpptoc/string_visitor_cpptoc.h \
    $$PWD/src/cef/windows/libcef_dll/cpptoc/task_cpptoc.h \
    $$PWD/src/cef/windows/libcef_dll/cpptoc/urlrequest_client_cpptoc.h \
    $$PWD/src/cef/windows/libcef_dll/cpptoc/v8accessor_cpptoc.h \
    $$PWD/src/cef/windows/libcef_dll/cpptoc/v8handler_cpptoc.h \
    $$PWD/src/cef/windows/libcef_dll/cpptoc/web_plugin_info_visitor_cpptoc.h \
    $$PWD/src/cef/windows/libcef_dll/cpptoc/web_plugin_unstable_callback_cpptoc.h \
    $$PWD/src/cef/windows/libcef_dll/cpptoc/write_handler_cpptoc.h \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/auth_callback_ctocpp.h \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/before_download_callback_ctocpp.h \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/binary_value_ctocpp.h \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/browser_ctocpp.h \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/browser_host_ctocpp.h \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/callback_ctocpp.h \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/command_line_ctocpp.h \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/context_menu_params_ctocpp.h \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/cookie_manager_ctocpp.h \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/ctocpp.h \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/dictionary_value_ctocpp.h \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/domdocument_ctocpp.h \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/domnode_ctocpp.h \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/download_item_callback_ctocpp.h \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/download_item_ctocpp.h \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/drag_data_ctocpp.h \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/file_dialog_callback_ctocpp.h \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/frame_ctocpp.h \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/geolocation_callback_ctocpp.h \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/jsdialog_callback_ctocpp.h \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/list_value_ctocpp.h \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/menu_model_ctocpp.h \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/navigation_entry_ctocpp.h \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/post_data_ctocpp.h \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/post_data_element_ctocpp.h \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/print_dialog_callback_ctocpp.h \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/print_job_callback_ctocpp.h \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/print_settings_ctocpp.h \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/process_message_ctocpp.h \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/request_callback_ctocpp.h \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/request_context_ctocpp.h \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/request_ctocpp.h \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/resource_bundle_ctocpp.h \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/response_ctocpp.h \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/run_context_menu_callback_ctocpp.h \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/scheme_registrar_ctocpp.h \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/sslcert_principal_ctocpp.h \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/sslinfo_ctocpp.h \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/stream_reader_ctocpp.h \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/stream_writer_ctocpp.h \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/task_runner_ctocpp.h \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/urlrequest_ctocpp.h \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/v8context_ctocpp.h \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/v8exception_ctocpp.h \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/v8stack_frame_ctocpp.h \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/v8stack_trace_ctocpp.h \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/v8value_ctocpp.h \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/value_ctocpp.h \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/web_plugin_info_ctocpp.h \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/xml_reader_ctocpp.h \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/zip_reader_ctocpp.h \
    $$PWD/src/cef/windows/libcef_dll/wrapper/cef_browser_info_map.h \
    $$PWD/src/cef/windows/libcef_dll/transfer_util.h \
    $$PWD/src/cef/windows/libcef_dll/wrapper_types.h

SOURCES += \
    $$PWD/src/cef/windows/cefclient/browser/binding_test.cc \
    $$PWD/src/cef/windows/cefclient/browser/browser_window.cc \
    $$PWD/src/cef/windows/cefclient/browser/browser_window_osr_win.cc \
    $$PWD/src/cef/windows/cefclient/browser/browser_window_std_win.cc \
    $$PWD/src/cef/windows/cefclient/browser/bytes_write_handler.cc \
    $$PWD/src/cef/windows/cefclient/browser/client_app_browser.cc \
    $$PWD/src/cef/windows/cefclient/browser/client_app_delegates_browser.cc \
    $$PWD/src/cef/windows/cefclient/browser/client_handler.cc \
    $$PWD/src/cef/windows/cefclient/browser/client_handler_osr.cc \
    $$PWD/src/cef/windows/cefclient/browser/client_handler_std.cc \
    $$PWD/src/cef/windows/cefclient/browser/dialog_test.cc \
    $$PWD/src/cef/windows/cefclient/browser/geometry_util.cc \
    $$PWD/src/cef/windows/cefclient/browser/main_context.cc \
    $$PWD/src/cef/windows/cefclient/browser/main_context_impl.cc \
    $$PWD/src/cef/windows/cefclient/browser/main_context_impl_win.cc \
    $$PWD/src/cef/windows/cefclient/browser/main_message_loop.cc \
    $$PWD/src/cef/windows/cefclient/browser/main_message_loop_multithreaded_win.cc \
    $$PWD/src/cef/windows/cefclient/browser/main_message_loop_std.cc \
    $$PWD/src/cef/windows/cefclient/browser/osr_dragdrop_win.cc \
    $$PWD/src/cef/windows/cefclient/browser/osr_renderer.cc \
    $$PWD/src/cef/windows/cefclient/browser/osr_window_win.cc \
    $$PWD/src/cef/windows/cefclient/browser/preferences_test.cc \
    $$PWD/src/cef/windows/cefclient/browser/resource_util_win.cc \
    $$PWD/src/cef/windows/cefclient/browser/response_filter_test.cc \
    $$PWD/src/cef/windows/cefclient/browser/root_window.cc \
    $$PWD/src/cef/windows/cefclient/browser/root_window_manager.cc \
    $$PWD/src/cef/windows/cefclient/browser/root_window_win.cc \
    $$PWD/src/cef/windows/cefclient/browser/scheme_test.cc \
    $$PWD/src/cef/windows/cefclient/browser/temp_window_win.cc \
    $$PWD/src/cef/windows/cefclient/browser/test_runner.cc \
    $$PWD/src/cef/windows/cefclient/browser/urlrequest_test.cc \
    $$PWD/src/cef/windows/cefclient/browser/util_win.cc \
    $$PWD/src/cef/windows/cefclient/browser/window_test.cc \
    $$PWD/src/cef/windows/cefclient/browser/window_test_win.cc \
    $$PWD/src/cef/windows/cefclient/common/client_app.cc \
    $$PWD/src/cef/windows/cefclient/common/client_app_delegates_common.cc \
    $$PWD/src/cef/windows/cefclient/common/client_app_other.cc \
    $$PWD/src/cef/windows/cefclient/common/client_switches.cc \
    $$PWD/src/cef/windows/cefclient/common/scheme_test_common.cc \
    $$PWD/src/cef/windows/cefclient/renderer/client_app_delegates_renderer.cc \
    $$PWD/src/cef/windows/cefclient/renderer/client_app_renderer.cc \
    $$PWD/src/cef/windows/cefclient/renderer/client_renderer.cc \
    $$PWD/src/cef/windows/cefclient/renderer/performance_test.cc \
    $$PWD/src/cef/windows/cefclient/renderer/performance_test_tests.cc \
    $$PWD/src/cef/windows/libcef_dll/base/cef_atomicops_x86_gcc.cc \
    $$PWD/src/cef/windows/libcef_dll/base/cef_bind_helpers.cc \
    $$PWD/src/cef/windows/libcef_dll/base/cef_callback_helpers.cc \
    $$PWD/src/cef/windows/libcef_dll/base/cef_callback_internal.cc \
    $$PWD/src/cef/windows/libcef_dll/base/cef_lock.cc \
    $$PWD/src/cef/windows/libcef_dll/base/cef_lock_impl.cc \
    $$PWD/src/cef/windows/libcef_dll/base/cef_logging.cc \
    $$PWD/src/cef/windows/libcef_dll/base/cef_ref_counted.cc \
    $$PWD/src/cef/windows/libcef_dll/base/cef_string16.cc \
    $$PWD/src/cef/windows/libcef_dll/base/cef_thread_checker_impl.cc \
    $$PWD/src/cef/windows/libcef_dll/base/cef_thread_collision_warner.cc \
    $$PWD/src/cef/windows/libcef_dll/base/cef_weak_ptr.cc \
    $$PWD/src/cef/windows/libcef_dll/cpptoc/app_cpptoc.cc \
    $$PWD/src/cef/windows/libcef_dll/cpptoc/base_cpptoc.cc \
    $$PWD/src/cef/windows/libcef_dll/cpptoc/browser_process_handler_cpptoc.cc \
    $$PWD/src/cef/windows/libcef_dll/cpptoc/client_cpptoc.cc \
    $$PWD/src/cef/windows/libcef_dll/cpptoc/completion_callback_cpptoc.cc \
    $$PWD/src/cef/windows/libcef_dll/cpptoc/context_menu_handler_cpptoc.cc \
    $$PWD/src/cef/windows/libcef_dll/cpptoc/cookie_visitor_cpptoc.cc \
    $$PWD/src/cef/windows/libcef_dll/cpptoc/delete_cookies_callback_cpptoc.cc \
    $$PWD/src/cef/windows/libcef_dll/cpptoc/dialog_handler_cpptoc.cc \
    $$PWD/src/cef/windows/libcef_dll/cpptoc/display_handler_cpptoc.cc \
    $$PWD/src/cef/windows/libcef_dll/cpptoc/domvisitor_cpptoc.cc \
    $$PWD/src/cef/windows/libcef_dll/cpptoc/download_handler_cpptoc.cc \
    $$PWD/src/cef/windows/libcef_dll/cpptoc/drag_handler_cpptoc.cc \
    $$PWD/src/cef/windows/libcef_dll/cpptoc/end_tracing_callback_cpptoc.cc \
    $$PWD/src/cef/windows/libcef_dll/cpptoc/find_handler_cpptoc.cc \
    $$PWD/src/cef/windows/libcef_dll/cpptoc/focus_handler_cpptoc.cc \
    $$PWD/src/cef/windows/libcef_dll/cpptoc/geolocation_handler_cpptoc.cc \
    $$PWD/src/cef/windows/libcef_dll/cpptoc/get_geolocation_callback_cpptoc.cc \
    $$PWD/src/cef/windows/libcef_dll/cpptoc/jsdialog_handler_cpptoc.cc \
    $$PWD/src/cef/windows/libcef_dll/cpptoc/keyboard_handler_cpptoc.cc \
    $$PWD/src/cef/windows/libcef_dll/cpptoc/life_span_handler_cpptoc.cc \
    $$PWD/src/cef/windows/libcef_dll/cpptoc/load_handler_cpptoc.cc \
    $$PWD/src/cef/windows/libcef_dll/cpptoc/navigation_entry_visitor_cpptoc.cc \
    $$PWD/src/cef/windows/libcef_dll/cpptoc/pdf_print_callback_cpptoc.cc \
    $$PWD/src/cef/windows/libcef_dll/cpptoc/print_handler_cpptoc.cc \
    $$PWD/src/cef/windows/libcef_dll/cpptoc/read_handler_cpptoc.cc \
    $$PWD/src/cef/windows/libcef_dll/cpptoc/render_handler_cpptoc.cc \
    $$PWD/src/cef/windows/libcef_dll/cpptoc/render_process_handler_cpptoc.cc \
    $$PWD/src/cef/windows/libcef_dll/cpptoc/request_context_handler_cpptoc.cc \
    $$PWD/src/cef/windows/libcef_dll/cpptoc/request_handler_cpptoc.cc \
    $$PWD/src/cef/windows/libcef_dll/cpptoc/resolve_callback_cpptoc.cc \
    $$PWD/src/cef/windows/libcef_dll/cpptoc/response_filter_cpptoc.cc \
    $$PWD/src/cef/windows/libcef_dll/cpptoc/resource_bundle_handler_cpptoc.cc \
    $$PWD/src/cef/windows/libcef_dll/cpptoc/resource_handler_cpptoc.cc \
    $$PWD/src/cef/windows/libcef_dll/cpptoc/run_file_dialog_callback_cpptoc.cc \
    $$PWD/src/cef/windows/libcef_dll/cpptoc/scheme_handler_factory_cpptoc.cc \
    $$PWD/src/cef/windows/libcef_dll/cpptoc/set_cookie_callback_cpptoc.cc \
    $$PWD/src/cef/windows/libcef_dll/cpptoc/string_visitor_cpptoc.cc \
    $$PWD/src/cef/windows/libcef_dll/cpptoc/task_cpptoc.cc \
    $$PWD/src/cef/windows/libcef_dll/cpptoc/urlrequest_client_cpptoc.cc \
    $$PWD/src/cef/windows/libcef_dll/cpptoc/v8accessor_cpptoc.cc \
    $$PWD/src/cef/windows/libcef_dll/cpptoc/v8handler_cpptoc.cc \
    $$PWD/src/cef/windows/libcef_dll/cpptoc/web_plugin_info_visitor_cpptoc.cc \
    $$PWD/src/cef/windows/libcef_dll/cpptoc/web_plugin_unstable_callback_cpptoc.cc \
    $$PWD/src/cef/windows/libcef_dll/cpptoc/write_handler_cpptoc.cc \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/auth_callback_ctocpp.cc \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/before_download_callback_ctocpp.cc \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/binary_value_ctocpp.cc \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/browser_ctocpp.cc \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/browser_host_ctocpp.cc \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/callback_ctocpp.cc \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/command_line_ctocpp.cc \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/context_menu_params_ctocpp.cc \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/cookie_manager_ctocpp.cc \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/dictionary_value_ctocpp.cc \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/domdocument_ctocpp.cc \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/domnode_ctocpp.cc \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/download_item_callback_ctocpp.cc \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/download_item_ctocpp.cc \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/drag_data_ctocpp.cc \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/file_dialog_callback_ctocpp.cc \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/frame_ctocpp.cc \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/geolocation_callback_ctocpp.cc \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/jsdialog_callback_ctocpp.cc \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/list_value_ctocpp.cc \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/menu_model_ctocpp.cc \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/navigation_entry_ctocpp.cc \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/post_data_ctocpp.cc \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/post_data_element_ctocpp.cc \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/print_dialog_callback_ctocpp.cc \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/print_job_callback_ctocpp.cc \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/print_settings_ctocpp.cc \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/process_message_ctocpp.cc \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/request_callback_ctocpp.cc \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/request_context_ctocpp.cc \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/request_ctocpp.cc \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/resource_bundle_ctocpp.cc \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/response_ctocpp.cc \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/run_context_menu_callback_ctocpp.cc \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/scheme_registrar_ctocpp.cc \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/sslcert_principal_ctocpp.cc \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/sslinfo_ctocpp.cc \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/stream_reader_ctocpp.cc \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/stream_writer_ctocpp.cc \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/task_runner_ctocpp.cc \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/urlrequest_ctocpp.cc \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/v8context_ctocpp.cc \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/v8exception_ctocpp.cc \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/v8stack_frame_ctocpp.cc \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/v8stack_trace_ctocpp.cc \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/v8value_ctocpp.cc \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/value_ctocpp.cc \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/web_plugin_info_ctocpp.cc \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/xml_reader_ctocpp.cc \
    $$PWD/src/cef/windows/libcef_dll/ctocpp/zip_reader_ctocpp.cc \
    $$PWD/src/cef/windows/libcef_dll/wrapper/cef_byte_read_handler.cc \
    $$PWD/src/cef/windows/libcef_dll/wrapper/cef_closure_task.cc \
    $$PWD/src/cef/windows/libcef_dll/wrapper/cef_message_router.cc \
    $$PWD/src/cef/windows/libcef_dll/wrapper/cef_resource_manager.cc \
    $$PWD/src/cef/windows/libcef_dll/wrapper/cef_stream_resource_handler.cc \
    $$PWD/src/cef/windows/libcef_dll/wrapper/cef_xml_object.cc \
    $$PWD/src/cef/windows/libcef_dll/wrapper/cef_zip_archive.cc \
    $$PWD/src/cef/windows/libcef_dll/wrapper/libcef_dll_wrapper.cc \
    $$PWD/src/cef/windows/libcef_dll/wrapper/libcef_dll_wrapper2.cc \
    $$PWD/src/cef/windows/libcef_dll/transfer_util.cc

LIBS += -L$$PWD/../../../core/build/cef/$$CORE_BUILDS_PLATFORM_PREFIX -llibcef

INCLUDEPATH += \
    $$PWD/../../../core/DesktopEditor/agg-2.4/include \
    $$PWD/../../../core/DesktopEditor/freetype-2.5.2/include
