From: Yangbo Lu <yangbo.lu@nxp.com>
Subject: [PATCH 6/6] MAINTAINERS: maintain DPAA2 PTP driver in QorIQ PTP entry
Date: Mon, 10 Jun 2019 11:21:08 +0800
Message-ID: <20190610032108.5791-7-yangbo.lu@nxp.com>
References: <20190610032108.5791-1-yangbo.lu@nxp.com>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190610032108.5791-1-yangbo.lu@nxp.com>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Yangbo Lu <yangbo.lu@nxp.com>
List-Id: devicetree@vger.kernel.org

Maintain DPAA2 PTP driver in QorIQ PTP entry.

Signed-off-by: Yangbo Lu <yangbo.lu@nxp.com>
---
 MAINTAINERS | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index fcbd648..81762bb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4910,13 +4910,6 @@ L:	linux-kernel@vger.kernel.org
 S:	Maintained
 F:	drivers/staging/fsl-dpaa2/ethsw
 
-DPAA2 PTP CLOCK DRIVER
-M:	Yangbo Lu <yangbo.lu@nxp.com>
-L:	netdev@vger.kernel.org
-S:	Maintained
-F:	drivers/net/ethernet/freescale/dpaa2/dpaa2-ptp*
-F:	drivers/net/ethernet/freescale/dpaa2/dprtc*
-
 DPT_I2O SCSI RAID DRIVER
 M:	Adaptec OEM Raid Solutions <aacraid@microsemi.com>
 L:	linux-scsi@vger.kernel.org
@@ -6359,6 +6352,8 @@ FREESCALE QORIQ PTP CLOCK DRIVER
 M:	Yangbo Lu <yangbo.lu@nxp.com>
 L:	netdev@vger.kernel.org
 S:	Maintained
+F:	drivers/net/ethernet/freescale/dpaa2/dpaa2-ptp*
+F:	drivers/net/ethernet/freescale/dpaa2/dprtc*
 F:	drivers/net/ethernet/freescale/enetc/enetc_ptp.c
 F:	drivers/ptp/ptp_qoriq.c
 F:	drivers/ptp/ptp_qoriq_debugfs.c
-- 
2.7.4
