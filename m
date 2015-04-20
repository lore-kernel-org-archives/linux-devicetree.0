From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH RFC 2/3] ARM: imx28: define PMU as clock consumer
Date: Mon, 20 Apr 2015 21:45:22 +0000
Message-ID: <1429566323-8263-3-git-send-email-stefan.wahren@i2se.com>
References: <1429566323-8263-1-git-send-email-stefan.wahren@i2se.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1429566323-8263-1-git-send-email-stefan.wahren@i2se.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>
Cc: Shawn Guo <shawn.guo@linaro.org>, Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Fabio Estevam <fabio.estevam@freescale.com>, Marek Vasut <marex@denx.de>, Sascha Hauer <kernel@pengutronix.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Stefan Wahren <stefan.wahren@i2se.com>
List-Id: devicetree@vger.kernel.org

This patch defines the i.MX28 PMU as consumer of clock dcdc_sel.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 arch/arm/boot/dts/imx28.dtsi |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/imx28.dtsi b/arch/arm/boot/dts/imx28.dtsi
index 02330f4..bdd087d 100644
--- a/arch/arm/boot/dts/imx28.dtsi
+++ b/arch/arm/boot/dts/imx28.dtsi
@@ -1022,7 +1022,9 @@
 			};
 
 			power: power@80044000 {
+				compatible = "fsl,imx28-power", "syscon";
 				reg = <0x80044000 0x2000>;
+				clocks = <&clks 67>;
 				status = "disabled";
 			};
 
-- 
1.7.9.5
