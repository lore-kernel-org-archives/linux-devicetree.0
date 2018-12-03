From: Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v1 1/2] dt-binding: mtd: add NPCM FIU controller
Date: Mon,  3 Dec 2018 11:14:55 +0200
Message-ID: <20181203091456.454030-2-tmaimon77@gmail.com>
References: <20181203091456.454030-1-tmaimon77@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20181203091456.454030-1-tmaimon77@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: dwmw2@infradead.org, computersforpeace@gmail.com, boris.brezillon@bootlin.com, marek.vasut@gmail.com, richard@nod.at, robh+dt@kernel.org, mark.rutland@arm.com, yuenn@google.com, venture@google.com, brendanhiggins@google.com, avifishman70@gmail.com, joel@jms.id.au
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>
List-Id: devicetree@vger.kernel.org

Added device tree binding documentation for Nuvoton BMC
NPCM Flash Interface Unit(FIU) SPI-NOR controller.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 Documentation/devicetree/bindings/mtd/npcm-fiu.txt | 64 ++++++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/npcm-fiu.txt

diff --git a/Documentation/devicetree/bindings/mtd/npcm-fiu.txt b/Documentation/devicetree/bindings/mtd/npcm-fiu.txt
new file mode 100644
index 000000000000..9746cb5b1ced
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/npcm-fiu.txt
@@ -0,0 +1,64 @@
+* Nuvoton FLASH Interface Unit (FIU) SPI Controller
+
+NPCM FIU supports single, dual and quad communication interface.
+
+The NPCM7XX supports three FIU modules,
+FIU0 and FIUx supports two chip selects,
+FIU3 support four chip select.
+
+Required properties:
+  - compatible : "nuvoton,npcm750-fiu" for the NPCM7XX BMC
+  - #address-cells : should be 1.
+  - #size-cells : should be 0.
+  - reg : the first contains the register location and length,
+          the second contains the memory mapping address and length
+  - reg-names: Should contain the reg names "control" and "memory"
+  - clocks : phandle of F reference clock.
+
+Required properties in case the pins can be muxed:
+  - pinctrl-names : a pinctrl state named "default" must be defined.
+  - pinctrl-0 : phandle referencing pin configuration of the device.
+
+Optional property:
+  - spix-mode: enable spix-mode for an expansion bus to an ASIC or CPLD.
+
+The SPI device must be a child of the FIU node and must have a
+compatible property as specified in bindings/mtd/jedec,spi-nor.txt
+
+Required property:
+- reg: chip select number.
+
+Optional property:
+- spi-rx-bus-width: see ../spi/spi-bus.txt for the description.
+
+Aliases:
+- All the FIU controller nodes should be represented in the aliases node using
+  the following format 'fiu{n}' where n is a unique number for the alias.
+  In the NPCM7XX BMC:
+  		fiu0 represent fiu 0 controller
+  		fiu1 represent fiu 3 controller
+  		fiu2 represent fiu x controller
+
+Example:
+fiu3: fiu@c00000000 {
+	compatible = "nuvoton,npcm750-fiu";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	reg = <0xfb000000 0x1000>, <0x80000000 0x10000000>;
+	reg-names = "control", "memory";
+	clocks = <&clk NPCM7XX_CLK_AHB>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&spi3_pins>;
+	spi-nor@0 {
+		compatible = "jedec,spi-nor";
+		spi-rx-bus-width = <2>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		reg = <0>;
+		partition@0 {
+			label = "flash_data";
+			reg = <0x0 0x800000>;
+		};
+	};
+};
+
-- 
2.14.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
