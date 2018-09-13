From: Rob Herring <robh@kernel.org>
Subject: [PATCH] ARM: dts: aspeed: Fix I2C bus warnings
Date: Thu, 13 Sep 2018 13:12:27 -0500
Message-ID: <20180913181245.25484-3-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, linux-aspeed@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

dtc has new checks for I2C buses. The ASpeed dts files have a node named
'i2c' which causes a false positive warning. As the node is a 'simple-bus',
correct the node name to be 'bus' to fix the warnings.

arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dtb: Warning (i2c_bus_bridge): /ahb/apb/i2c@1e78a000: incorrect #size-cells for I2C bus
arch/arm/boot/dts/aspeed-bmc-opp-romulus.dtb: Warning (i2c_bus_bridge): /ahb/apb/i2c@1e78a000: incorrect #size-cells for I2C bus
arch/arm/boot/dts/aspeed-ast2500-evb.dtb: Warning (i2c_bus_bridge): /ahb/apb/i2c@1e78a000: incorrect #size-cells for I2C bus
arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dtb: Warning (i2c_bus_bridge): /ahb/apb/i2c@1e78a000: incorrect #size-cells for I2C bus
arch/arm/boot/dts/aspeed-bmc-intel-s2600wf.dtb: Warning (i2c_bus_bridge): /ahb/apb/i2c@1e78a000: incorrect #size-cells for I2C bus
arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dtb: Warning (i2c_bus_bridge): /ahb/apb/i2c@1e78a000: incorrect #size-cells for I2C bus
arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dtb: Warning (i2c_bus_bridge): /ahb/apb/i2c@1e78a000: incorrect #size-cells for I2C bus
arch/arm/boot/dts/aspeed-bmc-opp-zaius.dtb: Warning (i2c_bus_bridge): /ahb/apb/i2c@1e78a000: incorrect #size-cells for I2C bus
arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dtb: Warning (i2c_bus_bridge): /ahb/apb/i2c@1e78a000: incorrect #size-cells for I2C bus
arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dtb: Warning (i2c_bus_bridge): /ahb/apb/i2c@1e78a000: incorrect #size-cells for I2C bus

Cc: Joel Stanley <joel@jms.id.au>
Cc: Andrew Jeffery <andrew@aj.id.au>
Cc: linux-aspeed@lists.ozlabs.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
Please apply to the sub-arch tree. The dtc changes haven't landed, but 
will for 4.20.

 arch/arm/boot/dts/aspeed-g4.dtsi | 2 +-
 arch/arm/boot/dts/aspeed-g5.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
index b23a983f95a5..69f6b9d2e7e7 100644
--- a/arch/arm/boot/dts/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -350,7 +350,7 @@
 				status = "disabled";
 			};
 
-			i2c: i2c@1e78a000 {
+			i2c: bus@1e78a000 {
 				compatible = "simple-bus";
 				#address-cells = <1>;
 				#size-cells = <1>;
diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index 87fdc146ff52..d107459fc0f8 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -410,7 +410,7 @@
 				status = "disabled";
 			};
 
-			i2c: i2c@1e78a000 {
+			i2c: bus@1e78a000 {
 				compatible = "simple-bus";
 				#address-cells = <1>;
 				#size-cells = <1>;
-- 
2.17.1
