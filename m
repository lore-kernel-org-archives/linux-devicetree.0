From: Alban <albeu-GANU6spQydw@public.gmane.org>
Subject: [PATCH] MIPS: ath79: Use the IRQ based GPIO key driver for the buttons
Date: Tue, 14 Feb 2017 00:10:37 +0100
Message-ID: <1487027453-10194-1-git-send-email-albeu@free.fr>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
Cc: Alban Bedel <albeu-GANU6spQydw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Antony Pavlov <antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Alban Bedel <albeu-GANU6spQydw@public.gmane.org>

Now that the GPIO driver support interrupts we don't need to poll the
buttons.

Signed-off-by: Alban Bedel <albeu-GANU6spQydw@public.gmane.org>
---
 arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dts | 3 +--
 arch/mips/boot/dts/qca/ar9331_dpt_module.dts     | 5 ++---
 arch/mips/boot/dts/qca/ar9331_dragino_ms14.dts   | 5 ++---
 arch/mips/boot/dts/qca/ar9331_omega.dts          | 5 ++---
 arch/mips/boot/dts/qca/ar9331_tl_mr3020.dts      | 5 ++---
 5 files changed, 9 insertions(+), 14 deletions(-)

diff --git a/arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dts b/arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dts
index 3c3b7ce..ed8791a 100644
--- a/arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dts
+++ b/arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dts
@@ -21,11 +21,10 @@
 	};
 
 	gpio-keys {
-		compatible = "gpio-keys-polled";
+		compatible = "gpio-keys";
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		poll-interval = <20>;
 		button@0 {
 			label = "reset";
 			linux,code = <KEY_RESTART>;
diff --git a/arch/mips/boot/dts/qca/ar9331_dpt_module.dts b/arch/mips/boot/dts/qca/ar9331_dpt_module.dts
index 98e7450..86bf1aa 100644
--- a/arch/mips/boot/dts/qca/ar9331_dpt_module.dts
+++ b/arch/mips/boot/dts/qca/ar9331_dpt_module.dts
@@ -28,11 +28,10 @@
 		};
 	};
 
-	gpio-keys-polled {
-		compatible = "gpio-keys-polled";
+	gpio-keys {
+		compatible = "gpio-keys";
 		#address-cells = <1>;
 		#size-cells = <0>;
-		poll-interval = <100>;
 
 		button@0 {
 			label = "reset";
diff --git a/arch/mips/boot/dts/qca/ar9331_dragino_ms14.dts b/arch/mips/boot/dts/qca/ar9331_dragino_ms14.dts
index 56f8320..7970f6b 100644
--- a/arch/mips/boot/dts/qca/ar9331_dragino_ms14.dts
+++ b/arch/mips/boot/dts/qca/ar9331_dragino_ms14.dts
@@ -46,11 +46,10 @@
 		};
 	};
 
-	gpio-keys-polled {
-		compatible = "gpio-keys-polled";
+	gpio-keys {
+		compatible = "gpio-keys";
 		#address-cells = <1>;
 		#size-cells = <0>;
-		poll-interval = <100>;
 
 		button@0 {
 			label = "jumpstart";
diff --git a/arch/mips/boot/dts/qca/ar9331_omega.dts b/arch/mips/boot/dts/qca/ar9331_omega.dts
index b2be3b0..6779291 100644
--- a/arch/mips/boot/dts/qca/ar9331_omega.dts
+++ b/arch/mips/boot/dts/qca/ar9331_omega.dts
@@ -28,11 +28,10 @@
 		};
 	};
 
-	gpio-keys-polled {
-		compatible = "gpio-keys-polled";
+	gpio-keys {
+		compatible = "gpio-keys";
 		#address-cells = <1>;
 		#size-cells = <0>;
-		poll-interval = <100>;
 
 		button@0 {
 			label = "reset";
diff --git a/arch/mips/boot/dts/qca/ar9331_tl_mr3020.dts b/arch/mips/boot/dts/qca/ar9331_tl_mr3020.dts
index 919cf3b..86d55d1 100644
--- a/arch/mips/boot/dts/qca/ar9331_tl_mr3020.dts
+++ b/arch/mips/boot/dts/qca/ar9331_tl_mr3020.dts
@@ -46,11 +46,10 @@
 		};
 	};
 
-	gpio-keys-polled {
-		compatible = "gpio-keys-polled";
+	gpio-keys {
+		compatible = "gpio-keys";
 		#address-cells = <1>;
 		#size-cells = <0>;
-		poll-interval = <100>;
 
 		button@0 {
 			label = "wps";
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
