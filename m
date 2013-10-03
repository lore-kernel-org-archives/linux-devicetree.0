From: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH v2 0/5] SoCFPGA: dts cleanups and SoCkit support
Date: Thu,  3 Oct 2013 23:21:36 +0200
Message-ID: <1380835301-26512-1-git-send-email-s.trumtrar@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Dinh Nguyen <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi!

This is mostly v1 with Acks from Dinh added and an extra patch
that fixes the baudrate for the SoC Development Kit.
Dinh mentioned this on v1. I opted for an extra patch, to keep
1/5 a clean re-ordering patch and don't have any drive-by fixes
although it is a simple one.

Regards,
Steffen

Steffen Trumtrar (5):
  ARM: socfpga: dts: Move common nodes to cyclone5 dtsi
  ARM: socfpga: dts: Change baudrate for socdk
  ARM: socfpga: dts: Add support for terasic SoCkit
  ARM: socfpga: dts: cleanup indentation
  ARM: socfpga: dts: fix s2f_* clock name

 arch/arm/boot/dts/Makefile                         |   3 +-
 arch/arm/boot/dts/socfpga.dtsi                     | 296 ++++++++++-----------
 ...{socfpga_cyclone5.dts => socfpga_cyclone5.dtsi} |  20 --
 arch/arm/boot/dts/socfpga_cyclone5_socdk.dts       |  40 +++
 arch/arm/boot/dts/socfpga_cyclone5_sockit.dts      |  37 +++
 5 files changed, 227 insertions(+), 169 deletions(-)
 rename arch/arm/boot/dts/{socfpga_cyclone5.dts => socfpga_cyclone5.dtsi} (78%)
 create mode 100644 arch/arm/boot/dts/socfpga_cyclone5_socdk.dts
 create mode 100644 arch/arm/boot/dts/socfpga_cyclone5_sockit.dts

-- 
1.8.4.rc3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
