From: Dong Aisheng <aisheng.dong-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCH 1/2] dt-bindings: timer: add nxp tpm timer binding doc
Date: Sat, 13 May 2017 15:29:34 +0800
Message-ID: <1494660575-30465-1-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, ping.bai-3arQi8VN3Tc@public.gmane.org, anson.huang-3arQi8VN3Tc@public.gmane.org, dongas86-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Dong Aisheng <aisheng.dong-3arQi8VN3Tc@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Adding NXP Low Power Timer/Pulse Width Modulation Module (TPM)
binding doc.

Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Bai Ping <ping.bai-3arQi8VN3Tc@public.gmane.org>
Signed-off-by: Dong Aisheng <aisheng.dong-3arQi8VN3Tc@public.gmane.org>
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
