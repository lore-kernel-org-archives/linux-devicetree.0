From: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 3/5] arm64: dts: renesas: r8a7795: add usb2.0 host ch3 device nodes
Date: Wed, 26 Jul 2017 20:29:38 +0900
Message-ID: <1501068580-3981-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1501068580-3981-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1501068580-3981-1-git-send-email-yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds support for usb2.0 host ch3 device nodes for R-Car
H3 ES2.0.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi |  2 ++
 arch/arm64/boot/dts/renesas/r8a7795.dtsi     | 25 +++++++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi b/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
index 2c24943..1eccc7c 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
@@ -22,6 +22,8 @@
 	};
 
 	/delete-node/ usb-phy@ee0e0200;
+	/delete-node/ usb@ee0e0100;
+	/delete-node/ usb@ee0e0000;
 
 	fcpf2: fcp@fe952000 {
 		compatible = "renesas,fcpf";
diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index 1b20892..c3b1285 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -1628,6 +1628,19 @@
 			status = "disabled";
 		};
 
+		ehci3: usb@ee0e0100 {
+			compatible = "generic-ehci";
+			reg = <0 0xee0e0100 0 0x100>;
+			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 700>;
+			phys = <&usb2_phy3>;
+			phy-names = "usb";
+			companion= <&ohci3>;
+			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+			resets = <&cpg 700>;
+			status = "disabled";
+		};
+
 		ohci0: usb@ee080000 {
 			compatible = "generic-ohci";
 			reg = <0 0xee080000 0 0x100>;
@@ -1664,6 +1677,18 @@
 			status = "disabled";
 		};
 
+		ohci3: usb@ee0e0000 {
+			compatible = "generic-ohci";
+			reg = <0 0xee0e0000 0 0x100>;
+			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 700>;
+			phys = <&usb2_phy3>;
+			phy-names = "usb";
+			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+			resets = <&cpg 700>;
+			status = "disabled";
+		};
+
 		hsusb: usb@e6590000 {
 			compatible = "renesas,usbhs-r8a7795",
 				     "renesas,rcar-gen3-usbhs";
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
