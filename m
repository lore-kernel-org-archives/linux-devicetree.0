From: Aisheng Dong <aisheng.dong@nxp.com>
Subject: [PATCH 0/4] irq: imx-irqsteer: add 32 interrupts chan and multi
 outputs support
Date: Fri, 18 Jan 2019 07:53:39 +0000
Message-ID: <1547797668-30342-1-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>, Aisheng Dong <aisheng.dong@nxp.com>
List-Id: devicetree@vger.kernel.org

Not all 64 interrupts may be used in one group. e.g. most irqsteer in
imx8qxp and imx8qm subsystems supports only 32 interrupts.
And one irqsteer channel can support up to 8 output interrupts.

This patch series aims to support 32 interrupts chan and multi output
interrupts.

Tested on:
iMX8QXP MEK with MIPI CSI capture and DC Display
iMX8MQ EVK with MIPI DSI Display

Dong Aisheng (4):
  dt-binding: irq: imx-irqsteer: use irq number per channel instead of
    group number
  dt-bindings: irq: imx-irqsteer: add multi output interrupts support
  irq: imx-irqsteer: change to use reg_num instead of irq_group
  irq: imx: irqsteer: add multi output interrupts support

 .../bindings/interrupt-controller/fsl,irqsteer.txt | 11 ++--
 drivers/irqchip/irq-imx-irqsteer.c                 | 74 ++++++++++++++----=
----
 2 files changed, 53 insertions(+), 32 deletions(-)

--=20
2.7.4
