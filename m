Return-Path: <SRS0=uzRV=5Q=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CEC9C43331
	for <linux-devicetree@archiver.kernel.org>; Tue, 31 Mar 2020 13:37:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E153D2071A
	for <linux-devicetree@archiver.kernel.org>; Tue, 31 Mar 2020 13:37:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f6egg8JB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730923AbgCaNhf (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 31 Mar 2020 09:37:35 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:38831 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730915AbgCaNhf (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 31 Mar 2020 09:37:35 -0400
Received: by mail-ot1-f68.google.com with SMTP id t28so22011226ott.5
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2020 06:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BPQgN4wp/xTiSdMQdV45T5G+Dpby0aslGWWXLQEqKs8=;
        b=f6egg8JB2oXmb5ZDcYSi37IoKdai/7O4iwDdS9tB5EdjG1fdejo+ualHWyXatNehYR
         MzuHVPjLmDt6I3mEnAV5vFbzaEDV3VPFLNpNOh9u1Y40GU1HMTPq3hWa6Ce+M6GQiG4b
         mneV32UAu3ydLOrO+Z4VV8rcPZmrygUm8uZsnmj/Te1Ef8SFeyqA5s845DdfJ+euHwLY
         NeaZljdmTifBJtQuuV/ekejxCON62UGXsMwWI8Sc7UbD5+iHUWdzyxY3T4ka19793baM
         Nl/S/m+Mys1Ba6C0/1gDd20aGwIa+3Sko7XR8PvXx54mJfhNJ4jofvoAtgq17f+5ntL1
         uQ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BPQgN4wp/xTiSdMQdV45T5G+Dpby0aslGWWXLQEqKs8=;
        b=aMnpDf7ZOXKoWl6sN7A73DrAlIDmx4lbPZlszHkOi/McVPpiPUrMEriNC5/MqnHZ8p
         5r/rmqXydpM2Baw8+VBjUCAmVnPiCIPfOse72+ANSHelai485wVJH45dqqPXMCTJC5Gn
         aOpJ2BjVu0krdGy/gauIWLYhWlZTPnbr9gV3st+GfhdIf6zHDQpO5Va7udvcgactxoNB
         6H3oJuZkZjXL1YZoR/01076b9N4Zimq1CJ5LaSi8SN1natKKnGZNpRL2glr7OkG3BmG/
         kHLxGVxyK9pHeiiEysAwS0jpvOi+Zg8A3A+eKEamX2zqG7OCuk2Kvy6T3npIP6ljddpS
         b8wA==
X-Gm-Message-State: ANhLgQ2GD2ApmL+r5A0yRJs9nThPMEmbXUjGbwshTD7EZ40sNmDKS7Hz
        tM4pzpTdgdUZf5Q4nO/VGg0naRFdGLG9KQtGgqrKYg==
X-Google-Smtp-Source: ADFU+vt5IKuc9tkmr+ASuJda0bZuWGWC0a0b+1r6JL9yr89+s9e71Nso2ucKWJ4k0ClJnzYWXoG2EP313c1QbdzqZj8=
X-Received: by 2002:a9d:6c88:: with SMTP id c8mr12319517otr.272.1585661854175;
 Tue, 31 Mar 2020 06:37:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200313110350.10864-1-robert.foss@linaro.org>
 <20200313110350.10864-3-robert.foss@linaro.org> <CAOMZO5D9bmXt9_qGTXw+qUG6JDHfuNtx++fJPJtn+mj1Dzsbag@mail.gmail.com>
In-Reply-To: <CAOMZO5D9bmXt9_qGTXw+qUG6JDHfuNtx++fJPJtn+mj1Dzsbag@mail.gmail.com>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Tue, 31 Mar 2020 15:37:22 +0200
Message-ID: <CAG3jFystdBKnosNQ0LeWQfHEtMgU4iGSr_XuS2XU3-902c31nQ@mail.gmail.com>
Subject: Re: [v2 2/3] media: ov8856: Add devicetree support
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
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

On Thu, 26 Mar 2020 at 13:18, Robert Foss <robert.foss@linaro.org> wrote:
>
> Hey Fabio,
>
> On Fri, 13 Mar 2020 at 14:15, Fabio Estevam <festevam@gmail.com> wrote:
> >
> > Hi Robert,
> >
> > On Fri, Mar 13, 2020 at 8:04 AM Robert Foss <robert.foss@linaro.org> wrote:
> >
> > > +static int __ov8856_power_on(struct ov8856 *ov8856)
> > > +{
> > > +       struct i2c_client *client = v4l2_get_subdevdata(&ov8856->sd);
> > > +       int ret;
> > > +
> > > +       ret = clk_prepare_enable(ov8856->xvclk);
> > > +       if (ret < 0) {
> > > +               dev_err(&client->dev, "failed to enable xvclk\n");
> > > +               return ret;
> > > +       }
> > > +
> > > +       gpiod_set_value_cansleep(ov8856->reset_gpio, GPIOD_OUT_HIGH);
> >
> > The parameter of gpiod_set_value_cansleep() is typically 0 (inactive
> > state) or 1 (active state), so:
> >
> >  gpiod_set_value_cansleep(ov8856->reset_gpio, 1);
>
> Ack

After testing this change, it breaks the driver during probing.
I had a quick look into GPIOD_OUT_HIGH & LOW definitions, and they
seem to never be 0 or 1.

https://elixir.bootlin.com/linux/latest/source/include/linux/gpio/consumer.h#L38

GPIOD_ASIS = 0,
GPIOD_IN = 1,
GPIOD_OUT_LOW = 3
GPIOD_OUT_HIGH = 7
