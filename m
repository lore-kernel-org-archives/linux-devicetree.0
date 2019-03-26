From: Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH 0/2] Add EDMA0/EDMA1 nodes
Date: Tue, 26 Mar 2019 09:42:59 +0000
Message-ID: <20190326094239.5910-1-daniel.baluta@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "shawnguo@kernel.org" <shawnguo@kernel.org>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, dl-linux-imx <linux-imx@nxp.com>, Aisheng Dong <aisheng.dong@nxp.com>, Peng Fan <peng.fan@nxp.com>, Anson Huang <anson.huang@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "S.j. Wang" <shengjiu.wang@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Teo Hall <teo.hall@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>
List-Id: devicetree@vger.kernel.org

First patch documents the fsl,imx8qm-edma string while the second
adds the two EDMA nodes used by Audio peripherals.

Daniel Baluta (2):
  bindings: fsl-edma: Document fsl,imx8qm-edma compatbile string
  arm64: dts: imx8qxp: Add EDMA0/EDMA1 nodes

 .../devicetree/bindings/dma/fsl-edma.txt      |  1 +
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi    | 72 +++++++++++++++++++
 2 files changed, 73 insertions(+)

--=20
2.17.1
