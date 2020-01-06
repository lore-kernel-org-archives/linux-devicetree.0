Return-Path: <SRS0=ND8X=23=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAD7DC33C9E
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jan 2020 21:53:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 754202080A
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jan 2020 21:53:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KvRZwXcj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726695AbgAFVx4 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 6 Jan 2020 16:53:56 -0500
Received: from mail-vs1-f66.google.com ([209.85.217.66]:38362 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726713AbgAFVx4 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 6 Jan 2020 16:53:56 -0500
Received: by mail-vs1-f66.google.com with SMTP id v12so32604036vsv.5
        for <devicetree@vger.kernel.org>; Mon, 06 Jan 2020 13:53:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=faKcBWRoBE2UlX7M22RMok2qsMWbJzCtmjkdjEhBadM=;
        b=KvRZwXcjreqaUPQ8TQS+8WGmX5JXgVz7Aa9cosBD9uIqp73RCLi8IaddTYv+Bb9+h7
         GG8wLl5227sVwjU/+vyr0VolH7MIFadz+ccCHeWYZfBVvNx1dQAAE2/51+k1bF87UHvw
         VrZJS+oLe9imzSxxt+SDyBB4xP9x9UU2clpSE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=faKcBWRoBE2UlX7M22RMok2qsMWbJzCtmjkdjEhBadM=;
        b=KJIeIpci7C2/UpO3af4PebWFH4k4GQhuIiUyrLgxT0g0xjgWtN3/yyvJIgtAV4XBmv
         qCwy3fEa5CmqIWFddGVwmOLFwy1hCulNLPsZjH+QS4EIKOwg4IncetssvCkYdrMTCaAg
         UkaLlZnhVmbpe24f7MiHjQR/IxAtJZyhUBYZfVydsOhn7HopU9hI4pbfYvluCoyVBKCP
         Q/irqBku5g1EEjpdcA1weyG+wv79gs+Hy3zEkBhefU0dcP2n3+GJk2LRGJBR7x7sXB6l
         QyCrGTBcMVlkMe9oVMbrHGNuHdVDWcs8DSHyWVTlqYwvg7wOzEKQpNTWVJf2fP75Ez3H
         KS2g==
X-Gm-Message-State: APjAAAXLL0yU8V2E1VQS5hdrz9E3wPxwT4/lUz+UA5wjrj1smAMw0nQH
        EfpNWdJ/GdNj+/U8Lw49EAViaNOkqsQ=
X-Google-Smtp-Source: APXvYqykes5ZdSwYqTRbECM2SEFSxgrqAqScXA8tmN2Fg2b1qLzfn749ZRuWEFGt1b/F7TOj12PW9g==
X-Received: by 2002:a05:6102:1255:: with SMTP id p21mr43742934vsg.224.1578347634464;
        Mon, 06 Jan 2020 13:53:54 -0800 (PST)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id m11sm18766357vkl.31.2020.01.06.13.53.53
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2020 13:53:53 -0800 (PST)
Received: by mail-vk1-f169.google.com with SMTP id s142so12894632vkd.9
        for <devicetree@vger.kernel.org>; Mon, 06 Jan 2020 13:53:53 -0800 (PST)
X-Received: by 2002:a1f:2197:: with SMTP id h145mr55322972vkh.75.1578347632921;
 Mon, 06 Jan 2020 13:53:52 -0800 (PST)
MIME-Version: 1.0
References: <20200106135142.1.I3f99ac8399a564c88ff48ae6290cc691b47c16ae@changeid>
In-Reply-To: <20200106135142.1.I3f99ac8399a564c88ff48ae6290cc691b47c16ae@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 6 Jan 2020 13:53:41 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WcpjiVQ6zNN8fO4ZUCTr6GZkcPXjMW1hq8fvif6_QBpw@mail.gmail.com>
Message-ID: <CAD=FV=WcpjiVQ6zNN8fO4ZUCTr6GZkcPXjMW1hq8fvif6_QBpw@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: rockchip: Use ABI name for write protect pin on
 veyron fievel/tiger
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On Mon, Jan 6, 2020 at 1:52 PM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> The flash write protect pin is currently named 'FW_WP_AP', which is
> how the signal is called in the schematics. The Chrome OS ABI
> requires the pin to be named 'AP_FLASH_WP_L', which is also how
> it is called on all other veyron devices. Rename the pin to match
> the ABI.
>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
>
>  arch/arm/boot/dts/rk3288-veyron-fievel.dts | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
