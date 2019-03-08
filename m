From: Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH v6 0/4] Enable wm8524 on i.MX8MQ-EVK
Date: Fri, 8 Mar 2019 12:02:21 +0000
Message-ID: <20190308120141.3698-1-daniel.baluta@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "shawnguo@kernel.org" <shawnguo@kernel.org>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "baruch@tkos.co.il" <baruch@tkos.co.il>, Abel Vesa <abel.vesa@nxp.com>, "kuninori.morimoto.gx@renesas.com" <kuninori.morimoto.gx@renesas.com>, "ccaione@baylibre.com" <ccaione@baylibre.com>, "spencercw@gmail.com" <spencercw@gmail.com>, "S.j. Wang" <shengjiu.wang@nxp.com>, "angus@akkea.ca" <angus@akkea.ca>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Aisheng Dong <aisheng.dong@nxp.com>, "agx@sigxcpu.org" <agx@sigxcpu.org>, "festevam@gmail.com" <festevam@gmail.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.>
List-Id: devicetree@vger.kernel.org

On i.MX8MQ EVK we can start the party using the wm8524 codec
which gets it's data through the SAI2 interface.

In order to make it work this patch series enables the SDMA nodes,
sets the correct pinctrl configuration and uses the simple card
machine driver to put everything together.

Changes since v5:
	- remove clocks and clock-names properties from wm8524
	code node as they are not used.

Changes since v4 (after Fabio's review)
	- removed mclk0 from sai2 node because it is not yet supported
	  by SAI driver
	- s/audio-codec-0/audio-codec
	- squashed patches 4 and 5

Changes since v3:
	- use "arm64: dts: imx8mq-evk" prefix for patches specific to
	  8MQ-EVK
	- squash together patches for setting up SAI (previous 3/5 and
	  4/5)
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
 arch/arm64/boot/dts/freescale/imx8mq-evk.dts  | 46 +++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mq.dtsi     | 37 +++++++++++++++
 3 files changed, 84 insertions(+)

-- 
2.17.1
