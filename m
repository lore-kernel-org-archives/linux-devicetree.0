From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v7 0/5] clk: Provide support for always-on clocks
Date: Thu, 30 Jul 2015 10:09:57 +0100
Message-ID: <20150730090957.GA14642@x1>
References: <1437570255-21049-1-git-send-email-lee.jones@linaro.org>
 <20150730002726.642.33056@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150730002726.642.33056@quantum>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Turquette <mturquette@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, sboyd@codeaurora.org, devicetree@vger.kernel.org, geert@linux-m68k.org, maxime.ripard@free-electrons.com, s.hauer@pengutronix.de
List-Id: devicetree@vger.kernel.org

On Wed, 29 Jul 2015, Michael Turquette wrote:
> Quoting Lee Jones (2015-07-22 06:04:10)
> > Lots of platforms contain clocks which if turned off would prove fa=
tal.
> > The only way to recover from these catastrophic failures is to rest=
art
> > the board(s).  Now, when a clock provider is registered with the
> > framework it is possible for a list of critical clocks to be suppli=
ed
> > which must be kept ungated.  Each clock mentioned in the newly
> > introduced 'critical-clock' property will be clk_prepare_enable()d
> > where the normal references will be taken.  This will prevent the
> > common clk framework from attempting to gate them during the normal
> > clk_disable_unused() and disable_clock() procedures.
> >=20
> > Note that it will still be possible for knowledgeable drivers to tu=
rn
> > these clocks off using clk_{enable,disable}_critical() calls.
>=20
> Hi Lee,
>=20
> Thanks for submitting the series.
>=20
> It has been a little while since v6. It would be helpful to remind me=
 of
> why a new api is necessary, versus using the existing clk_prepare_unu=
sed
> call at the time that a clock is enabled.
>=20
> I'm looking over the patches in detail now, but one question stands o=
ut:
> besides the DT use case, would a Linux device driver ever call
> clk_enable_critical instead of using clk_enable? If so, why?

Looks like a have a lot of emails to reply to.  Let's start here and
work our way through them, there are good answers to all of your
reasonable questions.

This set only supports the DT way of marking clocks as critical, due
to the fact that that's the way we'll be using the API.  I can spend
more time, once we have the ground work done, writing a similar
generic call (or expand the current one, whatever's deemed the best
approach) which will allow this to be possible from C.

> > Changelog:
> > v6 =3D> v7:
> >   - Introduce API to enable and disable critical clocks
> >   - Rename 'always-on-clock' to 'critical-clock'
> >=20
> > v5 =3D> v6:
> >   - Use of_clk_get_from_provider() instead of of_clk_get_by_clkspec=
()
> >   - Explicitly describe expected DT values
> >   - Be pedantic with regards to printk() format specifiers
> >=20
> > vX =3D> v5:
> >   Implementations have changed drastically between versions, thus I
> >   would like for this set to be thought of independently from its
> >   predecessors.  The only reason for identifying as 'v5' is ease of
> >   differentiation on the list, which stems from the confusion cause=
d
> >   by submitting 'v4' as a separate entity.
> >=20
> > Lee Jones (5):
> >   ARM: sti: stih407-family: Supply defines for CLOCKGEN A0
> >   ARM: sti: stih410-clocks: Identify critical clocks
> >   clk: Supply the critical clock {init, enable, disable} framework
> >   clk: Provide critical clock support
> >   clk: dt: Introduce binding for critical clock support
> >=20
> >  .../devicetree/bindings/clock/clock-bindings.txt   | 39 ++++++++++=
+++++++++
> >  arch/arm/boot/dts/stih410-clock.dtsi               | 10 +++++
> >  drivers/clk/clk-conf.c                             | 45 ++++++++++=
+++++++++++-
> >  drivers/clk/clk.c                                  | 45 ++++++++++=
++++++++++++
> >  include/dt-bindings/clock/stih407-clks.h           |  4 ++
> >  include/linux/clk-provider.h                       |  2 +
> >  include/linux/clk.h                                | 30 ++++++++++=
+++++
> >  7 files changed, 174 insertions(+), 1 deletion(-)
> >=20

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
