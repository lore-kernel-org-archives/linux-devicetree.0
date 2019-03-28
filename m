From: megous via linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Subject: [PATCH v2 1/2] ARM: dts: sun8i: a83t: Add missing
 cooling device properties for CPUs
Date: Thu, 28 Mar 2019 12:31:58 +0100
Message-ID: <20190328113159.9668-2-megous@megous.com>
References: <20190328113159.9668-1-megous@megous.com>
Reply-To: megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDXLF6FR5INBBOHB6LSAKGQEBNKUZ2Y-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20190328113159.9668-1-megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>

Enable to use CPUs as cooling device in the future, by adding
"#cooling-cells" to each CPU node. This property should be present for
all the CPUs of a cluster. If these are present only for a subset of
CPUs of a cluster then things will start falling apart as soon as the
CPUs are brought online in a different order. For example, this will
happen because the operating system looks for such properties in the CPU
node it is trying to bring up, so that it can register a cooling device.

Signed-off-by: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/sun8i-a83t.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-a83t.dtsi b/arch/arm/boot/dts/sun8i-a83t.dtsi
index fcb7ef5ce2df..7a40b7d77ec0 100644
--- a/arch/arm/boot/dts/sun8i-a83t.dtsi
+++ b/arch/arm/boot/dts/sun8i-a83t.dtsi
@@ -69,6 +69,7 @@
 			cci-control-port = <&cci_control0>;
 			enable-method = "allwinner,sun8i-a83t-smp";
 			reg = <0>;
+			#cooling-cells = <2>;
 		};
 
 		cpu@1 {
@@ -78,6 +79,7 @@
 			cci-control-port = <&cci_control0>;
 			enable-method = "allwinner,sun8i-a83t-smp";
 			reg = <1>;
+			#cooling-cells = <2>;
 		};
 
 		cpu@2 {
@@ -87,6 +89,7 @@
 			cci-control-port = <&cci_control0>;
 			enable-method = "allwinner,sun8i-a83t-smp";
 			reg = <2>;
+			#cooling-cells = <2>;
 		};
 
 		cpu@3 {
@@ -96,6 +99,7 @@
 			cci-control-port = <&cci_control0>;
 			enable-method = "allwinner,sun8i-a83t-smp";
 			reg = <3>;
+			#cooling-cells = <2>;
 		};
 
 		cpu100: cpu@100 {
@@ -107,6 +111,7 @@
 			cci-control-port = <&cci_control1>;
 			enable-method = "allwinner,sun8i-a83t-smp";
 			reg = <0x100>;
+			#cooling-cells = <2>;
 		};
 
 		cpu@101 {
@@ -116,6 +121,7 @@
 			cci-control-port = <&cci_control1>;
 			enable-method = "allwinner,sun8i-a83t-smp";
 			reg = <0x101>;
+			#cooling-cells = <2>;
 		};
 
 		cpu@102 {
@@ -125,6 +131,7 @@
 			cci-control-port = <&cci_control1>;
 			enable-method = "allwinner,sun8i-a83t-smp";
 			reg = <0x102>;
+			#cooling-cells = <2>;
 		};
 
 		cpu@103 {
@@ -134,6 +141,7 @@
 			cci-control-port = <&cci_control1>;
 			enable-method = "allwinner,sun8i-a83t-smp";
 			reg = <0x103>;
+			#cooling-cells = <2>;
 		};
 	};
 
-- 
2.21.0
