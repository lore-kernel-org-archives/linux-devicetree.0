From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 4.9 04/35] ARM: dts: imx7d-nitrogen7: Fix the description of the Wifi clock
Date: Wed, 26 Dec 2018 17:41:11 -0500
Message-ID: <20181226224142.150866-4-sashal@kernel.org>
References: <20181226224142.150866-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20181226224142.150866-1-sashal@kernel.org>
Sender: stable-owner@vger.kernel.org
To: stable@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Sasha Levin <sashal@kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Fabio Estevam <festevam@gmail.com>

[ Upstream commit f15096f12a4e9340168df5fdd9201aa8ed60d59e ]

According to bindings/regulator/fixed-regulator.txt the 'clocks' and
'clock-names' properties are not valid ones.

In order to turn on the Wifi clock the correct location for describing
the CLKO2 clock is via a mmc-pwrseq handle, so do it accordingly.

Fixes: 56354959cfec ("ARM: dts: imx: add Boundary Devices Nitrogen7 board")
Signed-off-by: Fabio Estevam <festevam@gmail.com>
Acked-by: Troy Kisky <troy.kisky@boundarydevices.com>
Signed-off-by: Shawn Guo <shawnguo@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/boot/dts/imx7d-nitrogen7.dts | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/imx7d-nitrogen7.dts b/arch/arm/boot/dts/imx7d-nitrogen7.dts
index ce08f180f213..080a4ea841c9 100644
--- a/arch/arm/boot/dts/imx7d-nitrogen7.dts
+++ b/arch/arm/boot/dts/imx7d-nitrogen7.dts
@@ -117,13 +117,17 @@
 		compatible = "regulator-fixed";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		clocks = <&clks IMX7D_CLKO2_ROOT_DIV>;
-		clock-names = "slow";
 		regulator-name = "reg_wlan";
 		startup-delay-us = <70000>;
 		gpio = <&gpio4 21 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
+
+	usdhc2_pwrseq: usdhc2_pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		clocks = <&clks IMX7D_CLKO2_ROOT_DIV>;
+		clock-names = "ext_clock";
+	};
 };
 
 &adc1 {
@@ -430,6 +434,7 @@
 	bus-width = <4>;
 	non-removable;
 	vmmc-supply = <&reg_wlan>;
+	mmc-pwrseq = <&usdhc2_pwrseq>;
 	cap-power-off-card;
 	keep-power-in-suspend;
 	status = "okay";
-- 
2.19.1
