From: <tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Subject: [PATCHv2 0/7]  Add EDAC peripheral init functions & Ethernet EDAC
Date: Mon, 25 Apr 2016 12:52:41 -0500
Message-ID: <1461606768-14404-1-git-send-email-tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org, dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org, m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, tthayer.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Thor Thayer <tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>

This patch set adds the memory initialization functions for Altera's
Arria10 peripherals, the first of which is the Ethernet EDAC. The
ECC memory init functions are common to all the peripheral memory
buffers.

Thor Thayer (7):
  EDAC, altera: Check parent status for Arria10 EDAC block
  EDAC, altera: Add panic flag check to A10 IRQ
  EDAC, altera: Move Arria10 IRQ function
  Documentation: dt: socfpga: Add Arria10 Ethernet binding
  EDAC, altera: Add Arria10 ECC memory init functions
  EDAC, altera: Add Arria10 Ethernet EDAC support
  ARM: dts: Add Arria10 Ethernet EDAC devicetree entry

 .../bindings/arm/altera/socfpga-eccmgr.txt         |   24 ++
 arch/arm/boot/dts/socfpga_arria10.dtsi             |   36 ++
 drivers/edac/Kconfig                               |    7 +
 drivers/edac/altera_edac.c                         |  373 ++++++++++++++++++--
 drivers/edac/altera_edac.h                         |   23 ++
 5 files changed, 443 insertions(+), 20 deletions(-)

-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
