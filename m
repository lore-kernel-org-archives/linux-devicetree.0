From: Yangbo Lu <yangbo.lu@nxp.com>
Subject: [v3, 6/6] MAINTAINERS: add drivers/ptp/ptp_qoriq_debugfs.c into QorIQ PTP list
Date: Mon, 21 Jan 2019 18:41:43 +0800
Message-ID: <20190121104143.46782-7-yangbo.lu@nxp.com>
References: <20190121104143.46782-1-yangbo.lu@nxp.com>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190121104143.46782-1-yangbo.lu@nxp.com>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: "David S . Miller" <davem@davemloft.net>, Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Yangbo Lu <yangbo.lu@nxp.com>
List-Id: devicetree@vger.kernel.org

Added drivers/ptp/ptp_qoriq_debugfs.c into QorIQ PTP clock driver list.

Signed-off-by: Yangbo Lu <yangbo.lu@nxp.com>
---
Changes for v3:
	- Added this patch.
---
 MAINTAINERS |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index a592b99..098d0eb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6088,6 +6088,7 @@ M:	Yangbo Lu <yangbo.lu@nxp.com>
 L:	netdev@vger.kernel.org
 S:	Maintained
 F:	drivers/ptp/ptp_qoriq.c
+F:	drivers/ptp/ptp_qoriq_debugfs.c
 F:	include/linux/fsl/ptp_qoriq.h
 F:	Documentation/devicetree/bindings/ptp/ptp-qoriq.txt
 
-- 
1.7.1
