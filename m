From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3] dt-bindings: imx: Add pinctrl binding doc for i.MX8MN
Date: Fri, 7 Jun 2019 23:04:25 +0200
Message-ID: <CACRpkdY-35o378Ka+4bgeSPjmq6P8DM872sgTxq2X3dDP9XZHQ@mail.gmail.com>
References: <20190530030546.9224-1-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190530030546.9224-1-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <Anson.Huang@nxp.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Stefan Agner <stefan@agner.ch>, Sascha Hauer <kernel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Sascha Hauer <s.hauer@pengutronix.de>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Olof Johansson <olof@lixom.net>, Simon Horman <horms+renesas@verge.net.au>, Jagan Teki <jagan@amarulasolutions.com>, Leonard Crestez <leonard.crestez@nxp.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Dinh Nguyen <dinguyen@kernel.org>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kerne>
List-Id: devicetree@vger.kernel.org

On Thu, May 30, 2019 at 5:04 AM <Anson.Huang@nxp.com> wrote:

> From: Anson Huang <Anson.Huang@nxp.com>
>
> Add binding doc for i.MX8MN pinctrl driver.
>
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Looks mostly OK to me, but I'd like the maintainers to review,
so Dong et al please look at this!

> +Required properties:
> +- compatible: "fsl,imx8mn-iomuxc"

So should this not be "nxp,imx8mn-iomuxc"
or "nxp,freescale-imx8mn-iomuxc" or something these
days? The vendor name is nxp is it not.

I was complaining to the DT maintainers at one point that
these companies seem to buy each other left and right
so this vendor nomenclature is dubious, but I guess at least
it should reflect the vendor that produced the chip or something.

If everyone is happy with "fsl,*" I will not complain though.
(i.e. if the maintainers ACK it.)

Yours,
Linus Walleij
