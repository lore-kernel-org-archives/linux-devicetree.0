From: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/9] dt-bindings: timer: Add nxp tpm timer binding doc
Date: Tue, 29 Aug 2017 11:34:19 +0200
Message-ID: <1503999271-15712-1-git-send-email-daniel.lezcano@linaro.org>
References: <20170829093354.GA2572@mai>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170829093354.GA2572@mai>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dong Aisheng <aisheng.dong-3arQi8VN3Tc@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bai Ping <ping.bai-3arQi8VN3Tc@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Dong Aisheng <aisheng.dong-3arQi8VN3Tc@public.gmane.org>

Adding NXP Low Power Timer/Pulse Width Modulation Module (TPM)
binding doc.

Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Bai Ping <ping.bai-3arQi8VN3Tc@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: Dong Aisheng <aisheng.dong-3arQi8VN3Tc@public.gmane.org>
Signed-off-by: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 .../devicetree/bindings/timer/nxp,tpm-timer.txt    | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/nxp,tpm-timer.txt

diff --git a/Documentation/devicetree/bindings/timer/nxp,tpm-timer.txt b/Documentation/devicetree/bindings/timer/nxp,tpm-timer.txt
new file mode 100644
index 0000000..b4aa7dd
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/nxp,tpm-timer.txt
@@ -0,0 +1,28 @@
+NXP Low Power Timer/Pulse Width Modulation Module (TPM)
+
+The Timer/PWM Module (TPM) supports input capture, output compare,
+and the generation of PWM signals to control electric motor and power
+management applications. The counter, compare and capture registers
+are clocked by an asynchronous clock that can remain enabled in low
+power modes. TPM can support global counter bus where one TPM drives
+the counter bus for the others, provided bit width is the same.
+
+Required properties:
+
+- compatible :	should be "fsl,imx7ulp-tpm"
+- reg :		Specifies base physical address and size of the register sets
+		for the clock event device and clock source device.
+- interrupts :	Should be the clock event device interrupt.
+- clocks :	The clocks provided by the SoC to drive the timer, must contain
+		an entry for each entry in clock-names.
+- clock-names : Must include the following entries: "igp" and "per".
+
+Example:
+tpm5: tpm@40260000 {
+	compatible = "fsl,imx7ulp-tpm";
+	reg = <0x40260000 0x1000>;
+	interrupts = <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
+	clocks = <&clks IMX7ULP_CLK_NIC1_BUS_DIV>,
+		 <&clks IMX7ULP_CLK_LPTPM5>;
+	clock-names = "ipg", "per";
+};
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
