From: Alexandre TORGUE <alexandre.torgue@st.com>
Subject: [PATCH v5 1/9] Documentation: dt-bindings: Document STM32 EXTI controller bindings
Date: Fri, 9 Sep 2016 16:41:56 +0200
Message-ID: <1473432124-6784-2-git-send-email-alexandre.torgue@st.com>
References: <1473432124-6784-1-git-send-email-alexandre.torgue@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1473432124-6784-1-git-send-email-alexandre.torgue@st.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org, arnd@arndb.de
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>, bruherrera@gmail.com, lee.jones@linaro.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Signed-off-by: Alexandre TORGUE <alexandre.torgue@st.com>

diff --git a/Documentation/devicetree/bindings/interrupt-controller/st,stm32-exti.txt b/Documentation/devicetree/bindings/interrupt-controller/st,stm32-exti.txt
new file mode 100644
index 0000000..6e7703d
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/st,stm32-exti.txt
@@ -0,0 +1,20 @@
+STM32 External Interrupt Controller
+
+Required properties:
+
+- compatible: Should be "st,stm32-exti"
+- reg: Specifies base physical address and size of the registers
+- interrupt-controller: Indentifies the node as an interrupt controller
+- #interrupt-cells: Specifies the number of cells to encode an interrupt
+  specifier, shall be 2
+- interrupts: interrupts references to primary interrupt controller
+
+Example:
+
+exti: interrupt-controller@40013c00 {
+	compatible = "st,stm32-exti";
+	interrupt-controller;
+	#interrupt-cells = <2>;
+	reg = <0x40013C00 0x400>;
+	interrupts = <1>, <2>, <3>, <6>, <7>, <8>, <9>, <10>, <23>, <40>, <41>, <42>, <62>, <76>;
+};
-- 
1.9.1

