From: Yangbo Lu <yangbo.lu@nxp.com>
Subject: [v2] MAINTAINERS: add myself as maintainer for QorIQ PTP clock driver
Date: Tue, 29 May 2018 11:47:44 +0800
Message-ID: <20180529034744.44590-1-yangbo.lu@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>, claudiu.manoil@nxp.com, Rob Herring <robh+dt@kernel.org>
Cc: Yangbo Lu <yangbo.lu@nxp.com>
List-Id: devicetree@vger.kernel.org

Added myself as maintainer for QorIQ PTP clock driver.
Since gianfar_ptp.c was renamed to ptp_qoriq.c, let's
maintain it under QorIQ PTP clock driver.

Signed-off-by: Yangbo Lu <yangbo.lu@nxp.com>
---
Changes for v2:
	- Dropped dpaa2/rtc part.
---
 MAINTAINERS |   10 ++++++++--
 1 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index f492431..c16340c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5620,7 +5620,6 @@ M:	Claudiu Manoil <claudiu.manoil@nxp.com>
 L:	netdev@vger.kernel.org
 S:	Maintained
 F:	drivers/net/ethernet/freescale/gianfar*
-X:	drivers/net/ethernet/freescale/gianfar_ptp.c
 F:	Documentation/devicetree/bindings/net/fsl-tsec-phy.txt
 
 FREESCALE GPMI NAND DRIVER
@@ -5667,6 +5666,14 @@ S:	Maintained
 F:	drivers/net/ethernet/freescale/fman
 F:	Documentation/devicetree/bindings/powerpc/fsl/fman.txt
 
+FREESCALE QORIQ PTP CLOCK DRIVER
+M:	Yangbo Lu <yangbo.lu@nxp.com>
+L:	netdev@vger.kernel.org
+S:	Maintained
+F:	drivers/ptp/ptp_qoriq.c
+F:	include/linux/fsl/ptp_qoriq.h
+F:	Documentation/devicetree/bindings/ptp/ptp-qoriq.txt
+
 FREESCALE QUAD SPI DRIVER
 M:	Han Xu <han.xu@nxp.com>
 L:	linux-mtd@lists.infradead.org
@@ -11405,7 +11412,6 @@ S:	Maintained
 W:	http://linuxptp.sourceforge.net/
 F:	Documentation/ABI/testing/sysfs-ptp
 F:	Documentation/ptp/*
-F:	drivers/net/ethernet/freescale/gianfar_ptp.c
 F:	drivers/net/phy/dp83640*
 F:	drivers/ptp/*
 F:	include/linux/ptp_cl*
-- 
1.7.1
