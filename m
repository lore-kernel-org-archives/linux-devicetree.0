Return-Path: <SRS0=ng1M=2Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34155C00523
	for <linux-devicetree@archiver.kernel.org>; Sat,  4 Jan 2020 00:40:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0858920866
	for <linux-devicetree@archiver.kernel.org>; Sat,  4 Jan 2020 00:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578098414;
	bh=sZyP0e+mjnxwlVWNCOgdOMQRJvAWhS76NcGzrvEEwbs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=w9nsvzv2TOpmfWfg8+XLxImStUBEpilpIz/0ri6H0I0xBMXmB67s4QbuqTwD0tYPo
	 7wY83V781e5msd1DaZjgu9FIjkFBViPQxCt7DfdllrHxwnPMKeq74Mgek0NeX/gcnE
	 Kp22zLvyivF1qo1o9LrgJY0AFSpkRARiwbtDFU4s=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726911AbgADAkN (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 3 Jan 2020 19:40:13 -0500
Received: from mail-il1-f193.google.com ([209.85.166.193]:34800 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726229AbgADAkN (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 3 Jan 2020 19:40:13 -0500
Received: by mail-il1-f193.google.com with SMTP id s15so38070575iln.1
        for <devicetree@vger.kernel.org>; Fri, 03 Jan 2020 16:40:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=dKtl1NpRX8aOyUbBGch9yTP0h5jL9ht++jj3F8wRx1Y=;
        b=CrD4BrzIayvqkJoZ8kOl0DkgNEtYWz+jI4sTOHVgs4sayWrBkR687OtHvxbOj2dzmz
         GALxWOxG9MBh6Six82xTiyPN4ijezoKW4m9bHmp1BrXgDA9ILt0fE2S5ZQI5B6LFvdTD
         Ihn1q7E0Uauv1sylPz/v8iPhmlubjzVJByO9OtAsK8pua8K1h5ddlSzZ17W6/sXq9w7F
         2ZsVT+3J6cfHFPnXo6as1knsxpMitzXxbzklnUTDZbaT/5m7hk0cO72LZbrr0wVf20Oq
         36wfxTce2YV45pjmXtg+ir05C8x0VT1iOPAxMb61byr252XsMHMS/HfmoS8+QiaG80aG
         ri/A==
X-Gm-Message-State: APjAAAXE5zV5uIVIRLwKWowT7MwDo/jIvalmJSSp/McuDvUANLFYGSi3
        jwTSQt03c3tv+LNidb0SwLcc+R8=
X-Google-Smtp-Source: APXvYqwdkQbDXs5IQgE2kJ09YEOfOx0GtSpSreT6jrJGSmkJRoccDfO/BN8MZTxLtOQgawEu+x4E0Q==
X-Received: by 2002:a92:5a16:: with SMTP id o22mr79778291ilb.229.1578098412678;
        Fri, 03 Jan 2020 16:40:12 -0800 (PST)
Received: from rob-hp-laptop ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id y11sm21415822ilp.46.2020.01.03.16.40.12
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2020 16:40:12 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2219b7
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Fri, 03 Jan 2020 17:39:39 -0700
Date:   Fri, 3 Jan 2020 17:39:39 -0700
From:   Rob Herring <robh@kernel.org>
To:     Akash Gajjar <akash@openedev.com>
Cc:     heiko@sntech.de, jagan@openedev.com, tom@radxa.com,
        Akash Gajjar <akash@openedev.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Douglas Anderson <dianders@chromium.org>,
        Vivek Unune <npcomplete13@gmail.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Kever Yang <kever.yang@rock-chips.com>,
        Markus Reichl <m.reichl@fivetechno.de>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Nick Xie <nick@khadas.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3, 1/1] arm64: dts: rockchip: add ROCK Pi S DTS support
Message-ID: <20200104003939.GA15565@bogus>
References: <20191230145008.5899-1-akash@openedev.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191230145008.5899-1-akash@openedev.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, 30 Dec 2019 20:19:32 +0530, Akash Gajjar wrote:
> ROCK Pi S is RK3308 based SBC from radxa.com. ROCK Pi S has a,
> - 256MB/512MB DDR3 RAM
> - SD, NAND flash (optional on board 1/2/4/8Gb)
> - 100MB ethernet, PoE (optional)
> - Onboard 802.11 b/g/n wifi + Bluetooth 4.0 Module
> - USB2.0 Type-A HOST x1
> - USB3.0 Type-C OTG x1
> - 26-pin expansion header
> - USB Type-C DC 5V Power Supply
> 
> This patch enables
> - Console
> - NAND Flash
> - SD Card
> 
> Signed-off-by: Akash Gajjar <akash@openedev.com>
> ---
> Changes for v2
> - Use pwm-supply for vdd_core node instead of vi-supply
> - Add USB2.0 node support
>  
> Changes for v3
> - Use small S on dts file name
> - Add missing semicolon
> - Remove USB2.0 node support
> 
>  .../devicetree/bindings/arm/rockchip.yaml     |   5 +
>  arch/arm64/boot/dts/rockchip/Makefile         |   1 +
>  .../boot/dts/rockchip/rk3308-rock-pi-s.dts    | 221 ++++++++++++++++++
>  3 files changed, 227 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3308-rock-pi-s.dts
> 

Reviewed-by: Rob Herring <robh@kernel.org>
