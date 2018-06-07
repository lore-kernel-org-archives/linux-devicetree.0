From: Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH 3/3] ARM: dts: imx6qdl-icore: Fix wrong reg_2p5 regulator node name
Date: Thu,  7 Jun 2018 19:21:33 +0530
Message-ID: <20180607135133.3104-3-jagan@amarulasolutions.com>
References: <20180607135133.3104-1-jagan@amarulasolutions.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180607135133.3104-1-jagan@amarulasolutions.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Matteo Lisi <matteo.lisi@engicam.com>, Michael Trimarchi <michael@amarulasolutions.com>, Jagan Teki <jagan@amarulasolutions.com>
List-Id: devicetree@vger.kernel.org

- in reg_2p5, fix regulator node name as regulator-2p5v
- remove exctra line

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 arch/arm/boot/dts/imx6qdl-icore.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/imx6qdl-icore.dtsi b/arch/arm/boot/dts/imx6qdl-icore.dtsi
index be8aa55c973e..9ce993776160 100644
--- a/arch/arm/boot/dts/imx6qdl-icore.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-icore.dtsi
@@ -65,8 +65,7 @@
 		regulator-always-on;
 	};
 
-
-	reg_2p5v: regulator-3p3v {
+	reg_2p5v: regulator-2p5v {
 		compatible = "regulator-fixed";
 		regulator-name = "2P5V";
 		regulator-min-microvolt = <2500000>;
-- 
2.14.3
