Return-Path: <SRS0=qRig=FR=linaro.org=linus.walleij@kernel.org>
MIME-Version: 1.0
In-Reply-To: <1518103733.31735.6.camel@pengutronix.de>
References: <20180201174923.7385-1-l.stach@pengutronix.de> <20180205060918.vm3q6ludepvqcuxm@rob-hp-laptop>
 <1517825351.3175.3.camel@pengutronix.de> <CACRpkdanb3XocUpmTaFTh-vsApucX0PzuqRg_fA2ORUFtrVGJA@mail.gmail.com>
 <1517914394.3175.21.camel@pengutronix.de> <CACRpkdbuGOrm=y=yPpsrkckk8+uKGxv6J9WGw9y=yiGcmbqn+w@mail.gmail.com>
 <1517932068.3175.27.camel@pengutronix.de> <CACRpkdYy43E5H=tRAf+YDvAY1RDTJ34nHSmqCXEn9xaknbLKZQ@mail.gmail.com>
 <20180207111156.a7cevrz3dbk2f4fb@pengutronix.de> <CAOMZO5DVoh67DZuwEtKpDaEkU2x1=qz92fiYmf9SQtidTbnhXg@mail.gmail.com>
 <20180208085605.GG31910@dragon> <1518103733.31735.6.camel@pengutronix.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 23 Feb 2018 11:08:23 +0100
Message-ID: <CACRpkdYEQnpRd5T_8NjvUjZmTrsu=DF0jb2KoLK-G4mq4DccWA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: add binding for i.MX8MQ IOMUXC
Content-Type: text/plain; charset="UTF-8"
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, "A . s . Dong" <aisheng.dong@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, Gary Bisson <gary.bisson@boundarydevices.com>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>, Sascha Hauer <kernel@pengutronix.de>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, patchwork-lst@pengutronix.de, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Thu, Feb 8, 2018 at 4:28 PM, Lucas Stach <l.stach@pengutronix.de> wrote:

> So it seems with that we are at a point where the majority vote of
> users/maintainers are in favor of keeping the binding that has served
> us well on MX5/6. Which is right where we started with v1 of the MX8
> patches.
>
> How do we proceed? I would like to send out a respin of those series
> next week. Can we all agree to roll back the pinctrl binding to the
> MX5/6 one? Or are there still major reservations against it? I would
> like to avoid introducing any unnecessary churn.

What we need to see is for i.MX maintainers to agree, e.g.
figure out how to do all stuff in drivers/pinctrl/freescale/*
should be engineered going forward.

(Maybe that filepath and symbols needs to be renamed drivers/pinctrl/imx
by the way, this platform seems to change company more often
than I change my car tyres.)

I'll try to follow up on the resulting patch series.

Yours,
Linus Walleij
