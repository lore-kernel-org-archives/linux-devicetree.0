From: Joshua Clayton <stillcompiling@gmail.com>
Subject: [PATCH v9 1/3] doc: dt: add cyclone-ps-spi binding document
Date: Tue, 24 Jan 2017 14:19:32 -0800
Message-ID: <910cf70128e0303d3642d6ff527a069ad6e18bf7.1485295905.git.stillcompiling@gmail.com>
References: <cover.1485295905.git.stillcompiling@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1485295905.git.stillcompiling@gmail.com>
In-Reply-To: <cover.1485295905.git.stillcompiling@gmail.com>
References: <cover.1485295905.git.stillcompiling@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alan Tull <atull@opensource.altera.com>, Moritz Fischer <moritz.fischer@ettus.com>, Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Anatolij Gustschin <agust@denx.de>, Joshua Clayton <stillcompiling@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-fpga@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Describe a cyclone-ps-spi devicetree entry, required features

Signed-off-by: Joshua Clayton <stillcompiling@gmail.com>
---
 .../bindings/fpga/altera-passive-serial.txt        | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/fpga/altera-passive-serial.txt

diff --git a/Documentation/devicetree/bindings/fpga/altera-passive-serial.txt b/Documentation/devicetree/bindings/fpga/altera-passive-serial.txt
new file mode 100644
index 0000000..774e6a7
--- /dev/null
+++ b/Documentation/devicetree/bindings/fpga/altera-passive-serial.txt
@@ -0,0 +1,29 @@
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
+- compatible: should contain "altr,fpga-passive-serial"
+- reg: spi chip select of the FPGA
+- nconfig-gpios: config pin (referred to as nCONFIG in the cyclone manual)
+- nstat-gpios: status pin (referred to as nSTATUS in the cyclone manual)
+
+Optional properties:
+- confd-gpios: confd pin (referred to as CONF_DONE in the cyclone manual)
+
+
+
+Example:
+	fpga_spi: evi-fpga-spi@0 {
+		compatible = "altr,cyclone-ps-spi-fpga-mgr";
+		spi-max-frequency = <20000000>;
+		reg = <0>;
+		nconfig-gpios = <&gpio4 9 GPIO_ACTIVE_LOW>;
+		nstat-gpios = <&gpio4 11 GPIO_ACTIVE_LOW>;
+		confd-gpios = <&gpio4 12 GPIO_ACTIVE_LOW>;
+	};
-- 
2.9.3
