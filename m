From: Rob Herring <robh@kernel.org>
Subject: [PATCH] ARM: dts: socfpga: Fix I2C bus unit-address error
Date: Thu, 13 Sep 2018 13:12:37 -0500
Message-ID: <20180913181245.25484-13-robh@kernel.org>
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
Cc: Dinh Nguyen <dinguyen@kernel.org>
List-Id: devicetree@vger.kernel.org

dtc has new checks for I2C buses. Fix the warnings in unit-addresses.

arch/arm/boot/dts/socfpga_cyclone5_de0_sockit.dtb: Warning (i2c_bus_reg): /soc/i2c@ffc04000/adxl345@0: I2C bus unit address format error, expected "53"

Cc: Dinh Nguyen <dinguyen@kernel.org>
Signed-off-by: Rob Herring <robh@kernel.org>
---
Please apply to the sub-arch tree. The dtc changes haven't landed, but 
will for 4.20.

 arch/arm/boot/dts/socfpga_cyclone5_de0_sockit.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/socfpga_cyclone5_de0_sockit.dts b/arch/arm/boot/dts/socfpga_cyclone5_de0_sockit.dts
index b280e6494193..31b01a998b2e 100644
--- a/arch/arm/boot/dts/socfpga_cyclone5_de0_sockit.dts
+++ b/arch/arm/boot/dts/socfpga_cyclone5_de0_sockit.dts
@@ -88,7 +88,7 @@
 	status = "okay";
 	clock-frequency = <100000>;
 
-	adxl345: adxl345@0 {
+	adxl345: adxl345@53 {
 		compatible = "adi,adxl345";
 		reg = <0x53>;
 
-- 
2.17.1
