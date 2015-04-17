From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH 2/5] clocksource: st_lpc: Add DT bindings documentation for lpc timer
Date: Fri, 17 Apr 2015 11:50:20 +0100
Message-ID: <1429267823-8879-3-git-send-email-peter.griffin@linaro.org>
References: <1429267823-8879-1-git-send-email-peter.griffin@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1429267823-8879-1-git-send-email-peter.griffin@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, srinivas.kandagatla@gmail.com, maxime.coquelin@st.com, patrice.chotard@st.com, daniel.lezcano@linaro.org, tglx@linutronix.de
Cc: peter.griffin@linaro.org, lee.jones@linaro.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch provides the DT bindings documentation for the lpc
timer found on stih407 fanmily SoCs from STMicroelectronics.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 Documentation/devicetree/bindings/timer/st,lpc-timer.txt | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/st,lpc-timer.txt

diff --git a/Documentation/devicetree/bindings/timer/st,lpc-timer.txt b/Documentation/devicetree/bindings/timer/st,lpc-timer.txt
new file mode 100644
index 0000000..c9ef297
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/st,lpc-timer.txt
@@ -0,0 +1,15 @@
+Binding for LPC Timer on STMicroelectronics STi series SoCs
+
+Required properties:
+- compatible: Should be "st,st_lpc_timer"
+- reg: Base address and length of the LPC Timers registers.
+- clock-names: Set to "lpc_clk".
+- clocks: phandle of the clock used by the LPC Timer
+
+Example:
+	lpc-timer@0x8788000 {
+		compatible = "st,st_lpc_timer";
+		reg = <0x8788000 0x1000>;
+		clock-names = "lpc_clk";
+		clocks = <&clk_s_d3_flexgen CLK_LPC_1>;
+	};
-- 
1.9.1
