From: Yangbo Lu <yangbo.lu@nxp.com>
Subject: [v2, 7/9] ptp: add QorIQ PTP support for ENETC
Date: Sat,  2 Feb 2019 10:57:05 +0800
Message-ID: <20190202025707.10794-8-yangbo.lu@nxp.com>
References: <20190202025707.10794-1-yangbo.lu@nxp.com>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190202025707.10794-1-yangbo.lu@nxp.com>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org, devicetree@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>, Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh+dt@kernel.org>, Claudiu Manoil <claudiu.manoil@nxp.com>, Yangbo Lu <yangbo.lu@nxp.com>
List-Id: devicetree@vger.kernel.org

This patch is to add QorIQ PTP support for ENETC.
ENETC PTP driver which is a PCI driver for same
1588 timer IP block will reuse QorIQ PTP driver.

Signed-off-by: Yangbo Lu <yangbo.lu@nxp.com>
---
Chanbges for v2:
	- None.
---
 drivers/ptp/Kconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/ptp/Kconfig b/drivers/ptp/Kconfig
index aeb4a8b..7fe1863 100644
--- a/drivers/ptp/Kconfig
+++ b/drivers/ptp/Kconfig
@@ -43,7 +43,7 @@ config PTP_1588_CLOCK_DTE
 
 config PTP_1588_CLOCK_QORIQ
 	tristate "Freescale QorIQ 1588 timer as PTP clock"
-	depends on GIANFAR || FSL_DPAA_ETH
+	depends on GIANFAR || FSL_DPAA_ETH || FSL_ENETC || FSL_ENETC_VF
 	depends on PTP_1588_CLOCK
 	default y
 	help
-- 
1.7.1
