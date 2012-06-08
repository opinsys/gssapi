module KRB5
  module LibKrb5

    extend FFI::Library

    krb5_lib = 'libkrb5.so.3'
    begin
      ffi_lib krb5_lib
    rescue Exception # XXX
      puts "Cannot load libkrb5.so.3" if $DEBUG
    end


    # OM_uint32 krb5_init_context(krb5_context *context)
    attach_function :krb5_init_context, [:pointer], :OM_uint32

    # void krb5_free_context(krb5_context context)
    attach_function :krb5_free_context, [:pointer], :void

    # void krb5_free_principal( krb5_context context, krb5_principal principal)
    attach_function :krb5_free_principal, [:pointer, :pointer], :void


    # krb5_error_code krb5_cc_destroy( krb5_context context, krb5_ccache ccache)
    attach_function :krb5_cc_destroy, [:pointer, :pointer], :OM_uint32

    attach_function :krb5_parse_name, [:pointer, :pointer, :pointer], :OM_uint32

    attach_function :krb5_cc_resolve, [:pointer, :string, :pointer], :OM_uint32

    attach_function :krb5_cc_initialize, [:pointer, :pointer, :pointer], :OM_uint32

    attach_function :krb5_cc_get_principal, [:pointer, :pointer, :pointer], :OM_uint32

#    attach_function :krb5_get_err_text, [:pointer, :OM_uint32], :pointer

    attach_function :error_message, [:OM_uint32], :string
  end
end
