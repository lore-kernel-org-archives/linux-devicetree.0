From: Pablo Greco <pgreco@centosproject.org>
Subject: [PATCH v4 3/7] ARM: dts: sun8i: v40: bananapi-m2-berry: Enable AHCI
Date: Thu, 18 Apr 2019 12:11:18 -0300
Message-ID: <1555600282-9405-4-git-send-email-pgreco@centosproject.org>
References: <1555600282-9405-1-git-send-email-pgreco@centosproject.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1555600282-9405-1-git-send-email-pgreco@centosproject.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-sunxi@googlegroups.com
Cc: Pablo Greco <pgreco@centosproject.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Just like the Bananapi M2 Ultra, enable the ahci controller and
the two regulators needed to activate it.

Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
Signed-off-by: Pablo Greco <pgreco@centosproject.org>
---
 arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts b/arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts
index 2a5b80b..c37c7ab 100644
--- a/arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts
+++ b/arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts
@@ -99,6 +99,12 @@
 	};
 };
 
+&ahci {
+	ahci-supply = <&reg_dldo4>;
+	phy-supply = <&reg_eldo3>;
+	status = "okay";
+};
+
 &de {
 	status = "okay";
 };
@@ -225,6 +231,18 @@
 	regulator-name = "vcc-wifi";
 };
 
+&reg_dldo4 {
+	regulator-min-microvolt = <2500000>;
+	regulator-max-microvolt = <2500000>;
+	regulator-name = "vdd2v5-sata";
+};
+
+&reg_eldo3 {
+	regulator-min-microvolt = <1200000>;
+	regulator-max-microvolt = <1200000>;
+	regulator-name = "vdd1v2-sata";
+};
+
 &tcon_tv0 {
 	status = "okay";
 };
-- 
1.8.3.1
