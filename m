From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v3 2/2] mmc: dw_mmc: add resets support to dw_mmc
Date: Sat, 02 Apr 2016 16:03:53 +0200
Message-ID: <5864557.bXRX6hBm9o@phil>
References: <1459322696-29919-1-git-send-email-guodong.xu@linaro.org> <5552254.5pm4SI4ary@phil> <CAFGCpxzUBUvMLWHUmd1WYDM7Do0J=QvaNbVQYMi_cQEhbV9-1Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAFGCpxzUBUvMLWHUmd1WYDM7Do0J=QvaNbVQYMi_cQEhbV9-1Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Guodong Xu <guodong.xu@linaro.org>
Cc: Shawn Lin <shawn.lin@rock-chips.com>, Jaehoon Chung <jh80.chung@samsung.com>, robh+dt@kernel.org, =?utf-8?B?UGF3ZcWC?= Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, ijc+devicetree@hellion.org.uk, Kumar Gala <galak@codeaurora.org>, Ulf Hansson <ulf.hansson@linaro.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Xinwei Kong <kong.kongxinwei@hisilicon.com>, Zhangfei Gao <zhangfei.gao@linaro.org>
List-Id: devicetree@vger.kernel.org

Am Samstag, 2. April 2016, 21:39:11 schrieb Guodong Xu:
> On 2 April 2016 at 02:42, Heiko Stuebner <heiko@sntech.de> wrote:
> > Am Mittwoch, 30. M=E4rz 2016, 15:24:56 schrieb Guodong Xu:
> >=20
> > [...]
> >=20
> > > @@ -2949,7 +2956,9 @@ int dw_mci_probe(struct dw_mci *host)
> > >=20
> > >       if (!host->pdata) {
> > >      =20
> > >               host->pdata =3D dw_mci_parse_dt(host);
> > >=20
> > > -             if (IS_ERR(host->pdata)) {
> > > +             if (PTR_ERR(host->pdata) =3D=3D -EPROBE_DEFER) {
> > > +                     return -EPROBE_DEFER;
> > > +             } else if (IS_ERR(host->pdata)) {
> >=20
> > how is this related to adding the reset handling?
>=20
> I added this into dw_mci_parse_dt(host), and that's the first time it=
 may
> return -EPROBE_DEFER
>=20
>   /* find reset controller when exist */
>   pdata->rstc =3D devm_reset_control_get_optional(dev, NULL);
>=20
> So, I added processing to this error in this patch.

ah, you're right of course


> > Making the driver handle probe deferral better should be a separate
> > patch.>=20
> > >                       dev_err(host->dev, "platform data not
> >=20
> > available\n");
> >=20
> > >                       return -EINVAL;
> > >              =20
> > >               }
> > >=20
> > > @@ -3012,6 +3021,9 @@ int dw_mci_probe(struct dw_mci *host)
> > >=20
> > >               }
> > >      =20
> > >       }
> > >=20
> > > +     if (!IS_ERR(host->pdata->rstc))
> > > +             reset_control_deassert(host->pdata->rstc);
> > > +
> >=20
> > Wouldn't reset_control_reset be better? The way it is now it would
> > expect
> > the reset to be asserted somewhere else before dw_mmc probes?
>=20
> It relates to how the SoC's reset logic is like. One bit set can clea=
r all
> dw_mmc host controller registers. It doesn't need do assert then
> deassert.
>=20
> That's what I saw in hi6220 (it integrates three dw_mmc host controll=
er),
> drivers/reset/hisilicon/hi6220_reset.c
> , which I wrote this patch for.

I just realized again that reset_control_reset is a completely separate=
=20
operation (not related to assert / deassert).

What I was originally getting at is that I don't see any assert-counter=
part.=20
So if the reset-control is already deasserted, nothing will happen on s=
ome=20
designs.

=46or example on Rockchip SoCs the reset controller needs the signal to=
 be=20
high to assert the reset and the dw_mmc part of the manual explicitly s=
ays=20
that the "reset_n should be asserted(active-low) for at least two clock=
s of=20
clk or cclk_in".

So I would expect something like

	reset_control_assert(reset);
	usleep_range(x, y);
	reset_control_deassert(reset);

instead of only trying to deassert the reset.


> > >       setup_timer(&host->cmd11_timer,
> > >      =20
> > >                   dw_mci_cmd11_timer, (unsigned long)host);
> >=20
> > [...]
> >=20
> > > diff --git a/include/linux/mmc/dw_mmc.h b/include/linux/mmc/dw_mm=
c.h
> > > index 7b41c6d..b95cd84 100644
> > > --- a/include/linux/mmc/dw_mmc.h
> > > +++ b/include/linux/mmc/dw_mmc.h
> > > @@ -14,9 +14,10 @@
> > >=20
> > >  #ifndef LINUX_MMC_DW_MMC_H
> > >  #define LINUX_MMC_DW_MMC_H
> > >=20
> > > -#include <linux/scatterlist.h>
> > > -#include <linux/mmc/core.h>
> > >=20
> > >  #include <linux/dmaengine.h>
> > >=20
> > > +#include <linux/mmc/core.h>
> > > +#include <linux/reset.h>
> > > +#include <linux/scatterlist.h>
> >=20
> > unrelated changed regarding the reordering of includes.
>=20
> Making them in the order of alphabetic. If you dislike, I will not ad=
d.

It's Jaehoon's call and that change above is pretty small, but generall=
y=20
introducing things unrelated to the change you actually want to make is=
 not=20
that nice - that's what separate patches are for :-) .


Heiko
