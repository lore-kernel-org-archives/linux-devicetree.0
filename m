From: Yangbo Lu <yangbo.lu@nxp.com>
Subject: [v3, 5/9] dt-binding: ptp_qoriq: add little-endian support
Date: Tue, 12 Feb 2019 12:24:00 +0800
Message-ID: <20190212042404.15575-6-yangbo.lu@nxp.com>
References: <20190212042404.15575-1-yangbo.lu@nxp.com>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190212042404.15575-1-yangbo.lu@nxp.com>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org, devicetree@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>, Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh+dt@kernel.org>, Claudiu Manoil <claudiu.manoil@nxp.com>, Yangbo Lu <yangbo.lu@nxp.com>
List-Id: devicetree@vger.kernel.org

Specify "little-endian" property if the 1588 timer IP block
is little-endian mode. The default endian mode is big-endian.

Signed-off-by: Yangbo Lu <yangbo.lu@nxp.com>
---
Changes for v2:
	- None.
Changes for v3:
	- None.
---
 .../devicetree/bindings/ptp/ptp-qoriq.txt          |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/Documentation/devicetree/bindings/ptp/ptp-qoriq.txt b/Documentation/devicetree/bindings/ptp/ptp-qoriq.txt
index 8e7f855..454c937 100644
--- a/Documentation/devicetree/bindings/ptp/ptp-qoriq.txt
+++ b/Documentation/devicetree/bindings/ptp/ptp-qoriq.txt
@@ -19,6 +19,9 @@ Clock Properties:
   - fsl,max-adj      Maximum frequency adjustment in parts per billion.
   - fsl,extts-fifo   The presence of this property indicates hardware
 		     support for the external trigger stamp FIFO.
+  - little-endian    The presence of this property indicates the 1588 timer
+		     IP block is little-endian mode. The default endian mode
+		     is big-endian.
 
   These properties set the operational parameters for the PTP
   clock. You must choose these carefully for the clock to work right.
-- 
1.7.1
