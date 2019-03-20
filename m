From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v7 0/4] Enable wm8524 on i.MX8MQ-EVK
Date: Wed, 20 Mar 2019 15:55:53 +0800
Message-ID: <20190320075552.GB4980@dragon>
References: <20190319174823.29467-1-daniel.baluta@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190319174823.29467-1-daniel.baluta@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: "S.j. Wang" <shengjiu.wang@nxp.com>, "angus@akkea.ca" <angus@akkea.ca>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, "ccaione@baylibre.com" <ccaione@baylibre.com>, "baruch@tkos.co.il" <baruch@tkos.co.il>, "agx@sigxcpu.org" <agx@sigxcpu.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>, Aisheng Dong <aisheng.dong@nxp.com>, kunin
List-Id: devicetree@vger.kernel.org

On Tue, Mar 19, 2019 at 05:48:35PM +0000, Daniel Baluta wrote:
> On i.MX8MQ EVK we can start the party using the wm8524 codec
> which gets it's data through the SAI2 interface.
> 
> In order to make it work this patch series enables the SDMA nodes,
> sets the correct pinctrl configuration and uses the simple card
> machine driver to put everything together.
> 
> Changes since v6: (after Shawn's comments)
> 	- rebased on latest Shawn's for-next branch
> 	- added new lines between properties and child nodes
> 	- added new lines between child nodes
> 	- keep pinctrl nodes sorted
> 	- added reviewed by after SoBs in commit message
> 
> Changes since v5:
>         - remove clocks and clock-names properties from wm8524
>         code node as they are not used.
> 
> Changes since v4 (after Fabio's review)
>         - removed mclk0 from sai2 node because it is not yet supported
>           by SAI driver
>         - s/audio-codec-0/audio-codec
>         - squashed patches 4 and 5
> 
> Changes since v3:
>         - use "arm64: dts: imx8mq-evk" prefix for patches specific to
>           8MQ-EVK
>         - squash together patches for setting up SAI (previous 3/5 and
>           4/5)
>         - add back and document "fsl, imx8mq-sdma" compatbile string
> 
> Changes since v2:
>         - s/QM/MQ after Chris comments
> 
> Changes since v1:
>         - added cover letter
>         - remove "fsl,imx8mq-sdma" compatible for sdma.
> 
> Daniel Baluta (4):
>   arm64: dts: imx8mq: Add SDMA nodes
>   bindings: fsl-imx-sdma: Document fsl,imx8mq-sdma compatbile string
>   arm64: dts: imx8mq: Add SAI2 node
>   arm64: dts: imx8mq-evk: Enable audio codec wm8524

Applied all, thanks.
