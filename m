From: Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH v3 0/5] Enable wm8524 on i.MX8MQ
Date: Tue, 26 Feb 2019 07:08:11 +0000
Message-ID: <20190226070742.30551-1-daniel.baluta@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "shawnguo@kernel.org" <shawnguo@kernel.org>
Cc: "S.j. Wang" <shengjiu.wang@nxp.com>, "angus@akkea.ca" <angus@akkea.ca>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, Abel Vesa <abel.vesa@nxp.com>, "ccaione@baylibre.com" <ccaione@baylibre.com>, "baruch@tkos.co.il" <baruch@tkos.co.il>, "agx@sigxcpu.org" <agx@sigxcpu.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>, Aisheng
List-Id: devicetree@vger.kernel.org

On i.MX8MQ we can start the party using the wm8524 codec
which gets it's data through the SAI2 interface.

In order to make it work this patch series enables the SDMA nodes,
sets the correct pinctrl configuration and uses the simple card
machine driver to put everything together.

Changes since v2:
	- s/QM/MQ after Chris comments

Changes since v1:
	- added cover letter
	- remove "fsl,imx8mq-sdma" compatible for sdma.

Daniel Baluta (5):
  arm64: dts: imx8mq: Add SDMA nodes
  arm64: dts: imx8mq: Add SAI2 node
  arm64: dts: imx8mq: Add SAI pinctrl configuration
  arm64: dts: imx8mq: Enable SAI2 for wm8524 codec
  arm64: dts: imx8mq: Enable wm8524 codec

 arch/arm64/boot/dts/freescale/imx8mq-evk.dts | 48 ++++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mq.dtsi    | 38 ++++++++++++++++
 2 files changed, 86 insertions(+)

--=20
2.17.1
