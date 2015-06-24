From: Jaedon Shin <jaedon.shin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 3/4] MIPS: BMIPS: bcm7360: add nodes for NAND
Date: Wed, 24 Jun 2015 15:08:33 +0900
Message-ID: <72f9d919f140dcab72b7e3b6f1432430b1d4c441.1435124524.git.jaedon.shin@gmail.com>
References: <cover.1435124524.git.jaedon.shin@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1435124524.git.jaedon.shin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
In-Reply-To: <cover.1435124524.git.jaedon.shin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
References: <cover.1435124524.git.jaedon.shin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
Cc: Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jaedon Shin <jaedon.shin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add NAND device nodes to BMIPS based BCM7360 platform.

Signed-off-by: Jaedon Shin <jaedon.shin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/mips/boot/dts/brcm/bcm7360.dtsi     | 22 ++++++++++++++++++++++
 arch/mips/boot/dts/brcm/bcm97360svmb.dts | 23 +++++++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/arch/mips/boot/dts/brcm/bcm7360.dtsi b/arch/mips/boot/dts/brcm/bcm7360.dtsi
index f23b0aed276f..cfa1830a411c 100644
--- a/arch/mips/boot/dts/brcm/bcm7360.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7360.dtsi
@@ -157,5 +157,27 @@
 			interrupts = <66>;
 			status = "disabled";
 		};
+
+		hif_intr2_intc: interrupt-controller@411000 {
+			compatible = "brcm,l2-intc";
+			reg = <0x411000 0x30>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+			interrupt-parent = <&periph_intc>;
+			interrupts = <30>;
+			interrupt-names = "hif";
+		};
+
+		nand0: nand@412800 {
+			compatible = "brcm,brcmnand-v5.0", "brcm,brcmnand";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg-names = "nand";
+			reg = <0x412800 0x400>;
+			interrupt-parent = <&hif_intr2_intc>;
+			interrupt-names = "nand_ctlrdy";
+			interrupts = <24>;
+			status = "disabled";
+		};
 	};
 };
diff --git a/arch/mips/boot/dts/brcm/bcm97360svmb.dts b/arch/mips/boot/dts/brcm/bcm97360svmb.dts
index 4fe515500102..e45f1d519667 100644
--- a/arch/mips/boot/dts/brcm/bcm97360svmb.dts
+++ b/arch/mips/boot/dts/brcm/bcm97360svmb.dts
@@ -32,3 +32,26 @@
 &ohci0 {
 	status = "okay";
 };
+
+&nand0 {
+	status = "okay";
+
+	nandcs@1 {
+		compatible = "brcm,nandcs";
+		reg = <1>;
+		nand-ecc-step-size = <512>;
+		nand-ecc-strength = <8>;
+		nand-on-flash-bbt;
+
+		#size-cells = <2>;
+		#address-cells = <2>;
+
+		flash1.rootfs0@0 {
+			reg = <0x0 0x0 0x0 0x80000000>;
+		};
+
+		flash1.rootfs1@80000000 {
+			reg = <0x0 0x80000000 0x0 0x80000000>;
+		};
+	};
+};
-- 
2.4.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
