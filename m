From: Fabrice Gasnier <fabrice.gasnier@st.com>
Subject: [PATCH 3/3] ARM: dts: stm32: don't use timers dmas on stm32mp157c-ev1
Date: Wed, 3 Oct 2018 17:11:05 +0200
Message-ID: <1538579465-7854-4-git-send-email-fabrice.gasnier@st.com>
References: <1538579465-7854-1-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1538579465-7854-1-git-send-email-fabrice.gasnier@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: alexandre.torgue@st.com
Cc: robh+dt@kernel.org, mcoquelin.stm32@gmail.com, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, fabrice.gasnier@st.com
List-Id: devicetree@vger.kernel.org

Spare dmas when using timers on stm32mp157c-ev1.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
---
 arch/arm/boot/dts/stm32mp157c-ev1.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp157c-ev1.dts b/arch/arm/boot/dts/stm32mp157c-ev1.dts
index 372bc2e..89bb35d 100644
--- a/arch/arm/boot/dts/stm32mp157c-ev1.dts
+++ b/arch/arm/boot/dts/stm32mp157c-ev1.dts
@@ -100,6 +100,9 @@
 };
 
 &timers2 {
+	/* spare dmas for other usage (un-delete to enable pwm capture) */
+	/delete-property/dmas;
+	/delete-property/dma-names;
 	status = "disabled";
 	pwm {
 		pinctrl-0 = <&pwm2_pins_a>;
@@ -112,6 +115,8 @@
 };
 
 &timers8 {
+	/delete-property/dmas;
+	/delete-property/dma-names;
 	status = "disabled";
 	pwm {
 		pinctrl-0 = <&pwm8_pins_a>;
@@ -124,6 +129,8 @@
 };
 
 &timers12 {
+	/delete-property/dmas;
+	/delete-property/dma-names;
 	status = "disabled";
 	pwm {
 		pinctrl-0 = <&pwm12_pins_a>;
-- 
1.9.1
