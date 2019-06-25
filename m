From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v13 05/13] clk: ingenic: Add driver for the TCU clocks
Date: Tue, 25 Jun 2019 16:28:20 -0700
Message-ID: <20190625232820.D1D4A20645@mail.kernel.org>
References: <20190624225759.18299-1-paul@crapouillou.net> <20190624225759.18299-6-paul@crapouillou.net> <20190625220931.2F69B2086D@mail.kernel.org> <1561502227.10069.1@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1561502227.10069.1@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Cercueil <paul@crapouillou.net>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, James Hogan <jhogan@kernel.org>, Jason Cooper <jason@lakedaemon.net>, Jonathan Corbet <corbet@lwn.net>, Lee Jones <lee.jones@linaro.org>, Marc Zyngier <marc.zyngier@arm.com>, Michael Turquette <mturquette@baylibre.com>, Paul Burton <paul.burton@mips.com>, Ralf Baechle <ralf@linux-mips.org>, Thomas Gleixner <tglx@linutronix.de>, Mathieu Malaterre <malat@debian.org>, od@zcrc.me, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-doc@vger.kernel.org, linux-clk@vger.kernel.org, Artur Rojek <contact@artur-rojek.eu>
List-Id: devicetree@vger.kernel.org

Quoting Paul Cercueil (2019-06-25 15:37:07)
> >=20
> > Do you need to get the clk by name? Or can that clk be "known" to the
> > TCU somehow so we can already have a direct clk pointer?
>=20
> This clock is provided by a separate driver, so I have to obtain the
> clock pointer from devicetree.

Ok.

> >>  +}
> >>  +
> >>  +static int __maybe_unused tcu_pm_suspend(void)
> >>  +{
> >>  +       struct ingenic_tcu *tcu =3D ingenic_tcu;
> >>  +
> >>  +       if (tcu->clk)
> >>  +               clk_disable(tcu->clk);
> >=20
> > Do you need to unprepare? Or it just isn't possible because this is
> > called from syscore and thus we can't sleep?
>=20
> I thought that clk_disable() was enough. We don't actually need to
> unprepare, do we? And yes, as you pointed out, this call cannot sleep.

Yeah unprepare isn't necessary, but it will be different on different
platforms. This is a highly platform specific driver though so I suspect
this is all fine.
