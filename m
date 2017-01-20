From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [PATCH v3 8/9] ARM64: dts: amlogic: add the ethernet TX delay configuration
Date: Fri, 20 Jan 2017 16:22:31 +0100
Message-ID: <20170120152232.13943-9-martin.blumenstingl@googlemail.com>
References: <20170120132650.9784-1-martin.blumenstingl@googlemail.com>
 <20170120152232.13943-1-martin.blumenstingl@googlemail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170120152232.13943-1-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This adds the amlogic,tx-delay-ns property with the old (hardcoded)
default value of 2ns to all boards which are using an RGMII ethernet
PHY.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts    | 2 ++
 arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dts        | 2 ++
 arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi   | 2 ++
 arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dts   | 2 ++
 arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dts | 2 ++
 arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts   | 2 ++
 arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts    | 2 ++
 arch/arm64/boot/dts/amlogic/meson-gxm-q200.dts         | 2 ++
 8 files changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
index 6b5579522587..e63ed98d6c25 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
@@ -154,6 +154,8 @@
 	phy-handle = <&eth_phy0>;
 	phy-mode = "rgmii";
 
+	amlogic,tx-delay-ns = <2>;
+
 	snps,reset-gpio = <&gpio GPIOZ_14 0>;
 	snps,reset-delays-us = <0 10000 1000000>;
 	snps,reset-active-low;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dts
index fa0f84cfeaa9..6c7e914e9bd9 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dts
@@ -58,6 +58,8 @@
 	phy-handle = <&eth_phy0>;
 	phy-mode = "rgmii";
 
+	amlogic,tx-delay-ns = <2>;
+
 	snps,reset-gpio = <&gpio GPIOZ_14 0>;
 	snps,reset-delays-us = <0 10000 1000000>;
 	snps,reset-active-low;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
index 358ab5159bd5..4301ad860a76 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
@@ -131,6 +131,8 @@
 	phy-handle = <&eth_phy0>;
 	phy-mode = "rgmii";
 
+	amlogic,tx-delay-ns = <2>;
+
 	snps,reset-gpio = <&gpio GPIOZ_14 0>;
 	snps,reset-delays-us = <0 10000 1000000>;
 	snps,reset-active-low;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dts
index 47fe4e444f33..f6d8c70a26a2 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dts
@@ -72,6 +72,8 @@
 	phy-handle = <&eth_phy0>;
 	phy-mode = "rgmii";
 
+	amlogic,tx-delay-ns = <2>;
+
 	snps,reset-gpio = <&gpio GPIOZ_14 0>;
 	snps,reset-delays-us = <0 10000 1000000>;
 	snps,reset-active-low;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dts
index 9a8e2f492b97..1a222ce60a30 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dts
@@ -94,6 +94,8 @@
 	phy-handle = <&eth_phy0>;
 	phy-mode = "rgmii";
 
+	amlogic,tx-delay-ns = <2>;
+
 	snps,reset-gpio = <&gpio GPIOZ_14 0>;
 	snps,reset-delays-us = <0 10000 1000000>;
 	snps,reset-active-low;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts
index f66939cacd37..7663d6775823 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts
@@ -59,6 +59,8 @@
 	/* Select external PHY by default */
 	phy-handle = <&external_phy>;
 
+	amlogic,tx-delay-ns = <2>;
+
 	/* External PHY reset is shared with internal PHY Led signals */
 	snps,reset-gpio = <&gpio GPIOZ_14 0>;
 	snps,reset-delays-us = <0 10000 1000000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts
index 5a337d339df1..a0bc746adb42 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts
@@ -162,6 +162,8 @@
 	/* Select external PHY by default */
 	phy-handle = <&external_phy>;
 
+	amlogic,tx-delay-ns = <2>;
+
 	snps,reset-gpio = <&gpio GPIOZ_14 0>;
 	snps,reset-delays-us = <0 10000 1000000>;
 	snps,reset-active-low;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-q200.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-q200.dts
index 5dbc66088355..e6ac39b712b7 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-q200.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-q200.dts
@@ -59,6 +59,8 @@
 	/* Select external PHY by default */
 	phy-handle = <&external_phy>;
 
+	amlogic,tx-delay-ns = <2>;
+
 	/* External PHY reset is shared with internal PHY Led signals */
 	snps,reset-gpio = <&gpio GPIOZ_14 0>;
 	snps,reset-delays-us = <0 10000 1000000>;
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
