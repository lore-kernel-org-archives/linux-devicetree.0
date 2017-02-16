From: Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>
Subject: [PATCH 1/2] dt: bindings: fpga: add xilinx slave-serial binding description
Date: Thu, 16 Feb 2017 16:10:59 +0100
Message-ID: <1487257860-31115-2-git-send-email-agust@denx.de>
References: <1487257860-31115-1-git-send-email-agust@denx.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1487257860-31115-1-git-send-email-agust-ynQEQJNshbs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-fpga-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add dt binding documentation details for Xilinx FPGA configuration
over slave serial interface.

Signed-off-by: Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>
---
 .../bindings/fpga/xilinx-slave-serial.txt          | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/fpga/xilinx-slave-serial.txt

diff --git a/Documentation/devicetree/bindings/fpga/xilinx-slave-serial.txt b/Documentation/devicetree/bindings/fpga/xilinx-slave-serial.txt
new file mode 100644
index 0000000..b5fa6a6
--- /dev/null
+++ b/Documentation/devicetree/bindings/fpga/xilinx-slave-serial.txt
@@ -0,0 +1,24 @@
+Xilinx Slave Serial SPI FPGA Manager
+
+Xilinx Spartan-6 FPGAs support a method of loading the bitstream over
+what is referred to as "slave serial" interface.
+The slave serial link is not technically SPI, and might require extra
+circuits in order to play nicely with other SPI slaves on the same bus.
+
+See https://www.xilinx.com/support/documentation/user_guides/ug380.pdf
+
+Required properties:
+- compatible: should contain "xlnx,fpga-slave-serial"
+- reg: spi chip select of the FPGA
+- prog_b-gpios: config pin (referred to as PROGRAM_B in the manual)
+- done-gpios: config status pin (referred to as DONE in the manual)
+
+Example:
+	fpga_mgr_spi: fpga-spi@0 {
+		compatible = "xlnx,fpga-slave-serial";
+		spi-max-frequency = <60000000>;
+		spi-cpha;
+		reg = <0>;
+		done-gpio = <&gpio0 9 GPIO_ACTIVE_HIGH>;
+		prog_b-gpio = <&gpio0 29 GPIO_ACTIVE_LOW>;
+	};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
