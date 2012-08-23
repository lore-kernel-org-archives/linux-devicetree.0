From: Michael Grzeschik <m.grzeschik@pengutronix.de>
Subject: [PATCH] ARM: dts: imx: add imx5x usb entries
Date: Thu, 23 Aug 2012 12:35:57 +0200
Message-ID: <1345718157-7927-1-git-send-email-m.grzeschik@pengutronix.de>
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
Cc: devicetree-discuss@lists.ozlabs.org, shawn.guo@linaro.org, richard.zhao@linaro.org, kernel@pengutronix.de
List-Id: devicetree@vger.kernel.org

Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
---
 arch/arm/boot/dts/imx51.dtsi |   28 ++++++++++++++++++++++++++++
 arch/arm/boot/dts/imx53.dtsi |   28 ++++++++++++++++++++++++++++
 2 files changed, 56 insertions(+)

diff --git a/arch/arm/boot/dts/imx51.dtsi b/arch/arm/boot/dts/imx51.dtsi
index aba28dc..4ec015f 100644
--- a/arch/arm/boot/dts/imx51.dtsi
+++ b/arch/arm/boot/dts/imx51.dtsi
@@ -130,6 +130,34 @@
 				};
 			};
 
+			usb@73f80000 {
+				compatible = "fsl,imx51-usb", "fsl,imx27-usb";
+				reg = <0x73f80000 0x0200>;
+				interrupts = <18>;
+				status = "disabled";
+			};
+
+			usb@73f80200 {
+				compatible = "fsl,imx51-usb", "fsl,imx27-usb";
+				reg = <0x73f80200 0x0200>;
+				interrupts = <14>;
+				status = "disabled";
+			};
+
+			usb@73f80400 {
+				compatible = "fsl,imx51-usb", "fsl,imx27-usb";
+				reg = <0x73f80400 0x0200>;
+				interrupts = <16>;
+				status = "disabled";
+			};
+
+			usb@73f80600 {
+				compatible = "fsl,imx51-usb", "fsl,imx27-usb";
+				reg = <0x73f80600 0x0200>;
+				interrupts = <17>;
+				status = "disabled";
+			};
+
 			gpio1: gpio@73f84000 {
 				compatible = "fsl,imx51-gpio", "fsl,imx35-gpio";
 				reg = <0x73f84000 0x4000>;
diff --git a/arch/arm/boot/dts/imx53.dtsi b/arch/arm/boot/dts/imx53.dtsi
index cd37165..24280a4 100644
--- a/arch/arm/boot/dts/imx53.dtsi
+++ b/arch/arm/boot/dts/imx53.dtsi
@@ -135,6 +135,34 @@
 				};
 			};
 
+			usb@53f80000 {
+				compatible = "fsl,imx53-usb", "fsl,imx27-usb";
+				reg = <0x53f80000 0x0200>;
+				interrupts = <18>;
+				status = "disabled";
+			};
+
+			usb@53f80200 {
+				compatible = "fsl,imx53-usb", "fsl,imx27-usb";
+				reg = <0x53f80200 0x0200>;
+				interrupts = <14>;
+				status = "disabled";
+			};
+
+			usb@53f80400 {
+				compatible = "fsl,imx53-usb", "fsl,imx27-usb";
+				reg = <0x53f80400 0x0200>;
+				interrupts = <16>;
+				status = "disabled";
+			};
+
+			usb@53f80600 {
+				compatible = "fsl,imx53-usb", "fsl,imx27-usb";
+				reg = <0x53f80600 0x0200>;
+				interrupts = <17>;
+				status = "disabled";
+			};
+
 			gpio1: gpio@53f84000 {
 				compatible = "fsl,imx53-gpio", "fsl,imx35-gpio";
 				reg = <0x53f84000 0x4000>;
-- 
1.7.10.4
