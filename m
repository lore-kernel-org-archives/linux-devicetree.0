From: Samuel Holland <samuel-RkNLwX/CsU9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v3 14/15] [NOT FOR MERGE] arm64: dts: allwinner:
 a64: Convert DTS to use msgbox_intc
Date: Fri,  1 Mar 2019 22:29:50 -0600
Message-ID: <20190302042951.53671-15-samuel@sholland.org>
References: <20190302042951.53671-1-samuel@sholland.org>
Reply-To: samuel-RkNLwX/CsU9g9hUCZPvPmw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDA2PU6QWEARBSMN5DRQKGQEC4H5GOY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20190302042951.53671-1-samuel-RkNLwX/CsU9g9hUCZPvPmw@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Samuel Holland <samuel-RkNLwX/CsU9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Now that there is an alternate way for Linux to receive NMIs from the
PMIC, replace references to r_intc with references to the new interrupt
controller.

Signed-off-by: Samuel Holland <samuel-RkNLwX/CsU9g9hUCZPvPmw@public.gmane.org>
---
 arch/arm64/boot/dts/allwinner/sun50i-a64-amarula-relic.dts | 4 ++--
 arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts  | 4 ++--
 arch/arm64/boot/dts/allwinner/sun50i-a64-nanopi-a64.dts    | 4 ++--
 arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts     | 4 ++--
 arch/arm64/boot/dts/allwinner/sun50i-a64-orangepi-win.dts  | 4 ++--
 arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts        | 4 ++--
 arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts      | 4 ++--
 arch/arm64/boot/dts/allwinner/sun50i-a64-sopine.dtsi       | 4 ++--
 arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts       | 4 ++--
 9 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-amarula-relic.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-amarula-relic.dts
index 6cb2b7f0c817..57690fc3f65e 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-amarula-relic.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-amarula-relic.dts
@@ -78,8 +78,8 @@
 	axp803: pmic@3a3 {
 		compatible = "x-powers,axp803";
 		reg = <0x3a3>;
-		interrupt-parent = <&r_intc>;
-		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-parent = <&msgbox_intc>;
+		interrupts = <0>;
 		x-powers,drive-vbus-en; /* set N_VBUSEN as output pin */
 	};
 };
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts
index 9d0afd7d50ec..0d5693710cb2 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts
@@ -214,8 +214,8 @@
 	axp803: pmic@3a3 {
 		compatible = "x-powers,axp803";
 		reg = <0x3a3>;
-		interrupt-parent = <&r_intc>;
-		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-parent = <&msgbox_intc>;
+		interrupts = <0>;
 		x-powers,drive-vbus-en; /* set N_VBUSEN as output pin */
 	};
 };
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-nanopi-a64.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-nanopi-a64.dts
index 31884dbc8838..33d89c2d7b60 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-nanopi-a64.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-nanopi-a64.dts
@@ -179,8 +179,8 @@
 	axp803: pmic@3a3 {
 		compatible = "x-powers,axp803";
 		reg = <0x3a3>;
-		interrupt-parent = <&r_intc>;
-		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-parent = <&msgbox_intc>;
+		interrupts = <0>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts
index f7a4bccaa5d4..6f9da1cc6c79 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts
@@ -169,8 +169,8 @@
 	axp803: pmic@3a3 {
 		compatible = "x-powers,axp803";
 		reg = <0x3a3>;
-		interrupt-parent = <&r_intc>;
-		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-parent = <&msgbox_intc>;
+		interrupts = <0>;
 		x-powers,drive-vbus-en;	/* set N_VBUSEN as output pin */
 	};
 };
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-orangepi-win.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-orangepi-win.dts
index 8974b5a1d3b1..94bc6fadc58f 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-orangepi-win.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-orangepi-win.dts
@@ -186,8 +186,8 @@
 	axp803: pmic@3a3 {
 		compatible = "x-powers,axp803";
 		reg = <0x3a3>;
-		interrupt-parent = <&r_intc>;
-		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-parent = <&msgbox_intc>;
+		interrupts = <0>;
 		x-powers,drive-vbus-en; /* set N_VBUSEN as output pin */
 	};
 };
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
index 216f2f5db5ef..ceb6d7353cc7 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
@@ -162,8 +162,8 @@
 	axp803: pmic@3a3 {
 		compatible = "x-powers,axp803";
 		reg = <0x3a3>;
-		interrupt-parent = <&r_intc>;
-		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-parent = <&msgbox_intc>;
+		interrupts = <0>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts
index d22736a62481..02b5dfabc181 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts
@@ -169,8 +169,8 @@
 	axp803: pmic@3a3 {
 		compatible = "x-powers,axp803";
 		reg = <0x3a3>;
-		interrupt-parent = <&r_intc>;
-		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-parent = <&msgbox_intc>;
+		interrupts = <0>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine.dtsi
index d2651f284aa0..9555dce6703b 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine.dtsi
@@ -68,8 +68,8 @@
 	axp803: pmic@3a3 {
 		compatible = "x-powers,axp803";
 		reg = <0x3a3>;
-		interrupt-parent = <&r_intc>;
-		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-parent = <&msgbox_intc>;
+		interrupts = <0>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts
index c455b24dd079..63aba1519ce3 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts
@@ -137,8 +137,8 @@
 	axp803: pmic@3a3 {
 		compatible = "x-powers,axp803";
 		reg = <0x3a3>;
-		interrupt-parent = <&r_intc>;
-		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-parent = <&msgbox_intc>;
+		interrupts = <0>;
 		wakeup-source;
 	};
 };
-- 
2.19.2
