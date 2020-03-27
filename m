Return-Path: <SRS0=jSFQ=5M=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A9DAC43331
	for <linux-devicetree@archiver.kernel.org>; Fri, 27 Mar 2020 10:32:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C992820714
	for <linux-devicetree@archiver.kernel.org>; Fri, 27 Mar 2020 10:32:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xXRePv+8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726656AbgC0Kcp (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 27 Mar 2020 06:32:45 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:43156 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726217AbgC0Kco (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 27 Mar 2020 06:32:44 -0400
Received: by mail-ot1-f67.google.com with SMTP id a6so9154990otb.10
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2020 03:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YYF9IlkYIan1+UFMEoSWkc8FBz64pPNX5SeJSHAu8kg=;
        b=xXRePv+8SgkF6sJVJLkuv6mQ3y/WTJtU4pKOk2h/g4ZRRHoUdhWf7be/9xVvXKJdOJ
         39uHfWxJUgkVtpS11k+sbvlmqrHPQZp4BnoMDUn9WmW3l093QS/IYdfe9Ov6MsLD0orX
         w3om+wu4CpiMG2891c46ivxP+5hF4oDBg/2XwZVmw0wycDU+vm++0LepD4VMusQXW9M8
         3DH+9eMSAFaeaUdQAvQIXWhp1gr1VgSA3s58G7EWE8Lwv+23SbpOZn67vq4HXZzLA10c
         9m/EzI/Ld/dq/n+X1pjXT4ciAgnrosOzyR+x1GIxsSkrvCUkSM+eiZJ1mgeNdRZhOWaY
         lCgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YYF9IlkYIan1+UFMEoSWkc8FBz64pPNX5SeJSHAu8kg=;
        b=X6/wbKO9O0eOtZHw081Pvy6HXem/5mS/iMPnWibFL4z0FXALZA2DaxE0PjKeHGj1A7
         gpvE5hmo4iQAEN7Gqq9BbR0Q5cmhdeZsVzD2d/EO5XdQs1fR9pAaYqPL68/rW3mDvbr5
         yWsaIgfWj5jRWChc1VXe/xwin402St+RyzBTa/ZbuuqW1EgWeF4PTeutEUAmOdXdDymA
         vw7k2RQcCVatVZ9DG+RPgNW+32sUxe/35EyxQUjJqtyO3ScVV0I8L08Xb0o9913GsgPh
         EzcUHVQQIp0PsDnLI5qJ/LkFNLYN4aSQ/uKjEQJF5WQLYZC/m5e9AX9k0tWsbDEIfuhT
         H+eQ==
X-Gm-Message-State: ANhLgQ20ZDsN9bmfzsbQFQo9nU7nT67KeC/Lnk3DbJr7dwurD2NOMXcv
        MhnXih5AkQh6s6xqil7q81iDhYXi/LjLJ7GBqwMGOQ==
X-Google-Smtp-Source: ADFU+vseCXoMGXatVYtvuIKCvvYcHpzp5L/GUxqGEUSN7+BRDLJCxO7pyQfJM0X4rU4ScjZZJpwRtscCky9sePUUX9s=
X-Received: by 2002:a9d:27a7:: with SMTP id c36mr9836243otb.68.1585305162293;
 Fri, 27 Mar 2020 03:32:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200313110350.10864-1-robert.foss@linaro.org>
 <20200313110350.10864-3-robert.foss@linaro.org> <20200313121746.GC5730@valkosipuli.retiisi.org.uk>
 <CAG3jFytpx8_+DKhUVZnUFeMYK82Z1hFWcEnbyD0=4a8p3ojteg@mail.gmail.com> <20200326144725.GA2394@valkosipuli.retiisi.org.uk>
In-Reply-To: <20200326144725.GA2394@valkosipuli.retiisi.org.uk>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Fri, 27 Mar 2020 11:32:29 +0100
Message-ID: <CAG3jFyu=HOsWNeRFC2t4HjzYrFrLjsbXzAm4+zD50Xq48mqzcw@mail.gmail.com>
Subject: Re: [v2 2/3] media: ov8856: Add devicetree support
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Fabio Estevam <festevam@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Tomasz Figa <tfiga@chromium.org>,
        linux-media <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, 26 Mar 2020 at 15:47, Sakari Ailus <sakari.ailus@iki.fi> wrote:
>
> Hi Robert,
>
> On Thu, Mar 26, 2020 at 12:56:37PM +0100, Robert Foss wrote:
> ...
> > > > +static int __ov8856_power_on(struct ov8856 *ov8856)
> > > > +{
> > > > +     struct i2c_client *client = v4l2_get_subdevdata(&ov8856->sd);
> > > > +     int ret;
> > > > +
> > > > +     ret = clk_prepare_enable(ov8856->xvclk);
> > > > +     if (ret < 0) {
> > > > +             dev_err(&client->dev, "failed to enable xvclk\n");
> > > > +             return ret;
> > > > +     }
> > > > +
> > > > +     gpiod_set_value_cansleep(ov8856->reset_gpio, GPIOD_OUT_HIGH);
> > > > +
> > > > +     ret = regulator_bulk_enable(ARRAY_SIZE(ov8856_supply_names),
> > > > +                                 ov8856->supplies);
> > > > +     if (ret < 0) {
> > > > +             dev_err(&client->dev, "failed to enable regulators\n");
> > > > +             goto disable_clk;
> > > > +     }
> > > > +
> > > > +     gpiod_set_value_cansleep(ov8856->reset_gpio, GPIOD_OUT_LOW);
> > > > +
> > > > +     usleep_range(1500, 1800);
> > >
> > > I think you could omit the delay on ACPI based systems. Or just bail out
> > > early in that case.
> >
> > I'll add a check for reset_gpio being NULL, and skip the sleep for that case.
>
> There could also be a regulator but no GPIO.
>
> I think if you don't have either, then certainly there's no need for a
> delay.

Removing the delay if no action is taken makes sense, but I'm not sure
how best to do it.
If there are no regulators dummy ones are created automatically, which
makes distinguishing between a little bit cumbersome. The regulator
structs could of course all be inspected, and if all are dummy ones,
the delay could be skipped. But is there a neater way of doing this?
Manually inspecting the regs strikes me as a bit inelegant.

>
> ...
>
> > > > +             ov8856->xvclk = NULL;
> > > > +     } else if (IS_ERR(ov8856->xvclk)) {
> > > > +             dev_err(&client->dev, "could not get xvclk clock (%ld)\n",
> > > > +                     PTR_ERR(ov8856->xvclk));
> > > > +             return PTR_ERR(ov8856->xvclk);
> > > > +     }
> > > > +
> > > > +     ret = clk_set_rate(ov8856->xvclk, OV8856_XVCLK_24);
> > >
> > > This should either come from platform data, or perhaps it'd be even better
> > > to get the clock rate and use assigned-clock-rates. I guess that's
> > > preferred nowadays.
> >
> > I'm a bit unsure about what this would look like.
> >
> > Are you thinking something like the way ext_clk is used in smiapp_core.c?
> > I went ahead and implemented support for retrieving and storing
> > 'clock-rates' during the ov8856_check_hwcfg() call, and then setting
> > the rate to the configured rate during probing.
>
> With assigned-clock-rates, you can simply use clk_get_rate().

Ah, I see.

I'll switch to that approach then.

>
> As you get the actual rate, it could be somewhat off of the intended one.
>
> --
> Kind regards,
>
> Sakari Ailus
