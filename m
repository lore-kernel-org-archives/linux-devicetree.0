Return-Path: <SRS0=zDkl=Z2=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5C72C3F68F
	for <linux-devicetree@archiver.kernel.org>; Wed,  4 Dec 2019 07:06:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 271E22464F
	for <linux-devicetree@archiver.kernel.org>; Wed,  4 Dec 2019 06:09:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jnGMJDQl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726166AbfLDGJx (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 4 Dec 2019 01:09:53 -0500
Received: from mail-io1-f65.google.com ([209.85.166.65]:44508 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725791AbfLDGJx (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 4 Dec 2019 01:09:53 -0500
Received: by mail-io1-f65.google.com with SMTP id z23so6648609iog.11
        for <devicetree@vger.kernel.org>; Tue, 03 Dec 2019 22:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=4jzAFltpu0J+4vz8XE00BFWN2RjNCAxYJnQznX1Z+Xg=;
        b=jnGMJDQlP6VnaR/rzSND//h22uscV3GaIcecJmwnWbQyjfsWW2OzOZGBb6nidrLPsz
         CgyQchVePdI42BNGVg4L/9tRHTdxEhHvVewB7auycAq332EiEhADTSAzZ5+stzHyooLC
         mWLULsHZpkT79hQc8BKhGB10A6xIa/gGHEn/WYj3C8uG6rH7FCr/rYDzdFQQvKzdwuxd
         DGkSKg+WPk6M8yaWK/xbtQHxfzDRokFKyPBOO5lFwjlBI7wCc3E7vE6CxT8Si0wnXaen
         ARFz3euhhRKDEvWGeBBrpjlE0aIocRuFfdovElYHo9xvezzUtsQa2msR37o1w9K0Oeh7
         WE1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=4jzAFltpu0J+4vz8XE00BFWN2RjNCAxYJnQznX1Z+Xg=;
        b=YocAumWLVwEsbqrDBMFl8B3EwlNC1jo8llvtsU/vNYVQb3lgA5+dnnSKIo71NLwphg
         5I4Bfg0i5Ow0TxmrzafbEcXuo00dY7/jq6PpxRtHcSW8BG9J7aSD/VvinSMNUPhktOXe
         7tvoBl5Twk7nTxt29rMRa+Iftl3Ii6AXXatJdBJY9AgMlULUbg0hhwO9HiYXJdK7FWVh
         1xXWcsaanKFIkDzVrWv6jU/82MZ0eb5S2QDCMkF66vItUciyjdAYra0BWvbzvCcuf9QW
         5fKw1iCkbrWq/nHkg3c80VjpR5t6qFERHvdFE473RTXDUI/fTbeOv4O8JQ41zfqDl81c
         Fsww==
X-Gm-Message-State: APjAAAXjqGcbel3+ypuV+8diPvcL5kKclXrywYX/h7lBhW62RnEKmMCp
        hbfXk1gq0OF4/zhLRuDxBQvwjB9+nvie9kEINw2gDQ==
X-Google-Smtp-Source: APXvYqz4Pw88LRkEnmh2SH8eskVaSjidohBjwfV2t8JDl1TAfhGM8m+OJSmsI+r/sywEWrSf3mMBwpV5V2BEoOsl1lM=
X-Received: by 2002:a02:3309:: with SMTP id c9mr1560177jae.52.1575439792493;
 Tue, 03 Dec 2019 22:09:52 -0800 (PST)
MIME-Version: 1.0
References: <20191202144524.5391-1-jun.nie@linaro.org> <20191202144524.5391-3-jun.nie@linaro.org>
 <449968d8f085a1d1fcf4018bb8efe454fa35b3e3.camel@pengutronix.de>
 <CABymUCNDZSH+mB9TyyUBwgRu-qTRbgUv89va2HuBs4VeJWn6uA@mail.gmail.com> <5ca8ff65b8489195ef5349cd2d074d412c9d0036.camel@pengutronix.de>
In-Reply-To: <5ca8ff65b8489195ef5349cd2d074d412c9d0036.camel@pengutronix.de>
From:   Jun Nie <jun.nie@linaro.org>
Date:   Wed, 4 Dec 2019 14:09:41 +0800
Message-ID: <CABymUCORzaeaD--wPLSD66x1Y3StSW624u7LxykM_j-1bzWsXg@mail.gmail.com>
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
=E6=97=A5=E5=91=A8=E4=BA=8C =E4=B8=8B=E5=8D=8810:15=E5=86=99=E9=81=93=EF=BC=
=9A
>
> Hi Jun,
>
> On Tue, 2019-12-03 at 11:53 +0800, Jun Nie wrote:
> [...]
> > @@ -48,13 +56,33 @@ static int hisi_reset_assert(struct reset_controlle=
r_dev *rcdev,
> > > >       u32 offset, reg;
> > > >       u8 bit;
> > > >
> > > > +     flags =3D (id & HISI_RESET_FLAG_MASK) >> HISI_RESET_FLAG_SHIF=
T;
> > > > +     if (flags & HISI_ASSERT_NONE)
> > > > +             return -ENOTSUPP; /* assert not supported for this re=
set */
> > >
> > > As long as .assert and .deassert are the only implemented operations =
for
> > > this reset controller, this does not make any sense to me. Are there
> > > resets that can only be deasserted?
> >
> > Some reset is asserted on power on automatically. So only .deassert is =
needed.
>
> But if the bit was set/cleared again after being deasserted, would it
> assert the reset line? Basically, I wonder if those bits are write-once
> or not.

I did not see vendor's code to clear it, seems the bit is only polled
to be set on every
device enablement.
>
> [...]
> > > > +             if (flags & HISI_ASSERT_SET)
> > > > +                     return readl_poll_timeout(rstc->membase + off=
set,
> > > > +                                               reg, reg & BIT(bit)=
, 0, 5000);
> > > > +             else
> > > > +                     return readl_poll_timeout(rstc->membase + off=
set,
> > > > +                                               reg, !(reg & BIT(bi=
t)),
> > > > +                                               0, 5000);
> > >
> > > And this is effectively dead code. Do you really have hardware that
> > > asserts or asserts a reset line in reaction to a read access?
> > >
> > > Should HISI_ASSERT_POLL and HISI_DEASSERT_POLL be mutually exclusive?
>
> This is missing an explanation.

They are not mutually exclusive in logic. But I did not see the need
to poll for a assert yet.
>
> [...]
> > > > +     writel(reg, rstc->membase + offset);
> > > >
> > > >       spin_unlock_irqrestore(&rstc->lock, flags);
> > > >
> > > > @@ -69,13 +97,33 @@ static int hisi_reset_deassert(struct reset_con=
troller_dev *rcdev,
> > > >       u32 offset, reg;
> > > >       u8 bit;
> > > >
> > > > +     flags =3D (id & HISI_RESET_FLAG_MASK) >> HISI_RESET_FLAG_SHIF=
T;
> > > > +     if (flags & HISI_DEASSERT_NONE)
> > > > +             return -ENOTSUPP; /* deassert not supported for this =
reset */
> > > > +
> > >
> > > Are there resets that can only ever be asserted?
> >
> > I do not know yet. Only extend this driver with all combination in logi=
c.
>
> If this is not used, let's leave it out.
>
> [...]
> > > > @@ -103,7 +151,7 @@ struct hisi_reset_controller *hisi_reset_init(s=
truct platform_device *pdev)
> > > >       rstc->rcdev.owner =3D THIS_MODULE;
> > > >       rstc->rcdev.ops =3D &hisi_reset_ops;
> > > >       rstc->rcdev.of_node =3D pdev->dev.of_node;
> > > > -     rstc->rcdev.of_reset_n_cells =3D 2;
> > > > +     rstc->rcdev.of_reset_n_cells =3D 3;
> > >
> > > This breaks current device trees (before patch 3). You can make sure
> > > device trees with #reset-cells =3D <2> keep working by parsing the #r=
eset-
> > > cells and setting this value to 2 for old DTs.
> >
> > All current dts file are modified accordingly. But existing dtb binary =
support
> > is an issue. Do you have any suggestion?
>
> Since this is for a new SoC, you should keep using of_reset_n_cells =3D 2
> for the current SoCs and only set it to 3 for a new compatible, for
> example using of_device_get_match_data().

Yeah, this should be the solution. I will check the detail, thanks!

Regards,
Jun
