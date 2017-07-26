From: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 5/5] arm64: dts: renesas: r8a7795: add hsusb ch3 device node
Date: Wed, 26 Jul 2017 20:29:40 +0900
Message-ID: <1501068580-3981-6-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1501068580-3981-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1501068580-3981-1-git-send-email-yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds support for hsusb ch3 device nodes for R-Car H3 ES2.0.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi |  1 +
 arch/arm64/boot/dts/renesas/r8a7795.dtsi     | 17 +++++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi b/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
index 9743aca..aaa5e67 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
@@ -24,6 +24,7 @@
 	/delete-node/ usb-phy@ee0e0200;
 	/delete-node/ usb@ee0e0100;
 	/delete-node/ usb@ee0e0000;
+	/delete-node/ usb@e659c000;
 
 	/delete-node/ dma-controller@e6460000;
 	/delete-node/ dma-controller@e6470000;
diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index d1381d9..b9213e2 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -1734,6 +1734,23 @@
 			status = "disabled";
 		};
 
+		hsusb3: usb@e659c000 {
+			compatible = "renesas,usbhs-r8a7795",
+				     "renesas,rcar-gen3-usbhs";
+			reg = <0 0xe659c000 0 0x100>;
+			interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 705>;
+			dmas = <&usb_dmac2 0>, <&usb_dmac2 1>,
+			       <&usb_dmac3 0>, <&usb_dmac3 1>;
+			dma-names = "ch0", "ch1", "ch2", "ch3";
+			renesas,buswait = <11>;
+			phys = <&usb2_phy3>;
+			phy-names = "usb";
+			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+			resets = <&cpg 705>;
+			status = "disabled";
+		};
+
 		pciec0: pcie@fe000000 {
 			compatible = "renesas,pcie-r8a7795",
 				     "renesas,pcie-rcar-gen3";
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
