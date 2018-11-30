From: Daniel Mack <daniel@zonque.org>
Subject: [PATCH 4/7] ARM: dts: pxa: merge &pxa3xx_ohci with &usb0
Date: Fri, 30 Nov 2018 18:55:40 +0100
Message-ID: <20181130175543.32628-5-daniel@zonque.org>
References: <20181130175543.32628-1-daniel@zonque.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181130175543.32628-1-daniel@zonque.org>
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

Both pxa3xx.dtsi and pxa2xx.dtsi define a node for the USB controller. Merge
them, and get rid of the one in pxa3xx.dtsi.

Signed-off-by: Daniel Mack <daniel@zonque.org>
---
 arch/arm/boot/dts/pxa2xx.dtsi | 1 +
 arch/arm/boot/dts/pxa3xx.dtsi | 8 --------
 2 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/pxa2xx.dtsi b/arch/arm/boot/dts/pxa2xx.dtsi
index 30e77ebbcc4d..c00b1115f2a7 100644
--- a/arch/arm/boot/dts/pxa2xx.dtsi
+++ b/arch/arm/boot/dts/pxa2xx.dtsi
@@ -138,6 +138,7 @@
 			compatible = "marvell,pxa-ohci";
 			reg = <0x4c000000 0x10000>;
 			interrupts = <3>;
+			clocks = <&clks CLK_USBH>;
 			status = "disabled";
 		};
 
diff --git a/arch/arm/boot/dts/pxa3xx.dtsi b/arch/arm/boot/dts/pxa3xx.dtsi
index eb3223e85f9a..eb9443208578 100644
--- a/arch/arm/boot/dts/pxa3xx.dtsi
+++ b/arch/arm/boot/dts/pxa3xx.dtsi
@@ -202,14 +202,6 @@
 			status = "disabled";
 		};
 
-		pxa3xx_ohci: usb@4c000000 {
-			compatible = "marvell,pxa-ohci";
-			reg = <0x4c000000 0x10000>;
-			interrupts = <3>;
-			clocks = <&clks CLK_USBH>;
-			status = "disabled";
-		};
-
 		pwm0: pwm@40b00000 {
 			compatible = "marvell,pxa270-pwm";
 			reg = <0x40b00000 0x10>;
-- 
2.19.2
