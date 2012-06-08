From: Marek Vasut <marex@denx.de>
Subject: [PATCH V2] MXS: Add DT binding support into stmp3xxx-rtc
Date: Fri,  8 Jun 2012 20:56:44 +0200
Message-ID: <1339181804-22822-1-git-send-email-marex@denx.de>
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
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@denx.de>, Alessandro Zummo <a.zummo@towertech.it>, rtc-linux@googlegroups.com, devicetree-discuss@lists.ozlabs.org, Rob Herring <rob.herring@calxeda.com>, Grant Likely <grant.likely@secretlab.ca>, Shawn Guo <shawn.guo@linaro.org>
List-Id: devicetree@vger.kernel.org

Add simple binding for the stmp3xxx-rtc.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alessandro Zummo <a.zummo@towertech.it>
Cc: devicetree-discuss@lists.ozlabs.org
Cc: Grant Likely <grant.likely@secretlab.ca>
Cc: Rob Herring <rob.herring@calxeda.com>
Cc: rtc-linux@googlegroups.com
Cc: Shawn Guo <shawn.guo@linaro.org>
---
 .../devicetree/bindings/rtc/stmp3xxx-rtc.txt        |   19 +++++++++++++++++++
 arch/arm/boot/dts/imx28.dtsi                        |    1 +
 drivers/rtc/rtc-stmp3xxx.c                          |    7 +++++++
 3 files changed, 27 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/stmp3xxx-rtc.txt

V2: Fix typos, remove fsl,imx28-rtc

diff --git a/Documentation/devicetree/bindings/rtc/stmp3xxx-rtc.txt b/Documentation/devicetree/bindings/rtc/stmp3xxx-rtc.txt
new file mode 100644
index 0000000..a7a7de5
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/stmp3xxx-rtc.txt
@@ -0,0 +1,19 @@
+* STMP3xxx/i.MX28 Time Clock controller
+
+Required properties:
+- compatible: should be one of the following.
+    * "fsl,stmp3xxx-rtc"
+- reg: physical base address of the controller and length of memory mapped
+  region.
+- interrupts: Two interrupt numbers to the cpu should be specified. First
+  interrupt number is the rtc tick interrupt and second interrupt number
+  is the rtc alarm interrupt. The number of cells representing a interrupt
+  depends on the parent interrupt controller.
+
+Example:
+
+	rtc@80056000 {
+		compatible = "fsl,stmp3xxx-rtc";
+		reg = <0x80056000 2000>;
+		interrupts = <28 29>;
+	};
diff --git a/arch/arm/boot/dts/imx28.dtsi b/arch/arm/boot/dts/imx28.dtsi
index cabcce8..5053019 100644
--- a/arch/arm/boot/dts/imx28.dtsi
+++ b/arch/arm/boot/dts/imx28.dtsi
@@ -387,6 +387,7 @@
 			};
 
 			rtc@80056000 {
+				compatible = "fsl,imx28-rtc", "fsl,stmp3xxx-rtc";
 				reg = <0x80056000 2000>;
 				interrupts = <28 29>;
 				status = "disabled";
diff --git a/drivers/rtc/rtc-stmp3xxx.c b/drivers/rtc/rtc-stmp3xxx.c
index 1028786..3aadb58 100644
--- a/drivers/rtc/rtc-stmp3xxx.c
+++ b/drivers/rtc/rtc-stmp3xxx.c
@@ -25,6 +25,7 @@
 #include <linux/interrupt.h>
 #include <linux/rtc.h>
 #include <linux/slab.h>
+#include <linux/of_device.h>
 
 #include <mach/common.h>
 
@@ -265,6 +266,11 @@ static int stmp3xxx_rtc_resume(struct platform_device *dev)
 #define stmp3xxx_rtc_resume	NULL
 #endif
 
+static const struct of_device_id rtc_dt_ids[] = {
+	{ .compatible = "fsl,stmp3xxx-rtc", },
+	{ /* sentinel */ }
+};
+
 static struct platform_driver stmp3xxx_rtcdrv = {
 	.probe		= stmp3xxx_rtc_probe,
 	.remove		= stmp3xxx_rtc_remove,
@@ -273,6 +279,7 @@ static struct platform_driver stmp3xxx_rtcdrv = {
 	.driver		= {
 		.name	= "stmp3xxx-rtc",
 		.owner	= THIS_MODULE,
+		.of_match_table = rtc_dt_ids,
 	},
 };
 
-- 
1.7.10
