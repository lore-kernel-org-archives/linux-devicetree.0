From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] ARM: dts: sunxi: Add simplefb nodes for
 de_be0-lcd0, de_be0-lcd0-tve0 pipelines
Date: Sat, 27 Dec 2014 17:09:00 +0100
Message-ID: <1419696540-15680-2-git-send-email-hdegoede@redhat.com>
References: <1419696540-15680-1-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDRZXY4CYYORBJFT7OSAKGQETREE2UQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1419696540-15680-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add simplefb nodes for "de_be0-lcd0" and "de_be0-lcd0-tve0" display pipeline
for when u-boot has set up a pipeline to drive a LCD panel / VGA output rather
then the HDMI output.

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/sun4i-a10.dtsi  | 17 +++++++++++++++++
 arch/arm/boot/dts/sun5i-a10s.dtsi |  8 ++++++++
 arch/arm/boot/dts/sun5i-a13.dtsi  | 14 ++++++++++++++
 arch/arm/boot/dts/sun6i-a31.dtsi  |  8 ++++++++
 arch/arm/boot/dts/sun7i-a20.dtsi  | 17 +++++++++++++++++
 arch/arm/boot/dts/sun8i-a23.dtsi  | 14 ++++++++++++++
 6 files changed, 78 insertions(+)

diff --git a/arch/arm/boot/dts/sun4i-a10.dtsi b/arch/arm/boot/dts/sun4i-a10.dtsi
index ff08bb4..e3a8bc3 100644
--- a/arch/arm/boot/dts/sun4i-a10.dtsi
+++ b/arch/arm/boot/dts/sun4i-a10.dtsi
@@ -39,6 +39,23 @@
 				 <&ahb_gates 44>;
 			status = "disabled";
 		};
+
+		framebuffer@1 {
+			compatible = "allwinner,simple-framebuffer",
+				     "simple-framebuffer";
+			allwinner,pipeline = "de_be0-lcd0";
+			clocks = <&pll5 1>, <&ahb_gates 36>, <&ahb_gates 44>;
+			status = "disabled";
+		};
+
+		framebuffer@2 {
+			compatible = "allwinner,simple-framebuffer",
+				     "simple-framebuffer";
+			allwinner,pipeline = "de_be0-lcd0-tve0";
+			clocks = <&pll5 1>, <&ahb_gates 34>, <&ahb_gates 36>,
+				 <&ahb_gates 44>;
+			status = "disabled";
+		};
 	};
 
 	cpus {
diff --git a/arch/arm/boot/dts/sun5i-a10s.dtsi b/arch/arm/boot/dts/sun5i-a10s.dtsi
index 1dfd024..d971534 100644
--- a/arch/arm/boot/dts/sun5i-a10s.dtsi
+++ b/arch/arm/boot/dts/sun5i-a10s.dtsi
@@ -36,6 +36,14 @@
 				 <&ahb_gates 44>;
 			status = "disabled";
 		};
+
+		framebuffer@1 {
+			compatible = "allwinner,simple-framebuffer",
+				     "simple-framebuffer";
+			allwinner,pipeline = "de_be0-lcd0";
+			clocks = <&pll5 1>, <&ahb_gates 36>, <&ahb_gates 44>;
+			status = "disabled";
+		};
 	};
 
 	cpus {
diff --git a/arch/arm/boot/dts/sun5i-a13.dtsi b/arch/arm/boot/dts/sun5i-a13.dtsi
index 0306d59..771badf 100644
--- a/arch/arm/boot/dts/sun5i-a13.dtsi
+++ b/arch/arm/boot/dts/sun5i-a13.dtsi
@@ -21,6 +21,20 @@
 		serial1 = &uart3;
 	};
 
+	chosen {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		framebuffer@0 {
+			compatible = "allwinner,simple-framebuffer",
+				     "simple-framebuffer";
+			allwinner,pipeline = "de_be0-lcd0";
+			clocks = <&pll5 1>, <&ahb_gates 36>, <&ahb_gates 44>;
+			status = "disabled";
+		};
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
diff --git a/arch/arm/boot/dts/sun6i-a31.dtsi b/arch/arm/boot/dts/sun6i-a31.dtsi
index 9e9504c..26dfe4d 100644
--- a/arch/arm/boot/dts/sun6i-a31.dtsi
+++ b/arch/arm/boot/dts/sun6i-a31.dtsi
@@ -73,6 +73,14 @@
 			clocks = <&pll6 0>;
 			status = "disabled";
 		};
+
+		framebuffer@1 {
+			compatible = "allwinner,simple-framebuffer",
+				     "simple-framebuffer";
+			allwinner,pipeline = "de_be0-lcd0";
+			clocks = <&pll6 0>;
+			status = "disabled";
+		};
 	};
 
 	cpus {
diff --git a/arch/arm/boot/dts/sun7i-a20.dtsi b/arch/arm/boot/dts/sun7i-a20.dtsi
index d54d684..9b5ac12 100644
--- a/arch/arm/boot/dts/sun7i-a20.dtsi
+++ b/arch/arm/boot/dts/sun7i-a20.dtsi
@@ -76,6 +76,23 @@
 				 <&ahb_gates 44>;
 			status = "disabled";
 		};
+
+		framebuffer@1 {
+			compatible = "allwinner,simple-framebuffer",
+				     "simple-framebuffer";
+			allwinner,pipeline = "de_be0-lcd0";
+			clocks = <&pll5 1>, <&ahb_gates 36>, <&ahb_gates 44>;
+			status = "disabled";
+		};
+
+		framebuffer@2 {
+			compatible = "allwinner,simple-framebuffer",
+				     "simple-framebuffer";
+			allwinner,pipeline = "de_be0-lcd0-tve0";
+			clocks = <&pll5 1>, <&ahb_gates 34>, <&ahb_gates 36>,
+				 <&ahb_gates 44>;
+			status = "disabled";
+		};
 	};
 
 	cpus {
diff --git a/arch/arm/boot/dts/sun8i-a23.dtsi b/arch/arm/boot/dts/sun8i-a23.dtsi
index 0746cd1..496a6c2 100644
--- a/arch/arm/boot/dts/sun8i-a23.dtsi
+++ b/arch/arm/boot/dts/sun8i-a23.dtsi
@@ -61,6 +61,20 @@
 		serial5 = &r_uart;
 	};
 
+	chosen {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		framebuffer@0 {
+			compatible = "allwinner,simple-framebuffer",
+				     "simple-framebuffer";
+			allwinner,pipeline = "de_be0-lcd0";
+			clocks = <&pll6 0>;
+			status = "disabled";
+		};
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
-- 
2.1.0
