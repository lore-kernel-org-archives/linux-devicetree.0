From: Joshua Clayton <stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/3] doc: dt: add cyclone-spi binding document
Date: Thu,  6 Oct 2016 13:34:18 -0700
Message-ID: <8d89e70475e8e1c3ce5117a0367c8444c11c61e3.1475783742.git.stillcompiling@gmail.com>
References: <4b4432c04b4ea92a2af814e3d7866c33f2eb12ea.1475783742.git.stillcompiling@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4b4432c04b4ea92a2af814e3d7866c33f2eb12ea.1475783742.git.stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
In-Reply-To: <cover.1475783742.git.stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
References: <cover.1475783742.git.stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Joshua Clayton <stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Describe a cyclonespi devicetree entry, required features

Signed-off-by: Joshua Clayton <stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 .../bindings/fpga/cyclone-spi-fpga-mgr.txt         | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/fpga/cyclone-spi-fpga-mgr.txt

diff --git a/Documentation/devicetree/bindings/fpga/cyclone-spi-fpga-mgr.txt b/Documentation/devicetree/bindings/fpga/cyclone-spi-fpga-mgr.txt
new file mode 100644
index 0000000..8de34db
--- /dev/null
+++ b/Documentation/devicetree/bindings/fpga/cyclone-spi-fpga-mgr.txt
@@ -0,0 +1,23 @@
+Altera SOCFPGA FPGA Manager
+
+Altera cyclone FPGAs support a method of loading the bitstream over what is
+referred to as "passive serial".
+The passive serial link is not technically spi, and might require extra
+circuits in order to play nicely with other spi slaves on the same bus.
+
+See https://www.altera.com/literature/hb/cyc/cyc_c51013.pdf
+
+Required properties:
+- compatible  : should contain "altr,cyclonespi-fpga-mgr"
+- reg         : spi slave id of the fpga
+- reset-gpio  : reset pin (referred to as nCONFIG in the cyclone manual)
+- status-gpio : status pin (referred to as nSTATUS in the cyclone manual)
+
+Example:
+	fpga_spi: evi-fpga-spi@0 {
+		compatible = "altr,cyclonespi-fpga-mgr";
+		spi-max-frequency = <20000000>;
+		reg = <0>;
+		reset-gpio = <&gpio4 9 GPIO_ACTIVE_HIGH>;
+		status-gpio = <&gpio4 11 GPIO_ACTIVE_HIGH>;
+	};
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
