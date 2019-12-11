Return-Path: <SRS0=G+GX=2B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADDA9C43603
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Dec 2019 20:16:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7FC4920836
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Dec 2019 20:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1576095411;
	bh=cUoh7S6+Md4jEL5o+zEKAOpahw/HlQWsfjB+bqvFMDA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=Kx9pzOZ9peTqSfcNIfOkn5DkS9clIxBp5RdVMbhA1WIXwmz6ubmVJMMAAA6E1RDPM
	 oGcHBXJHNRjF4ZQibtgRkTjKryEN6CM/N+g2GIS42MRWoNH/vGzZHF1SjVlMZzFQ4i
	 c+VN1y9qntCxfK+Vy1ZNr5A+yd7HUVOXDhulzRuU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726717AbfLKUQv (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 11 Dec 2019 15:16:51 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:39158 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726568AbfLKUQv (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 11 Dec 2019 15:16:51 -0500
Received: by mail-oi1-f194.google.com with SMTP id a67so14430483oib.6
        for <devicetree@vger.kernel.org>; Wed, 11 Dec 2019 12:16:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=MTVpmT1f6GS8I9bMajNHsAH5wqJpn8dooP9Y7lA8Agw=;
        b=eLVQO8xY8kvCUuDb+zRvGlop1dtjg1pz4BHNJdSAWeg2zM98i1YwzQ7SzlZwzb+ngu
         Q9joxz8McuEhpz4HWf/34dM83iMSqxSGaSo17OHoML/9hJGJcJiCyws+0If+5pLLqtMr
         d1NBC0n5+6ih7dp47XR9X0bw1FFXFkAYeUdru7auoKRtn9ODYLfBCatRbm0Q/KTtb0oq
         8FWYMV7nY4/gvI+gVL/2042UBfTE8XsQNQzruwQ8kjyyQa2J66SYyf4zxPLZBmH10rln
         WLVc8vzzzaD+fmocWumDQwvxY7ATtKlgqDIkW5pkmYfAwPzW9tLocI+ZWYWHMi06P8dZ
         fc7Q==
X-Gm-Message-State: APjAAAWGk0NW/CNtfZCerFi63JTh2TPb/VEBzAvgmyIACFApIA94a58v
        SuYdG+BFIQMa9bpYa/UpmBP9YA0=
X-Google-Smtp-Source: APXvYqx5a1i3URZ3dUUrfC0pK3yQMbk2Qn/PkxnQ5IJXIl3whGWlF4wqPoCftEBPw/32yB54Fz5R2Q==
X-Received: by 2002:aca:5fc1:: with SMTP id t184mr4407966oib.20.1576095409977;
        Wed, 11 Dec 2019 12:16:49 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id u26sm1270955otk.0.2019.12.11.12.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2019 12:16:49 -0800 (PST)
Date:   Wed, 11 Dec 2019 14:16:48 -0600
From:   Rob Herring <robh@kernel.org>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
        Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH] dt-bindings: Change maintainer address
Message-ID: <20191211201648.GA18519@bogus>
References: <20191209093248.50454-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191209093248.50454-1-maxime@cerno.tech>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon,  9 Dec 2019 10:32:48 +0100, Maxime Ripard wrote:
> While my email address has changed for a while, all the schemas I
> contributed still have the old one unfortunately. Update it.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  Documentation/devicetree/bindings/arm/sunxi.yaml                | 2 +-
>  .../devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml       | 2 +-
>  .../devicetree/bindings/bus/allwinner,sun8i-a23-rsb.yaml        | 2 +-
>  .../devicetree/bindings/clock/allwinner,sun4i-a10-ccu.yaml      | 2 +-
>  .../devicetree/bindings/crypto/allwinner,sun4i-a10-crypto.yaml  | 2 +-
>  .../bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml          | 2 +-
>  .../devicetree/bindings/display/panel/ronbo,rb070d30.yaml       | 2 +-
>  .../devicetree/bindings/dma/allwinner,sun4i-a10-dma.yaml        | 2 +-
>  .../devicetree/bindings/dma/allwinner,sun50i-a64-dma.yaml       | 2 +-
>  .../devicetree/bindings/dma/allwinner,sun6i-a31-dma.yaml        | 2 +-
>  .../devicetree/bindings/i2c/allwinner,sun6i-a31-p2wi.yaml       | 2 +-
>  .../devicetree/bindings/iio/adc/allwinner,sun8i-a33-ths.yaml    | 2 +-
>  .../bindings/input/allwinner,sun4i-a10-lradc-keys.yaml          | 2 +-
>  .../bindings/interrupt-controller/allwinner,sun4i-a10-ic.yaml   | 2 +-
>  .../interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml        | 2 +-
>  .../devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml      | 2 +-
>  .../devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml       | 2 +-
>  .../devicetree/bindings/mfd/allwinner,sun4i-a10-ts.yaml         | 2 +-
>  .../devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml        | 2 +-
>  .../devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml       | 2 +-
>  .../devicetree/bindings/net/allwinner,sun4i-a10-emac.yaml       | 2 +-
>  .../devicetree/bindings/net/allwinner,sun4i-a10-mdio.yaml       | 2 +-
>  .../devicetree/bindings/net/allwinner,sun7i-a20-gmac.yaml       | 2 +-
>  .../devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml      | 2 +-
>  .../devicetree/bindings/net/can/allwinner,sun4i-a10-can.yaml    | 2 +-
>  .../devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml      | 2 +-
>  .../devicetree/bindings/phy/allwinner,sun6i-a31-mipi-dphy.yaml  | 2 +-
>  .../bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml           | 2 +-
>  .../devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml        | 2 +-
>  .../devicetree/bindings/rtc/allwinner,sun4i-a10-rtc.yaml        | 2 +-
>  .../devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml        | 2 +-
>  .../devicetree/bindings/serio/allwinner,sun4i-a10-ps2.yaml      | 2 +-
>  .../devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml    | 2 +-
>  .../devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml      | 2 +-
>  .../devicetree/bindings/sound/allwinner,sun4i-a10-spdif.yaml    | 2 +-
>  .../bindings/sound/allwinner,sun50i-a64-codec-analog.yaml       | 2 +-
>  .../bindings/sound/allwinner,sun8i-a23-codec-analog.yaml        | 2 +-
>  .../devicetree/bindings/sound/allwinner,sun8i-a33-codec.yaml    | 2 +-
>  .../devicetree/bindings/spi/allwinner,sun4i-a10-spi.yaml        | 2 +-
>  .../devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml        | 2 +-
>  .../devicetree/bindings/timer/allwinner,sun4i-a10-timer.yaml    | 2 +-
>  .../devicetree/bindings/timer/allwinner,sun5i-a13-hstimer.yaml  | 2 +-
>  .../devicetree/bindings/usb/allwinner,sun4i-a10-musb.yaml       | 2 +-
>  .../devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml   | 2 +-
>  44 files changed, 44 insertions(+), 44 deletions(-)
> 

Applied, thanks.

Rob
