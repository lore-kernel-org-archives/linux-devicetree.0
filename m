From: Anson Huang <Anson.Huang@nxp.com>
Subject: [PATCH] dt-bindings: reset: imx7: update the compatible string
Date: Thu, 30 Aug 2018 16:05:25 +0800
Message-ID: <1535616325-17445-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: p.zabel@pengutronix.de, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

The i.MX7 SRC's compatible string should be "fsl,imx7d-src".

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 Documentation/devicetree/bindings/reset/fsl,imx7-src.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/reset/fsl,imx7-src.txt b/Documentation/devicetree/bindings/reset/fsl,imx7-src.txt
index 5e1afc3..1ab1d10 100644
--- a/Documentation/devicetree/bindings/reset/fsl,imx7-src.txt
+++ b/Documentation/devicetree/bindings/reset/fsl,imx7-src.txt
@@ -5,7 +5,7 @@ Please also refer to reset.txt in this directory for common reset
 controller binding usage.
 
 Required properties:
-- compatible: Should be "fsl,imx7-src", "syscon"
+- compatible: Should be "fsl,imx7d-src", "syscon"
 - reg: should be register base and length as documented in the
   datasheet
 - interrupts: Should contain SRC interrupt
-- 
2.7.4
