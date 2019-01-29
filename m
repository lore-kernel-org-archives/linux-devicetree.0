From: Vladimir Zapolskiy <vz@mleia.com>
Subject: [PATCH 11/13] ARM: dts: lpc32xx: ea3250: beautify gpio keys children
 nodes
Date: Tue, 29 Jan 2019 21:20:47 +0200
Message-ID: <20190129192049.11223-12-vz@mleia.com>
References: <20190129192049.11223-1-vz@mleia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190129192049.11223-1-vz@mleia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sylvain Lemieux <slemieux.tyco@gmail.com>, Russell King <linux@armlinux.org.uk>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Regarding the 'gpio_keys' device node a dtc reports a couple of
warnings:

  Warning (avoid_unnecessary_addr_size): /gpio_keys: unnecessary
  #address-cells/#size-cells without "ranges" or child "reg" property

  Warning (unit_address_vs_reg): /gpio_keys/button@21: node has
  a unit name, but no reg property

The change fixes these issues and adds empty lines between adjacent
children device nodes. The device node itself is renamed by substituting
an underscore by hyphen to follow the standard naming convention
of device tree nodes.

Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
---
 arch/arm/boot/dts/lpc3250-ea3250.dts | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/lpc3250-ea3250.dts b/arch/arm/boot/dts/lpc3250-ea3250.dts
index ef6b3e74cd9f..f46a11827ef6 100644
--- a/arch/arm/boot/dts/lpc3250-ea3250.dts
+++ b/arch/arm/boot/dts/lpc3250-ea3250.dts
@@ -23,56 +23,64 @@
 		reg = <0x80000000 0x4000000>;
 	};
 
-	gpio_keys {
+	gpio-keys {
 		compatible = "gpio-keys";
-		#address-cells = <1>;
-		#size-cells = <0>;
 		autorepeat;
-		button@21 {
+
+		button {
 			label = "Interrupt Key";
 			linux,code = <103>;
 			gpios = <&gpio 4 1 0>; /* GPI_P3 1 */
 		};
+
 		key1 {
 			label = "KEY1";
 			linux,code = <1>;
 			gpios = <&pca9532 0 0>;
 		};
+
 		key2 {
 			label = "KEY2";
 			linux,code = <2>;
 			gpios = <&pca9532 1 0>;
 		};
+
 		key3 {
 			label = "KEY3";
 			linux,code = <3>;
 			gpios = <&pca9532 2 0>;
 		};
+
 		key4 {
 			label = "KEY4";
 			linux,code = <4>;
 			gpios = <&pca9532 3 0>;
 		};
+
 		joy0 {
 			label = "Joystick Key 0";
 			linux,code = <10>;
 			gpios = <&gpio 2 0 0>; /* P2.0 */
 		};
+
 		joy1 {
 			label = "Joystick Key 1";
 			linux,code = <11>;
 			gpios = <&gpio 2 1 0>; /* P2.1 */
 		};
+
 		joy2 {
 			label = "Joystick Key 2";
 			linux,code = <12>;
 			gpios = <&gpio 2 2 0>; /* P2.2 */
 		};
+
 		joy3 {
 			label = "Joystick Key 3";
 			linux,code = <13>;
 			gpios = <&gpio 2 3 0>; /* P2.3 */
 		};
+
 		joy4 {
 			label = "Joystick Key 4";
 			linux,code = <14>;
-- 
2.20.1
