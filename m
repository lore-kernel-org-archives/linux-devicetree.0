From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v2 04/12] ARM: davinci: WARN_ON() if clk_get() fails
Date: Tue, 26 Feb 2019 13:08:59 +0100
Message-ID: <CAMRc=Mcd886pfbOr3cWwMtRJt34DVAEq63B7W8m2Nqkrddw5FQ@mail.gmail.com>
References: <20190204171757.32073-1-brgl@bgdev.pl> <20190204171757.32073-5-brgl@bgdev.pl>
 <0750392d-e298-b467-24c0-3c2779ead3f7@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <0750392d-e298-b467-24c0-3c2779ead3f7@lechnology.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Lechner <david@lechnology.com>
Cc: Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: devicetree@vger.kernel.org

wt., 5 lut 2019 o 03:18 David Lechner <david@lechnology.com> napisa=C5=82(a=
):
>
> On 2/4/19 11:17 AM, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > Currently the timer code checks if the clock pointer passed to it is
> > good (!IS_ERR(clk)). The new clocksource driver expects the clock to
> > be functional and doesn't perform any checks so emit a warning if
> > clk_get() fails. Apply this to all davinci platforms.
> >
> > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > ---
> >   arch/arm/mach-davinci/da830.c  | 4 ++++
> >   arch/arm/mach-davinci/da850.c  | 4 ++++
> >   arch/arm/mach-davinci/dm355.c  | 4 ++++
> >   arch/arm/mach-davinci/dm365.c  | 4 ++++
> >   arch/arm/mach-davinci/dm644x.c | 4 ++++
> >   arch/arm/mach-davinci/dm646x.c | 4 ++++
> >   6 files changed, 24 insertions(+)
> >
> > diff --git a/arch/arm/mach-davinci/da830.c b/arch/arm/mach-davinci/da83=
0.c
> > index 2cc9fe4c3a91..9a4b749cbb6b 100644
> > --- a/arch/arm/mach-davinci/da830.c
> > +++ b/arch/arm/mach-davinci/da830.c
> > @@ -834,6 +834,10 @@ void __init da830_init_time(void)
> >       da830_pll_init(NULL, pll, NULL);
> >
> >       clk =3D clk_get(NULL, "timer0");
> > +     if (WARN_ON(IS_ERR(clk))) {
> > +             pr_err("Unable to get the timer clock\n");
>
> Do we really need a warning _and_ an error?
>

That will give us the reason AND point us to the right place in the code.

Bart

> > +             return;
> > +     }
> >
> >       davinci_timer_init(clk);
> >   }
