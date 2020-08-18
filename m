Return-Path: <SRS0=iTj2=B4=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3AF8C433E1
	for <linux-devicetree@archiver.kernel.org>; Tue, 18 Aug 2020 03:03:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7A5ED206DA
	for <linux-devicetree@archiver.kernel.org>; Tue, 18 Aug 2020 03:03:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RYHArkFo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726365AbgHRDDO (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 17 Aug 2020 23:03:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726302AbgHRDDL (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 17 Aug 2020 23:03:11 -0400
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1EF9C061389
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2020 20:03:10 -0700 (PDT)
Received: by mail-io1-xd42.google.com with SMTP id h4so19768361ioe.5
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2020 20:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eKAWzYNYaU6JFfG0ymLmU9yELeTD/hTkpBoT+dVsEtU=;
        b=RYHArkFoy/sHeUDVoHzXXD3Jk6Kic4vQEVoeYDt3H1laHzpN0tD49E/Xj2tcnwyH/i
         W7BhVB4R1/h/02Y4qySmekwJTkK902ZrQGjjsX8Tzuug/oolz+2uynRYF9kV/WmP1MVX
         SbQYvJ0FwZV4NGBfX+zIGo34iJs5jkKDhLX+0oLjfn8H2k4XfSazLH4zwyDH4HjLpabE
         de5s7OWaGgfpP2a2YHRyZFuoz6cG3WcG+WHn/nBUqFqF+0TR4gB/4UJwWSfvP71gSJCt
         0ZD4cVFJ2j+AfyhezV5M8bVIjC1tkdhI4/JBSmOqRebcmwTBgIJ3wYvpZL4w7/eeOpq1
         svAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eKAWzYNYaU6JFfG0ymLmU9yELeTD/hTkpBoT+dVsEtU=;
        b=hHZOoXGlvIO3rFQSMmFO712Ue+wiAqMrxPAbjezVkGkyfZlfA/jJ4phVa3qDI50GMQ
         hZdel/l2BNOJBkgvKropeJu9sqvBHEH8tjDoOxk+0tZGoX+jx+jxId+bDHJJPqASNYXJ
         +vQWKpaIYSgolY1wd2Zpez8VyhlogsQxvV8vdeTGZU5426zNAmqzUAvRyDtM87mzx76j
         vmXnD2mizVk8kO7ZQSBT2xwp6f538OqOGu/lI0KsJ/sZq9qgyDtcr8y75zdr+tWLjNAX
         OTOSMRoGUDuqpUa5urmZHKUUcau+QTXV/RrdAPNzyKmo7dYM7CgCkqYsXQZqkrm1MnRR
         0p5w==
X-Gm-Message-State: AOAM533NQ6XKtE0HaeS1Dccm/Rtt7t8fV2LrjW6jHg98+7/xoJQkptd6
        wEKSMlcNhT8Oeohulu2IoU6rWBpQIbpSrsOTg9RxuFh53xs=
X-Google-Smtp-Source: ABdhPJwO3NPmdxsDbX920pGQbMgZOsuQDFoUtU5IZdNYu9vR7YhfgcpgJed/o9z/0DY6T5dFcWS4dYqSQanbT+uXjf8=
X-Received: by 2002:a05:6602:811:: with SMTP id z17mr14607839iow.110.1597719790018;
 Mon, 17 Aug 2020 20:03:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200817102122.434-1-linux.amoon@gmail.com> <20200817102122.434-2-linux.amoon@gmail.com>
 <CAFBinCCYgm83Vs+dq6G4+1wv7T=S0mzt=gtLaHDfgBrCeRkk5A@mail.gmail.com>
In-Reply-To: <CAFBinCCYgm83Vs+dq6G4+1wv7T=S0mzt=gtLaHDfgBrCeRkk5A@mail.gmail.com>
From:   Anand Moon <linux.amoon@gmail.com>
Date:   Tue, 18 Aug 2020 08:33:00 +0530
Message-ID: <CANAwSgTqAEyKFFan=opdF3MLtvkwj5MZ=oEizjeZNEfhL8ZzKA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] arm64: dts: meson-g12b-odroid-n2: Enable RTC
 controller node
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-amlogic@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Christian Hewitt <christianshewitt@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Martin,

Thanks for your review comments .

On Tue, 18 Aug 2020 at 01:06, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Hi Anand,
>
> thank you for updating this patch!
>
> On Mon, Aug 17, 2020 at 12:21 PM Anand Moon <linux.amoon@gmail.com> wrote:
> [...]
> > changes v2
> > --Fix the missing INT (GPIOA.BIT7) pinctrl.
> should I also expect an interrupt property somewhere below?
>
> > --Fix the missing rtcwakeup.
> > --Drop the clock not required clock property by the PCF8563 driver.
> > ---
> >  .../arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
> > index 34fffa6d859d..f08ae1b337ad 100644
> > --- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
> > +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
> > @@ -477,6 +477,19 @@ hdmi_tx_tmds_out: endpoint {
> >         };
> >  };
> >
> > +&i2c3 {
> > +       pinctrl-0 = <&i2c3_sda_a_pins>, <&i2c3_sck_a_pins>;
> > +       pinctrl-1 = <&tdm_c_din3_a_pins>;
> > +       pinctrl-names = "default";
> why is there pinctrl-1 without any corresponding "pinctrl-names" entry?
> also I'm surprised to see a TDM (audio) related pin function as part
> of an I2C controller. if this is correct then I'd appreciate a bit
> information (for example as part of the patch description) why that is
>
>
> Martin

Opps, I could not figure the difference between GPIOA_7 and GPIOAO_7 pins
I will try to figure out the correct configuration pin for this node.

Best Regards
-Anand
