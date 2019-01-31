From: Yangbo Lu <yangbo.lu@nxp.com>
Subject: [PATCH 9/9] MAINTAINERS: add enetc_ptp driver into QorIQ PTP list
Date: Thu, 31 Jan 2019 10:33:10 +0800
Message-ID: <20190131023310.9563-10-yangbo.lu@nxp.com>
References: <20190131023310.9563-1-yangbo.lu@nxp.com>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190131023310.9563-1-yangbo.lu@nxp.com>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org, devicetree@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>, Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh+dt@kernel.org>, Claudiu Manoil <claudiu.manoil@nxp.com>, Yangbo Lu <yangbo.lu@nxp.com>
List-Id: devicetree@vger.kernel.org

This patch to add enetc_ptp driver into QorIQ PTP list
for maintaining.

Signed-off-by: Yangbo Lu <yangbo.lu@nxp.com>
---
 MAINTAINERS |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 019a2bc..f0b50f8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6093,6 +6093,7 @@ FREESCALE QORIQ PTP CLOCK DRIVER
 M:	Yangbo Lu <yangbo.lu@nxp.com>
 L:	netdev@vger.kernel.org
 S:	Maintained
+F:	drivers/net/ethernet/freescale/enetc/enetc_ptp.c
 F:	drivers/ptp/ptp_qoriq.c
 F:	drivers/ptp/ptp_qoriq_debugfs.c
 F:	include/linux/fsl/ptp_qoriq.h
-- 
1.7.1
