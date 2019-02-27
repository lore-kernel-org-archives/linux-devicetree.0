From: Amelie Delaunay <amelie.delaunay@st.com>
Subject: [PATCH v4 5/9] ARM: dts: stm32: add STMFX support on stm32746g-eval
Date: Wed, 27 Feb 2019 10:34:50 +0100
Message-ID: <1551260094-32570-6-git-send-email-amelie.delaunay@st.com>
References: <1551260094-32570-1-git-send-email-amelie.delaunay@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1551260094-32570-1-git-send-email-amelie.delaunay@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexandre Torgue <alexandre.torgue@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, Amelie Delaunay <amelie.delaunay@st.com>
List-Id: devicetree@vger.kernel.org

This patch adds support for STMicroelectronics Multi-Function eXpander
(STMFX) on stm32746g-eval. It is connected on i2c1.

Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/boot/dts/stm32746g-eval.dts | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm/boot/dts/stm32746g-eval.dts b/arch/arm/boot/dts/stm32746g-eval.dts
index 8c081ea..203faf0 100644
--- a/arch/arm/boot/dts/stm32746g-eval.dts
+++ b/arch/arm/boot/dts/stm32746g-eval.dts
@@ -44,6 +44,7 @@
 #include "stm32f746.dtsi"
 #include "stm32f746-pinctrl.dtsi"
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/interrupt-controller/irq.h>
 
 / {
 	model = "STMicroelectronics STM32746g-EVAL board";
@@ -114,6 +115,22 @@
 	i2c-scl-rising-time-ns = <185>;
 	i2c-scl-falling-time-ns = <20>;
 	status = "okay";
+
+	stmfx: stmfx@42 {
+		compatible = "st,stmfx-0300";
+		reg = <0x42>;
+		interrupts = <8 IRQ_TYPE_EDGE_RISING>;
+		interrupt-parent = <&gpioi>;
+
+		stmfx_pinctrl: stmfx-pin-controller {
+			compatible = "st,stmfx-0300-pinctrl";
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			gpio-ranges = <&stmfx_pinctrl 0 0 24>;
+		};
+	};
 };
 
 &rtc {
-- 
2.7.4
