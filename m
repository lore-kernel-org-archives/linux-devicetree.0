From: Daniel Baluta <daniel.baluta@nxp.com>
Subject: [RESEND PATCH v3 0/2] Enable wm8524 codec on i.MX8MM EVK
Date: Wed, 15 May 2019 14:42:27 +0000
Message-ID: <20190515144210.25596-1-daniel.baluta@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Content-ID: <2C46ACD4F00E9A4DB116E9692A0D211A@eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "shawnguo@kernel.org" <shawnguo@kernel.org>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, dl-linux-imx <linux-imx@nxp.com>, Aisheng Dong <aisheng.dong@nxp.com>, Anson Huang <anson.huang@nxp.com>, "S.j. Wang" <shengjiu.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "m.felsch@pengutronix.de" <m.felsch@pengutronix.de>, Daniel Baluta <daniel.baluta@nxp.com>
List-Id: devicetree@vger.kernel.org

This patch series introduces the SAI nodes on i.MX8MM EVK then
creates the wm8524 codec node and finally uses simple card machine
driver to create a sound card.

Changes since v2:
       - place compatible strings one a single lines
       - move GPIO pinctrl in a node of its own
       - remove codec phandle

Changes since v1:
        - use "fsl,imx8mm-sai", "fsl,imx8mq-sai" compatbile strings and
          remove "fsl,imx6sx-sai" because SAI module on i.MX8M is not
          compatbile with SAI modules form i.MX6

RESEND to fix email encoding.

Daniel Baluta (2):
  arm64: dts: imx8mm: Add SAI nodes
  arm64: dts: imx8mm-evk: Enable audio codec wm8524

 arch/arm64/boot/dts/freescale/imx8mm-evk.dts | 55 ++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mm.dtsi    | 66 ++++++++++++++++++++
 2 files changed, 121 insertions(+)

--=20
2.17.1
