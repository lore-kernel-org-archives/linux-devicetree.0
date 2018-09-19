From: Anson Huang <Anson.Huang@nxp.com>
Subject: [PATCH V2 3/4] dt-bindings: arm: add compatible for i.MX6ULZ 14x14 EVK board
Date: Wed, 19 Sep 2018 14:04:47 +0800
Message-ID: <1537337088-28819-4-git-send-email-Anson.Huang@nxp.com>
References: <1537337088-28819-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1537337088-28819-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, fabio.estevam@nxp.com, linux@armlinux.org.uk, mturquette@baylibre.com, sboyd@kernel.org, ping.bai@nxp.com, Aisheng.dong@nxp.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Cc: Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

This patch adds compatible for i.MX6ULZ 14x14 EVK board.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 Documentation/devicetree/bindings/arm/fsl.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.txt b/Documentation/devicetree/bindings/arm/fsl.txt
index 968f238..9a0ffce 100644
--- a/Documentation/devicetree/bindings/arm/fsl.txt
+++ b/Documentation/devicetree/bindings/arm/fsl.txt
@@ -85,6 +85,10 @@ i.MX6 UltraLiteLite 14x14 EVK Board
 Required root node properties:
     - compatible = "fsl,imx6ull-14x14-evk", "fsl,imx6ull";
 
+i.MX6 ULZ 14x14 EVK Board
+Required root node properties:
+    - compatible = "fsl,imx6ulz-14x14-evk", "fsl,imx6ulz";
+
 i.MX6 SoloX SDB Board
 Required root node properties:
     - compatible = "fsl,imx6sx-sdb", "fsl,imx6sx";
-- 
2.7.4
