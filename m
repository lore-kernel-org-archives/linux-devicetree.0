From: Heiner Kallweit <hkallweit1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH RfC v3 7/7] pinctrl: meson: add interrupt controller to GPIO
 DT nodes
Date: Wed, 17 May 2017 22:17:10 +0200
Message-ID: <1c8aa228-c1da-ed48-52a5-184332eecf26@gmail.com>
References: <16950080-b19d-e25c-fb48-bc79cfe4acc0@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <16950080-b19d-e25c-fb48-bc79cfe4acc0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add interrupt controller properties to the gpio controller nodes and
extend the gpio controller DT binding documentation.

Signed-off-by: Heiner Kallweit <hkallweit1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
v3:
- added to the patch series
---
 Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt | 4 ++++
 arch/arm/boot/dts/meson8.dtsi                               | 2 ++
 arch/arm/boot/dts/meson8b.dtsi                              | 2 ++
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi                 | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi                  | 4 ++++
 5 files changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
index 2392557e..49a8118a 100644
--- a/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
@@ -24,6 +24,8 @@ Required properties for sub-nodes are:
    when it is missing the "pull" registers are used instead
  - gpio-controller: identifies the node as a gpio controller
  - #gpio-cells: must be 2
+ - interrupt-controller: identifies the node as interrupt controller
+ - #interrupt-cells: must be 2
 
 === Other sub-nodes ===
 
@@ -62,6 +64,8 @@ pinctrl-bindings.txt
 			reg-names = "mux", "pull", "pull-enable", "gpio";
 			gpio-controller;
 			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
                };
 
 		nand {
diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
index 1962e16e..4fe73050 100644
--- a/arch/arm/boot/dts/meson8.dtsi
+++ b/arch/arm/boot/dts/meson8.dtsi
@@ -119,6 +119,8 @@
 			reg-names = "mux", "pull", "pull-enable", "gpio";
 			gpio-controller;
 			#gpio-cells = <2>;
+			interrupt-controller;
+			#interupt-cells = <2>;
 			gpio-ranges = <&pinctrl_cbus 0 0 120>;
 		};
 
diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
index e48017be..16391a30 100644
--- a/arch/arm/boot/dts/meson8b.dtsi
+++ b/arch/arm/boot/dts/meson8b.dtsi
@@ -211,6 +211,8 @@
 				reg-names = "mux", "pull", "pull-enable", "gpio";
 				gpio-controller;
 				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
 				gpio-ranges = <&pinctrl_cbus 0 0 130>;
 			};
 		};
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
index 07e405cf..e9177041 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
@@ -118,6 +118,8 @@
 			reg-names = "mux", "pull", "gpio";
 			gpio-controller;
 			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
 			gpio-ranges = <&pinctrl_aobus 0 0 14>;
 		};
 
@@ -267,6 +269,8 @@
 			reg-names = "mux", "pull", "pull-enable", "gpio";
 			gpio-controller;
 			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
 			gpio-ranges = <&pinctrl_periphs 0 14 120>;
 		};
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
index d8e096df..344a5243 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
@@ -80,6 +80,8 @@
 			reg-names = "mux", "pull", "gpio";
 			gpio-controller;
 			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
 			gpio-ranges = <&pinctrl_aobus 0 0 14>;
 		};
 
@@ -208,6 +210,8 @@
 			reg-names = "mux", "pull", "pull-enable", "gpio";
 			gpio-controller;
 			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
 			gpio-ranges = <&pinctrl_periphs 0 14 101>;
 		};
 
-- 
2.13.0


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
