// for testing including all SSDTs with NO_DEFINITIONBLOCK
DefinitionBlock("", "SSDT", 2, "I320", "_320", 0)
{
    #define NO_DEFINITIONBLOCK
    #include "SSDT-XCPM.dsl"
    #include "SSDT-XOSI.dsl"
    #include "SSDT-GPRW.dsl"
    #include "SSDT-I2C.dsl"
    #include "SSDT-PS2K.dsl"
    #include "SSDT-USB.dsl"
  
}
//EOF
