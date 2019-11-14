Return-Path: <SRS0=7KoJ=ZG=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7DA5C432C3
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 Nov 2019 01:53:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0B5A4206EF
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 Nov 2019 01:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573696398;
	bh=HU9Jz4jf4H5sBM80OlgQbD6/rJi/CznrtVCfuFoSNaU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=nU7oVLvCr5HLHZ13Rl5bJpZ0IKi4x9lmcviTU7FoxZrj6qaifBFriFHVlUN6AV+TN
	 I7wGAKTif9bwMvmchL6Ce33f1n4ssChYljsW5r0FCOMqtMfXabizeJgVsrO1cgKJLI
	 vztMPU6Q4r2NaTdeTf76YsSAhUxrKDs4CEuNC1e8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726139AbfKNBxR (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 13 Nov 2019 20:53:17 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:45554 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726098AbfKNBxR (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 13 Nov 2019 20:53:17 -0500
Received: by mail-oi1-f194.google.com with SMTP id 14so3761377oir.12;
        Wed, 13 Nov 2019 17:53:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=YzMRKwOAeyLEJgS4ZedeWkKapXjgaDKadOBSenofCOI=;
        b=Q5SqW621pMEXWFOxlj47GluyaeyhBM47KNH2cdm83i0CxQqOZhVqKibh5SCSyKVkYr
         hRkv9X+bQgMYskVp+Eq5G4c/QdnrXeBQqnddSz0G8muUWq6v4cD7eL4XVgDoU56RpKfn
         EeYhlfCrcRPKvjEkrDezTsTj3a+CeAQJemruMriKuphnYstBlm1u9x4HfO5q6KOHPkTq
         tQaS3Q4yKMqrUMD+slYGa8XB2jl7+mpPhdwUKwBUKCIN2I1nXJuHaegxtQMbwBMjVJhm
         l/oHkoIwo9l21ma4vrwZuCNzcNrcCwQ5xixHlm3IXy73BQyEAO0ijtVt9NT6XQ0Wj48K
         rr4g==
X-Gm-Message-State: APjAAAVfNLEmR/yc5YysIFZRi444+FoOZznEKWDtaclZdQab8bmIzby/
        of7Y0D3VgXqvS7+81egmvA==
X-Google-Smtp-Source: APXvYqwoPjq8G5QC+rJOSL3DpKhW/ooUFfVo8fZnHTp3oTWVQOIRPmWDGvOgzhuvR+EDBaTL0DpXUQ==
X-Received: by 2002:aca:6706:: with SMTP id z6mr1288414oix.89.1573696395971;
        Wed, 13 Nov 2019 17:53:15 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id l18sm1345873oti.11.2019.11.13.17.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2019 17:53:15 -0800 (PST)
Date:   Wed, 13 Nov 2019 19:53:14 -0600
From:   Rob Herring <robh@kernel.org>
To:     Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
Cc:     kishon@ti.com, robh+dt@kernel.org, mark.rutland@arm.com,
        bivvy.bi@rock-chips.com, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org,
        christoph.muellner@theobroma-systems.com,
        Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
Subject: Re: [PATCH 1/2] dt-bindings: phy: drop #clock-cells from
 rockchip,px30-dsi-dphy
Message-ID: <20191114015314.GA24328@bogus>
References: <20191108000640.8775-1-heiko.stuebner@theobroma-systems.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191108000640.8775-1-heiko.stuebner@theobroma-systems.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri,  8 Nov 2019 01:06:39 +0100, Heiko Stuebner wrote:
> Further review of the dsi components for the px30 revealed that the
> phy shouldn't expose the pll as clock but instead handle settings
> via phy parameters.
> 
> As the phy binding is new and not used anywhere yet, just drop them
> so they don't get used.
> 
> Fixes: 3817c7961179 ("dt-bindings: phy: add yaml binding for rockchip,px30-dsi-dphy")
> Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> ---
> Hi Kishon,
> 
> this should ideally get into 5.5 as a fix for the previous change
> so that the binding doesn't accidentially get used.
> 
> Thanks
> Heiko
> 
>  .../devicetree/bindings/phy/rockchip,px30-dsi-dphy.yaml      | 5 -----
>  1 file changed, 5 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
