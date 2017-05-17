From: Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>
Subject: [PATCH v10 1/3] doc: dt: add altera-ps-spi binding document
Date: Wed, 17 May 2017 20:23:40 +0200
Message-ID: <1495045422-19183-1-git-send-email-agust@denx.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, joshua.clayton-DelKAr4a3LpBDgjK7y7TUQ@public.gmane.org, bst-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
Cc: linux-fpga-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, atull-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Joshua Clayton <stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Describe an altera-ps-spi devicetree entry, required features

Signed-off-by: Joshua Clayton <stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>
---
Changes in v10:
 - fix compatible string in example
 - add Arria 10 compatible
 - s/spi/SPI/
 - reword to remove entries mentioning cyclone, since it
   can be used with other FPGAs now (Arria 10, Stratix V)

 .../bindings/fpga/altera-passive-serial.txt        | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/fpga/altera-passive-serial.txt

diff --git a/Documentation/devicetree/bindings/fpga/altera-passive-serial.txt b/Documentation/devicetree/bindings/fpga/altera-passive-serial.txt
new file mode 100644
index 0000000..3e240b2
--- /dev/null
+++ b/Documentation/devicetree/bindings/fpga/altera-passive-serial.txt
@@ -0,0 +1,29 @@
+Altera Passive Serial SPI FPGA Manager
+
+Altera FPGAs support a method of loading the bitstream over what is
+referred to as "passive serial".
+The passive serial link is not technically SPI, and might require extra
+circuits in order to play nicely with other SPI slaves on the same bus.
+
+See https://www.altera.com/literature/hb/cyc/cyc_c51013.pdf
+
+Required properties:
+- compatible: Must be one of the following:
+	"altr,fpga-passive-serial",
+	"altr,fpga-arria10-passive-serial"
+- reg: SPI chip select of the FPGA
+- nconfig-gpios: config pin (referred to as nCONFIG in the manual)
+- nstat-gpios: status pin (referred to as nSTATUS in the manual)
+
+Optional properties:
+- confd-gpios: confd pin (referred to as CONF_DONE in the manual)
+
+Example:
+	fpga_spi: evi-fpga-spi@0 {
+		compatible = "altr,fpga-passive-serial";
+		spi-max-frequency = <20000000>;
+		reg = <0>;
+		nconfig-gpios = <&gpio4 9 GPIO_ACTIVE_LOW>;
+		nstat-gpios = <&gpio4 11 GPIO_ACTIVE_LOW>;
+		confd-gpios = <&gpio4 12 GPIO_ACTIVE_LOW>;
+	};
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
