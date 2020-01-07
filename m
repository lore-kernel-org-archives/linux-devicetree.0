Return-Path: <SRS0=83Av=24=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD6DEC282DD
	for <linux-devicetree@archiver.kernel.org>; Tue,  7 Jan 2020 23:57:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8B2672068E
	for <linux-devicetree@archiver.kernel.org>; Tue,  7 Jan 2020 23:57:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech-se.20150623.gappssmtp.com header.i=@ragnatech-se.20150623.gappssmtp.com header.b="g4WO63H6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726793AbgAGX5A (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 7 Jan 2020 18:57:00 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:36807 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726683AbgAGX47 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 7 Jan 2020 18:56:59 -0500
Received: by mail-lf1-f66.google.com with SMTP id n12so1062247lfe.3
        for <devicetree@vger.kernel.org>; Tue, 07 Jan 2020 15:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=qJTEOOiO4RTQGS3Ae845HTznxsWFmc3KEeBqoOfq6kI=;
        b=g4WO63H6UVjDQWF13y7eMfpsPjmtqjiL8xBlQpj6AAxxHkrI66bIGrLwrAkr14cCvD
         BvfGYNIW6l7t1LtHwWKeeqtaHHHY9FdNDGCImQHP1ygLbOGeVejZb/iiWiI3x71vJ8Ti
         nDhkmvhuU8SbvYh7p7Uf5lX9mpnKydcY1w7yqf2MHMElex/l5FR0aFTw/6e1sRESc224
         0YlVajjtGZsEvZoCPfc44bO00A33DTSpZIAPFzThYcrcs7g7JbDFwf4ek/ePtFfvAf5s
         pZREKiUdO040hgTgCIqzHrUPfWcM+77XjhTPm7z5adjjpB/VWDHea0NE3WpeheRRqV9f
         ffAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=qJTEOOiO4RTQGS3Ae845HTznxsWFmc3KEeBqoOfq6kI=;
        b=RGBCD4j2SSeRUMuKhekO6zyhnivt9x48P8as+jcWnoFwdqoWnKi7dzFrbWhjPRyXNF
         xkdhR8xSRDlj4xZtvjxbxD3mpe+6S7qcj6mY8njFIxXKOAPzN1uskRMsxOO15aLMiYCx
         kdWRsmTlDoN6BfcADGZWo4NIGM/bHj2qSfIsVBlbw/hdYhFHCFnW/hbQqdX+U0p8gioz
         5yB58mosId43vIX5Fqzik4CbCgYYHepUKT4bbSVahf6ULgeRqfR9s7IZzYR82Lm9Pmv1
         hHgFF+m31CrPpKBCdmlVqFgOSQIDyXVwzyk7ApJly1O8wXNj07qJHmO1rK/MVa9HqhrZ
         5I4g==
X-Gm-Message-State: APjAAAWTVMVbdIJ98FoXDHeDObA/4hKbrQHYu9LqmjqDTqvOxDpMoR1p
        ZGsVNAsljoVSmtZpOUkyyPH8XZ11B9ALEA==
X-Google-Smtp-Source: APXvYqyTeDZKb3hwUSnj/fKrlW0FHLXZ21i1X9zqdycW8TRMmIIYcJX31kp7ohhEYx/e498rXOctXA==
X-Received: by 2002:ac2:5a48:: with SMTP id r8mr1099445lfn.179.1578441415378;
        Tue, 07 Jan 2020 15:56:55 -0800 (PST)
Received: from localhost (h-93-159.A463.priv.bahnhof.se. [46.59.93.159])
        by smtp.gmail.com with ESMTPSA id s23sm415570lji.70.2020.01.07.15.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2020 15:56:54 -0800 (PST)
Date:   Wed, 8 Jan 2020 00:56:54 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: renesas: Group tuples in operating-points
 properties
Message-ID: <20200107235654.GU533370@oden.dyn.berto.se>
References: <20191231141642.31609-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191231141642.31609-1-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Geert,

Thanks for your work.

On 2019-12-31 15:16:42 +0100, Geert Uytterhoeven wrote:
> To improve human readability and enable automatic validation, the tuples
> in the "operating-points" properties of CPU nodes should be grouped.
> 
> Fix this by grouping the tuples of these properties using angle brackets
> in the DTS files for all Renesas SoCs that don't already do so.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  arch/arm/boot/dts/r8a73a4-ape6evm.dts | 7 ++-----
>  arch/arm/boot/dts/sh73a0-kzm9g.dts    | 9 +++------
>  2 files changed, 5 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/r8a73a4-ape6evm.dts b/arch/arm/boot/dts/r8a73a4-ape6evm.dts
> index 1fbf45082726af36..9eea57d069c227a7 100644
> --- a/arch/arm/boot/dts/r8a73a4-ape6evm.dts
> +++ b/arch/arm/boot/dts/r8a73a4-ape6evm.dts
> @@ -238,11 +238,8 @@
>  
>  &cpu0 {
>  	cpu0-supply = <&vdd_dvfs>;
> -	operating-points = <
> -		/* kHz  uV */
> -		1950000 1115000
> -		1462500  995000
> -	>;
> +	operating-points = <1950000 1115000>,	/* kHz  uV */
> +			   <1462500  995000>;
>  	voltage-tolerance = <1>; /* 1% */
>  };
>  
> diff --git a/arch/arm/boot/dts/sh73a0-kzm9g.dts b/arch/arm/boot/dts/sh73a0-kzm9g.dts
> index 5fa9d3d9cd36a146..1c9dfe9f10e552da 100644
> --- a/arch/arm/boot/dts/sh73a0-kzm9g.dts
> +++ b/arch/arm/boot/dts/sh73a0-kzm9g.dts
> @@ -25,12 +25,9 @@
>  	cpus {
>  		cpu@0 {
>  			cpu0-supply = <&vdd_dvfs>;
> -			operating-points = <
> -				/* kHz  uV */
> -				1196000 1315000
> -				 598000 1175000
> -				 398667 1065000
> -			>;
> +			operating-points = <1196000 1315000>,	/* kHz  uV */
> +					   < 598000 1175000>,
> +					   < 398667 1065000>;
>  			voltage-tolerance = <1>; /* 1% */
>  		};
>  	};
> -- 
> 2.17.1
> 

-- 
Regards,
Niklas Söderlund
