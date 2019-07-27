From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
Subject: [PATCH] dt-bindings: imx: i.MX8MN: Use space instead of tab
Date: Sat, 27 Jul 2019 13:29:30 +0200
Message-ID: <35f999387bca037731dd963a5901909d6e6d0a17.1564226824.git.agx@sigxcpu.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This fixes 'make dt_binding_check'

Signed-off-by: Guido Günther <agx@sigxcpu.org>
---
Seen on next-20190726

 Documentation/devicetree/bindings/clock/imx8mn-clock.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/imx8mn-clock.yaml b/Documentation/devicetree/bindings/clock/imx8mn-clock.yaml
index 454c5b44b2ee..622f3658bd9f 100644
--- a/Documentation/devicetree/bindings/clock/imx8mn-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/imx8mn-clock.yaml
@@ -71,7 +71,7 @@ examples:
         compatible = "fixed-clock";
         #clock-cells = <0>;
         clock-frequency = <32768>;
-	clock-output-names = "osc_32k";
+        clock-output-names = "osc_32k";
     };
 
     osc_24m: clock-osc-24m {
-- 
2.20.1
