Return-Path: <SRS0=vtFV=5K=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E79EC1975A
	for <linux-devicetree@archiver.kernel.org>; Wed, 25 Mar 2020 13:01:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D7C1820772
	for <linux-devicetree@archiver.kernel.org>; Wed, 25 Mar 2020 13:01:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727277AbgCYNBX (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 25 Mar 2020 09:01:23 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:38072 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727177AbgCYNBX (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 25 Mar 2020 09:01:23 -0400
Received: by mail-oi1-f196.google.com with SMTP id w2so1973995oic.5;
        Wed, 25 Mar 2020 06:01:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6b9uuA0aNtQ3KS63dzxDL0TH4aJwxZd88qv2EmvcWpE=;
        b=HeYwlesruLmxbdtFbuxOGQkFBs5VaS14REB/5Ni/U5hI+MVLzbmMNdtGFjaLz+kI/X
         NuJ/V8DrYzQpN40vlkkDvaTDWO2bjuASh7V71mma//xUNJZX9pqpGPkQV46+2/pTpm4x
         tr1+4iGVXSvKRTGRaLciVsNqP2NlshWWBrXYdx8PITRPe1JgpMCeek++z2mzEu8BszTI
         TGgPeO5RUXx5Gd/5vlQuUOZeb4rU/PTrcBJ3MsWZHmaA2EiV6A5hVTfD3kZVrK3mJhPu
         eq+xTueXMD6di9a7olFWyOtaFU8aBCHkb1GyV3CwGL4rxw6C1zx5rtTBM51S5z1jMzAV
         oXHg==
X-Gm-Message-State: ANhLgQ0vmit5BV917VNyN/9ONRuHGSJ/9DOBRFgvg2xc5DkEXNUI4ZNW
        gGAFHrHNArsmvnreAmbhOC81a6U2svCIOwBoUqfUsg==
X-Google-Smtp-Source: ADFU+vv5gCYsq60DuC9OSj7OhQUx4TSjxP9nV6u3006GjlU/JO71QZ2I22FI/FT/7ClTr1OI2Inf3NZOJmRiujI0yYM=
X-Received: by 2002:aca:4e57:: with SMTP id c84mr2275379oib.148.1585141282795;
 Wed, 25 Mar 2020 06:01:22 -0700 (PDT)
MIME-Version: 1.0
References: <1585117006-8266-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1585117006-8266-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1585117006-8266-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 25 Mar 2020 14:01:11 +0100
Message-ID: <CAMuHMdVm2yQsKmj5es_mhMpuz5THP6+Tr9HoTnepKXG4ExDFMg@mail.gmail.com>
Subject: Re: [PATCH 3/3] dt-bindings: usb: renesas,usb3-peri: add r8a77961 support
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Mar 25, 2020 at 7:18 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> This patch adds support for r8a77961 (R-Car M3-W+).
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
