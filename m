Return-Path: <SRS0=Tw2w=2K=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3E53C2D0DB
	for <linux-devicetree@archiver.kernel.org>; Fri, 20 Dec 2019 15:51:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A74A421D7E
	for <linux-devicetree@archiver.kernel.org>; Fri, 20 Dec 2019 15:51:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727565AbfLTPve (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 20 Dec 2019 10:51:34 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:40432 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727411AbfLTPvd (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 20 Dec 2019 10:51:33 -0500
Received: by mail-oi1-f195.google.com with SMTP id c77so4312635oib.7;
        Fri, 20 Dec 2019 07:51:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tulvWuO+lfC11OaHpbro2bnBMTva8CQZsIKaKyF21W0=;
        b=UJwup9Bb3803MRbopQr7p+m07N32OBnvrYjf3nfv2bMTBfuZT4uGwPUXhSGYz7IDxy
         mrDVj83hk2vcf3nHWlMe8+AxPjBhqQwyoFat83iwDDd7eZIXhJ/gepyoTSnjQIMB4vP1
         ScpZE11mrJHHL7YyMP79KM3bqOpWkPoO8jaIt0fOYFbGiPr0H4s3zxuWQVJ5ixxLA1JT
         vuWW374yedPCiNfFgpa5k7f84q0199vK8WRJyZrmupiZzSywly+saJCCnV5YhRAOIdjn
         JLWeRqOTui3nAEhVPN5zc5Onl+pUJzRk27AVAsFSA0sU9DV3mv6XSmNGc0roe1zEaRo0
         MVZw==
X-Gm-Message-State: APjAAAVLBdsuh8zyW5nBUTKs0u+qo3uReb9CK6HtpX2c0xaMBuGNFLwx
        5oSg53cLathP9KJwAuazTq68Dr7/2pmzhsjkew8=
X-Google-Smtp-Source: APXvYqzchUhqLwQiMfXZKXZyP7v8fIN2PO8DqcEhtTUOkjyL7QPAh7bHF/N4b1oZe/fFPjGrc7KJChncR16AfjCVknA=
X-Received: by 2002:a05:6808:292:: with SMTP id z18mr648668oic.131.1576857092572;
 Fri, 20 Dec 2019 07:51:32 -0800 (PST)
MIME-Version: 1.0
References: <20191213164115.3697-1-geert+renesas@glider.be> <506390662.44203.1576307324771@webmail.strato.com>
In-Reply-To: <506390662.44203.1576307324771@webmail.strato.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 20 Dec 2019 16:51:21 +0100
Message-ID: <CAMuHMdVfV1u_fWGSP7SyDDR4vCB2qVkibr0irtUMnSfoh=nGUg@mail.gmail.com>
Subject: Re: [PATCH 0/7] arm: dts: renesas: Group tuples in
 reg/ranges/dma-ranges/states properties
To:     Ulrich Hecht <uli@fpond.eu>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sat, Dec 14, 2019 at 8:08 AM Ulrich Hecht <uli@fpond.eu> wrote:
> > On December 13, 2019 at 5:41 PM Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> > To improve human readability and enable automatic validation, tuples
> > in various properties should be grouped.  While "make dtbs_check" does
> > not impose this yet for all properties, it does for some, hence
> > triggering me to fix (I hope) all of them.
> >
> > Unfortunately even after this, a few "... is too long" warnings are
> > still printed (e.g. for PCI "ranges"), which I believe are false
> > positives.
> >
> > This series is against renesas-devel-2019-12-13-v5.5-rc1[*] with
> > "[PATCH] ARM: dts: rcar-gen2: Fix PCI high address in
> > interrupt-map-mask" applied on top.
> >
> > Thanks for your comments!
>
> For the whole series:
> Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>

Thanks, queuing in renesas-devel for v5.6.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
