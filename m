From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v2 06/12] ARM: davinci: da830: switch to using the
 clocksource driver
Date: Fri, 8 Feb 2019 13:46:28 +0100
Message-ID: <CAMpxmJUutUx5z0rdCziLbseZ6hmceJ0FZazJ0mYMu3pwAKuxRw@mail.gmail.com>
References: <20190204171757.32073-1-brgl@bgdev.pl> <20190204171757.32073-7-brgl@bgdev.pl>
 <3e80e485-10f0-1bf6-72eb-69d69a571cb6@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <3e80e485-10f0-1bf6-72eb-69d69a571cb6@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sekhar Nori <nsekhar@ti.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Kevin Hilman <khilman@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, arm-soc <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, linux-devicetree <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

pt., 8 lut 2019 o 13:23 Sekhar Nori <nsekhar@ti.com> napisa=C5=82(a):
>
> On 04/02/19 10:47 PM, Bartosz Golaszewski wrote:
> > -/*
> > - * T0_BOT: Timer 0, bottom           : Used for clock_event & clocksou=
rce
> > - * T0_TOP: Timer 0, top                      : Used by DSP
> > - * T1_BOT, T1_TOP: Timer 1, bottom & top: Used for watchdog timer
>
> Aren't we changing this usage model for DA830 now, leaving no clock for
> use by DSP? It seems to me that after these patches clockevent is always
> T0_BOT and clocksource is always T0_TOP.
>
> Thanks,
> Sekhar

No it's still the same. I added some comments to the driver's header in v2.

Bart
