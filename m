From: jmondi <jacopo@jmondi.org>
Subject: Re: [PATCH v5 01/10] pinctrl: generic: Add bi-directional and
 output-enable
Date: Tue, 9 May 2017 11:55:44 +0200
Message-ID: <20170509095544.GD25206@w540>
References: <CACRpkdayW0qPXDcc_JofkwtX5UHhDPxiY_8deZZ7+hPNJkjgeQ@mail.gmail.com>
 <SG2PR06MB1165E7E651BE96CD7B7738B08A130@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <CAHp75Vcp_eMWrjZRX-x3=Tt3JRXcL_wWG43MymF=oyLLP4EJwg@mail.gmail.com>
 <SG2PR06MB11658EC3A3A80C57E6F539AC8A130@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <CAHp75VeLtOuty=iaxuCaH43rnBZDTT03iH7JyjDJBQhTD-EjzA@mail.gmail.com>
 <CACRpkdZkNGSUvTrEdjbGKO1hr799QpJBGSHPVbsBibph7Jx61A@mail.gmail.com>
 <20170508160120.GB25206@w540>
 <CAHp75VfOMKOhpkec+htA6DRQhivpSmNXy1=Ayig1W+ZC84gTLw@mail.gmail.com>
 <20170508172516.GC25206@w540>
 <CAHp75VeV2MqVSF9hxThyvw8WQM1s+pH2eNMgGtqhw_ihwM5S2w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAHp75VeV2MqVSF9hxThyvw8WQM1s+pH2eNMgGtqhw_ihwM5S2w@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Chris Brandt <Chris.Brandt@renesas.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King - ARM Linux <linux@armlinux.org.uk>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Andy,

On Mon, May 08, 2017 at 08:47:17PM +0300, Andy Shevchenko wrote:
> On Mon, May 8, 2017 at 8:25 PM, jmondi <jacopo@jmondi.org> wrote:
> > Andy,
> >
> > On Mon, May 08, 2017 at 07:08:32PM +0300, Andy Shevchenko wrote:
> >> On Mon, May 8, 2017 at 7:01 PM, jmondi <jacopo@jmondi.org> wrote:
> >> > On Sun, May 07, 2017 at 09:52:49AM +0200, Linus Walleij wrote:
> >> >> On Fri, Apr 28, 2017 at 4:53 PM, Andy Shevchenko
> >> >> <andy.shevchenko@gmail.com> wrote:
> >> >>
> >> >> > Linus, for me it looks like better to revert that change, until we
> >> >> > will have clear picture why existing configuration parameters can't
> >> >> > work.
> >> >>
> >> >> Yeah I'll revert the binding for fixes.
> >>
> >> > As it seems we won't be able to proceed with the currently proposed solution,
> >> > would that be acceptable now that we use the "pinmux" property to add
> >> > flags as BIDIR
> >>
> >> Can you explain what does this *electrically* mean?
> >
> > I really don't know what to add to what Chris said in his 2 previous
> > replies to the same question, and I don't know if I can even get this
> > information as the most detailed drawing I can provide is what you
> > have seen already at page 2696 Fig. 54.1 of the following document.
> >
> > https://www.renesas.com/en-us/doc/products/mpumcu/doc/rz/r01uh0403ej0300_rz_a1h.pdf?key=ccbb2d79446f1cbd015031061140507c
>
> I didn't see before this document. (I had downloaded what Chris
> referred to, which has less than 1200 pages).
>
> The figure you pointed to is really nice and explains it, thank you.

Oh sorry, I thought you had seen this already :)
>
> So, BiDi in this hardware is just helper to enable Input
> simultaneously when you enable output.
>
> This makes me wonder what prevents you to do this in two steps in software?
> So, basically in terms of pin control framework you define this pin
> configuration as
>
> 1. PIN_CONFIG_INPUT_ENABLE:
> 2. PIN_CONFIG_OUTPUT:
>
> (or wise versa)
>

That could be doable, as when we're collecting generic pin
configuration to apply to the pin I can simply check if both of them
are enabled.

That would feel un-natural in dts anyway, for someone that is not that
into the pin controller sub system details.
If I would have to do something like  this, not knowing all the
reasonable pre-conditions we've been discussing about

pins {
    pinmux = < .. >;
    input-enable;
    output-high; /* or output-low, we can ignore the argument here */
}

In place of

pins {
   pinmux = < .. >;
   renesas,bi-directional;
}

And the hardware manual speaks of "bi-directional" everywhere, I would
be wondering what those guys implementing this were thinking :)

> > From my perspective these flags are configurations internal to the pin
> > controller hardware used to enable/disable input buffers when a pin needs to
> > perform in both direction.
>
> > The level of detail I can provide on this is the logical diagram we have pointed
> > you to already.
> >
> > As I assume you are trying to get this answer from us in order to
> > avoid duplicating things in pin controller sub-system, and I
> > understand this, but my question here was "can we have those flags as part
> > of the pinmux property argument list, as that property description
> > seems to allow us to do that, instead of making them generic pin
> > configuration properties and upset other developers?"
>
> I guess Linus is better than me could answer to this.
>
> > Anyway, I still fail to see why those configuration flags, only
> > affecting the way the pin controller hardware enables/disables
> > its internal buffers and its internal operations have to be
> > described in term of their externally visible electrically characteristics.
> >
> >> Second question, what makes it differ to what already exists?
> >
> > To me, what already exists are pin configuration properties generic to
> > the whole pin controller subsystem, and I understand you don't want to
> > see duplication there.
> >
> > At the same time, to me, those flags are settings the pin controller
> > wants to have specified by software to overcome its hw design flaws,
> > and are intended to configure its internal buffers in a way it cannot
> > do by itself for some very specific operation modes (they are listed
> > in the hw reference manual, it's not something you can chose to
> > configure or not, if you want a pin working in i2c mode, you HAVE to
> > pass those flags to pin controller).
>
> So, when you configuring pinmux to use group of pins to be i2c, what
> does prevent you to apply those settings implicitly?
>

Chris already gave some valid reasons why it would be hard to do this
considering the different part numbers this driver may handle, but I
would also like to add that I have counted > 100 cases where
bi-directional flag has to be applied just in the first 5 IO ports (on a
total of 13).

As there are RZ systems out there running with just < 9MB of SRAM,
adding a static table (or several, considering the different part numbers)
with at least 300 entries, is a considerable waste :(

For SWIO it would be easier, there are just 16 cases, all of them
listed in the hardware reference manual as Chris said.

Thanks
   j

> --
> With Best Regards,
> Andy Shevchenko
