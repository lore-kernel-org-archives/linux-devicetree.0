From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg-Bxea+6Xhats@public.gmane.org>
Subject: [PATCH v2 0/3] ARM: aspeed: add support for the BT IPMI interface
Date: Fri, 16 Sep 2016 12:39:24 +0200
Message-ID: <1474022367-21029-1-git-send-email-clg@kaod.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Corey Minyard <minyard-HInyCGIudOg@public.gmane.org>, openipmi-developer-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Cc: Alistair Popple <alistair-Y4h6yKqj69EXC2x5gXVKYQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg-Bxea+6Xhats@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello,

This serie adds support for the iBT interface on Aspeed SOCs (AST2400
and AST2500). The BT (Block Transfer) interface is used to perform
in-band IPMI communication between a host and its BMC. This driver
implements the BMC side.

Most noticeable changes in v2 are:

 - the driver is now called 'bt-bmc' and the device node '/dev/ipmi-bt-host'
   
 - the code is now under drivers/char/ipmi/. This required a change of
   the top Makefile in drivers/ to compile the bt-bmc driver with the
   ipmi handlers not being selected. That might be an issue.
   
 - changed the read/write operations to use a temporary buffer and get
   rid of the {get,put}_user calls

Thanks,

C.

Alistair Popple (1):
  misc: Add Aspeed BT IPMI BMC driver

Cédric Le Goater (2):
  ARM: aspeed: Add defconfigs for CONFIG_ASPEED_BT_IPMI_BMC
  ARM: dts: aspeed: Enable BT IPMI BMC device

 .../bindings/char/ipmi/aspeed,ast2400-bt-bmc.txt   |  23 +
 arch/arm/boot/dts/aspeed-g4.dtsi                   |   6 +
 arch/arm/boot/dts/aspeed-g5.dtsi                   |   6 +
 arch/arm/configs/aspeed_g4_defconfig               |   1 +
 arch/arm/configs/aspeed_g5_defconfig               |   1 +
 drivers/Makefile                                   |   2 +-
 drivers/char/ipmi/Kconfig                          |   7 +
 drivers/char/ipmi/Makefile                         |   1 +
 drivers/char/ipmi/bt-bmc.c                         | 486 +++++++++++++++++++++
 include/uapi/linux/Kbuild                          |   1 +
 include/uapi/linux/bt-bmc.h                        |  18 +
 11 files changed, 551 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/char/ipmi/aspeed,ast2400-bt-bmc.txt
 create mode 100644 drivers/char/ipmi/bt-bmc.c
 create mode 100644 include/uapi/linux/bt-bmc.h

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
