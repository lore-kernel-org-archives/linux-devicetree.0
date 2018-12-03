From: Rob Herring <robh@kernel.org>
Subject: [PATCH] ARM: dts: realview: Fix some more duplicate regulator nodes
Date: Mon,  3 Dec 2018 13:12:48 -0600
Message-ID: <20181203191248.13067-1-robh@kernel.org>
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
To: Linus Walleij <linus.walleij@linaro.org>, arm@kernel.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

There's a bug in dtc in checking for duplicate node names when there's
another section (e.g. "/ { };"). In this case, skeleton.dtsi provides
another section. Upon removal of skeleton.dtsi, the dtb fails to build
due to a duplicate node 'fixedregulator@0'. As both nodes were pretty
much the same 3.3V fixed regulator, it hasn't really mattered. Fix this
by renaming the nodes to something unique. In the process, drop the
unit-address which shouldn't be present wtihout reg property.

Cc: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Rob Herring <robh@kernel.org>
---
Sigh, not sure what happened, but I missed these 2 cases.

 arch/arm/boot/dts/arm-realview-pb1176.dts | 4 ++--
 arch/arm/boot/dts/arm-realview-pb11mp.dts | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/arm-realview-pb1176.dts b/arch/arm/boot/dts/arm-realview-pb1176.dts
index cee2d7aab203..cbbb8878daa3 100644
--- a/arch/arm/boot/dts/arm-realview-pb1176.dts
+++ b/arch/arm/boot/dts/arm-realview-pb1176.dts
@@ -47,7 +47,7 @@
 	};
 
 	/* The voltage to the MMC card is hardwired at 3.3V */
-	vmmc: fixedregulator@0 {
+	vmmc: regulator-vmmc {
 		compatible = "regulator-fixed";
 		regulator-name = "vmmc";
 		regulator-min-microvolt = <3300000>;
@@ -55,7 +55,7 @@
 		regulator-boot-on;
         };
 
-	veth: fixedregulator@0 {
+	veth: regulator-veth {
 		compatible = "regulator-fixed";
 		regulator-name = "veth";
 		regulator-min-microvolt = <3300000>;
diff --git a/arch/arm/boot/dts/arm-realview-pb11mp.dts b/arch/arm/boot/dts/arm-realview-pb11mp.dts
index 63d71a1d8282..2015619ca22c 100644
--- a/arch/arm/boot/dts/arm-realview-pb11mp.dts
+++ b/arch/arm/boot/dts/arm-realview-pb11mp.dts
@@ -147,7 +147,7 @@
 	};
 
 	/* The voltage to the MMC card is hardwired at 3.3V */
-	vmmc: fixedregulator@0 {
+	vmmc: regulator-vmmc {
 		compatible = "regulator-fixed";
 		regulator-name = "vmmc";
 		regulator-min-microvolt = <3300000>;
@@ -155,7 +155,7 @@
 		regulator-boot-on;
         };
 
-	veth: fixedregulator@0 {
+	veth: regulator-veth {
 		compatible = "regulator-fixed";
 		regulator-name = "veth";
 		regulator-min-microvolt = <3300000>;
-- 
2.19.1
