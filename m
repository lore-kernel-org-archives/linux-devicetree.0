From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v3 0/5] Enable wm8524 on i.MX8MQ
Date: Tue, 26 Feb 2019 09:52:11 -0300
Message-ID: <CAOMZO5CpefU56xLaOUq0GRwWP9kcMPyZ2PWM38C9FuU-3k1MJA@mail.gmail.com>
References: <20190226070742.30551-1-daniel.baluta@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190226070742.30551-1-daniel.baluta@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: "shawnguo@kernel.org" <shawnguo@kernel.org>, "S.j. Wang" <shengjiu.wang@nxp.com>, "angus@akkea.ca" <angus@akkea.ca>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, Abel Vesa <abel.vesa@nxp.com>, "ccaione@baylibre.com" <ccaione@baylibre.com>, "baruch@tkos.co.il" <baruch@tkos.co.il>, "agx@sigxcpu.org" <agx@sigxcpu.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>, Aisheng
List-Id: devicetree@vger.kernel.org

Hi Daniel,

On Tue, Feb 26, 2019 at 4:08 AM Daniel Baluta <daniel.baluta@nxp.com> wrote:
>
> On i.MX8MQ we can start the party using the wm8524 codec
> which gets it's data through the SAI2 interface.
>
> In order to make it work this patch series enables the SDMA nodes,
> sets the correct pinctrl configuration and uses the simple card
> machine driver to put everything together.
>
> Changes since v2:
>         - s/QM/MQ after Chris comments
>
> Changes since v1:
>         - added cover letter
>         - remove "fsl,imx8mq-sdma" compatible for sdma.

Why? It is good practice to add the new compatible entry.

In case we find out a need for a fix that only affects imx8mq in the
future we can do that by using the specific compatible and no dts
change will be needed.

>
> Daniel Baluta (5):
>   arm64: dts: imx8mq: Add SDMA nodes
>   arm64: dts: imx8mq: Add SAI2 node
>   arm64: dts: imx8mq: Add SAI pinctrl configuration
>   arm64: dts: imx8mq: Enable SAI2 for wm8524 codec
>   arm64: dts: imx8mq: Enable wm8524 codec

I would suggest making the last three patches as a single one.

Also, please make the Subject as: arm64: dts: imx8mq-evk when a patch
is specific to the imx8mq-evk dts.
