From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v3 0/2] Enable wm8524 codec on i.MX8MM EVK
Date: Sun, 12 May 2019 09:30:00 +0800
Message-ID: <20190512012959.GM15856@dragon>
References: <20190424150350.7963-1-daniel.baluta@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190424150350.7963-1-daniel.baluta@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Baluta <daniel.baluta@nxp.com>, Marco Felsch <m.felsch@pengutronix.de>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, dl-linux-imx <linux-imx@nxp.com>, Aisheng Dong <aisheng.dong@nxp.com>, Anson Huang <anson.huang@nxp.com>, "S.j. Wang" <shengjiu.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Apr 24, 2019 at 03:04:12PM +0000, Daniel Baluta wrote:
> This patch series introduces the SAI nodes on i.MX8MM EVK then
> creates the wm8524 codec node and finally uses simple card machine
> driver to create a sound card.
> 
> Changes since v2:
> 	- place compatible strings one a single lines
> 	- move GPIO pinctrl in a node of its own
> 	- remove codec phandle
> 
> Changes since v1:
>         - use "fsl,imx8mm-sai", "fsl,imx8mq-sai" compatbile strings and
>           remove "fsl,imx6sx-sai" because SAI module on i.MX8M is not
>           compatbile with SAI modules form i.MX6
> 
> Daniel Baluta (2):
>   arm64: dts: imx8mm: Add SAI nodes
>   arm64: dts: imx8mm-evk: Enable audio codec wm8524

Hi Marco,

Are you fine with this version?

Shawn
