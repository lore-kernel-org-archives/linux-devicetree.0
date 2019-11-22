Return-Path: <SRS0=Wk4Z=ZO=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67756C432C0
	for <linux-devicetree@archiver.kernel.org>; Fri, 22 Nov 2019 07:52:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3B63420659
	for <linux-devicetree@archiver.kernel.org>; Fri, 22 Nov 2019 07:52:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="PgrQz9rj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726364AbfKVHwR (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 22 Nov 2019 02:52:17 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:46251 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726018AbfKVHwR (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 22 Nov 2019 02:52:17 -0500
Received: by mail-ot1-f65.google.com with SMTP id n23so5363037otr.13;
        Thu, 21 Nov 2019 23:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6CId69ZN8zw9ohBvU0FF7D9FcvCyDU1hZuuZbIs9xAk=;
        b=PgrQz9rjrPYZ3pN21PUePSus0Hm7Ex00MnpWWh+EGlQaEENkCr3yOLM3yDfYHWbblQ
         HOb4YnlLrWToHw9YIfP/xz9Td70mOM/w9HJn2rKpov5QOs7jtTaI9jX5F4bpG3CutoVd
         uoi90EAPJuxx8v8Zf1d4i9CgE1mJR2TjNapHNly5J/S5FnJ49gOYj5U0UQY5c6uOGOlo
         AUO0MhH7SX8/pl1qICwScMBngGfSb01TVj1ROQGMAtuoICBM4UpBO0Ty6BCjP+Vr/dEO
         rDuEprwXAsTDP0dYHmvhMDQa4pZRKndT+en6x+jE2O06OQIjZBogDi398DpnI09Y2Mau
         wW7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6CId69ZN8zw9ohBvU0FF7D9FcvCyDU1hZuuZbIs9xAk=;
        b=BZDlCB+hEeDKa8U+q8+MWNtSnyCNbQ8k3CRhDQXjdmN3KP+GLdu0kzLUf4k0IAq8f/
         50eT6rUBiK18RWSwNJTqwQZdm2MbmzFeyZTvylwd2XSx6tExqWXLTxdYPy6FNWIxYUMt
         u8Lv5X6rLQf3SmD+3t+Qg3xKmqqB84JdwFzasZ560MbU3yQ4W1em5gREFz1oVwuU/L4s
         qH9RwuB1c1MXRy4axPoMAHP/A/nclipwY9W8liWtr390Yo+zazrVJwtP2LEv4TETJLkQ
         4b9UxGIaQfqtsgWzV84XR33ABE1b8mWHKdLhKXj2LoiEgk6ErekK5O9OXx8EFy4EBoZP
         fP0w==
X-Gm-Message-State: APjAAAU8EWeWQaC4I128RC2DWfqU6RzMUCGlUai0TdyPDA6XLH9U2M36
        9jtC0fVTdYtA3jtefEwa0yMRLcTkxOdDeMmHe0l9HeGg
X-Google-Smtp-Source: APXvYqzeFxfrw01grEvs/XEDH0mG+F6i0yHJyLr4ROGX1swFEompn0SBsemnA3Zd+YXdUloDWqSTQ1PHx0UrFRvl8K4=
X-Received: by 2002:a9d:3e53:: with SMTP id h19mr9832272otg.98.1574409134946;
 Thu, 21 Nov 2019 23:52:14 -0800 (PST)
MIME-Version: 1.0
References: <1574405757-76184-1-git-send-email-hanjie.lin@amlogic.com>
In-Reply-To: <1574405757-76184-1-git-send-email-hanjie.lin@amlogic.com>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Fri, 22 Nov 2019 08:52:04 +0100
Message-ID: <CAFBinCDA=ZekRC0hgQnPLRZM3LMnqBZ6TWCvXhyixAmgDyTAsw@mail.gmail.com>
Subject: Re: [PATCH 0/6] arm64: meson: Add support for USB on Amlogic A1
To:     Hanjie Lin <hanjie.lin@amlogic.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, Carlo Caione <carlo@caione.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Liang Yang <liang.yang@amlogic.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Qiufang Dai <qiufang.dai@amlogic.com>,
        Jian Hu <jian.hu@amlogic.com>,
        Victor Wan <victor.wan@amlogic.com>,
        Yue Wang <yue.wang@amlogic.com>,
        Xingyu Chen <xingyu.chen@amlogic.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hello Hanjie,

On Fri, Nov 22, 2019 at 7:55 AM Hanjie Lin <hanjie.lin@amlogic.com> wrote:
[...]
>   dt-bindings: phy: Add Amlogic G12A USB2 PHY Bindings
>   dt-bindings: usb: dwc3: Add the Amlogic A1 Family DWC3 Glue Bindings
>   phy: amlogic: Add Amlogic A1 USB2 PHY Driver
drivers/phy/amlogic/phy-meson-g12a-usb2.c seems very similar to the A1
USB2 PHY you are introducing here.

>   usb: dwc3: Add Amlogic A1 DWC3 glue
drivers/usb/dwc3/dwc3-meson-g12a.c is also very similar to the dwc3 glue.

I have two questions:
- how is the PHY and the dwc3 glue different from G12A (or SM1)?
- why do we need a separate set of new drivers (instead of updating
the existing drivers)?

We try to use one driver for the same IP block, even if there are
several revisions with small differences (for example the SAR ADC
driver supports all SoC generations from Meson8 to G12A/G12B/SM1,
because 80-90% of the code is shared across all revisions).


Martin
