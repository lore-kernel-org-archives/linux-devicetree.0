From: Amelie Delaunay <amelie.delaunay@st.com>
Subject: [PATCH v4 1/9] dt-bindings: mfd: Add ST Multi-Function eXpander (STMFX) core bindings
Date: Wed, 27 Feb 2019 10:34:46 +0100
Message-ID: <1551260094-32570-2-git-send-email-amelie.delaunay@st.com>
References: <1551260094-32570-1-git-send-email-amelie.delaunay@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1551260094-32570-1-git-send-email-amelie.delaunay@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexandre Torgue <alexandre.torgue@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, Amelie Delaunay <amelie.delaunay@st.com>
List-Id: devicetree@vger.kernel.org

This patch adds documentation of device tree bindings for the
STMicroelectronics Multi-Function eXpander (STMFX) MFD core.

Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
---
 Documentation/devicetree/bindings/mfd/stmfx.txt | 28 +++++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/stmfx.txt

diff --git a/Documentation/devicetree/bindings/mfd/stmfx.txt b/Documentation/devicetree/bindings/mfd/stmfx.txt
new file mode 100644
index 0000000..f0c2f7f
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/stmfx.txt
@@ -0,0 +1,28 @@
+STMicroelectonics Multi-Function eXpander (STMFX) Core bindings
+
+ST Multi-Function eXpander (STMFX) is a slave controller using I2C for
+communication with the main MCU. Its main features are GPIO expansion, main
+MCU IDD measurement (IDD is the amount of current that flows through VDD) and
+resistive touchscreen controller.
+
+Required properties:
+- compatible: should be "st,stmfx-0300".
+- reg: I2C slave address of the device.
+- interrupts: interrupt specifier triggered by MFX_IRQ_OUT signal.
+  Please refer to ../interrupt-controller/interrupt.txt
+
+Optional properties:
+- drive-open-drain: configure MFX_IRQ_OUT as open drain.
+- vdd-supply: phandle of the regulator supplying STMFX.
+
+Example:
+
+	stmfx: stmfx@42 {
+		compatible = "st,stmfx-0300";
+		reg = <0x42>;
+		interrupts = <8 IRQ_TYPE_EDGE_RISING>;
+		interrupt-parent = <&gpioi>;
+		vdd-supply = <&v3v3>;
+	};
+
+Please refer to ../pinctrl/pinctrl-stmfx.txt for STMFX GPIO expander function bindings.
-- 
2.7.4
