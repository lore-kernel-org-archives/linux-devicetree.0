From: Bruno Herrera <bruherrera@gmail.com>
Subject: [PATCH v3 2/5] ARM: dts: stm32: Add USB FS support for STM32F429 MCU
Date: Tue, 17 Jan 2017 14:12:34 -0200
Message-ID: <20170117161237.3802-3-bruherrera@gmail.com>
References: <20170117161237.3802-1-bruherrera@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170117161237.3802-1-bruherrera@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robh+dt@kernel.org, mark.rutland@arm.com, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, johnyoun@synopsys.com, felipe.balbi@linux.intel.com
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This patch adds the USB pins and nodes for USB FS core. 

Signed-off-by: Bruno Herrera <bruherrera@gmail.com>
---
 arch/arm/boot/dts/stm32f429.dtsi | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f429.dtsi b/arch/arm/boot/dts/stm32f429.dtsi
index e4dae0e..26f2395 100644
--- a/arch/arm/boot/dts/stm32f429.dtsi
+++ b/arch/arm/boot/dts/stm32f429.dtsi
@@ -316,6 +316,28 @@
 				};
 			};
 
+			usbotg_fs_pins_a: usbotg_fs@0 {
+				pins {
+					pinmux = <STM32F429_PA10_FUNC_OTG_FS_ID>,
+						 <STM32F429_PA11_FUNC_OTG_FS_DM>,
+						 <STM32F429_PA12_FUNC_OTG_FS_DP>;
+					bias-disable;
+					drive-push-pull;
+					slew-rate = <2>;
+				};
+			};
+
+			usbotg_fs_pins_b: usbotg_fs@1 {
+				pins {
+					pinmux = <STM32F429_PB12_FUNC_OTG_HS_ID>,
+						 <STM32F429_PB14_FUNC_OTG_HS_DM>,
+						 <STM32F429_PB15_FUNC_OTG_HS_DP>;
+					bias-disable;
+					drive-push-pull;
+					slew-rate = <2>;
+				};
+			};
+
 			usbotg_hs_pins_a: usbotg_hs@0 {
 				pins {
 					pinmux = <STM32F429_PH4_FUNC_OTG_HS_ULPI_NXT>,
@@ -420,6 +442,15 @@
 			status = "disabled";
 		};
 
+		usbotg_fs: usb@50000000 {
+			compatible = "st,stm32f4xx-fsotg";
+			reg = <0x50000000 0x40000>;
+			interrupts = <67>;
+			clocks = <&rcc 0 39>;
+			clock-names = "otg";
+			status = "disabled";
+		};
+
 		rng: rng@50060800 {
 			compatible = "st,stm32-rng";
 			reg = <0x50060800 0x400>;
-- 
2.10.1 (Apple Git-78)
