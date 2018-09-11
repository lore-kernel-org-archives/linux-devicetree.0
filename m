MIME-Version: 1.0
Date: Tue, 11 Sep 2018 11:01:48 -0500
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
	<CAL_JsqJ84FW8a8eaHPsJAM9R3tYVzOJxp7=Fq+xWzBPVV03fhg@mail.gmail.com>
	<TY1PR01MB15621F2C9CC30B20BF5E09A18A050@TY1PR01MB1562.jpnprd01.prod.outlook.com>
In-Reply-To: <TY1PR01MB15621F2C9CC30B20BF5E09A18A050@TY1PR01MB1562.jpnprd01.prod.outlook.com>
Message-ID: <CAL_JsqJorfOhuwiRk9vbfZ_6B8s-EM7k+RTJmC4La76NzY5tuw@mail.gmail.com>
Subject: Re: [PATCH 1/2] clocksource/drivers/ostm: Delay driver registration
From: Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Thomas Gleixner <tglx@linutronix.de>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, "open list:MEDIA DRIVERS FOR RENESAS - FCP" <linux-renesas-soc@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms+renesas@verge.net.au>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Arnd Bergmann <arnd.bergmann@linaro.org>, Mark Brown <broonie@linaro.org>
List-ID: <devicetree@vger.kernel.org>

On Mon, Sep 10, 2018 at 12:20 PM Chris Brandt <Chris.Brandt@renesas.com> wrote:
>
> On Monday, September 10, 2018, Rob Herring wrote:
> > > The current OSTM driver uses TIMER_OF_DECLARE and that basically means
> > > it will never work with my new SoC.
> > >
> > > For now, can I change the driver to register a standard platform driver
> > > in subsys_initcall like the other Renesas timer drivers?
> >
> > I'm confused how this can even work as an initcall. The whole reason
> > *_OF_DECLARE exists is for things that have to be setup before
> > initcalls.
>
> I wrote a long explanation of the issue, but the summary is:
>
> The timer (which is currently using TIMER_OF_DECLARE) can't start up
> until the clocks are set up because of_clk_get fails().
>
> But, the clock driver is a platform driver that is not started until
> subsys_initcall.
>
> So, unless you have a clock driver with CLK_OF_DECLARE, you can't use
> a timer driver with a TIMER_OF_DECLARE driver.
>
> And, there is no such thing as a deferred probe for timer drivers
> declared with IMER_OF_DECLARE.

Yes, I read the thread and understand all of this part.

Well before we get to initcalls, the kernel calls the arch specific
time_init() which (on ARM) calls of_clk_init (for all the reasons
above) and then timer_probe(). When timer_probe returns, it is
expected that you have setup a clocksource and clockevent. If you
haven't, then at some point before we get to initcalls we should hang
because we're not getting any timer interrupts and time is not
advancing. At least that's how it used to be and maybe something has
changed (It's been a while since I've looked at this area). Maybe you
just get lucky and it works as long as no thread blocks (e.g. on a
msleep). If things changed and you can setup a timer in an initcall,
then why are folks still trying to do things like early platform
drivers. Regular drivers would work and we should be able to
completely remove CLK_OF_DECLARE and TIMER_OF_DECLARE.

Rob
