From: Daniel Mack <daniel@zonque.org>
Subject: [PATCH] ARM: dts: pxa: clean up USB controller nodes
Date: Sat,  1 Dec 2018 14:54:51 +0100
Message-ID: <20181201135451.3505-1-daniel@zonque.org>
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
To: robert.jarzmik@free.fr, haojian.zhuang@gmail.com
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, Daniel Mack <daniel@zonque.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

PXA25xx SoCs don't have a USB controller, so drop the node from the
common pxa2xx.dtsi base file. Both pxa27x and pxa3xx have a dedicated
node already anyway.

While at it, unify the names for the nodes across all pxa platforms.

Signed-off-by: Daniel Mack <daniel@zonque.org>
Reported-by: Sergey Yanovich <ynvich@gmail.com>
Link: https://patchwork.kernel.org/patch/8375421/
---
 arch/arm/boot/dts/pxa27x.dtsi | 2 +-
 arch/arm/boot/dts/pxa2xx.dtsi | 7 -------
 arch/arm/boot/dts/pxa3xx.dtsi | 2 +-
 3 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/pxa27x.dtsi b/arch/arm/boot/dts/pxa27x.dtsi
index 3228ad5fb725..ccbecad9c5c7 100644
--- a/arch/arm/boot/dts/pxa27x.dtsi
+++ b/arch/arm/boot/dts/pxa27x.dtsi
@@ -35,7 +35,7 @@
 			clocks = <&clks CLK_NONE>;
 		};
 
-		pxa27x_ohci: usb@4c000000 {
+		usb0: usb@4c000000 {
 			compatible = "marvell,pxa-ohci";
 			reg = <0x4c000000 0x10000>;
 			interrupts = <3>;
diff --git a/arch/arm/boot/dts/pxa2xx.dtsi b/arch/arm/boot/dts/pxa2xx.dtsi
index 30e77ebbcc4d..e83879d97aea 100644
--- a/arch/arm/boot/dts/pxa2xx.dtsi
+++ b/arch/arm/boot/dts/pxa2xx.dtsi
@@ -134,13 +134,6 @@
 			status = "disabled";
 		};
 
-		usb0: ohci@4c000000 {
-			compatible = "marvell,pxa-ohci";
-			reg = <0x4c000000 0x10000>;
-			interrupts = <3>;
-			status = "disabled";
-		};
-
 		mmc0: mmc@41100000 {
 			compatible = "marvell,pxa-mmc";
 			reg = <0x41100000 0x1000>;
diff --git a/arch/arm/boot/dts/pxa3xx.dtsi b/arch/arm/boot/dts/pxa3xx.dtsi
index d9f7c68479ab..e1e607f53ce6 100644
--- a/arch/arm/boot/dts/pxa3xx.dtsi
+++ b/arch/arm/boot/dts/pxa3xx.dtsi
@@ -202,7 +202,7 @@
 			status = "disabled";
 		};
 
-		pxa3xx_ohci: usb@4c000000 {
+		usb0: usb@4c000000 {
 			compatible = "marvell,pxa-ohci";
 			reg = <0x4c000000 0x10000>;
 			interrupts = <3>;
-- 
2.19.2
