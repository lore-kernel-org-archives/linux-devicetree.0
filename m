From: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH v4 6/6] pinctrl: lochnagar: Add support for the Cirrus
 Logic Lochnagar
Date: Thu, 15 Nov 2018 11:53:35 +0000
Message-ID: <20181115115335.GA16508@imbe.wolfsonmicro.main>
References: <20181108101405.14062-1-ckeepax@opensource.cirrus.com>
 <20181108101405.14062-7-ckeepax@opensource.cirrus.com>
 <CACRpkdZCUDsSZA3xAH05ZFuNP8dyHFapX7MJTVnD3A-ts1Y7yA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdZCUDsSZA3xAH05ZFuNP8dyHFapX7MJTVnD3A-ts1Y7yA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Lee Jones <lee.jones@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Liam Girdwood <lgirdwood@gmail.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, patches@opensource.cirrus.com, linux-clk <linux-clk@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 15, 2018 at 11:54:48AM +0100, Linus Walleij wrote:
> On Thu, Nov 8, 2018 at 11:14 AM Charles Keepax
> <ckeepax@opensource.cirrus.com> wrote:
> 
> > Lochnagar is an evaluation and development board for Cirrus
> > Logic Smart CODEC and Amp devices. It allows the connection of
> > most Cirrus Logic devices on mini-cards, as well as allowing
> > connection of various application processor systems to provide a
> > full evaluation platform. This driver supports the board
> > controller chip on the Lochnagar board.
> >
> > Lochnagar provides many pins which can generally be used for an
> > audio function such as an AIF or a PDM interface, but also as
> > GPIOs.
> >
> > Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> 
> This v4 version looks very good to me!
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> 
> Nitpicks (fix or not, my review tag stands):
> 
> >  drivers/pinctrl/cirrus/pinctrl-lochnagar.c | 1145 ++++++++++++++++++++++++++++
> >  drivers/pinctrl/cirrus/pinctrl-lochnagar.h |  112 +++
> 
> Why don't you just include that header file in the C file.
> 112 lines +/- on a 1145 line file doesn't matter.
> 
> > +       priv->gpio_chip = template_chip;
> 
> I would just skip the template and just assign struct members
> directly.
> 
> Bonus if you set ->label to something instance-unique as well.
> 

No objection to any of those need to respin for Mark's comments
on the regulators anyway, so will wrap these in and add your
reviewed by.

Thanks,
Charles
