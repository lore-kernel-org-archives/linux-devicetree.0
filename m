From: Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH v5 0/4] Enable wm8524 on i.MX8MQ-EVK
Date: Fri, 1 Mar 2019 16:36:31 +0000
Message-ID: <20190301163604.10618-1-daniel.baluta@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "shawnguo@kernel.org" <shawnguo@kernel.org>
Cc: "S.j. Wang" <shengjiu.wang@nxp.com>, "angus@akkea.ca" <angus@akkea.ca>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, Abel Vesa <abel.vesa@nxp.com>, "ccaione@baylibre.com" <ccaione@baylibre.com>, "baruch@tkos.co.il" <baruch@tkos.co.il>, "agx@sigxcpu.org" <agx@sigxcpu.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>, Aisheng
List-Id: devicetree@vger.kernel.org

Changes since v4 (after Fabio's review)
	- removed mclk0 from sai2 node because it is not yet supported by SAI driv=
er
	- s/audio-codec-0/audio-codec
	- squashed patches 4 and 5

Changes since v3:
	- use "arm64: dts: imx8mq-evk" prefix for patches specific to 8MQ-EVK
	- squash together patches for setting up SAI (previous 3/5 and 4/5)
	- add back and document "fsl, imx8mq-sdma" compatbile string

Changes since v2:
        - s/QM/MQ after Chris comments

Changes since v1:
        - added cover letter
        - remove "fsl,imx8mq-sdma" compatible for sdma.

Daniel Baluta (4):
  arm64: dts: imx8mq: Add SDMA nodes
  bindings: fsl-imx-sdma: Document fsl,imx8mq-sdma compatbile string
  arm64: dts: imx8mq: Add SAI2 node
  arm64: dts: imx8mq-evk: Enable audio codec wm8952

 .../devicetree/bindings/dma/fsl-imx-sdma.txt  |  1 +
 arch/arm64/boot/dts/freescale/imx8mq-evk.dts  | 48 +++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mq.dtsi     | 37 ++++++++++++++
 3 files changed, 86 insertions(+)

--=20
2.17.1
