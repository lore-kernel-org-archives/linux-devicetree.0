From: <tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Subject: [PATCH 0/3] Add Altera peripheral memories to EDAC framework
Date: Wed, 1 Oct 2014 11:31:29 -0500
Message-ID: <1412181092-27162-1-git-send-email-tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dinh-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org, dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org, bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org, m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org, tthayer.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Thor Thayer <tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>

This patch adds the L2 cache and OCRAM peripherals to the EDAC framework
using the EDAC device framework. The ECC is enabled early in the boot
process in the platform specific code.

Thor Thayer (3):
  arm: socfpga: Enable ECC of L2 and OCRAM on startup.
  edac: altera: Add Altera L2 Cache and OCRAM EDAC Support
  arm: dts: Add Altera L2 Cache and OCRAM EDAC

 .../bindings/arm/altera/socfpga-l2-edac.txt        |   15 ++
 .../bindings/arm/altera/socfpga-ocram-edac.txt     |   16 ++
 MAINTAINERS                                        |    7 +
 arch/arm/boot/dts/socfpga.dtsi                     |   20 +-
 arch/arm/configs/socfpga_defconfig                 |    1 +
 arch/arm/mach-socfpga/Makefile                     |    2 +
 arch/arm/mach-socfpga/l2_cache.c                   |   44 ++++
 arch/arm/mach-socfpga/l2_cache.h                   |   28 +++
 arch/arm/mach-socfpga/ocram.c                      |   84 +++++++
 arch/arm/mach-socfpga/ocram.h                      |   28 +++
 arch/arm/mach-socfpga/socfpga.c                    |   13 +-
 drivers/edac/Kconfig                               |   14 ++
 drivers/edac/Makefile                              |    4 +
 drivers/edac/altera_edac_mgr.c                     |  261 ++++++++++++++++++++
 drivers/edac/altera_edac_mgr.h                     |   56 +++++
 drivers/edac/altera_l2_edac.c                      |  130 ++++++++++
 drivers/edac/altera_ocram_edac.c                   |  107 ++++++++
 17 files changed, 828 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/altera/socfpga-l2-edac.txt
 create mode 100644 Documentation/devicetree/bindings/arm/altera/socfpga-ocram-edac.txt
 create mode 100644 arch/arm/mach-socfpga/l2_cache.c
 create mode 100644 arch/arm/mach-socfpga/l2_cache.h
 create mode 100644 arch/arm/mach-socfpga/ocram.c
 create mode 100644 arch/arm/mach-socfpga/ocram.h
 create mode 100644 drivers/edac/altera_edac_mgr.c
 create mode 100644 drivers/edac/altera_edac_mgr.h
 create mode 100644 drivers/edac/altera_l2_edac.c
 create mode 100644 drivers/edac/altera_ocram_edac.c

-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
