From: Zhao Qiang <qiang.zhao-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCH v3 5/7] T104xD4RDB: Add qe node to t104xd4rdb
Date: Tue, 1 Mar 2016 15:09:41 +0800
Message-ID: <1456816183-22340-5-git-send-email-qiang.zhao@nxp.com>
References: <1456816183-22340-1-git-send-email-qiang.zhao@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1456816183-22340-1-git-send-email-qiang.zhao-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org, leoyang.li-3arQi8VN3Tc@public.gmane.org, xiaobo.xie-3arQi8VN3Tc@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Zhao Qiang <qiang.zhao-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

add qe node to t104xd4rdb.dtsi and t1040si-post.dtsi.

Signed-off-by: Zhao Qiang <qiang.zhao-3arQi8VN3Tc@public.gmane.org>
---
Changes for v2
	- rebase
Changes for v3
	- rebase

 arch/powerpc/boot/dts/fsl/t1040si-post.dtsi | 45 +++++++++++++++++++++++++++++
 arch/powerpc/boot/dts/fsl/t104xd4rdb.dtsi   | 39 +++++++++++++++++++++++++
 2 files changed, 84 insertions(+)

diff --git a/arch/powerpc/boot/dts/fsl/t1040si-post.dtsi b/arch/powerpc/boot/dts/fsl/t1040si-post.dtsi
index e0f4da5..012f813 100644
--- a/arch/powerpc/boot/dts/fsl/t1040si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/t1040si-post.dtsi
@@ -673,3 +673,48 @@
 		};
 	};
 };
+
+&qe {
+	#address-cells = <1>;
+	#size-cells = <1>;
+	device_type = "qe";
+	compatible = "fsl,qe";
+	fsl,qe-num-riscs = <1>;
+	fsl,qe-num-snums = <28>;
+
+	qeic: interrupt-controller@80 {
+		interrupt-controller;
+		compatible = "fsl,qe-ic";
+		#address-cells = <0>;
+		#interrupt-cells = <1>;
+		reg = <0x80 0x80>;
+		interrupts = <95 2 0 0  94 2 0 0>; //high:79 low:78
+	};
+
+	ucc@2000 {
+		cell-index = <1>;
+		reg = <0x2000 0x200>;
+		interrupts = <32>;
+		interrupt-parent = <&qeic>;
+	};
+
+	ucc@2200 {
+		cell-index = <3>;
+		reg = <0x2200 0x200>;
+		interrupts = <34>;
+		interrupt-parent = <&qeic>;
+	};
+
+	muram@10000 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "fsl,qe-muram", "fsl,cpm-muram";
+		ranges = <0x0 0x10000 0x6000>;
+
+		data-only@0 {
+			compatible = "fsl,qe-muram-data",
+			"fsl,cpm-muram-data";
+			reg = <0x0 0x6000>;
+		};
+	};
+};
diff --git a/arch/powerpc/boot/dts/fsl/t104xd4rdb.dtsi b/arch/powerpc/boot/dts/fsl/t104xd4rdb.dtsi
index 3f6d7c6..d9e89d5 100644
--- a/arch/powerpc/boot/dts/fsl/t104xd4rdb.dtsi
+++ b/arch/powerpc/boot/dts/fsl/t104xd4rdb.dtsi
@@ -212,4 +212,43 @@
 				  0 0x00010000>;
 		};
 	};
+
+	qe: qe@ffe140000 {
+		ranges = <0x0 0xf 0xfe140000 0x40000>;
+		reg = <0xf 0xfe140000 0 0x480>;
+		brg-frequency = <0>;
+		bus-frequency = <0>;
+
+		si1: si@700 {
+			compatible = "fsl,t1040-qe-si";
+			reg = <0x700 0x80>;
+		};
+
+		siram1: siram@1000 {
+			compatible = "fsl,t1040-qe-siram";
+			reg = <0x1000 0x800>;
+		};
+
+		ucc_hdlc: ucc@2000 {
+			compatible = "fsl,ucc-hdlc";
+			rx-clock-name = "clk8";
+			tx-clock-name = "clk9";
+			fsl,rx-sync-clock = "rsync_pin";
+			fsl,tx-sync-clock = "tsync_pin";
+			fsl,tx-timeslot-mask = <0xfffffffe>;
+			fsl,rx-timeslot-mask = <0xfffffffe>;
+			fsl,tdm-framer-type = "e1";
+			fsl,tdm-id = <0>;
+			fsl,siram-entry-id = <0>;
+			fsl,tdm-interface;
+		};
+
+		ucc_serial: ucc@2200 {
+			device_type = "serial";
+			compatible = "ucc_uart";
+			port-number = <1>;
+			rx-clock-name = "brg2";
+			tx-clock-name = "brg2";
+		};
+	};
 };
-- 
2.1.0.27.g96db324

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
