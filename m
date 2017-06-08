From: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: [PATCH v4 3/3] ARM: dts: imx6qdl.dtsi: add "fsl,imx6q-snvs-lpgpr" node
Date: Thu,  8 Jun 2017 18:51:34 +0200
Message-ID: <20170608165134.14971-4-o.rempel@pengutronix.de>
References: <20170608165134.14971-1-o.rempel@pengutronix.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170608165134.14971-1-o.rempel@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>
List-Id: devicetree@vger.kernel.org

This node is for Low Power General Purpose Register which can
be used as Non-Volatile Storage.

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 arch/arm/boot/dts/imx6qdl.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/imx6qdl.dtsi b/arch/arm/boot/dts/imx6qdl.dtsi
index e426faa9c243..94e992558238 100644
--- a/arch/arm/boot/dts/imx6qdl.dtsi
+++ b/arch/arm/boot/dts/imx6qdl.dtsi
@@ -769,6 +769,10 @@
 					mask = <0x60>;
 					status = "disabled";
 				};
+
+				snvs_lpgpr: snvs-lpgpr {
+					compatible = "fsl,imx6q-snvs-lpgpr";
+				};
 			};
 
 			epit1: epit@020d0000 { /* EPIT1 */
-- 
2.11.0
