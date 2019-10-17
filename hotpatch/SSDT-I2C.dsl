// VoodooI2C (TPD0) Patch for Lenovo I320-14IKB with ELAN I2C Precision TouchPad.

#ifndef NO_DEFINITIONBLOCK
DefinitionBlock("", "SSDT", 2, "V330", "_I2C", 0)
{
#endif
    External (_SB_.PCI0.I2C0, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.I2C0.TPD0, DeviceObj)    // (from opcode)
    External (SBFB, FieldUnitObj)    // (from opcode)
    External (SBFG, FieldUnitObj)    // (from opcode)
  

    Scope (_SB.PCI0.I2C0.TPD0)
    {
   
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (ConcatenateResTemplate (SBFB, SBFG))
            }
        }
     Scope (_SB.PCI0.I2C0)
    {
        Name (SSCN, Package (0x03)
        {
            0x01B0, 
            0x01FB, 
            0x1E
        })
        Name (FMCN, Package (0x03)
        {
            0x48, 
            0xA0, 
            0x1E
        })
    }
    

#ifndef NO_DEFINITIONBLOCK
}
#endif
//EOF
