From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH] dt-bindings: timer: gpt: update binding doc
Date: Fri, 23 Nov 2018 09:10:09 +0000
Message-ID: <1542963884-20823-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, "tglx@linutronix.de" <tglx@linutronix.de>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

The i.MX GPT timer driver binding doc is out of date,
the "interrupts", "clocks" and "clock-names" do NOT match
current GPT driver implementation, update it and use i.MX6SX
as example.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 .../devicetree/bindings/timer/fsl,imxgpt.txt       | 22 +++++++++++++-----=
----
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/timer/fsl,imxgpt.txt b/Docum=
entation/devicetree/bindings/timer/fsl,imxgpt.txt
index 9809b11..4e9fa16 100644
--- a/Documentation/devicetree/bindings/timer/fsl,imxgpt.txt
+++ b/Documentation/devicetree/bindings/timer/fsl,imxgpt.txt
@@ -2,17 +2,21 @@ Freescale i.MX General Purpose Timer (GPT)
=20
 Required properties:
=20
-- compatible : should be "fsl,<soc>-gpt"
-- reg : Specifies base physical address and size of the registers.
-- interrupts : A list of 4 interrupts; one per timer channel.
-- clocks : The clocks provided by the SoC to drive the timer.
+- compatible : should be "fsl,<soc>-gpt".
+- reg : specifies base physical address and size of the registers.
+- interrupts : should be the clock event device interrupt.
+- clocks : the clocks provided by the SoC to drive the timer, must contain
+           an entry for each entry in clock-names.
+- clock-names : must include an "per" or "osc_per" entry, and "ipg" entry
+                is optional according to SoC design.
=20
 Example:
=20
-gpt1: timer@10003000 {
-	compatible =3D "fsl,imx27-gpt", "fsl,imx1-gpt";
-	reg =3D <0x10003000 0x1000>;
-	interrupts =3D <26>;
-	clocks =3D <&clks 46>, <&clks 61>;
+gpt: gpt@2098000 {
+	compatible =3D "fsl,imx6sx-gpt", "fsl,imx31-gpt";
+	reg =3D <0x02098000 0x4000>;
+	interrupts =3D <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>;
+	clocks =3D <&clks IMX6SX_CLK_GPT_BUS>,
+		 <&clks IMX6SX_CLK_GPT_3M>;
 	clock-names =3D "ipg", "per";
 };
--=20
2.7.4
