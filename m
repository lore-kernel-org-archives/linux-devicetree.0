From: Yangbo Lu <yangbo.lu@nxp.com>
Subject: [PATCH 5/5] MAINTAINERS: add myself as maintainer for QorIQ PTP clock driver
Date: Fri, 25 May 2018 12:40:38 +0800
Message-ID: <20180525044038.37756-5-yangbo.lu@nxp.com>
References: <20180525044038.37756-1-yangbo.lu@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180525044038.37756-1-yangbo.lu@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>, claudiu.manoil@nxp.com, Rob Herring <robh+dt@kernel.org>
Cc: Yangbo Lu <yangbo.lu@nxp.com>
List-Id: devicetree@vger.kernel.org

Added myself as maintainer for QorIQ PTP clock driver.
Since gianfar_ptp.c was renamed to ptp_qoriq.c, let's
also maintain it under QorIQ PTP clock driver.

Signed-off-by: Yangbo Lu <yangbo.lu@nxp.com>
---
 MAINTAINERS |   17 +++++++++--------
 1 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4b65225..a71d4fa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4411,12 +4411,6 @@ L:	linux-kernel@vger.kernel.org
 S:	Maintained
 F:	drivers/staging/fsl-dpaa2/ethsw
 
-DPAA2 PTP CLOCK DRIVER
-M:	Yangbo Lu <yangbo.lu@nxp.com>
-L:	linux-kernel@vger.kernel.org
-S:	Maintained
-F:	drivers/staging/fsl-dpaa2/rtc
-
 DPT_I2O SCSI RAID DRIVER
 M:	Adaptec OEM Raid Solutions <aacraid@microsemi.com>
 L:	linux-scsi@vger.kernel.org
@@ -5648,7 +5642,6 @@ M:	Claudiu Manoil <claudiu.manoil@nxp.com>
 L:	netdev@vger.kernel.org
 S:	Maintained
 F:	drivers/net/ethernet/freescale/gianfar*
-X:	drivers/net/ethernet/freescale/gianfar_ptp.c
 F:	Documentation/devicetree/bindings/net/fsl-tsec-phy.txt
 
 FREESCALE GPMI NAND DRIVER
@@ -5695,6 +5688,15 @@ S:	Maintained
 F:	drivers/net/ethernet/freescale/fman
 F:	Documentation/devicetree/bindings/powerpc/fsl/fman.txt
 
+FREESCALE QORIQ PTP CLOCK DRIVER
+M:	Yangbo Lu <yangbo.lu@nxp.com>
+L:	linux-kernel@vger.kernel.org
+S:	Maintained
+F:	drivers/staging/fsl-dpaa2/rtc
+F:	drivers/ptp/ptp_qoriq.c
+F:	include/linux/fsl/ptp_qoriq.h
+F:	Documentation/devicetree/bindings/ptp/ptp-qoriq.txt
+
 FREESCALE QUAD SPI DRIVER
 M:	Han Xu <han.xu@nxp.com>
 L:	linux-mtd@lists.infradead.org
@@ -11429,7 +11431,6 @@ S:	Maintained
 W:	http://linuxptp.sourceforge.net/
 F:	Documentation/ABI/testing/sysfs-ptp
 F:	Documentation/ptp/*
-F:	drivers/net/ethernet/freescale/gianfar_ptp.c
 F:	drivers/net/phy/dp83640*
 F:	drivers/ptp/*
 F:	include/linux/ptp_cl*
-- 
1.7.1
