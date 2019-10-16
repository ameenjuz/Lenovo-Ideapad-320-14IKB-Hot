// Lenovo V330-15IKB Keyboard Map

#ifndef NO_DEFINITIONBLOCK
DefinitionBlock ("", "SSDT", 2, "V330", "_KBD", 0)
{
#endif
    External (_SB.PCI0.LPCB.EC_, DeviceObj)
    External (_SB.PCI0.LPCB.PS2K, DeviceObj)

    Scope (_SB.PCI0.LPCB.EC)
    {
        Method (_Q11, 0, NotSerialized) // Brightness Up
        {
            Notify (PS2K, 0x0405)
            Notify (PS2K, 0x0485)
        }
        Method (_Q12, 0, NotSerialized) // Brightness Down
        {
            Notify (PS2K, 0x0406)
            Notify (PS2K, 0x0486)
        }
         }
#ifndef NO_DEFINITIONBLOCK
}
#endif
//EOF
