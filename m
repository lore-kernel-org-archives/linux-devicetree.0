From: Joshua Clayton <stillcompiling@gmail.com>
Subject: [PATCH v2 2/5] doc: dt: add cyclone-spi binding document
Date: Fri, 28 Oct 2016 09:56:39 -0700
Message-ID: <2de74f6d2f2689b8ef090a9017db2ffb3bd319cb.1477669745.git.stillcompiling@gmail.com>
References: <cover.1477669744.git.stillcompiling@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.1477669744.git.stillcompiling@gmail.com>
In-Reply-To: <cover.1477669744.git.stillcompiling@gmail.com>
References: <cover.1477669744.git.stillcompiling@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Alan Tull <atull@opensource.altera.com>, Moritz Fischer <moritz.fischer@ettus.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Joshua Clayton <stillcompiling@gmail.com>, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Describe a cyclonei-ps-spi devicetree entry, required features

Signed-off-by: Joshua Clayton <stillcompiling@gmail.com>
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
2.7.4
