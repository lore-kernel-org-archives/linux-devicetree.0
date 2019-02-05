From: Tao Ren <taoren@fb.com>
Subject: [PATCH] ARM: dts: aspeed: cmm: enable iio-hwmon-adc
Date: Tue, 5 Feb 2019 14:46:19 -0800
Message-ID: <20190205224619.2102873-1-taoren@fb.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Cc: Tao Ren <taoren@fb.com>
List-Id: devicetree@vger.kernel.org

Bind aspeed ADC channels 0-7 to "iio-hwmon" driver so the data of these
voltage sensing channels can be accessed by "lm_sensors". Channels 8-15
are not used on CMM BMC.

Signed-off-by: Tao Ren <taoren@fb.com>
---
 arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts
index 9f194b5eeba4..43aba4071a5c 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts
@@ -56,6 +56,12 @@
 	memory@80000000 {
 		reg = <0x80000000 0x20000000>;
 	};
+
+	ast-adc-hwmon {
+		compatible = "iio-hwmon";
+		io-channels = <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>,
+			      <&adc 4>, <&adc 5>, <&adc 6>, <&adc 7>;
+	};
 };
 
 &pinctrl {
-- 
2.17.1
