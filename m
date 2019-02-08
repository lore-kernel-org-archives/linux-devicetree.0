From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v2 05/12] ARM: davinci: da850: switch to using the
 clocksource driver
Date: Fri, 8 Feb 2019 13:34:52 +0100
Message-ID: <CAMpxmJW0qMi0BmiK2SOwdagw2-t8+1g20XJR418mWb8f1dwxtQ@mail.gmail.com>
References: <20190204171757.32073-1-brgl@bgdev.pl> <20190204171757.32073-6-brgl@bgdev.pl>
 <9d423e18-8c85-731b-388a-1843067db242@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <9d423e18-8c85-731b-388a-1843067db242@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sekhar Nori <nsekhar@ti.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Kevin Hilman <khilman@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, arm-soc <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, linux-devicetree <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

pt., 8 lut 2019 o 13:06 Sekhar Nori <nsekhar@ti.com> napisa=C5=82(a):
>
> On 04/02/19 10:47 PM, Bartosz Golaszewski wrote:
> > +static const struct davinci_timer_cfg da850_timer_cfg =3D {
> > +     .reg =3D {
> > +             .start          =3D DA8XX_TIMER64P0_BASE,
> > +             .end            =3D DA8XX_TIMER64P0_BASE + SZ_4K,
>
> SZ_4K - 1
>
> This should have prevented watchdog timer from getting registered.
>
> Thanks,
> Sekhar

My clocksource driver doesn't call request_region() so a subsequent
devm_ioremap_resource() in the watchdog driver would still succeed. I
now fixed both the missing call and the value here.

Bart
