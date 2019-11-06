Return-Path: <SRS0=r6ca=Y6=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDADBC5DF62
	for <linux-devicetree@archiver.kernel.org>; Wed,  6 Nov 2019 04:23:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9C0D62084C
	for <linux-devicetree@archiver.kernel.org>; Wed,  6 Nov 2019 04:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573014235;
	bh=ehRxmYY6hwWstAbU9YBG6UH4wWuJDfGRkwxBkNjo1NU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=vGmrU9NjnjBLy3H9OgsovRgRSWLWqDsaUO4G8kQOhRqnn0tVsoyDkjSFrMTgIvj99
	 s7fIG7p22gCsxoHLX+ZugTwh0cAqRWJvDWftKQwisNbFTHSscpOnEH6d02Jiu+bDA/
	 pv/KIqFKqy9T/al4B1nCvcxWukb46jiX3Q3JPOws=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731044AbfKFEXz (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 5 Nov 2019 23:23:55 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:41690 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727266AbfKFEXz (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 5 Nov 2019 23:23:55 -0500
Received: by mail-ot1-f67.google.com with SMTP id 94so19682601oty.8
        for <devicetree@vger.kernel.org>; Tue, 05 Nov 2019 20:23:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Y3DWYeqriebyJFdljdEg8brbxtOMqiGsmKQQNplT8xE=;
        b=F/dCZ1vLWPfjp4QROpYt9rowez/GlvHDCo7HiT192MP+rP8fhP6R3b/6CamUj8UFER
         mKOe/t9E8AFAcxaNQvVL0C40oNxs5h1cAKOsz/XlPCQsitJWHJ3ybqzkULYJuWNlRbKI
         xmXtgeJfANpI6j9XyoAFwpn1ySYqCvn3F6p6Q1kJmE51T6Bo0d8XVtI39xYaR6X2qrXc
         GUqkGKb8rDT+Kl0qhB+3sg8MEr2M6mi2zjFsshQLffmdX1/pkrkMFNW3wyRefPJvVp1+
         V5twKuIWzpjesH4fWr60hCXbtM8wI6e5WEdfE5E4weFA6Q22ci++AhAZiyiKIr5LyLVx
         K1/A==
X-Gm-Message-State: APjAAAUdFwE4S1dWlQPjGyvQ3SfRIsJZes08QTo7VWSsiHjgDH81kmeg
        CSHja9ya/9FzqQmLDcUdsg==
X-Google-Smtp-Source: APXvYqzQ+l/JcEI46WoYprObfXoM6iP7CyYkO456aCXMJEI/MIzZv/4G1PDLLfBo29MhM+ZkF2rCnw==
X-Received: by 2002:a9d:6285:: with SMTP id x5mr274924otk.267.1573014232412;
        Tue, 05 Nov 2019 20:23:52 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id j9sm6220801oij.15.2019.11.05.20.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 20:23:51 -0800 (PST)
Date:   Tue, 5 Nov 2019 22:23:51 -0600
From:   Rob Herring <robh@kernel.org>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <mripard@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH] dt-bindings: Remove FIXME in yaml bindings
Message-ID: <20191106042351.GA4131@bogus>
References: <20191101135808.259371-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191101135808.259371-1-maxime@cerno.tech>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri,  1 Nov 2019 14:58:08 +0100, Maxime Ripard wrote:
> Some binding that were introduced early on got a comment to enable
> additionalProperties, but we couldn't due to the generic properties being
> reported as errors.
> 
> The way we're dealing with this now is to use the draft-08's
> unevaluatedProperties (even though the tools doesn't do anything with it
> yet).
> 
> Let's convert those old bindings to it.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  .../devicetree/bindings/dma/allwinner,sun50i-a64-dma.yaml   | 4 +---
>  .../devicetree/bindings/i2c/allwinner,sun6i-a31-p2wi.yaml   | 4 +---
>  .../devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml        | 4 +---
>  .../interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml    | 4 +---
>  .../devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml   | 4 +---
>  .../devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml    | 6 ++----
>  .../devicetree/bindings/net/allwinner,sun4i-a10-emac.yaml   | 6 ++----
>  .../devicetree/bindings/net/allwinner,sun4i-a10-mdio.yaml   | 6 ++----
>  .../devicetree/bindings/net/allwinner,sun7i-a20-gmac.yaml   | 6 ++----
>  .../devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml  | 6 ++----
>  .../devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml  | 4 +---
>  11 files changed, 16 insertions(+), 38 deletions(-)
> 

Applied, thanks.

Rob
