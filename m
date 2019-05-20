From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: watchdog: add Allwinner H6 watchdog
Date: Mon, 20 May 2019 17:16:25 +0200
Message-ID: <CAJiuCccUQ0grMo_RC4DN1AfzSPQq14KjUbNpFFvfQ+GBWDvG+w@mail.gmail.com>
References: <20190518152355.11134-1-peron.clem@gmail.com> <20190518152355.11134-2-peron.clem@gmail.com>
 <20190520073529.nxptfbibexrqyzfi@flea> <CAJiuCcdrW7RcEKePCr1DaL-be8dA5oOjvHdxYkiu=h37z2e7tw@mail.gmail.com>
 <20190520144258.eauhvvwfxuhiczie@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190520144258.eauhvvwfxuhiczie@flea>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Chen-Yu Tsai <wens@csie.org>, linux-watchdog@vger.kernel.org, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, 20 May 2019 at 16:43, Maxime Ripard <maxime.ripard@bootlin.com> wro=
te:
>
> On Mon, May 20, 2019 at 10:14:10AM +0200, Cl=C3=A9ment P=C3=A9ron wrote:
> > >
> > > > +     - "allwinner,sun4i-a10-wdt"
> > > > +     - "allwinner,sun50i-a64-wdt","allwinner,sun6i-a31-wdt"
> > > > +     - "allwinner,sun50i-h6-wdt","allwinner,sun50i-a64-wdt",
> > > > +       "allwinner,sun6i-a31-wdt"
> > >
> > > Is there a reason to keep the A64 compatible?
> >
> > Yes, A64 and H6 has the exact same memory mapping looking at the datash=
eet.
> > So if there is an errata or a new feature for the A64, it should be
> > also compatible with the H6.
> > Which is not the case with A31 (WDT_KEY_FIELD is not preset)
>
> The thing is, if you use those three compatibles, then you're saying
> that it's ok for the OS to use first the H6 driver, then the A64
> driver, and then the A31 driver.
>
> If the A31 isn't compatible, then it shouldn't be listed there. And if
> it is, then you can skip the A64 compatible.

Hi Maxime,

I'm just supposing that A31 is the version 1.0 of the IP, A64 is the
version 1.1 and H6 is 1.2.
And if an issue is found for A64 there is more chance that we will
have to fix it also for H6.
But bindings the driver with :
"allwinner,sun50i-h6-wdt","allwinner,sun50i-a31-wdt" is also fine for
me.

Regards,
Clement
>
> Maxime
>
> --
> Maxime Ripard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
