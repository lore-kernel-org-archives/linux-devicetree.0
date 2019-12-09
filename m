Return-Path: <SRS0=leSB=Z7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39E34C43603
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Dec 2019 20:23:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 02C822068E
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Dec 2019 20:23:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iEEtxuDJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726589AbfLIUX1 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 9 Dec 2019 15:23:27 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:40423 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726483AbfLIUX1 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 9 Dec 2019 15:23:27 -0500
Received: by mail-oi1-f195.google.com with SMTP id 6so7592215oix.7
        for <devicetree@vger.kernel.org>; Mon, 09 Dec 2019 12:23:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Zb2z1zh/PIMzhw5YuaHgoz9OhiNEP+lZ66Mh07HK17M=;
        b=iEEtxuDJYa+g2J9VBtV1qwh8N5zKCj9QsMm9jTr2sOBLMb3hCbbxt7jYIbCz0YvFjk
         dTS6vE4Wn0E/mazaqxrbnwAHcGpEEqkMY3tX7vuNBvvps0U7k05iOuqBMUK9Ak1IIgba
         lzoceXwvdxIVz1m3hwg+mGQpGdwNVdipSkbGpWpiIAnZx6eDuigtTIKQnLa6B8W5Vab3
         2dmpKaxWL6+UEq6DxQYAG1iNuBqMbkt5Ivyf2rYGTliP8+zC4S0zVx2V1ORNTqa1YfZv
         m72I9kF/Y5ik/kzpfJAd8nCu9KRnAHlEDCiYrN9wqHjSqoS4ZIpqJkligqAAH60+7ujk
         3QMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Zb2z1zh/PIMzhw5YuaHgoz9OhiNEP+lZ66Mh07HK17M=;
        b=V9Al1NbR878M/xfOW6dM8mZalwBECxh9yYUEFQHBAZOgt63uRnBGIVG1LAcDbVYQxZ
         rdakp1Y6elL6YJm3OAaWQCoA4IMGW6yZMWDVLUNIaBgQtNAPHlPPGovfj9fvwmpLAeh6
         KJmEVs0nV+QnwKAZmGtJ8yYA/BlokqjWvs3UgHXnE8uxpmAcivXJc9NT6R2mrXEKFoqY
         /Mh4uNrQEukrS9IJyiZa3vj1ghXeulk6JLanjGTp1r/8BP9/6A+5NVxzL1C/LNthCPDe
         EAhOjk6KcJBYbHkQ7jMsG9eZGhhlGU03Ott4xbk169wGk+iaYq3zFXAln0VOS/TLS/yL
         Bxsg==
X-Gm-Message-State: APjAAAVg0eKWpO9CDb2R/5VVk5ZFbYzLDfv9UXdzm3R1gCtx3WYU7qF+
        MwreL0YCf3FSGr4qnSPvbSiKxQYnh9/25OCvBEg=
X-Google-Smtp-Source: APXvYqyDDNE9/rLQegvz6/oBL9hwxhdlCfxJI17/tIDMmTvRsbRghB5eJVsPTc1bZqHpyayNj7SMNqn9hYbaHIoC7Ws=
X-Received: by 2002:aca:c3c6:: with SMTP id t189mr895697oif.98.1575923006414;
 Mon, 09 Dec 2019 12:23:26 -0800 (PST)
MIME-Version: 1.0
References: <20191203021420.164129-1-anarsoul@gmail.com> <20191209193112.qr6un5ryhyxwu6a5@hendrix.lan>
In-Reply-To: <20191209193112.qr6un5ryhyxwu6a5@hendrix.lan>
From:   Vasily Khoruzhick <anarsoul@gmail.com>
Date:   Mon, 9 Dec 2019 12:23:18 -0800
Message-ID: <CA+E=qVcxXu4CggnhZFti-J4MB5m3pvoxKCHnH6ap-4OSZMzCFQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: allwinner: a64: set GPU clock to 432 MHz
To:     Maxime Ripard <mripard@kernel.org>
Cc:     Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        arm-linux <linux-arm-kernel@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Dec 9, 2019 at 12:03 PM Maxime Ripard <mripard@kernel.org> wrote:
>
> Hi,
>
> On Mon, Dec 02, 2019 at 06:14:20PM -0800, Vasily Khoruzhick wrote:
> > That's what BSP kernel sets it to and it seems to work fine.
> >
> > Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
> > ---
> >  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> > index 27e48234f1c2..0051f39b3d98 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> > @@ -976,6 +976,9 @@ mali: gpu@1c40000 {
> >                       clocks = <&ccu CLK_BUS_GPU>, <&ccu CLK_GPU>;
> >                       clock-names = "bus", "core";
> >                       resets = <&ccu RST_BUS_GPU>;
> > +
> > +                     assigned-clocks = <&ccu CLK_GPU>;
> > +                     assigned-clock-rates = <432000000>;
> >               };
>
> This doesn't really guarantee anything. If the GPU needs to remain at
> that rate, it should be set in the driver. I just saw that you did
> send a PR in github, I just merged it.

Lima doesn't set GPU frequency at all since it's different for
different SoCs and we don't support operation points nor frequency
scaling yet.

So this change effectively sets GPU frequency to 432MHz on A64 when using lima.

>
> Maxime
