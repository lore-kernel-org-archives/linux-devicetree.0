From: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/3] firmware: add driver for lpc18xx boot ROM
Date: Tue, 13 Sep 2016 21:51:14 +0200
Message-ID: <20160913195117.2887-1-manabian@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch set adds a firmware driver for the boot ROM found on all
NXP LPC18xx/43xx devices. The boot ROM contains serveral APIs that
is used to retrive device specific information and program the 
internal Flash and OTP memories.

For now this driver only uses the API in the boot ROM to expose
device information via a 'SoC device'. Support for Flash and OTP
programming will be added later.

Also note that not all APIs are avaliable on all devices. The IAP
API that is used to retrive device information is only avaliable
on devices with Flash. Flashless devices retrive information from
OTP memory. To determin if IAP is avaliable one must check a
specific register in the CREG (syscon) block.

I intend to take this patch set via arm-soc/drivers through my
lpc18xx tree for 4.10.


Joachim Eastwood (3):
  firmware: add lpc18xx boot rom driver
  firmware: dt: document lpc1850 boot ROM bindings
  ARM: dts: lpc18xx: add boot rom node

 .../devicetree/bindings/firmware/nxp,boot-rom.txt  |  21 ++
 arch/arm/boot/dts/lpc18xx.dtsi                     |   8 +
 drivers/firmware/Kconfig                           |  12 +
 drivers/firmware/Makefile                          |   1 +
 drivers/firmware/nxp_lpc_boot_rom.c                | 411 +++++++++++++++++++++
 5 files changed, 453 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/firmware/nxp,boot-rom.txt
 create mode 100644 drivers/firmware/nxp_lpc_boot_rom.c

-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
