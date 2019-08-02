From: =?UTF-8?q?Yannick=20Fertr=C3=A9?= <yannick.fertre@st.com>
Subject: [PATCH] ARM: dts: stm32: move ltdc pinctrl on stm32mp157a dk1 board
Date: Fri, 2 Aug 2019 16:08:51 +0200
Message-ID: <1564754931-13861-1-git-send-email-yannick.fertre@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Benjamin Gaignard <benjamin.gaignard@st.com>, Yannick Fertre <yannick.fertre@st.com>, Philippe Cornu <philippe.cornu@st.com>, Fabrice Gasnier <fabrice.gasnier@st.com>
List-Id: devicetree@vger.kernel.org

The ltdc pinctrl must be in the display controller node and
not in the peripheral node (hdmi bridge).

Signed-off-by: Yannick Fertré <yannick.fertre@st.com>
---
 arch/arm/boot/dts/stm32mp157a-dk1.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp157a-dk1.dts b/arch/arm/boot/dts/stm32mp157a-dk1.dts
index f3f0e37..1285cfc 100644
--- a/arch/arm/boot/dts/stm32mp157a-dk1.dts
+++ b/arch/arm/boot/dts/stm32mp157a-dk1.dts
@@ -99,9 +99,6 @@
 		reset-gpios = <&gpioa 10 GPIO_ACTIVE_LOW>;
 		interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
 		interrupt-parent = <&gpiog>;
-		pinctrl-names = "default", "sleep";
-		pinctrl-0 = <&ltdc_pins_a>;
-		pinctrl-1 = <&ltdc_pins_sleep_a>;
 		status = "okay";
 
 		ports {
@@ -276,6 +273,9 @@
 };
 
 &ltdc {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&ltdc_pins_a>;
+	pinctrl-1 = <&ltdc_pins_sleep_a>;
 	status = "okay";
 
 	port {
-- 
2.7.4
