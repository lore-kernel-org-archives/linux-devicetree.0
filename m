From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Subject: [PATCH v2 1/2] binding for stm32 cec driver
Date: Tue, 16 May 2017 14:56:22 +0200
Message-ID: <1494939383-18937-2-git-send-email-benjamin.gaignard@linaro.org>
References: <1494939383-18937-1-git-send-email-benjamin.gaignard@linaro.org>
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <1494939383-18937-1-git-send-email-benjamin.gaignard@linaro.org>
Sender: linux-media-owner@vger.kernel.org
To: yannick.fertre@st.com, alexandre.torgue@st.com, hverkuil@xs4all.nl, devicetree@vger.kernel.org, linux-media@vger.kernel.org, robh@kernel.org, hans.verkuil@cisco.com
Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@linaro.org>
---
 .../devicetree/bindings/media/st,stm32-cec.txt        | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/st,stm32-cec.txt

diff --git a/Documentation/devicetree/bindings/media/st,stm32-cec.txt b/Documentation/devicetree/bindings/media/st,stm32-cec.txt
new file mode 100644
index 0000000..6be2381
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/st,stm32-cec.txt
@@ -0,0 +1,19 @@
+STMicroelectronics STM32 CEC driver
+
+Required properties:
+ - compatible : value should be "st,stm32-cec"
+ - reg : Physical base address of the IP registers and length of memory
+	 mapped region.
+ - clocks : from common clock binding: handle to CEC clocks
+ - clock-names : from common clock binding: must be "cec" and "hdmi-cec".
+ - interrupts : CEC interrupt number to the CPU.
+
+Example for stm32f746:
+
+cec: cec@40006c00 {
+	compatible = "st,stm32-cec";
+	reg = <0x40006C00 0x400>;
+	interrupts = <94>;
+	clocks = <&rcc 0 STM32F7_APB1_CLOCK(CEC)>, <&rcc 1 CLK_HDMI_CEC>;
+	clock-names = "cec", "hdmi-cec";
+};
-- 
1.9.1
