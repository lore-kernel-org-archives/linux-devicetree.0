From: Guodong Xu <guodong.xu@linaro.org>
Subject: Re: [PATCH v3 2/2] mmc: dw_mmc: add resets support to dw_mmc
Date: Wed, 25 May 2016 21:33:55 +0800
Message-ID: <CAFGCpxz+mAwnkoiXPW263SZQExg+ai=bEWpGWBVzMaPXhVXEwA@mail.gmail.com>
References: <1459322696-29919-1-git-send-email-guodong.xu@linaro.org>
	<5552254.5pm4SI4ary@phil>
	<CAFGCpxzUBUvMLWHUmd1WYDM7Do0J=QvaNbVQYMi_cQEhbV9-1Q@mail.gmail.com>
	<5864557.bXRX6hBm9o@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5864557.bXRX6hBm9o@phil>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: Shawn Lin <shawn.lin@rock-chips.com>, Jaehoon Chung <jh80.chung@samsung.com>, Rob Herring <robh+dt@kernel.org>, =?UTF-8?Q?Pawe=C5=82_Moll?= <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Ulf Hansson <ulf.hansson@linaro.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Xinwei Kong <kong.kongxinwei@hisilicon.com>, Zhangfei Gao <zhangfei.gao@linaro.org>
List-Id: devicetree@vger.kernel.org

On 2 April 2016 at 22:03, Heiko Stuebner <heiko@sntech.de> wrote:
> Am Samstag, 2. April 2016, 21:39:11 schrieb Guodong Xu:
>> On 2 April 2016 at 02:42, Heiko Stuebner <heiko@sntech.de> wrote:
>> > Am Mittwoch, 30. M=C3=A4rz 2016, 15:24:56 schrieb Guodong Xu:
>> >
>> > [...]
>> >
>> > > @@ -2949,7 +2956,9 @@ int dw_mci_probe(struct dw_mci *host)
>> > >
>> > >       if (!host->pdata) {
>> > >
>> > >               host->pdata =3D dw_mci_parse_dt(host);
>> > >
>> > > -             if (IS_ERR(host->pdata)) {
>> > > +             if (PTR_ERR(host->pdata) =3D=3D -EPROBE_DEFER) {
>> > > +                     return -EPROBE_DEFER;
>> > > +             } else if (IS_ERR(host->pdata)) {
>> >
>> > how is this related to adding the reset handling?
>>
>> I added this into dw_mci_parse_dt(host), and that's the first time i=
t may
>> return -EPROBE_DEFER
>>
>>   /* find reset controller when exist */
>>   pdata->rstc =3D devm_reset_control_get_optional(dev, NULL);
>>
>> So, I added processing to this error in this patch.
>
> ah, you're right of course
>
>
>> > Making the driver handle probe deferral better should be a separat=
e
>> > patch.>
>> > >                       dev_err(host->dev, "platform data not
>> >
>> > available\n");
>> >
>> > >                       return -EINVAL;
>> > >
>> > >               }
>> > >
>> > > @@ -3012,6 +3021,9 @@ int dw_mci_probe(struct dw_mci *host)
>> > >
>> > >               }
>> > >
>> > >       }
>> > >
>> > > +     if (!IS_ERR(host->pdata->rstc))
>> > > +             reset_control_deassert(host->pdata->rstc);
>> > > +
>> >
>> > Wouldn't reset_control_reset be better? The way it is now it would
>> > expect
>> > the reset to be asserted somewhere else before dw_mmc probes?
>>
>> It relates to how the SoC's reset logic is like. One bit set can cle=
ar all
>> dw_mmc host controller registers. It doesn't need do assert then
>> deassert.
>>
>> That's what I saw in hi6220 (it integrates three dw_mmc host control=
ler),
>> drivers/reset/hisilicon/hi6220_reset.c
>> , which I wrote this patch for.
>
> I just realized again that reset_control_reset is a completely separa=
te
> operation (not related to assert / deassert).
>
> What I was originally getting at is that I don't see any assert-count=
erpart.
> So if the reset-control is already deasserted, nothing will happen on=
 some
> designs.
>
> For example on Rockchip SoCs the reset controller needs the signal to=
 be
> high to assert the reset and the dw_mmc part of the manual explicitly=
 says
> that the "reset_n should be asserted(active-low) for at least two clo=
cks of
> clk or cclk_in".
>
> So I would expect something like
>
>         reset_control_assert(reset);
>         usleep_range(x, y);
>         reset_control_deassert(reset);
>
> instead of only trying to deassert the reset.
>

After confirmation with SoC hardware engineer, yeah, a correct _assert
action is expected. I will modify it as the above. Regarding
usleep_range(x, y) values, here is suggestion:

+               usleep_range(10, 50); /* 1/400kHz =3D 2.5us */

400kHz is the minimal bus speed for MMC. It stands for 2.5us per cycle.
10us is 4 cycles, and 50us is 20 cycles.

Does this setting make sense to you?

>
>> > >       setup_timer(&host->cmd11_timer,
>> > >
>> > >                   dw_mci_cmd11_timer, (unsigned long)host);
>> >
>> > [...]
>> >
>> > > diff --git a/include/linux/mmc/dw_mmc.h b/include/linux/mmc/dw_m=
mc.h
>> > > index 7b41c6d..b95cd84 100644
>> > > --- a/include/linux/mmc/dw_mmc.h
>> > > +++ b/include/linux/mmc/dw_mmc.h
>> > > @@ -14,9 +14,10 @@
>> > >
>> > >  #ifndef LINUX_MMC_DW_MMC_H
>> > >  #define LINUX_MMC_DW_MMC_H
>> > >
>> > > -#include <linux/scatterlist.h>
>> > > -#include <linux/mmc/core.h>
>> > >
>> > >  #include <linux/dmaengine.h>
>> > >
>> > > +#include <linux/mmc/core.h>
>> > > +#include <linux/reset.h>
>> > > +#include <linux/scatterlist.h>
>> >
>> > unrelated changed regarding the reordering of includes.
>>
>> Making them in the order of alphabetic. If you dislike, I will not a=
dd.
>
> It's Jaehoon's call and that change above is pretty small, but genera=
lly
> introducing things unrelated to the change you actually want to make =
is not
> that nice - that's what separate patches are for :-) .

Got your point. I will remove this. Make it simple.

-Guodong

>
>
> Heiko
