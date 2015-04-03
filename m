From: <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Subject: [PATCH 0/7] ARM: socfpga: Add support for Arria10 devkit
Date: Thu, 2 Apr 2015 23:39:51 -0500
Message-ID: <1428035998-27542-1-git-send-email-dinguyen@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org
Cc: dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>

Hi,

This patchset enables and tidy up support for the Arria10 devkit. Along with
this patchset and the patch for enabling clocks on the Arria10, the devkit
can boot Linux.

Dinh Nguyen (7):
  ARM: socfpga: add cpu1-start-addr for Arria 10
  ARM: socfpga: disable the sdmmc, and uart nodes in the base arria10
  ARM: socfpga: dts: enable UART1 for the debug uart
  ARM: socfpga: rename socdk board file to socdk_sdmmc
  ARM: socfpga: Add support for UART1 debug uart for earlyprintk
  ARM: socfpga: remove the need to map uart_io_desc
  Documentation: DT bindings: add doc for Altera's SoCFPGA platform

 Documentation/devicetree/bindings/arm/altera.txt   | 14 ++++++++++++
 arch/arm/Kconfig.debug                             | 25 +++++++++++++++------
 arch/arm/boot/dts/Makefile                         |  2 +-
 arch/arm/boot/dts/socfpga_arria10.dtsi             |  4 ++++
 ...rria10_socdk.dts => socfpga_arria10_socdk.dtsi} |  6 ++---
 arch/arm/boot/dts/socfpga_arria10_socdk_sdmmc.dts  | 26 ++++++++++++++++++++++
 arch/arm/mach-socfpga/socfpga.c                    |  9 --------
 7 files changed, 65 insertions(+), 21 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/altera.txt
 rename arch/arm/boot/dts/{socfpga_arria10_socdk.dts => socfpga_arria10_socdk.dtsi} (92%)
 mode change 100755 => 100644
 create mode 100644 arch/arm/boot/dts/socfpga_arria10_socdk_sdmmc.dts

-- 
2.2.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
