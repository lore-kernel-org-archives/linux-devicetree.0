From: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 1/2] ARM: shmobile: r8a7790: add USB-DMAC device nodes
Date: Mon, 9 Feb 2015 17:23:33 +0900
Message-ID: <1423470214-7140-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1423470214-7140-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1423470214-7140-1-git-send-email-yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm/boot/dts/r8a7790.dtsi |   22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7790.dtsi b/arch/arm/boot/dts/r8a7790.dtsi
index 24de994..737b578 100644
--- a/arch/arm/boot/dts/r8a7790.dtsi
+++ b/arch/arm/boot/dts/r8a7790.dtsi
@@ -376,6 +376,28 @@
 		reg = <0 0xec740000 0 0x200>;
 	};
 
+	usb_dmac0: dma-controller@e65a0000 {
+		compatible = "renesas,usb-dmac";
+		reg = <0 0xe65a0000 0 0x100>;
+		interrupts = <0 109 IRQ_TYPE_LEVEL_HIGH
+			      0 109 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "ch0", "ch1";
+		clocks = <&mstp3_clks R8A7790_CLK_USBDMAC0>;
+		#dma-cells = <1>;
+		dma-channels = <2>;
+	};
+
+	usb_dmac1: dma-controller@e65b0000 {
+		compatible = "renesas,usb-dmac";
+		reg = <0 0xe65b0000 0 0x100>;
+		interrupts = <0 110 IRQ_TYPE_LEVEL_HIGH
+			      0 110 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "ch0", "ch1";
+		clocks = <&mstp3_clks R8A7790_CLK_USBDMAC1>;
+		#dma-cells = <1>;
+		dma-channels = <2>;
+	};
+
 	i2c0: i2c@e6508000 {
 		#address-cells = <1>;
 		#size-cells = <0>;
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
