// USB Port Injector for Lenovo I320-14IKB.
// Injects USBX Device with USB Power Properties.
// Disables auto restart after shutdown when USB device Plugged In.

#ifndef NO_DEFINITIONBLOCK
DefinitionBlock ("", "SSDT", 2, "Idea", "_USB", 0)
{
#endif
    External (_SB_.PCI0.XHC_.PMEE, FieldUnitObj)
    External (ZPTS, MethodObj)
    
     Device(UIAC)
    {
        Name(_HID, "UIA00000")

        Name(RMCF, Package()
        {
                     "8086_9d2f", Package()
            {
                "port-count", Buffer() { 18, 0, 0, 0 },
                "ports", Package()
                {
                    "HS01", Package()
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 1, 0, 0, 0 },
                    },
                     "HS02", Package()
                    {
                        "UsbConnector", 9,
                        "port", Buffer() { 2, 0, 0, 0 },
                    },
                      "HS03", Package()
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 3, 0, 0, 0 },
                    },
                       "HS04", Package()
                    {
                        "UsbConnector", 255,
                        "port", Buffer() { 4, 0, 0, 0 },
                    },
                     "HS05", Package()
                    {
                        "UsbConnector", 0,
                        "port", Buffer() { 5, 0, 0, 0 },
                    },
                     
                    "HS07", Package()
                    {
                        "UsbConnector", 255,
                        "port", Buffer() { 7, 0, 0, 0 },
                    },
                    "HS08", Package()
                    {
                        "UsbConnector", 255,
                        "port", Buffer() { 8, 0, 0, 0 },
                    },

                      "SS01", Package()
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 13, 0, 0, 0 },
                    },
                    "SS02", Package()
                    {
                        "UsbConnector", 9,
                        "port", Buffer() { 14, 0, 0, 0 },
                    },
                     "SS03", Package()
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 15, 0, 0, 0 },
                    },

                },
            },
        })
    }
    // USB Power Properties
    Device (_SB.USBX)
    {
        Name (_ADR, Zero)  // _ADR: Address
        Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
        {
            If (LNot (Arg2))
            {
                Return (Buffer (One)
                {
                     0x03                                           
                })
            }

            Return (Package (0x08)
            {
                "kUSBSleepPortCurrentLimit", 
                0x0BB8, 
                "kUSBSleepPowerSupply", 
                0x0A28, 
                "kUSBWakePortCurrentLimit", 
                0x0BB8, 
                "kUSBWakePowerSupply", 
                0x0C80
            })
        }
    }
    // Auto Start after Shutdown fix when USB device Plugged In.       
    Method(_PTS, 1)
    {
        ZPTS(Arg0)
        If (5 == Arg0)
        {
            \_SB.PCI0.XHC.PMEE = 0
        }
    }
#ifndef NO_DEFINITIONBLOCK
}
#endif
//EOF
