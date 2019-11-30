Return-Path: <SRS0=1K1h=ZW=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE65FC432C0
	for <linux-devicetree@archiver.kernel.org>; Sat, 30 Nov 2019 19:25:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8C0892072C
	for <linux-devicetree@archiver.kernel.org>; Sat, 30 Nov 2019 19:25:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="gpX5A2aC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727027AbfK3TZk (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 30 Nov 2019 14:25:40 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:34640 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726981AbfK3TZj (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 30 Nov 2019 14:25:39 -0500
Received: by mail-oi1-f195.google.com with SMTP id l136so13252436oig.1
        for <devicetree@vger.kernel.org>; Sat, 30 Nov 2019 11:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BnMc24+B70/Q5ugWCE/LR1YkmepW1gWZgz/E3ooHThA=;
        b=gpX5A2aCEhk8sEvvIUDdtD9GglmIYsxqJrEtQj4mwza+JfgX28m0m+KJed0n4m4yBr
         di7TIw5RfjMvPicZEptNPcCAX3kF4ttUrHHx6GFCH8nMe94n/hWbwr8yd7G3NwzS3Zvm
         eQE9Tm91b90+X27Ai6OqJITulFTSTQZI2SDlsggoPnxrz032yGIPTvdHRQsVVStyYyP0
         RPp9UewzFVZAczmqyiQzJ+00LNJzMPpF+Z2zOGRbYLBz2NuzwASU0v5R/bELuKlT51bm
         4BYuBhDVP4hELFlb/HL5I6xHbp/WloD1P5O23IGYNVbCgICJ8hAVL0kLhbCOhDetUMTc
         FU8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BnMc24+B70/Q5ugWCE/LR1YkmepW1gWZgz/E3ooHThA=;
        b=WY2ag4Rb/0JnSfXWphbYQRDzUoj4PbkXfjzxm3q6w1AjVQNU+uQHkxRhju1DQFUTUK
         dcLZZJmSZ28fFjk/hX73N9cOorzflWdW0a15Mjtf4htF5fPVZIJ8JBFAuB1WrwR+Fec2
         XWUA389p67GuCLvgJvbxc7XUTP7lVFERKEUnj1xk+AdiAjwElFVJCbKTmroMW7Cw39eF
         PC1UMFERVNdDWD4cYPt9wuApf3OAWPzhXocFhIajCktFB25dO+0N8n+Ob0fl5cAizbZ7
         Nnj68uCNvEkZRdxBuS8WoYQ5ywpEpZ+h5cwCoozvgd+Thw9MfoKIgKj2zXXxXdYCYrKC
         EiVQ==
X-Gm-Message-State: APjAAAUnWUrgKLuCFvv6PJiwNUPc80JFzyHvfh9HwIvVKHuMa/A/PgxB
        7jyhfAkB++CbZQYE+LkL+8EVV3NAl+3VHGk0qHY=
X-Google-Smtp-Source: APXvYqyrlrd69onpSTv26wSUvL4E3A2ZXS9gVikG2aKU4RwOanHbThAgXtbeLWh2SzevU2xow5kWcn8kSx12D3twlhE=
X-Received: by 2002:aca:dc45:: with SMTP id t66mr1767282oig.39.1575141937114;
 Sat, 30 Nov 2019 11:25:37 -0800 (PST)
MIME-Version: 1.0
References: <20191130115824.31778-1-mohammad.rasim96@gmail.com>
 <20191130115824.31778-3-mohammad.rasim96@gmail.com> <CAFBinCAxt5v6K3qcWeaECnqufRpb-0OK-Q+QFR+qph_tPVaXvg@mail.gmail.com>
 <20191130174753.6ajv5spl6n3ojhqy@manjaro.localdomain> <CAFBinCBdGHX2dR89C+sy+v_ZmPPeu95GGDu1t0E03TYg33SChQ@mail.gmail.com>
 <20191130190702.52zjhlh65gpq2ugj@manjaro.localdomain>
In-Reply-To: <20191130190702.52zjhlh65gpq2ugj@manjaro.localdomain>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Sat, 30 Nov 2019 20:25:26 +0100
Message-ID: <CAFBinCD4otHpey+A3G2sdo1K-Z8Ed6OSa2BerW-q7t9irZPnvg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: meson-gxbb: add support for
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

On Sat, Nov 30, 2019 at 8:07 PM Mohammad Rasim
<mohammad.rasim96@gmail.com> wrote:
[...]
> > > > > +       leds {
> > > > > +               compatible = "gpio-leds";
> > > > > +               red {
> > > > > +                       label = "status";
> > > > this property seems to be deprecated now, see
> > > > Documentation/devicetree/bindings/leds/common.txt
> > > > but I'm not sure whether Kevin has made a decision yet when to not
> > > > accept "label" properties here anymore
> > > OK, I will remove the deprecated property
> > > but I'm not sure what should I choose as a function, LED_FUNCTION_STATUS
> > > or LED_FUNCTION_ACTIVITY ?
> > I haven't used function and color myself but I believe it works like
> > this (untested):
> > - add an #include <dt-bindings/leds/common.h> next to the other
> > #includes (keep alphabetical ordering). this include file also
> > contains all the #defines for color and function
> > - add a color property, for example: color = <LED_COLOR_ID_RED>;
> > - add a function property, for example: function = <LED_FUNCTION_STATUS>;
> > - test, debug and fix potential issues ;)
> Yes, I've already tested it but I'm just not sure what should be in the
> function property, LED_FUNCTION_STATUS and LED_FUNCTION_ACTIVITY both
> seem like good choices,
I haven't considered "activity" before, but most of our boards with
some kind of status LED use status in the label
unless someone objects: choose the one you like most

[...]
> if this property only used to lable the led then LED_FUNCTION_STATUS is
> ok, but maybe this is used by userspace to trigger the led ?!
in general devicetree describes hardware
I don't know if userspace does something "automatically" based on the
function. however, my expectation is that the trigger from
"linux,default-trigger" is used (if set) and that you can change the
trigger from userspace manually (if you wish)


Martin
