MIME-Version: 1.0
Date: Mon, 10 Sep 2018 08:48:05 -0500
References: <20180829132954.64862-1-chris.brandt@renesas.com>
	<20180829132954.64862-2-chris.brandt@renesas.com>
	<1ff04fa1-ee3b-6095-bcd8-f16dbb99b57a@linaro.org>
	<TY1PR01MB156202DC354E70F1C8C5B18A8A090@TY1PR01MB1562.jpnprd01.prod.outlook.com>
	<c16b82c0-e675-8f86-19e6-75cb5995813b@linaro.org>
	<CAMuHMdX9nXYan-m14k6h7OU1UCGW_irDLvMMi==dnM0cdUR_nA@mail.gmail.com>
	<c4bd550f-5319-9d92-a30a-1d12fc9bbcab@linaro.org>
	<CAMuHMdUs-YNQk1wmbqQvz_n9xq04=gkyL1uBJdg9ExA9Lmg5uw@mail.gmail.com>
	<a160b76b-8dca-81e8-e958-d8b92bdc8928@linaro.org>
	<CAMuHMdV3Ai+CLHBJ_GH9d=JN0cmiaQT3eSfNGRgiiMffgK7stg@mail.gmail.com>
	<ba334f02-ac37-0908-ec0c-da8a6459fab4@linaro.org>
	<TYXPR01MB1568B71126AB4A2BDB78BF1F8A000@TYXPR01MB1568.jpnprd01.prod.outlook.com>
In-Reply-To: <TYXPR01MB1568B71126AB4A2BDB78BF1F8A000@TYXPR01MB1568.jpnprd01.prod.outlook.com>
Message-ID: <CAL_JsqJ84FW8a8eaHPsJAM9R3tYVzOJxp7=Fq+xWzBPVV03fhg@mail.gmail.com>
Subject: Re: [PATCH 1/2] clocksource/drivers/ostm: Delay driver registration
From: Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Thomas Gleixner <tglx@linutronix.de>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, "open list:MEDIA DRIVERS FOR RENESAS - FCP" <linux-renesas-soc@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms+renesas@verge.net.au>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Arnd Bergmann <arnd.bergmann@linaro.org>, Mark Brown <broonie@linaro.org>
List-ID: <devicetree@vger.kernel.org>

On Fri, Sep 7, 2018 at 10:16 AM Chris Brandt <Chris.Brandt@renesas.com> wrote:
>
> On Thursday, August 30, 2018, Daniel Lezcano wrote:
> > > AFAIK no attempt was done to support EPROBE_DEFER with *_OF_DECLARE.
> > > IMHO it would be pointless, as it would be much easier to just switch to
> > real
> > > platform drivers.
> >
> > May be, may be not.
> >
> > From your point of view, the change is simple because it touches only a
> > single driver.
> >
> > From my point of view, the change implies a split in the approach while
> > I'm trying to unify the drivers little by little and there are hundred
> > of them.
> >
> > It is not the first time we face this situation and Bartosz Golaszewski
> > has a similar problem [1].
> >
> > We have all the frameworks we need to solve this properly but I would
> > like something we can propagate to all drivers (OF and !OF) so we end up
> > with unified code.
> >
> > It is time we clearly state the dependency issues and we find a proper
> > way to solve it.
>
>
> On Thursday, August 30, 2018, Bartosz Golaszewski wrote:
> > This was my latest proposal for early platform drivers:
> >
> >     https://lkml.org/lkml/2018/5/11/488
> >
> > I still intend on continuing this work, I just don't have the time right
> > now.
>
> Daniel,
>
> So what is your final thought on this?
>
> The current OSTM driver uses TIMER_OF_DECLARE and that basically means
> it will never work with my new SoC.
>
> For now, can I change the driver to register a standard platform driver
> in subsys_initcall like the other Renesas timer drivers?

I'm confused how this can even work as an initcall. The whole reason
*_OF_DECLARE exists is for things that have to be setup before
initcalls.

Rob
