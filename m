From: Rob Herring <robh@kernel.org>
Subject: [PATCH] ARM: dts: realview-pbx: Fix duplicate regulator nodes
Date: Thu, 29 Nov 2018 19:05:47 -0600
Message-ID: <20181130010547.24757-1-robh@kernel.org>
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
 arch/arm/boot/dts/arm-realview-pbx.dtsi | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/arm-realview-pbx.dtsi b/arch/arm/boot/dts/arm-realview-pbx.dtsi
index a5676697ff3b..916a97734f84 100644
--- a/arch/arm/boot/dts/arm-realview-pbx.dtsi
+++ b/arch/arm/boot/dts/arm-realview-pbx.dtsi
@@ -44,7 +44,7 @@
 	};
 
 	/* The voltage to the MMC card is hardwired at 3.3V */
-	vmmc: fixedregulator@0 {
+	vmmc: regulator-vmmc {
 		compatible = "regulator-fixed";
 		regulator-name = "vmmc";
 		regulator-min-microvolt = <3300000>;
@@ -52,7 +52,7 @@
 		regulator-boot-on;
         };
 
-	veth: fixedregulator@0 {
+	veth: regulator-veth {
 		compatible = "regulator-fixed";
 		regulator-name = "veth";
 		regulator-min-microvolt = <3300000>;
@@ -567,4 +567,3 @@
 		};
 	};
 };
-
-- 
2.19.1
