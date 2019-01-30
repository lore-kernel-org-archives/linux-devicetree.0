From: Aisheng Dong <aisheng.dong@nxp.com>
Subject: [PATCH V2 1/4] dt-binding: irq: imx-irqsteer: use irq number instead
 of group number
Date: Wed, 30 Jan 2019 13:05:55 +0000
Message-ID: <1548853196-11447-2-git-send-email-aisheng.dong@nxp.com>
References: <1548853196-11447-1-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548853196-11447-1-git-send-email-aisheng.dong@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>, Aisheng Dong <aisheng.dong@nxp.com>, Marc Zyngier <marc.zyngier@arm.com>
List-Id: devicetree@vger.kernel.org

Not all 64 interrupts may be used in one group. e.g. most irqsteer in
imx8qxp and imx8qm subsystems supports only 32 interrupts.

As the IP integration parameters are Channel number and interrupts number,
let's use fsl,num-irqs to represents how many interrupts supported
by this irqsteer channel.

Cc: Marc Zyngier <marc.zyngier@arm.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
ChangeLog:
 v1->v2:
  * change property name fsl,irqs-per-chan to fsl,num-irqs.
---
 .../devicetree/bindings/interrupt-controller/fsl,irqsteer.txt       | 6 ++=
+---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/fsl,irq=
steer.txt b/Documentation/devicetree/bindings/interrupt-controller/fsl,irqs=
teer.txt
index 45790ce..6d0a41b 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/fsl,irqsteer.t=
xt
+++ b/Documentation/devicetree/bindings/interrupt-controller/fsl,irqsteer.t=
xt
@@ -16,8 +16,8 @@ Required properties:
 - #interrupt-cells: Specifies the number of cells needed to encode an
   interrupt source. The value must be 1.
 - fsl,channel: The output channel that all input IRQs should be steered in=
to.
-- fsl,irq-groups: Number of IRQ groups managed by this controller instance=
.
-  Each group manages 64 input interrupts.
+- fsl,num-irqs: Number of input interrupts of this channel.
+  Should be multiple of 32 input interrupts and up to 512 interrupts.
=20
 Example:
=20
@@ -28,7 +28,7 @@ Example:
 		clocks =3D <&clk IMX8MQ_CLK_DISP_APB_ROOT>;
 		clock-names =3D "ipg";
 		fsl,channel =3D <0>;
-		fsl,irq-groups =3D <1>;
+		fsl,num-irqs =3D <64>;
 		interrupt-controller;
 		#interrupt-cells =3D <1>;
 	};
--=20
2.7.4
