From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: watchdog: add Allwinner H6 watchdog
Date: Mon, 20 May 2019 10:14:10 +0200
Message-ID: <CAJiuCcdrW7RcEKePCr1DaL-be8dA5oOjvHdxYkiu=h37z2e7tw@mail.gmail.com>
References: <20190518152355.11134-1-peron.clem@gmail.com> <20190518152355.11134-2-peron.clem@gmail.com>
 <20190520073529.nxptfbibexrqyzfi@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190520073529.nxptfbibexrqyzfi@flea>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Chen-Yu Tsai <wens@csie.org>, linux-watchdog@vger.kernel.org, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Maxime,

On Mon, 20 May 2019 at 09:35, Maxime Ripard <maxime.ripard@bootlin.com> wro=
te:
>
> On Sat, May 18, 2019 at 05:23:52PM +0200, Cl=C3=A9ment P=C3=A9ron wrote:
> > Allwinner H6 has a similar watchdog as the A64 which is already
> > a compatible of the A31.
> >
> > This commit sort the lines and add the H6 compatible.
> >
> > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> > ---
> >  .../devicetree/bindings/watchdog/sunxi-wdt.txt         | 10 ++++++----
> >  1 file changed, 6 insertions(+), 4 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/watchdog/sunxi-wdt.txt b=
/Documentation/devicetree/bindings/watchdog/sunxi-wdt.txt
> > index 46055254e8dd..f4810f8ad1c5 100644
> > --- a/Documentation/devicetree/bindings/watchdog/sunxi-wdt.txt
> > +++ b/Documentation/devicetree/bindings/watchdog/sunxi-wdt.txt
> > @@ -3,10 +3,12 @@ Allwinner SoCs Watchdog timer
> >  Required properties:
> >
> >  - compatible : should be one of
> > -     "allwinner,sun4i-a10-wdt"
> > -     "allwinner,sun6i-a31-wdt"
> > -     "allwinner,sun50i-a64-wdt","allwinner,sun6i-a31-wdt"
> > -     "allwinner,suniv-f1c100s-wdt", "allwinner,sun4i-a10-wdt"
>
> That sorting was kind of intentional
Arg indeed, I will remove it.


>
> > +     - "allwinner,sun4i-a10-wdt"
> > +     - "allwinner,sun50i-a64-wdt","allwinner,sun6i-a31-wdt"
> > +     - "allwinner,sun50i-h6-wdt","allwinner,sun50i-a64-wdt",
> > +       "allwinner,sun6i-a31-wdt"
>
> Is there a reason to keep the A64 compatible?
Yes, A64 and H6 has the exact same memory mapping looking at the datasheet.
So if there is an errata or a new feature for the A64, it should be
also compatible with the H6.
Which is not the case with A31 (WDT_KEY_FIELD is not preset)

Thanks,
Clement

>
> Thanks,
> Maxime
>
> --
> Maxime Ripard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
