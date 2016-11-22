From: Emmanuel Vadot <manu@bidouilliste.com>
Subject: [PATCH] ARM: dts: sunxi: Add num-cs for A20 spi nodes
Date: Tue, 22 Nov 2016 18:06:16 +0100
Message-ID: <20161122170616.29557-1-manu@bidouilliste.com>
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
To: robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, maxime.ripard@free-electrons.com, wens@csie.org
Cc: devicetree@vger.kernel.org, Emmanuel Vadot <manu@bidouilliste.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The spi0 controller on the A20 have up to 4 CS (Chip Select) while the
others three only have 1.
Add the num-cs property to each node.

Signed-off-by: Emmanuel Vadot <manu@bidouilliste.com>
---
 arch/arm/boot/dts/sun7i-a20.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/sun7i-a20.dtsi b/arch/arm/boot/dts/sun7i-a20.dtsi
index 94cf5a1..ed21982 100644
--- a/arch/arm/boot/dts/sun7i-a20.dtsi
+++ b/arch/arm/boot/dts/sun7i-a20.dtsi
@@ -871,6 +871,7 @@
 			status = "disabled";
 			#address-cells = <1>;
 			#size-cells = <0>;
+			num-cs = 4;
 		};
 
 		spi1: spi@01c06000 {
@@ -885,6 +886,7 @@
 			status = "disabled";
 			#address-cells = <1>;
 			#size-cells = <0>;
+			num-cs = 1;
 		};
 
 		emac: ethernet@01c0b000 {
@@ -1037,6 +1039,7 @@
 			status = "disabled";
 			#address-cells = <1>;
 			#size-cells = <0>;
+			num-cs = 1;
 		};
 
 		ahci: sata@01c18000 {
@@ -1079,6 +1082,7 @@
 			status = "disabled";
 			#address-cells = <1>;
 			#size-cells = <0>;
+			num-cs = 1;
 		};
 
 		pio: pinctrl@01c20800 {
-- 
2.9.2
