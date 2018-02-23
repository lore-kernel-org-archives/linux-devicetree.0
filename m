From: Michal Simek <michal.simek@xilinx.com>
Subject: [PATCH] arm: zynq: Use i2c-mux instead of i2cswitch for pca9548
Date: Fri, 23 Feb 2018 15:02:09 +0100
Message-ID: <5ea002abef0c3c2ef7fe04360c916c0db72f2619.1519394527.git.michal.simek@xilinx.com>
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
To: linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, monstr@monstr.eu, Josh Cartwright <josh.cartwright@ni.com>, linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>, robh+dt@kernel.org, Rob Herring <robherring2@gmail.com>, Peter Crosthwaite <peter.crosthwaite@xilinx.com>, Steffen Trumtrar <s.trumtrar@pengutronix.de>, =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann@xilinx.com>
List-Id: devicetree@vger.kernel.org

i2c muxes should described like this.

Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---

Based on Rob's comment https://patchwork.kernel.org/patch/10175211/

---
 arch/arm/boot/dts/zynq-zc702.dts | 2 +-
 arch/arm/boot/dts/zynq-zc706.dts | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/zynq-zc702.dts b/arch/arm/boot/dts/zynq-zc702.dts
index d96979644e49..c0384376d7e0 100644
--- a/arch/arm/boot/dts/zynq-zc702.dts
+++ b/arch/arm/boot/dts/zynq-zc702.dts
@@ -105,7 +105,7 @@
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_i2c0_default>;
 
-	i2cswitch@74 {
+	i2c-mux@74 {
 		compatible = "nxp,pca9548";
 		#address-cells = <1>;
 		#size-cells = <0>;
diff --git a/arch/arm/boot/dts/zynq-zc706.dts b/arch/arm/boot/dts/zynq-zc706.dts
index d0f51d0d6c95..886d20c4fdd5 100644
--- a/arch/arm/boot/dts/zynq-zc706.dts
+++ b/arch/arm/boot/dts/zynq-zc706.dts
@@ -61,7 +61,7 @@
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_i2c0_default>;
 
-	i2cswitch@74 {
+	i2c-mux@74 {
 		compatible = "nxp,pca9548";
 		#address-cells = <1>;
 		#size-cells = <0>;
-- 
1.9.1
