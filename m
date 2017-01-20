From: Joshua Clayton <stillcompiling@gmail.com>
Subject: [PATCH v7 1/3] doc: dt: add cyclone-ps-spi binding document
Date: Thu, 19 Jan 2017 16:12:27 -0800
Message-ID: <6b7883678d1e343d103302c77863bf69ca836637.1484869881.git.stillcompiling@gmail.com>
References: <cover.1484869881.git.stillcompiling@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.1484869881.git.stillcompiling@gmail.com>
In-Reply-To: <cover.1484869881.git.stillcompiling@gmail.com>
References: <cover.1484869881.git.stillcompiling@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Alan Tull <atull@opensource.altera.com>, Moritz Fischer <moritz.fischer@ettus.com>, Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Joshua Clayton <stillcompiling@gmail.com>, linux-fpga@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Anatolij Gustschin <agust@denx.de>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Describe a cyclone-ps-spi devicetree entry, required features

Signed-off-by: Joshua Clayton <stillcompiling@gmail.com>
---
 .../bindings/fpga/altera-passive-serial.txt        | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/fpga/altera-passive-serial.txt

diff --git a/Documentation/devicetree/bindings/fpga/altera-passive-serial.txt b/Documentation/devicetree/bindings/fpga/altera-passive-serial.txt
new file mode 100644
index 0000000..b5f0bb5
--- /dev/null
+++ b/Documentation/devicetree/bindings/fpga/altera-passive-serial.txt
@@ -0,0 +1,25 @@
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
+- nstat-gpios: status pin (referred to as nSTATUS in the cyclone manual)
+- nconfig-gpios: config pin (referred to as nCONFIG in the cyclone manual)
+- confd-gpios: confd pin (referred to as CONF_DONE in the cyclone manual)
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
