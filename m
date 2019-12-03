Return-Path: <SRS0=0idb=ZZ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E79EC432C0
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Dec 2019 03:54:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 42FB72068E
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Dec 2019 03:54:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EQX9ghzs"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726486AbfLCDyC (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 2 Dec 2019 22:54:02 -0500
Received: from mail-il1-f194.google.com ([209.85.166.194]:40599 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726480AbfLCDyC (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 2 Dec 2019 22:54:02 -0500
Received: by mail-il1-f194.google.com with SMTP id b15so1856160ila.7
        for <devicetree@vger.kernel.org>; Mon, 02 Dec 2019 19:54:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=P66P0ilxXmQ/bFuRbUZj8MYSHIX9XQA0VvK+ZgM+jMI=;
        b=EQX9ghzstAeFCYJB4ktw87KzjfpcmZguNfHkYQ7o2IhuBaxHuNjluCAoDjiaXY6Oxy
         g0y/CIADTI4AIlQMcor/P5iRIUI8HANb/w2gBMR866Hf8+Cl5sMbyIA5YupZt4pUrHRI
         f3Zch/S6GeQtmYOrR8Q38OVq7VsdY9JshmLYHQSqRMLUWf6q/G0W0yze2ew6y0oC5bSY
         f99/+ZMfCAR/dRptc1kWeGgg2NU5TcQWJBrvm/tSNFLw0//RU74Me1UUr10hAaUeZphq
         7RbuQN3IJ3uz36vb7JOfCUEvisRocuNUjuIWOLhHPu4N6TSOS4SKlB3HyGkBqKS0PPyR
         etRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=P66P0ilxXmQ/bFuRbUZj8MYSHIX9XQA0VvK+ZgM+jMI=;
        b=UXxeiB5ke5lrKlLk20MWd/KI+21/d4gMS/ST3bPPbKMkQa+KwRdkc/0rmYfDNXyvwI
         blmorKD5cGXgM4EX/oLmY0/HHYOhtMbBF0Rxi+dOQ5M7l0EH/bAdlpUwQm/F5yOjUvGy
         gfodRtvNHH5r9Z66QU+fHnHtR1U3/Xvgmu19wL2+azGtasJA6PBSMYmYAPZ42rjibybT
         NujmIY3BPLsEF14lJUoGnllFV//EJwdLRrDOOT5rZcwO0eb+lCNz/Kuj06nDAlCLoXt6
         xLMhTH5UAsXTNpi0jZlUZ2hK4xS9fijmZfR3p6aiJmiTNS7O3WHf90235oNF6jHipIpQ
         vJKQ==
X-Gm-Message-State: APjAAAWcvO8KlwPIiAyzPRg+s4F6O1Mz7ES+Lq97FooZxJ1nVZTnvzRA
        P34k0PNN1m2pNg5SBdPjw8fI97DehSm9P/p0AZq7/Q==
X-Google-Smtp-Source: APXvYqy2zUY/LL0dv7iBMmNQUjPgcL6eR1t0egWLgsB8mWiDl9VLhHaQQdxMWFLledpWGRrJHdNdUXiXrbLxJBBZu54=
X-Received: by 2002:a92:9107:: with SMTP id t7mr2945252ild.51.1575345241540;
 Mon, 02 Dec 2019 19:54:01 -0800 (PST)
MIME-Version: 1.0
References: <20191202144524.5391-1-jun.nie@linaro.org> <20191202144524.5391-3-jun.nie@linaro.org>
 <449968d8f085a1d1fcf4018bb8efe454fa35b3e3.camel@pengutronix.de>
In-Reply-To: <449968d8f085a1d1fcf4018bb8efe454fa35b3e3.camel@pengutronix.de>
From:   Jun Nie <jun.nie@linaro.org>
Date:   Tue, 3 Dec 2019 11:53:50 +0800
Message-ID: <CABymUCNDZSH+mB9TyyUBwgRu-qTRbgUv89va2HuBs4VeJWn6uA@mail.gmail.com>
Subject: Re: [PATCH 2/3] reset: hisilicon: Extend reset operation type
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Michael Turquette <mturquette@baylibre.com>, sboyd@kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Wei Xu <xuwei5@hisilicon.com>, opensource@jilayne.com,
        swinslow@gmail.com, allison@lohutok.net, yuehaibing@huawei.com,
        tglx@linutronix.de, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        xuejiancheng@hisilicon.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Philipp Zabel <p.zabel@pengutronix.de> =E4=BA=8E2019=E5=B9=B412=E6=9C=883=
=E6=97=A5=E5=91=A8=E4=BA=8C =E4=B8=8A=E5=8D=881:04=E5=86=99=E9=81=93=EF=BC=
=9A
>
> On Mon, 2019-12-02 at 22:45 +0800, Jun Nie wrote:
> > Extend reset operations to support combination of three type flags:
> > ASSERT/DEASSERT SET/CLEAR POLL.
> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > ---
> >  drivers/clk/hisilicon/reset.c | 58 ++++++++++++++++++++++++++++++++---
> >  1 file changed, 53 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/clk/hisilicon/reset.c b/drivers/clk/hisilicon/rese=
t.c
> > index 93cee17db8b1..de7d186b0894 100644
> > --- a/drivers/clk/hisilicon/reset.c
> > +++ b/drivers/clk/hisilicon/reset.c
> > @@ -2,20 +2,25 @@
> >  /*
> >   * Hisilicon Reset Controller Driver
> >   *
> > - * Copyright (c) 2015-2016 HiSilicon Technologies Co., Ltd.
> > + * Copyright (c) 2015-2019 HiSilicon Technologies Co., Ltd.
> >   */
> >
> >  #include <linux/io.h>
> > +#include <linux/iopoll.h>
> >  #include <linux/of_address.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/reset-controller.h>
> >  #include <linux/slab.h>
> >  #include <linux/spinlock.h>
> > +
> > +#include <dt-bindings/reset/hisilicon-resets.h>
> >  #include "reset.h"
> >
> >  #define      HISI_RESET_BIT_MASK     0x1f
> >  #define      HISI_RESET_OFFSET_SHIFT 8
> >  #define      HISI_RESET_OFFSET_MASK  0xffff00
> > +#define      HISI_RESET_FLAG_SHIFT   24
> > +#define      HISI_RESET_FLAG_MASK    0xff000000
> >
> >  struct hisi_reset_controller {
> >       spinlock_t      lock;
> > @@ -30,14 +35,17 @@ struct hisi_reset_controller {
> >  static int hisi_reset_of_xlate(struct reset_controller_dev *rcdev,
> >                       const struct of_phandle_args *reset_spec)
> >  {
> > +     unsigned long flags;
> >       u32 offset;
> >       u8 bit;
> >
> > +     flags =3D (reset_spec->args[2] << HISI_RESET_FLAG_SHIFT)
> > +             & HISI_RESET_FLAG_MASK;
> >       offset =3D (reset_spec->args[0] << HISI_RESET_OFFSET_SHIFT)
> >               & HISI_RESET_OFFSET_MASK;
> >       bit =3D reset_spec->args[1] & HISI_RESET_BIT_MASK;
> >
> > -     return (offset | bit);
> > +     return (flags | offset | bit);
> >  }
> >
> >  static int hisi_reset_assert(struct reset_controller_dev *rcdev,
> > @@ -48,13 +56,33 @@ static int hisi_reset_assert(struct reset_controlle=
r_dev *rcdev,
> >       u32 offset, reg;
> >       u8 bit;
> >
> > +     flags =3D (id & HISI_RESET_FLAG_MASK) >> HISI_RESET_FLAG_SHIFT;
> > +     if (flags & HISI_ASSERT_NONE)
> > +             return -ENOTSUPP; /* assert not supported for this reset =
*/
>
> As long as .assert and .deassert are the only implemented operations for
> this reset controller, this does not make any sense to me. Are there
> resets that can only be deasserted?

Some reset is asserted on power on automatically. So only .deassert is need=
ed.
>
> > +
> >       offset =3D (id & HISI_RESET_OFFSET_MASK) >> HISI_RESET_OFFSET_SHI=
FT;
> >       bit =3D id & HISI_RESET_BIT_MASK;
> >
> > +     pr_devel("%s %s to %s 0x%x:bit[%d]\n", __func__,
> > +             flags & HISI_ASSERT_POLL ? "poll" : "",
> > +             flags & HISI_ASSERT_SET ? "set":"clear", offset, bit);
> > +
> > +     if (flags & HISI_ASSERT_POLL) {
>
> Since HISI_ASSERT_POLL is 0, this is always false.

Will fix the wrong value definition in next version patch. The same to
below comments.
>
> > +             if (flags & HISI_ASSERT_SET)
> > +                     return readl_poll_timeout(rstc->membase + offset,
> > +                                               reg, reg & BIT(bit), 0,=
 5000);
> > +             else
> > +                     return readl_poll_timeout(rstc->membase + offset,
> > +                                               reg, !(reg & BIT(bit)),
> > +                                               0, 5000);
>
> And this is effectively dead code. Do you really have hardware that
> asserts or asserts a reset line in reaction to a read access?
>
> Should HISI_ASSERT_POLL and HISI_DEASSERT_POLL be mutually exclusive?
>
> > +     }
> > +
> >       spin_lock_irqsave(&rstc->lock, flags);
> >
> >       reg =3D readl(rstc->membase + offset);
> > -     writel(reg | BIT(bit), rstc->membase + offset);
> > +     /* Default is setting to assert for no flag case. */
> > +     reg =3D (flags & HISI_ASSERT_CLEAR) ? reg & ~BIT(bit) : reg | BIT=
(bit);
>
> Consider moving this into a helper function with a boolean set/clear
> parameter.

Will do.
>
> As long as HISI_ASSERT_CLEAR is 0, the first branch is dead code.
>
> > +     writel(reg, rstc->membase + offset);
> >
> >       spin_unlock_irqrestore(&rstc->lock, flags);
> >
> > @@ -69,13 +97,33 @@ static int hisi_reset_deassert(struct reset_control=
ler_dev *rcdev,
> >       u32 offset, reg;
> >       u8 bit;
> >
> > +     flags =3D (id & HISI_RESET_FLAG_MASK) >> HISI_RESET_FLAG_SHIFT;
> > +     if (flags & HISI_DEASSERT_NONE)
> > +             return -ENOTSUPP; /* deassert not supported for this rese=
t */
> > +
>
> Are there resets that can only ever be asserted?

I do not know yet. Only extend this driver with all combination in logic.
>
> >       offset =3D (id & HISI_RESET_OFFSET_MASK) >> HISI_RESET_OFFSET_SHI=
FT;
> >       bit =3D id & HISI_RESET_BIT_MASK;
> >
> > +     pr_devel("%s %s to %s 0x%x:bit[%d]\n", __func__,
> > +             flags & HISI_DEASSERT_POLL ? "poll" : "",
> > +             flags & HISI_DEASSERT_SET ? "clear":"set", offset, bit);
> > +
> > +     if (flags & HISI_DEASSERT_POLL) {
> > +             if (flags & HISI_DEASSERT_SET)
> > +                     return readl_poll_timeout(rstc->membase + offset,
> > +                                               reg, reg & BIT(bit), 0,=
 5000);
> > +             else
> > +                     return readl_poll_timeout(rstc->membase + offset,
> > +                                               reg, !(reg & BIT(bit)),
> > +                                               0, 5000);
>
> See above, this code currently can never be reached.
>
> > +     }
> > +
> >       spin_lock_irqsave(&rstc->lock, flags);
> >
> >       reg =3D readl(rstc->membase + offset);
> > -     writel(reg & ~BIT(bit), rstc->membase + offset);
> > +     /* Default is clearing to deasseart for no flag case. */
> > +     reg =3D (flags & HISI_DEASSERT_SET) ? reg | BIT(bit) : reg & ~BIT=
(bit);
>
> Same as above, the read-modify-write for set/clear could be split out
> into a helper.
>
> > +     writel(reg, rstc->membase + offset);
> >
> >       spin_unlock_irqrestore(&rstc->lock, flags);
> >
> > @@ -103,7 +151,7 @@ struct hisi_reset_controller *hisi_reset_init(struc=
t platform_device *pdev)
> >       rstc->rcdev.owner =3D THIS_MODULE;
> >       rstc->rcdev.ops =3D &hisi_reset_ops;
> >       rstc->rcdev.of_node =3D pdev->dev.of_node;
> > -     rstc->rcdev.of_reset_n_cells =3D 2;
> > +     rstc->rcdev.of_reset_n_cells =3D 3;
>
> This breaks current device trees (before patch 3). You can make sure
> device trees with #reset-cells =3D <2> keep working by parsing the #reset=
-
> cells and setting this value to 2 for old DTs.

All current dts file are modified accordingly. But existing dtb binary supp=
ort
is an issue. Do you have any suggestion?

>
> >       rstc->rcdev.of_xlate =3D hisi_reset_of_xlate;
> >       reset_controller_register(&rstc->rcdev);
>
> regards
> Philipp
>
