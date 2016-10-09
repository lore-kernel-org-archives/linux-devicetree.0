From: Zhao Qiang <qiang.zhao-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCH v2 1/2] ls1043ardb: add qe node to ls1043ardb
Date: Sun, 9 Oct 2016 10:12:38 +0800
Message-ID: <1475979159-20597-1-git-send-email-qiang.zhao@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, xiaobo.xie-3arQi8VN3Tc@public.gmane.org, Zhao Qiang <qiang.zhao-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Zhao Qiang <qiang.zhao-3arQi8VN3Tc@public.gmane.org>
---
Changes for v2:
	- use "fsl,ucc-hdlc" directly

 arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dts | 16 ++++++
 arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi    | 66 +++++++++++++++++++++++
 2 files changed, 82 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dts
index 4084631..a6a39fc 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dts
@@ -124,6 +124,22 @@
 	};
 };
 
+&uqe {
+	ucc_hdlc: ucc@2000 {
+		compatible = "fsl,ucc-hdlc";
+		rx-clock-name = "clk8";
+		tx-clock-name = "clk9";
+		fsl,rx-sync-clock = "rsync_pin";
+		fsl,tx-sync-clock = "tsync_pin";
+		fsl,tx-timeslot-mask = <0xfffffffe>;
+		fsl,rx-timeslot-mask = <0xfffffffe>;
+		fsl,tdm-framer-type = "e1";
+		fsl,tdm-id = <0>;
+		fsl,siram-entry-id = <0>;
+		fsl,tdm-interface;
+	};
+};
+
 &duart0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
index e669fbd..f6b6775 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
@@ -388,6 +388,72 @@
 			#interrupt-cells = <2>;
 		};
 
+		uqe: uqe@2400000 {
+			#address-cells = <1>;
+			#size-cells = <1>;
+			device_type = "qe";
+			compatible = "fsl,qe", "simple-bus";
+			ranges = <0x0 0x0 0x2400000 0x40000>;
+			reg = <0x0 0x2400000 0x0 0x480>;
+			brg-frequency = <100000000>;
+			bus-frequency = <200000000>;
+
+			fsl,qe-num-riscs = <1>;
+			fsl,qe-num-snums = <28>;
+
+			qeic: qeic@80 {
+				compatible = "fsl,qe-ic";
+				reg = <0x80 0x80>;
+				#address-cells = <0>;
+				interrupt-controller;
+				#interrupt-cells = <1>;
+				interrupts = <0 77 0x04 0 77 0x04>;
+			};
+
+			si1: si@700 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				compatible = "fsl,ls1043-qe-si",
+						"fsl,t1040-qe-si";
+				reg = <0x700 0x80>;
+			};
+
+			siram1: siram@1000 {
+				#address-cells = <1>;
+				#size-cells = <1>;
+				compatible = "fsl,ls1043-qe-siram",
+						"fsl,t1040-qe-siram";
+				reg = <0x1000 0x800>;
+			};
+
+			ucc@2000 {
+				cell-index = <1>;
+				reg = <0x2000 0x200>;
+				interrupts = <32>;
+				interrupt-parent = <&qeic>;
+			};
+
+			ucc@2200 {
+				cell-index = <3>;
+				reg = <0x2200 0x200>;
+				interrupts = <34>;
+				interrupt-parent = <&qeic>;
+			};
+
+			muram@10000 {
+				#address-cells = <1>;
+				#size-cells = <1>;
+				compatible = "fsl,qe-muram", "fsl,cpm-muram";
+				ranges = <0x0 0x10000 0x6000>;
+
+				data-only@0 {
+					compatible = "fsl,qe-muram-data",
+					"fsl,cpm-muram-data";
+					reg = <0x0 0x6000>;
+				};
+			};
+		};
+
 		lpuart0: serial@2950000 {
 			compatible = "fsl,ls1021a-lpuart";
 			reg = <0x0 0x2950000 0x0 0x1000>;
-- 
2.1.0.27.g96db324

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
