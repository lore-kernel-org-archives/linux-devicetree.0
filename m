From: Eric Schwarz <eas-bW38P/QUPruSQf2WMc2Ye0EOCMrvLtNR@public.gmane.org>
Subject: reserve PCIe window for hotplug device on PCIe switch
Date: Wed, 27 May 2015 20:07:50 +0200
Message-ID: <1054e5cfb1bc552613fa02c52f2c6f10@sw-optimization.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

schematic overview:
processor (MV78x60) - PCIe switch (PEX8619) - FPGA (Altera) loaded in 
userland

FDT (Flattened Device Tree):

#include "armada-xp-mv78260.dtsi"

...

soc {
     ranges = <MBUS_ID(0xf0, 0x01) 0 0 0xf1000000 0x100000   /* internal 
regs */
               MBUS_ID(0x01, 0x1d) 0 0 0xfff00000 0x100000>; /* BootROM   
     */

     pcie-mem-aperture = <0x80000000 0x50000000>;            /* window 
needs to be big enough in
                                                                 order to 
host FPGA BARs et al. */

     ...

     pcie-controller {
         status = "okay";
         pcie@1,0 { /* Port 0.0 registers */
             status = "okay";
         };
         pcie@9,0 { /* Port 2.0 registers */
             status = "okay";
         };
     };
};

Question:
Since the FPGA is not visible when the system boots how to reserve a 
256MB PCI window for non-prefetchable memory for it and 1MB io-space on 
pcie@9,0 using the FDT.
Actually in armada-xp-mv78260.dtsi (and included files respectivley) the 
window for the PCIe of the processor is big enough but I do not have 
really a clue on how to reserve a memory window (maybe soc ranges?) and 
later on assign it to an Altera FPGA (compatible attribute? and patch 
the kernel for that string?).
Thus, on boot-up the window for the PCIe switch needs to be big enough 
... but how to?

Cheers,
Eric
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
