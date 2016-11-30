From: Joshua Clayton <stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 2/3] doc: dt: add cyclone-spi binding document
Date: Tue, 29 Nov 2016 17:11:04 -0800
Message-ID: <2de74f6d2f2689b8ef090a9017db2ffb3bd319cb.1480467185.git.stillcompiling@gmail.com>
References: <cover.1480467185.git.stillcompiling@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1480467185.git.stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
In-Reply-To: <cover.1480467185.git.stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
References: <cover.1480467185.git.stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Joshua Clayton <stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Describe a cyclonei-ps-spi devicetree entry, required features

Signed-off-by: Joshua Clayton <stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 .../bindings/fpga/cyclone-ps-spi-fpga-mgr.txt      | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/fpga/cyclone-ps-spi-fpga-mgr.txt

diff --git a/Documentation/devicetree/bindings/fpga/cyclone-ps-spi-fpga-mgr.txt b/Documentation/devicetree/bindings/fpga/cyclone-ps-spi-fpga-mgr.txt
new file mode 100644
index 0000000..c942281
--- /dev/null
+++ b/Documentation/devicetree/bindings/fpga/cyclone-ps-spi-fpga-mgr.txt
@@ -0,0 +1,23 @@
+Altera Cyclone Passive Serial SPI FPGA Manager
+
+Altera Cyclone FPGAs support a method of loading the bitstream over what is
+referred to as "passive serial".
+The passive serial link is not technically spi, and might require extra
+circuits in order to play nicely with other spi slaves on the same bus.
+
+See https://www.altera.com/literature/hb/cyc/cyc_c51013.pdf
+
+Required properties:
+- compatible  : should contain "altr,cyclone-ps-spi-fpga-mgr"
+- reg         : spi slave id of the fpga
+- config-gpio : config pin (referred to as nCONFIG in the cyclone manual)
+- status-gpio : status pin (referred to as nSTATUS in the cyclone manual)
+
+Example:
+	fpga_spi: evi-fpga-spi@0 {
+		compatible = "altr,cyclone-ps-spi-fpga-mgr";
+		spi-max-frequency = <20000000>;
+		reg = <0>;
+		config-gpio = <&gpio4 9 GPIO_ACTIVE_HIGH>;
+		status-gpio = <&gpio4 11 GPIO_ACTIVE_HIGH>;
+	};
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
