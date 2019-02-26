From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v2 08/12] ARM: davinci: dm355: switch to using the
 clocksource driver
Date: Tue, 26 Feb 2019 13:09:26 +0100
Message-ID: <CAMRc=Mf8wGNaPOxNx8xmvw5cRpA1fnRQ1-sc7iyMihcZ=Fb6dw@mail.gmail.com>
References: <20190204171757.32073-1-brgl@bgdev.pl> <20190204171757.32073-9-brgl@bgdev.pl>
 <bb0bc61a-8c2b-affa-c58a-1e7c14f9390d@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <bb0bc61a-8c2b-affa-c58a-1e7c14f9390d@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sekhar Nori <nsekhar@ti.com>
Cc: Kevin Hilman <khilman@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: devicetree@vger.kernel.org

pt., 8 lut 2019 o 13:34 Sekhar Nori <nsekhar@ti.com> napisa=C5=82(a):
>
> On 04/02/19 10:47 PM, Bartosz Golaszewski wrote:
> > -/*
> > - * T0_BOT: Timer 0, bottom:  clockevent source for hrtimers
> > - * T0_TOP: Timer 0, top   :  clocksource for generic timekeeping
> > - * T1_BOT: Timer 1, bottom:  (used by DSP in TI DSPLink code)
> > - * T1_TOP: Timer 1, top   :  <unused>
>
> Documenting this timer division is important because DSP usage and
> unused timers are not immediately clear from kernel code alone. Can you
> retain these comments in all patches of this series (I guess T0_BOT etc.
> terminology is changed, so feel free to adjust the comment text).
>
> > - */
> > -static struct davinci_timer_info dm355_timer_info =3D {
> > -     .timers         =3D davinci_timer_instance,
> > -     .clockevent_id  =3D T0_BOT,
> > -     .clocksource_id =3D T0_TOP,
> > +static const struct davinci_timer_cfg dm355_timer_cfg =3D {
> > +     .reg =3D {
> > +             .start          =3D DAVINCI_TIMER0_BASE,
> > +             .end            =3D DAVINCI_TIMER0_BASE + SZ_4K,
>
> Here and other places too, SZ_4K - 1
>
> Thanks,
> Sekhar

I used appropriate DEFINE_RES_x() macros instead.

Bart
