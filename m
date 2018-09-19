From: =?UTF-8?q?Rodrigo=20Exterck=C3=B6tter=20Tj=C3=A4der?=
        <rodrigo@tjader.xyz>
Subject: [PATCH 1/2] arm64: dts: allwinner: Olimex A64-OLinuXino: enable eMMC.
Date: Wed, 19 Sep 2018 11:18:13 -0300
Message-ID: <20180919141815.18737-1-rodrigo@tjader.xyz>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: =?UTF-8?q?Rodrigo=20Exterck=C3=B6tter=20Tj=C3=A4der?= <rodrigo@tjader.xyz>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Copied snippet from A64-TERES I.

Signed-off-by: Rodrigo Exterckötter Tjäder <rodrigo@tjader.xyz>
---
 .../arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts
index 657f58def54c..5245de3a1f35 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts
@@ -128,6 +128,17 @@
 	};
 };
 
+&mmc2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc2_pins>;
+	vmmc-supply = <&reg_dcdc1>;
+	vqmmc-supply = <&reg_dcdc1>;
+	bus-width = <8>;
+	non-removable;
+	cap-mmc-hw-reset;
+	status = "okay";
+};
+
 &ohci0 {
 	status = "okay";
 };
-- 
2.18.0
