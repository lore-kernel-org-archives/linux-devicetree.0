From: Jens Renner <renner-Xf229rFC5gsb1SvskN2V4Q@public.gmane.org>
Subject: [PATCH] spi: xilinx: Add DT binding documentation for spi/spi-xilinx.c
Date: Thu, 10 Oct 2013 17:24:38 +0200
Message-ID: <5256C6B6.9090604@efe-gmbh.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, Mark Brown <broonie-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add device tree binding documentation for the driver in spi/spi-xilinx.c.

Signed-off-by: Jens Renner <renner-Xf229rFC5gsb1SvskN2V4Q@public.gmane.org>
---
diff --git a/Documentation/devicetree/bindings/spi/spi-xilinx.txt b/Documentation/devicetree/bindings/spi/spi-xilinx.txt
new file mode 100644
index 0000000..768a1ea
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/spi-xilinx.txt
@@ -0,0 +1,32 @@
+Xilinx SPI controller:
+
+Required properties:
+- compatible : Must be "xlnx,axi-1.02.a" or "xlnx,xps-spi-2.00.a"
+- interrupt-parent : reference to parent interrupt controller
+- interrupts : SPI controller interrupt
+- reg : SPI register location and length
+
+Optional properties:
+- xlnx,num-ss-bits : # of slave select bits
+- xlnx,num-transfer_bits : # of data transfer bits (defaults to 8)
+- xlnx,... : not considered by kernel module
+- #address-cells = <1> : if child nodes are defined
+- #size-cells = <0> : if child nodes are defined
+- Child nodes conforming to SPI bus binding
+
+Example with 3 slave select bits and 32 bit transfer size:
+
+	axi_spi_0: spi@40a00000 {
+		compatible = "xlnx,axi-spi-1.02.a", "xlnx,xps-spi-2.00.a";
+		interrupt-parent = <&axi_intc_0>;
+		interrupts = < 2 2 >;
+		reg = < 0x40a00000 0x10000 >;
+		xlnx,family = "spartan6";
+		xlnx,fifo-exist = <0x1>;
+		xlnx,instance = "axi_spi_0";
+		xlnx,num-ss-bits = <0x3>;
+		xlnx,num-transfer-bits = <0x20>;
+		xlnx,sck-ratio = <0x4>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
