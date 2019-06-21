From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] ARM: dts: socfpga: update to new Denali NAND binding
Date: Fri, 21 Jun 2019 20:23:06 +0900
Message-ID: <20190621112306.17769-1-yamada.masahiro@socionext.com>
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
To: linux-arm-kernel@lists.infradead.org, Dinh Nguyen <dinguyen@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

With commit d8e8fd0ebf8b ("mtd: rawnand: denali: decouple controller
and NAND chips"), the Denali NAND controller driver migrated to the
new controller/chip representation.

Update DT for it.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 arch/arm/boot/dts/socfpga.dtsi                |  2 +-
 arch/arm/boot/dts/socfpga_arria10.dtsi        |  2 +-
 .../boot/dts/socfpga_arria10_socdk_nand.dts   | 20 ++++++++++++-------
 3 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/socfpga.dtsi b/arch/arm/boot/dts/socfpga.dtsi
index ec1966480f2f..90d6d0d4417d 100644
--- a/arch/arm/boot/dts/socfpga.dtsi
+++ b/arch/arm/boot/dts/socfpga.dtsi
@@ -747,7 +747,7 @@
 
 		nand0: nand@ff900000 {
 			#address-cells = <0x1>;
-			#size-cells = <0x1>;
+			#size-cells = <0x0>;
 			compatible = "altr,socfpga-denali-nand";
 			reg = <0xff900000 0x100000>,
 			      <0xffb80000 0x10000>;
diff --git a/arch/arm/boot/dts/socfpga_arria10.dtsi b/arch/arm/boot/dts/socfpga_arria10.dtsi
index ae24599d5829..677394153f4d 100644
--- a/arch/arm/boot/dts/socfpga_arria10.dtsi
+++ b/arch/arm/boot/dts/socfpga_arria10.dtsi
@@ -659,7 +659,7 @@
 
 		nand: nand@ffb90000 {
 			#address-cells = <1>;
-			#size-cells = <1>;
+			#size-cells = <0>;
 			compatible = "altr,socfpga-denali-nand";
 			reg = <0xffb90000 0x72000>,
 			      <0xffb80000 0x10000>;
diff --git a/arch/arm/boot/dts/socfpga_arria10_socdk_nand.dts b/arch/arm/boot/dts/socfpga_arria10_socdk_nand.dts
index e36e0a0f8aa6..9bd9e04c7361 100644
--- a/arch/arm/boot/dts/socfpga_arria10_socdk_nand.dts
+++ b/arch/arm/boot/dts/socfpga_arria10_socdk_nand.dts
@@ -9,12 +9,18 @@
 &nand {
 	status = "okay";
 
-	partition@nand-boot {
-		label = "Boot and fpga data";
-		reg = <0x0 0x1C00000>;
-	};
-	partition@nand-rootfs {
-		label = "Root Filesystem - JFFS2";
-		reg = <0x1C00000 0x6400000>;
+	nand@0 {
+		reg = <0>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		partition@0 {
+			label = "Boot and fpga data";
+			reg = <0x0 0x1C00000>;
+		};
+		partition@1c00000 {
+			label = "Root Filesystem - JFFS2";
+			reg = <0x1C00000 0x6400000>;
+		};
 	};
 };
-- 
2.17.1
