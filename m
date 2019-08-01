From: Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 4/8] ARM: dts: mbimxsd25: native-mode is part of display-timings
Date: Thu,  1 Aug 2019 17:46:24 +0200
Message-ID: <20190801154628.1624-5-martin@kaiser.cx>
References: <20190801154628.1624-1-martin@kaiser.cx>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190801154628.1624-1-martin@kaiser.cx>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Martin Kaiser <martin@kaiser.cx>
List-Id: devicetree@vger.kernel.org

Move the native-mode property inside the display-timings node.

According to
Documentation/devicetree/bindings/display/panel/display-timing.txt.
native-mode is a property of the display-timings node.

If it's located outside of display-timings, the native-mode setting is
ignored and the first display timing is used (which is a problem only if
someone adds another display timing).

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 arch/arm/boot/dts/imx25-eukrea-mbimxsd25-baseboard-cmo-qvga.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/imx25-eukrea-mbimxsd25-baseboard-cmo-qvga.dts b/arch/arm/boot/dts/imx25-eukrea-mbimxsd25-baseboard-cmo-qvga.dts
index dbecd6d2cfc4..7d4301b22b90 100644
--- a/arch/arm/boot/dts/imx25-eukrea-mbimxsd25-baseboard-cmo-qvga.dts
+++ b/arch/arm/boot/dts/imx25-eukrea-mbimxsd25-baseboard-cmo-qvga.dts
@@ -14,8 +14,8 @@
 		bits-per-pixel = <16>;
 		fsl,pcr = <0xcad08b80>;
 		bus-width = <18>;
-		native-mode = <&qvga_timings>;
 		display-timings {
+			native-mode = <&qvga_timings>;
 			qvga_timings: 320x240 {
 				clock-frequency = <6500000>;
 				hactive = <320>;
-- 
2.11.0
