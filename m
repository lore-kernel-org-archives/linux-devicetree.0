From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH 12/18] dt-bindings: timer: gpt: update binding doc
Date: Sat, 23 Feb 2019 14:07:00 +0100
Message-ID: <20190223130707.16704-12-daniel.lezcano@linaro.org>
References: <b5d75b05-b78c-535c-2b35-9a1f5a3a853f@linaro.org>
 <20190223130707.16704-1-daniel.lezcano@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190223130707.16704-1-daniel.lezcano@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: tglx@linutronix.de
Cc: linux-kernel@vger.kernel.org, Anson Huang <anson.huang@nxp.com>, Anson Huang <Anson.Huang@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

From: Anson Huang <anson.huang@nxp.com>

The i.MX GPT timer driver binding doc is out of date,
update it according to current GPT timer driver.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 .../devicetree/bindings/timer/fsl,imxgpt.txt  | 39 ++++++++++++++++---
 1 file changed, 33 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/timer/fsl,imxgpt.txt b/Documentation/devicetree/bindings/timer/fsl,imxgpt.txt
index 9809b11f7180..5d8fd5b52598 100644
--- a/Documentation/devicetree/bindings/timer/fsl,imxgpt.txt
+++ b/Documentation/devicetree/bindings/timer/fsl,imxgpt.txt
@@ -2,17 +2,44 @@ Freescale i.MX General Purpose Timer (GPT)
 
 Required properties:
 
-- compatible : should be "fsl,<soc>-gpt"
-- reg : Specifies base physical address and size of the registers.
-- interrupts : A list of 4 interrupts; one per timer channel.
-- clocks : The clocks provided by the SoC to drive the timer.
+- compatible : should be one of following:
+  for i.MX1:
+  - "fsl,imx1-gpt";
+  for i.MX21:
+  - "fsl,imx21-gpt";
+  for i.MX27:
+  - "fsl,imx27-gpt", "fsl,imx21-gpt";
+  for i.MX31:
+  - "fsl,imx31-gpt";
+  for i.MX25:
+  - "fsl,imx25-gpt", "fsl,imx31-gpt";
+  for i.MX50:
+  - "fsl,imx50-gpt", "fsl,imx31-gpt";
+  for i.MX51:
+  - "fsl,imx51-gpt", "fsl,imx31-gpt";
+  for i.MX53:
+  - "fsl,imx53-gpt", "fsl,imx31-gpt";
+  for i.MX6Q:
+  - "fsl,imx6q-gpt", "fsl,imx31-gpt";
+  for i.MX6DL:
+  - "fsl,imx6dl-gpt";
+  for i.MX6SL:
+  - "fsl,imx6sl-gpt", "fsl,imx6dl-gpt";
+  for i.MX6SX:
+  - "fsl,imx6sx-gpt", "fsl,imx6dl-gpt";
+- reg : specifies base physical address and size of the registers.
+- interrupts : should be the gpt interrupt.
+- clocks : the clocks provided by the SoC to drive the timer, must contain
+           an entry for each entry in clock-names.
+- clock-names : must include "ipg" entry first, then "per" entry.
 
 Example:
 
 gpt1: timer@10003000 {
-	compatible = "fsl,imx27-gpt", "fsl,imx1-gpt";
+	compatible = "fsl,imx27-gpt", "fsl,imx21-gpt";
 	reg = <0x10003000 0x1000>;
 	interrupts = <26>;
-	clocks = <&clks 46>, <&clks 61>;
+	clocks = <&clks IMX27_CLK_GPT1_IPG_GATE>,
+		 <&clks IMX27_CLK_PER1_GATE>;
 	clock-names = "ipg", "per";
 };
-- 
2.17.1
