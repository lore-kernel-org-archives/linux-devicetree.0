From: jacopo mondi <jacopo@jmondi.org>
Subject: Re: [PATCH 1/2] pinctrl: rza1: add support for RZ/A1L
Date: Tue, 3 Oct 2017 17:04:12 +0200
Message-ID: <20171003150412.GI4037@w540>
References: <20171003073334.18917-1-chris.brandt@renesas.com>
 <20171003073334.18917-2-chris.brandt@renesas.com>
 <20171003083148.GG4037@w540>
 <SG2PR06MB1165EE1D21AFC1D3005308538A720@SG2PR06MB1165.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <SG2PR06MB1165EE1D21AFC1D3005308538A720@SG2PR06MB1165.apcprd06.prod.outlook.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms+renesas@verge.net.au>, Jacopo Mondi <jacopo+renesas@jmondi.org>
List-Id: devicetree@vger.kernel.org

Hi Chris,

On Tue, Oct 03, 2017 at 01:36:57PM +0000, Chris Brandt wrote:
> Hi Jacopo,
>
> On Tuesday, October 03, 2017, jacopo mondi wrote:
> > Do you have other authoritative sources for pin's bidir settings?
> > According to the publicly available manual, there are other pins that
> > needs bidir not listed here.
> > As the same happened with RZ/A1H I'm not too concerned, but I'm
> > listing some of there here nonetheless
>
> Back when you were working on this, I discussed with the guys back in
> Japan. While in the table there are multiple pins that show
> 'bi-directional capable', they don't all need the bi-dir bit set. This was the list of
> peripheral:
>  I2C, MDIO (ETH), MMC, SDHI, QSPI, Data (D0-D31)

Oh, I just received the list of pin in txt format iirc and didn't
noted down which peripherals where actually bi-dir

>
>
> > P2 has several TIOC pins in mode 4 and SSI in mode 2
>
> Port 2???
> Port 2, mode 4 in the RZ/A1L manual only has IRQ7,6,5,2,1

That was mode #3, sorry about this.
>
>
> I thought we decided on that TIOC pins are ones that are manually set to
> either input (input-enable, output-enable) by the users Device Tree, so
> they don't need to be put into a table. If input-enable or
> output-enable is specified, then you manually set it to that direction.
>

Correct

> As for SSI, the manual says only the SSITx pins need bi-dir, not the
> SSIRx pins.

Looking at RZ/A1H tables you're right. I wonder why in RZ/A1L SSI pins
are listed as bidir and in RZ/A1H they're not.
>
>
> > TIOC in mode3, SKC3 and SCK1 in mode 5
> > > +
> > > +static const struct rza1_bidir_pin rza1l_bidir_pins_p4[] = {
> > > +	{ .pin = 1, .func = 4 },
> > > +	{ .pin = 2, .func = 2 },
> > > +	{ .pin = 3, .func = 2 },
> > > +	{ .pin = 6, .func = 2 },
> > > +	{ .pin = 7, .func = 2 },
> > > +};
> >
> > Confused, you're here listing TIOC2B pin (pin 1 mode #4) but not TIOC1B
> > (pin 0 mode #4)
> > ET_MDIO in mode 4, which we list as bidir in RZ/A1H
>
> P4_1 mode 4 is ET_MDIO.

And I keep counting modes from 0...

>
> TIOC1B is P4_0 mode 3.
> TIOC2B is P4_1 Mode 3

So it's fine to leave TIOC out from this table.

>
> Are you looking at Table 41.19 in the Rev.3.00 version of the RZ/A1L
> Hardware Manual?
>
> > > +static const struct rza1_swio_pin rza1l_swio_pins[] = {
> > > +	{ .port = 2, .pin = 8, .func = 2, .input = 0 },
> > > +	{ .port = 5, .pin = 6, .func = 3, .input = 0 },
> > > +	{ .port = 6, .pin = 6, .func = 3, .input = 0 },
> > > +	{ .port = 6, .pin = 10, .func = 3, .input = 0 },
> > > +	{ .port = 7, .pin = 10, .func = 2, .input = 0 },
> > > +	{ .port = 8, .pin = 2, .func = 3, .input = 0 },
> > > +};
> >
> > I count 20 SWIO pins
> >
> > TIOC[0-4][A-D]
> > SSITx[0-3]
> > WDTOVF
>
> I thought we said TIOC didn't need to be in a table because the user has
> to specify them anyway because the user has to choose if he wants them
> as input or output, so if he does that, then we automatically know it's
> a swio pin. Hmm, maybe I have to go back and look at what the driver
> ended up implementing.
>

Can confirm TIOC pins are not listed in SWIO table in RZ/A1H.

Thanks for double checking. Your source from Japan is more
authoritative than manuals and defintely more accurate than me ;)

Thanks
   j

>
> Chris
