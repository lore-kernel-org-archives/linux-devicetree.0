From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Subject: [PATCH 2/3] ARM: i.MX25: add RNGC node to dtsi
Date: Mon, 29 Feb 2016 16:52:35 +0100
Message-ID: <1456761156-27664-2-git-send-email-s.trumtrar@pengutronix.de>
References: <1456761156-27664-1-git-send-email-s.trumtrar@pengutronix.de>
Return-path: <linux-crypto-owner@vger.kernel.org>
In-Reply-To: <1456761156-27664-1-git-send-email-s.trumtrar@pengutronix.de>
Sender: linux-crypto-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, Matt Mackall <mpm@selenic.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org, kernel@pengutronix.de, Steffen Trumtrar <s.trumtrar@pengutronix.de>
List-Id: devicetree@vger.kernel.org

Add a devicetree entry for the Random Number Generator Version C (RNGC).

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
 arch/arm/boot/dts/imx25.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/imx25.dtsi b/arch/arm/boot/dts/imx25.dtsi
index cde329e9b9e3..ec44ed125057 100644
--- a/arch/arm/boot/dts/imx25.dtsi
+++ b/arch/arm/boot/dts/imx25.dtsi
@@ -397,6 +397,15 @@
 				interrupts = <41>;
 			};
 
+			rng: rng@53fb0000 {
+				compatible = "fsl,imx25-rng";
+				reg = <0x53fb0000 0x4000>;
+				clocks = <&clks 109>;
+				clock-names = "ipg";
+				interrupts = <22>;
+				interrupt-names = "rng";
+			};
+
 			esdhc1: esdhc@53fb4000 {
 				compatible = "fsl,imx25-esdhc";
 				reg = <0x53fb4000 0x4000>;
-- 
2.7.0
