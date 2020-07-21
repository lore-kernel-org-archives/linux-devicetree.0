Return-Path: <SRS0=jMr8=BA=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A60FBC433E2
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Jul 2020 02:10:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 80FD120709
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Jul 2020 02:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1595297430;
	bh=mpSYOJaRe2HqbXPdJ82PWIpqASuHVIFRJawi1rvbTE8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=g2PBUqlrLk4UM3DOjd5zvLCF/XlfnvavgMLfZfU7tBZdISYjEmdHQOrR9H55oqgiR
	 iRkrlyDNE8xEOZeS1YJa7Z50rVyYje8GKZ75OAP4w8Gj7htDJIA74fg7RI4JHfEAl1
	 A3EPoPA4kX/xKdXovpsEA5He6gkU5wOYdXuc/Byk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726042AbgGUCKa (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 20 Jul 2020 22:10:30 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:40837 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725857AbgGUCK3 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 20 Jul 2020 22:10:29 -0400
Received: by mail-io1-f67.google.com with SMTP id l17so19700423iok.7
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2020 19:10:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/46L/c6KjZBA8UxcNLwuQWdQYtMpxrAX9cV63irRY9g=;
        b=pBvadwdBGq6jmyrEBlbNtTTYdx4GtMlVTaq89H8wnDHDSBeFOUMBU8/mPrFcWBBas0
         42U0wAJj2Y+zuscNlNvDA0Ig6NBilsSAa7FPb2nIc6eeGXTtF8XyWDSwDSLADt311Rta
         x0cFDQdyOllOjpAuZI7k4rKH0NeNzhWxzfUJQvCn3Hm9lUzdaEaIAWNnerMqgtSIZhbx
         F8/RYDgDAQDYouQxONPVHPitr6wT7rAw6lrf8HDDSvicdr4f1QTFVdLvggIpBvTshvMp
         rG1WVeGZABpgymDnfslsipZLUueGTIfF8/pSsLSQUxL/nhAuqLBgkvQK+a6gk+92Ynli
         D2aA==
X-Gm-Message-State: AOAM531zR1Gwcy+CSimodkG4gXnXh1AG3v5MKtLVUgJBcu/chc81YdWs
        e4Lllco/2CPDssVtedcFHA==
X-Google-Smtp-Source: ABdhPJwTmQpxHmmOzo0iMaN1uJwnfUhSB9KfvOR2nPHFEjoe2wxlJnhzE2QElfxxyztGC0KuU6qdQg==
X-Received: by 2002:a6b:b54e:: with SMTP id e75mr25929429iof.31.1595297428957;
        Mon, 20 Jul 2020 19:10:28 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id l18sm9842201ill.56.2020.07.20.19.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 19:10:28 -0700 (PDT)
Received: (nullmailer pid 3386425 invoked by uid 1000);
        Tue, 21 Jul 2020 02:10:26 -0000
Date:   Mon, 20 Jul 2020 20:10:26 -0600
From:   Rob Herring <robh@kernel.org>
To:     Chen-Yu Tsai <wens@kernel.org>
Cc:     Maxime Ripard <mripard@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Siarhei Siamashka <siarhei.siamashka@gmail.com>
Subject: Re: [PATCH 1/5] dt-bindings: display: panel-dpi: Add bits-per-color
 property
Message-ID: <20200721021026.GA3382460@bogus>
References: <20200714071305.18492-1-wens@kernel.org>
 <20200714071305.18492-2-wens@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200714071305.18492-2-wens@kernel.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Jul 14, 2020 at 03:13:01PM +0800, Chen-Yu Tsai wrote:
> From: Chen-Yu Tsai <wens@csie.org>
> 
> Some LCD panels do not support 24-bit true color, or 8bits per channel
> RGB. Many low end ones only support up to 6 bits per channel natively.

This should be implied by the panel's compatible property.

> Add a device tree property to describe the native bit depth of the
> panel. This is separate from the bus width or format of the connection
> to the display output.
> 
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
>  .../devicetree/bindings/display/panel/panel-dpi.yaml          | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml b/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> index 0cd74c8dab42..8eb013fb1969 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> @@ -26,6 +26,9 @@ properties:
>    height-mm: true
>    label: true
>    panel-timing: true
> +  bits-per-color:
> +    description:
> +      Shall contain an integer describing the number of bits per color.
>    port: true
>    power-supply: true
>    reset-gpios: true
> @@ -42,6 +45,7 @@ examples:
>      panel {
>          compatible = "osddisplays,osd057T0559-34ts", "panel-dpi";
>          label = "osddisplay";
> +        bits-per-color = <8>;
>          power-supply = <&vcc_supply>;
>          backlight = <&backlight>;
>  
> -- 
> 2.27.0
> 
