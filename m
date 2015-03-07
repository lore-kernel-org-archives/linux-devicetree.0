From: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
Subject: [RFC 17/18] arm: dts: n950, n9: Add primary camera support
Date: Sat,  7 Mar 2015 23:41:14 +0200
Message-ID: <1425764475-27691-18-git-send-email-sakari.ailus@iki.fi>
References: <1425764475-27691-1-git-send-email-sakari.ailus@iki.fi>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1425764475-27691-1-git-send-email-sakari.ailus-X3B1VOXEql0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pali.rohar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add support for the primary camera of the Nokia N950 and N9.

Signed-off-by: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
---
 arch/arm/boot/dts/omap3-n9.dts       |   39 ++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/omap3-n950-n9.dtsi |    4 ----
 arch/arm/boot/dts/omap3-n950.dts     |   39 ++++++++++++++++++++++++++++++++++
 3 files changed, 78 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/omap3-n9.dts b/arch/arm/boot/dts/omap3-n9.dts
index 9938b5d..05f32ae 100644
--- a/arch/arm/boot/dts/omap3-n9.dts
+++ b/arch/arm/boot/dts/omap3-n9.dts
@@ -16,3 +16,42 @@
 	model = "Nokia N9";
 	compatible = "nokia,omap3-n9", "ti,omap36xx", "ti,omap3";
 };
+
+&i2c2 {
+	clock-frequency = <400000>;
+
+	smia_1: camera@10 {
+		compatible = "nokia,smia";
+		reg = <0x10>;
+		/* No reset gpio */
+		vana-supply = <&vaux3>;
+		clocks = <&omap3_isp 0>;
+		clock-frequency = <9600000>;
+		nokia,nvm-size = <1024>; /* 16 * 64 */
+		link-frequencies = /bits/ 64 <199200000 210000000 499200000>;
+		port {
+			smia_1_1: endpoint {
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+				remote-endpoint = <&csi2a_ep>;
+			};
+		};
+	};
+};
+
+&omap3_isp {
+	vdd-csiphy1-supply = <&vaux2>;
+	vdd-csiphy2-supply = <&vaux2>;
+	ports {
+		port@2 {
+			reg = <2>;
+			csi2a_ep: endpoint {
+				remote-endpoint = <&smia_1_1>;
+				clock-lanes = <2>;
+				data-lanes = <1 3>;
+				crc = <1>;
+				lane-polarity = <1 1 1>;
+			};
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/omap3-n950-n9.dtsi b/arch/arm/boot/dts/omap3-n950-n9.dtsi
index c41db94..51e5043 100644
--- a/arch/arm/boot/dts/omap3-n950-n9.dtsi
+++ b/arch/arm/boot/dts/omap3-n950-n9.dtsi
@@ -86,10 +86,6 @@
 	regulator-max-microvolt = <2800000>;
 };
 
-&i2c2 {
-	clock-frequency = <400000>;
-};
-
 &i2c3 {
 	clock-frequency = <400000>;
 };
diff --git a/arch/arm/boot/dts/omap3-n950.dts b/arch/arm/boot/dts/omap3-n950.dts
index 261c558..2b2ed9c 100644
--- a/arch/arm/boot/dts/omap3-n950.dts
+++ b/arch/arm/boot/dts/omap3-n950.dts
@@ -16,3 +16,42 @@
 	model = "Nokia N950";
 	compatible = "nokia,omap3-n950", "ti,omap36xx", "ti,omap3";
 };
+
+&i2c2 {
+	clock-frequency = <400000>;
+
+	smia_1: camera@10 {
+		compatible = "nokia,smia";
+		reg = <0x10>;
+		/* No reset gpio */
+		vana-supply = <&vaux3>;
+		clocks = <&omap3_isp 0>;
+		clock-frequency = <9600000>;
+		nokia,nvm-size = <1024>; /* 16 * 64 */
+		link-frequencies = /bits/ 64 <210000000 333600000 398400000>;
+		port {
+			smia_1_1: endpoint {
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+				remote-endpoint = <&csi2a_ep>;
+			};
+		};
+	};
+};
+
+&omap3_isp {
+	vdd-csiphy1-supply = <&vaux2>;
+	vdd-csiphy2-supply = <&vaux2>;
+	ports {
+		port@2 {
+			reg = <2>;
+			csi2a_ep: endpoint {
+				remote-endpoint = <&smia_1_1>;
+				clock-lanes = <2>;
+				data-lanes = <3 1>;
+				crc = <1>;
+				lane-polarity = <1 1 1>;
+			};
+		};
+	};
+};
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
