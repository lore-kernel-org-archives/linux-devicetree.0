From: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Subject: [PATCHv6 0/2] socfpga: support suspend to ram*
Date: Tue, 2 Jun 2015 13:35:37 -0500
Message-ID: <1433270139-7042-1-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Pavel Machek <pavel-ynQEQJNshbs@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Delicious Quinoq <delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Support suspend to ram on socfpga.
  * allocate space in ocram using sram driver.
  * Add a function in ocram to place DDR in self-refresh
    and suspend.
  * Prevent suspend if EDAC is enabled.
  * Add a device tree binding document for the Altera
    SOCFPGA SDRAM controller that is used to put DDR in
    self-refresh mode.

Alan Tull (2):
  ARM: socfpga: support suspend to ram
  ARM: socfpga: dts: add sdram controller dt binding doc

 .../arm/altera/socfpga-sdram-controller.txt        |   12 ++
 arch/arm/mach-socfpga/Kconfig                      |   10 +-
 arch/arm/mach-socfpga/Makefile                     |    1 +
 arch/arm/mach-socfpga/core.h                       |    6 +-
 arch/arm/mach-socfpga/pm.c                         |  149 ++++++++++++++++++++
 arch/arm/mach-socfpga/self-refresh.S               |  136 ++++++++++++++++++
 arch/arm/mach-socfpga/socfpga.c                    |    6 +-
 drivers/edac/altera_edac.c                         |   20 +++
 8 files changed, 337 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/altera/socfpga-sdram-controller.txt
 create mode 100644 arch/arm/mach-socfpga/pm.c
 create mode 100644 arch/arm/mach-socfpga/self-refresh.S

-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
