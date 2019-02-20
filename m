From: Aisheng Dong <aisheng.dong@nxp.com>
Subject: [PATCH V4 0/4] irq: imx-irqsteer: add 32 interrupts chan and multi
 outputs support
Date: Wed, 20 Feb 2019 11:40:36 +0000
Message-ID: <1550662447-8565-1-git-send-email-aisheng.dong@nxp.com>
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

Change Log:
v3->v4:
 * no code changes except adding more commit message for Patch 1

Dong Aisheng (4):
  dt-binding: irq: imx-irqsteer: use irq number instead of group number
  dt-bindings: irq: imx-irqsteer: add multi output interrupts support
  irq: imx-irqsteer: change to use reg_num instead of irq_group
  irq: imx: irqsteer: add multi output interrupts support

 .../bindings/interrupt-controller/fsl,irqsteer.txt |  11 +-
 drivers/irqchip/irq-imx-irqsteer.c                 | 115 +++++++++++++++--=
----
 2 files changed, 89 insertions(+), 37 deletions(-)

--=20
2.7.4
