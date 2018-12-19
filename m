From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH V3] dt-bindings: timer: gpt: update binding doc
Date: Wed, 19 Dec 2018 07:09:10 +0000
Message-ID: <1545203073-10659-1-git-send-email-Anson.Huang@nxp.com>
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
update it according to current GPT timer driver.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 .../devicetree/bindings/timer/fsl,imxgpt.txt       | 35 ++++++++++++++++++=
----
 1 file changed, 29 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/timer/fsl,imxgpt.txt b/Docum=
entation/devicetree/bindings/timer/fsl,imxgpt.txt
index 9809b11..a7f23a6 100644
--- a/Documentation/devicetree/bindings/timer/fsl,imxgpt.txt
+++ b/Documentation/devicetree/bindings/timer/fsl,imxgpt.txt
@@ -2,17 +2,40 @@ Freescale i.MX General Purpose Timer (GPT)
=20
 Required properties:
=20
-- compatible : should be "fsl,<soc>-gpt"
-- reg : Specifies base physical address and size of the registers.
-- interrupts : A list of 4 interrupts; one per timer channel.
-- clocks : The clocks provided by the SoC to drive the timer.
+- compatible : should be one of following:
+
+  should be "fsl,imx1-gpt" for i.MX1;
+
+  should be one of following for i.MX21/i.MX27:
+  - "fsl,imx21-gpt",
+  - "fsl,imx27-gpt",
+
+  should be one of following for i.MX31/i.MX25/i.MX50/i.MX51/i.MX53/i.MX6Q=
:
+  - "fsl,imx31-gpt",
+  - "fsl,imx25-gpt",
+  - "fsl,imx50-gpt",
+  - "fsl,imx51-gpt",
+  - "fsl,imx53-gpt",
+  - "fsl,imx6q-gpt",
+
+  should be one of following for i.MX6DL/i.MX6SL/i.MX6SX:
+  - "fsl,imx6dl-gpt",
+  - "fsl,imx6sl-gpt",
+  - "fsl,imx6sx-gpt".
+
+- reg : specifies base physical address and size of the registers.
+- interrupts : should be the gpt interrupt.
+- clocks : the clocks provided by the SoC to drive the timer, must contain
+           an entry for each entry in clock-names.
+- clock-names : must include "ipg" entry first, then "per" entry.
=20
 Example:
=20
 gpt1: timer@10003000 {
-	compatible =3D "fsl,imx27-gpt", "fsl,imx1-gpt";
+	compatible =3D "fsl,imx27-gpt", "fsl,imx21-gpt";
 	reg =3D <0x10003000 0x1000>;
 	interrupts =3D <26>;
-	clocks =3D <&clks 46>, <&clks 61>;
+	clocks =3D <&clks IMX27_CLK_GPT1_IPG_GATE>,
+		 <&clks IMX27_CLK_PER1_GATE>;
 	clock-names =3D "ipg", "per";
 };
--=20
2.7.4
