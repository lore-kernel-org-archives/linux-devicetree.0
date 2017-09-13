From: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 2/2] arm64: dts: renesas: r8a77995: draak: enable EthernetAVB
Date: Wed, 13 Sep 2017 21:18:39 +0900
Message-ID: <1505305119-4257-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1505305119-4257-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1505305119-4257-1-git-send-email-yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch enables EthernetAVB for R-Car D3 draak board.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm64/boot/dts/renesas/r8a77995-draak.dts | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
index 19c5462..9c5a790 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
@@ -11,6 +11,7 @@
 
 /dts-v1/;
 #include "r8a77995.dtsi"
+#include <dt-bindings/gpio/gpio.h>
 
 / {
 	model = "Renesas Draak board based on r8a77995";
@@ -18,6 +19,7 @@
 
 	aliases {
 		serial0 = &scif2;
+		ethernet0 = &avb;
 	};
 
 	chosen {
@@ -37,6 +39,14 @@
 };
 
 &pfc {
+	avb0_pins: avb {
+		mux {
+			groups = "avb0_link", "avb0_phy_int", "avb0_mdc",
+				 "avb0_mii";
+			function = "avb0";
+		};
+	};
+
 	scif2_pins: scif2 {
 		groups = "scif2_data";
 		function = "scif2";
@@ -44,6 +54,21 @@
 
 };
 
+&avb {
+	pinctrl-0 = <&avb0_pins>;
+	pinctrl-names = "default";
+	renesas,no-ether-link;
+	phy-handle = <&phy0>;
+	status = "okay";
+
+	phy0: ethernet-phy@0 {
+		rxc-skew-ps = <1500>;
+		reg = <0>;
+		interrupt-parent = <&gpio5>;
+		interrupts = <19 IRQ_TYPE_LEVEL_LOW>;
+	};
+};
+
 &scif2 {
 	pinctrl-0 = <&scif2_pins>;
 	pinctrl-names = "default";
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
