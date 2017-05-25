From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH V2 4/5] dt-bindings: pinctrl: add imx7ulp pinctrl binding
 doc
Date: Thu, 25 May 2017 11:16:21 +0800
Message-ID: <20170525031620.GS26102@dragon>
References: <1495177545-23006-1-git-send-email-aisheng.dong@nxp.com>
 <1495177545-23006-5-git-send-email-aisheng.dong@nxp.com>
 <5e78ef100319f229a87e33804384e5b3@agner.ch>
 <DBXPR04MB320A55DE4386DE561A1D4DC80F90@DBXPR04MB320.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <DBXPR04MB320A55DE4386DE561A1D4DC80F90@DBXPR04MB320.eurprd04.prod.outlook.com>
Sender: linux-gpio-owner@vger.kernel.org
To: "A.S. Dong" <aisheng.dong@nxp.com>
Cc: Stefan Agner <stefan@agner.ch>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Andy Duan <fugang.duan@nxp.com>, Jacky Bai <ping.bai@nxp.com>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 23, 2017 at 10:37:27AM +0000, A.S. Dong wrote:
> > > +#ifndef __DTS_IMX7ULP_PINFUNC_H
> > > +#define __DTS_IMX7ULP_PINFUNC_H
> > > +
> > > +/*
> > > + * The pin function ID is a tuple of
> > > + * <mux_conf_reg input_reg mux_mode input_val>  */
> > > +
> > > +#define ULP1_PAD_PTC0__PTC0
> > > 0x0000 0x0000 0x1 0x0
> > 
> > 
> > For consistency with other SoCs, can we add MX7 to the define? E.g.
> > MX7ULP1?
> > 
> 
> ULP1 is another SoC name of IMX7ULP.
> And there will be ULP0, ULPx in the future..

What is the external/formal SoC name for ULP0 and ULPx?

> 
> It looks like not big issue, so I did not change it.

It's an easy change to make things more obvious, so +1 on Stefan's
opinion.

Shawn
