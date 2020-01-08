Return-Path: <SRS0=aplZ=25=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B767C282DD
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 17:48:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 671EA20705
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 17:48:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LTssbe7x"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729089AbgAHRsP (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Jan 2020 12:48:15 -0500
Received: from mail-vk1-f195.google.com ([209.85.221.195]:46917 "EHLO
        mail-vk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729052AbgAHRsP (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Jan 2020 12:48:15 -0500
Received: by mail-vk1-f195.google.com with SMTP id u6so1186275vkn.13
        for <devicetree@vger.kernel.org>; Wed, 08 Jan 2020 09:48:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6fjeBXfdA5v8j8/xbcj6l8Tou8rGGc9L+qfhjRz0QRI=;
        b=LTssbe7xKtfJVDgsmMn2w88kRfx17N272Mz1utTbhfsLCjMFjPKI/5jq1OVsGaqA/q
         XdMmhJqxW1e83ABFojZyXrW0egWKzCycXb0O62a+JoAHeY5Xx8k6d+4OXPTQq+lexwaq
         twnq+XxLCP5A58S4nIVyd5jdb6MYrvhrtWTf8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6fjeBXfdA5v8j8/xbcj6l8Tou8rGGc9L+qfhjRz0QRI=;
        b=FJBFjKkqB9s+QUOXJ6BA6V7RJ4ZaX9LNaWtcVkwakw/nGoIIvfeP5VC5uTgF1+3QQX
         o/zSHLQMMS033Bqyqzoq2ByTkqmLxv9Oh9G9Doaz6oMxDcteI2+oBRV8hK1Yb5xdXKpF
         LWVLXeVDpeBWBgYRs3c1auQyGmv/dgPUqKPCe5Ni6CCR/dbEWZTwPJcqwmimd/bdYb+/
         gRZJ3KMpQ+68rVvpQdrK1awaIp6dYbLLFjO0fBJ08GpMRlJReL70RhsGj306bcAgrj5r
         a1aK5z1ZWSCbn3DOciSDa1PRk+joPTBh39DDgDw1Ftiu5GSxKpaCDm6RPI3Bw79PG1u9
         nehQ==
X-Gm-Message-State: APjAAAUuojNURdw8N1lOPFQoPMNLlwrQ1qakbkpgZaKyxxFuP4vRGFhT
        jMMvh4q4So+E9Zr/ZrjWA4l51ZXpQ9g=
X-Google-Smtp-Source: APXvYqyTNrodS0TlQ5utUFZMu/sZc6HZStDn+qK3phMxPfatRrLWcCkr+b/WxSO4kvLgbzVOUsGT8A==
X-Received: by 2002:a1f:5fc1:: with SMTP id t184mr4056817vkb.57.1578505693691;
        Wed, 08 Jan 2020 09:48:13 -0800 (PST)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id x9sm998237vsf.7.2020.01.08.09.48.12
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2020 09:48:12 -0800 (PST)
Received: by mail-vs1-f42.google.com with SMTP id x123so2431198vsc.2
        for <devicetree@vger.kernel.org>; Wed, 08 Jan 2020 09:48:12 -0800 (PST)
X-Received: by 2002:a67:e342:: with SMTP id s2mr1091753vsm.198.1578505692418;
 Wed, 08 Jan 2020 09:48:12 -0800 (PST)
MIME-Version: 1.0
References: <20200108092908.1.I3afd3535b65460e79f3976e9ebfa392a0dd75e01@changeid>
In-Reply-To: <20200108092908.1.I3afd3535b65460e79f3976e9ebfa392a0dd75e01@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 8 Jan 2020 09:48:00 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WFCjzRGv=8C-LU9O+fRi_C6E6zuyM7SyAX7CWx=wHnGw@mail.gmail.com>
Message-ID: <CAD=FV=WFCjzRGv=8C-LU9O+fRi_C6E6zuyM7SyAX7CWx=wHnGw@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: rockchip: Use ABI name for recovery mode pin on
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

On Wed, Jan 8, 2020 at 9:29 AM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> The recovery mode pin is currently named 'REC_MODE_L', which is
> how the signal is called in the schematics. The Chrome OS ABI
> requires the pin to be named 'RECOVERY_SW_L', which is also how
> it is called on all other veyron devices. Rename the pin to match
> the ABI.
>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
> Another misnamed pin, I should have noticed when fixing the
> name of the write protect pin ...

...and I should have noticed when reviewing.  Sorry about that.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
