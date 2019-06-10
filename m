From: Yangbo Lu <yangbo.lu@nxp.com>
Subject: [PATCH 3/6] dt-binding: ptp_qoriq: support DPAA2 PTP compatible
Date: Mon, 10 Jun 2019 11:21:05 +0800
Message-ID: <20190610032108.5791-4-yangbo.lu@nxp.com>
References: <20190610032108.5791-1-yangbo.lu@nxp.com>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190610032108.5791-1-yangbo.lu@nxp.com>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Yangbo Lu <yangbo.lu@nxp.com>
List-Id: devicetree@vger.kernel.org

Add a new compatible for DPAA2 PTP.

Signed-off-by: Yangbo Lu <yangbo.lu@nxp.com>
---
 Documentation/devicetree/bindings/ptp/ptp-qoriq.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/ptp/ptp-qoriq.txt b/Documentation/devicetree/bindings/ptp/ptp-qoriq.txt
index 6ec0534..d48f9eb 100644
--- a/Documentation/devicetree/bindings/ptp/ptp-qoriq.txt
+++ b/Documentation/devicetree/bindings/ptp/ptp-qoriq.txt
@@ -4,7 +4,8 @@ General Properties:
 
   - compatible   Should be "fsl,etsec-ptp" for eTSEC
                  Should be "fsl,fman-ptp-timer" for DPAA FMan
-		 Should be "fsl,enetc-ptp" for ENETC
+                 Should be "fsl,dpaa2-ptp" for DPAA2
+                 Should be "fsl,enetc-ptp" for ENETC
   - reg          Offset and length of the register set for the device
   - interrupts   There should be at least two interrupts. Some devices
                  have as many as four PTP related interrupts.
-- 
2.7.4
