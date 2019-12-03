Return-Path: <SRS0=0idb=ZZ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3C8EC432C0
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Dec 2019 20:58:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AFCDE20661
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Dec 2019 20:58:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="SZ+1pVHo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727361AbfLCU62 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 3 Dec 2019 15:58:28 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:38887 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727295AbfLCU61 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 3 Dec 2019 15:58:27 -0500
Received: by mail-oi1-f195.google.com with SMTP id b8so4713923oiy.5
        for <devicetree@vger.kernel.org>; Tue, 03 Dec 2019 12:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=k08Tu4R7mIdBXzzLXcb2VOjUxXP2lhnZ8WU4w9CSb54=;
        b=SZ+1pVHornoIyHgteIvpizx7VVGkZbpRZvPvjReQPLduQiBvNYZk1Ot9au5iF5E4bZ
         dpeQba9uAoujZK1Agd0uNM5PjzqvSiIDdnITi4l3Rslwa/+1bhYsrexxLLt6n2EaycjW
         SRUYRcykSdmrwx/2QZg188o7zY5R96hoEmRxHUWmGu8B+VGvaqQ5YHKc6ECJCD1fxo+i
         HVmfjrBKAoxJyY/M19Mv54fNX7zNzB4edGxuM07q0jHkuV5MHgEOGNIM6GqLf+S9RaSv
         VGZ1bkvfzHSv80jIock3FXEuVjxhO3y42LuKkkD9uts7YySn0/7/22rA1pm3+fWtcrCf
         A1Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k08Tu4R7mIdBXzzLXcb2VOjUxXP2lhnZ8WU4w9CSb54=;
        b=tIdB26W/Dixgj7tTO+PptuH8N3IrH+PpZR326oKeL2RD6uue1u88Mj1EKm47tiWlzg
         Ms6w56sIEvaKlE5VG0tNRaI93z74BMz59bo5iueunviyMwVzbm/pH1sG315pFHI0J7g+
         9jWsmRP0q2Z0u2XkyIXsw6pfmdJasS5tKX1UcFLIm4krcoOB1eDK0oShefL63zQKnj0N
         pGM6bVD1E+Xhz69hE3YIFXQ4vNKV6kH1bkMj+uBuuXAL8fsznxD7oDS2UKRHcRTVUfF8
         I15hQ2tzkbNMAg01pIJfRPlaUrELzfWMAI+G2vVWvyE+gi2eqUSOVrNDXfrcQAOT7lzb
         t5Kg==
X-Gm-Message-State: APjAAAUAvcbZtujHv/Cvzlp/0Apr2gL8TQx8MMvoZipYlK7vicAa6iav
        A1RCQhY3InsqLNhXXuIzL277F2QvjETO7GQEz7w=
X-Google-Smtp-Source: APXvYqzcYa9U4pz5mY+YRFjfuWn85Y+s31Sn24jyMw4/wNe2W1wUT+pJWipghG1lTF5ijOBmH9WCCDQVyIFDd9hbg5s=
X-Received: by 2002:aca:dc45:: with SMTP id t66mr8073oig.39.1575406706818;
 Tue, 03 Dec 2019 12:58:26 -0800 (PST)
MIME-Version: 1.0
References: <20191130195335.17740-1-mohammad.rasim96@gmail.com>
 <20191130195335.17740-4-mohammad.rasim96@gmail.com> <CAFBinCCYzThAM_DkQyDZ2LrF-6bJoxeNZDtfADmWOxLH+B3AUw@mail.gmail.com>
 <20191202080203.js5fciajlf7qkgvw@manjaro.localdomain>
In-Reply-To: <20191202080203.js5fciajlf7qkgvw@manjaro.localdomain>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Tue, 3 Dec 2019 21:58:15 +0100
Message-ID: <CAFBinCA+yCKwj4qc_b-EOhkVDpvnOn-tDUE3TcGtC1r5_jOxGg@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] arm64: dts: meson-gxbb: add support for
 Videostrong KII Pro
To:     Mohammad Rasim <mohammad.rasim96@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Dec 2, 2019 at 9:02 AM Mohammad Rasim
<mohammad.rasim96@gmail.com> wrote:
>
> On 19/12/01 11:21PM, Martin Blumenstingl wrote:
> > [...]
> > > +       leds {
> > > +               compatible = "gpio-leds";
> > > +               status {
> > > +                       gpios = <&gpio_ao GPIOAO_13 GPIO_ACTIVE_LOW>;
> > > +                       default-state = "off";
> > > +                       color = <LED_COLOR_ID_RED>;
> > > +                       function = LED_FUNCTION_STATUS;
> > why is LED_FUNCTION_STATUS not enclosed in <> like color above?
> >
> Well, the examples in the documentation enclose the color and don't
> enclose function
> https://github.com/torvalds/linux/blob/596cf45cbf6e4fa7bcb0df33e373a7d062b644b5/Documentation/devicetree/bindings/leds/common.txt#L140
sorry for the noise, only now I realize that the LED_FUNCTION_*s are
string definitions and not numeric values
in this case all is fine

I learnt something new today ;)


Martin
