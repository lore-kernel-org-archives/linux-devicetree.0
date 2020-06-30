Return-Path: <SRS0=g9lS=AL=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88D8DC433DF
	for <linux-devicetree@archiver.kernel.org>; Tue, 30 Jun 2020 21:03:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6348E2074D
	for <linux-devicetree@archiver.kernel.org>; Tue, 30 Jun 2020 21:03:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech-se.20150623.gappssmtp.com header.i=@ragnatech-se.20150623.gappssmtp.com header.b="M51V8KCf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728528AbgF3VDh (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 30 Jun 2020 17:03:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728501AbgF3VDg (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 30 Jun 2020 17:03:36 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F09A5C03E97A
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2020 14:03:35 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id o4so12245781lfi.7
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2020 14:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=PjU8LAZRfkKwjEfQp/C6gHlytaYYnBRvg8dwpQ1D6Cw=;
        b=M51V8KCfEOfuNKYbStqI3kDXtEmV7at6P2apYiGE+5bYNNQN5nOi4JygqfIIkYfQGs
         cIKe83j3IJmzY2MNATDv+wll1XgWFTuQKvf1VO5S4n50abTcFmpXtSBNR2BsG5J8hGWN
         LMv6QCT3FFued2MgftsCVkKBNUd5NXrjpnQ+OCGgci6pauVCz+Og1UgfoSS6YM1YLSHy
         9Xl+xYqFV0fymcJ9ECtuTF5EvYJMgUauBKkyDy7iwhlk5Emkafj6RVdCm0K6rrV6eq+Y
         R1+RaIOrHOPcUWmVdD3/iova53XF753UTQUBnR2Yo1tm+jpQBoJte8Lxdeh9x1AvSCX1
         E/0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=PjU8LAZRfkKwjEfQp/C6gHlytaYYnBRvg8dwpQ1D6Cw=;
        b=QQNOE7q0RXBn8i96JuoqBYSkVJ9d1QCoiVU/5Zm7vRo3MXpcMhmGV5gB0t5qwA4d3s
         hTsez3Ynewnc49Q/SlfT+LP8D4LW+dF6byq4+PRRZhZGlguJ5CJSoW8ppV4qXNPfMZRe
         xqfYaEDbyCx2U5mUdJ5kFKO2VffcnBTGBYHD9ai4bQn3461HMBWbxeL83xQO5H/h8+fi
         2QwRMfJ6B9NOY8fm3rhKdUor6Bv+Gj2+QQBoTNd72xgJwfh/9AuXhgRa8ZcZ4hIIRXro
         AI4BwfBmIDR0ignrgek+5fZFlcbNtEIsu/O9tpFWc782kqNlqpfd6bemPMLCOMXOJtBp
         Y2aw==
X-Gm-Message-State: AOAM531AiagoJKjpk7mHMkT/Cqo+R4Bwjml4iM222JcJQlI8syBtuc49
        dWvyOz7GckvKPGwzVRyl0tXotA==
X-Google-Smtp-Source: ABdhPJwUbEeifJyd/WCrFKRdiRUNY5LgqYyFB6ZwCRtvzJWrwr67EOgsIxyATWjjD/Ovcu5Ey+/Ltw==
X-Received: by 2002:a05:6512:550:: with SMTP id h16mr12999586lfl.155.1593551013088;
        Tue, 30 Jun 2020 14:03:33 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id 16sm1088750ljw.127.2020.06.30.14.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 14:03:32 -0700 (PDT)
Date:   Tue, 30 Jun 2020 23:03:32 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 8/8] dt-bindings: media: renesas,vsp1: Add
 power-domains and resets
Message-ID: <20200630210332.GH2365286@oden.dyn.berto.se>
References: <20200621004734.28602-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200621004734.28602-9-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200621004734.28602-9-laurent.pinchart+renesas@ideasonboard.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Laurent,

Thanks for your patch.

On 2020-06-21 03:47:34 +0300, Laurent Pinchart wrote:
> The power-domains and resets properties are used in all DT sources in
> the kernel but are absent from the bindings. Document them and make them
> mandatory.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  .../devicetree/bindings/media/renesas,vsp1.yaml    | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/renesas,vsp1.yaml b/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
> index 65e8ee61ce90..990e9c1dbc43 100644
> --- a/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
> +++ b/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
> @@ -29,6 +29,12 @@ properties:
>    clocks:
>      maxItems: 1
>  
> +  power-domains:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
>    renesas,fcp:
>      $ref: /schemas/types.yaml#/definitions/phandle
>      description:
> @@ -39,6 +45,8 @@ required:
>    - reg
>    - interrupts
>    - clocks
> +  - power-domains
> +  - resets
>  
>  additionalProperties: false
>  
> @@ -59,24 +67,30 @@ examples:
>    - |
>      #include <dt-bindings/clock/renesas-cpg-mssr.h>
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/r8a7790-sysc.h>
>  
>      vsp@fe928000 {
>          compatible = "renesas,vsp1";
>          reg = <0xfe928000 0x8000>;
>          interrupts = <GIC_SPI 267 IRQ_TYPE_LEVEL_HIGH>;
>          clocks = <&cpg CPG_MOD 131>;
> +        power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
> +        resets = <&cpg 131>;
>      };
>  
>    # R8A77951 (R-Car H3) VSP2-BC
>    - |
>      #include <dt-bindings/clock/renesas-cpg-mssr.h>
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/r8a7795-sysc.h>
>  
>      vsp@fe920000 {
>          compatible = "renesas,vsp2";
>          reg = <0xfe920000 0x8000>;
>          interrupts = <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>;
>          clocks = <&cpg CPG_MOD 624>;
> +        power-domains = <&sysc R8A7795_PD_A3VP>;
> +        resets = <&cpg 624>;
>  
>          renesas,fcp = <&fcpvb1>;
>      };
> -- 
> Regards,
> 
> Laurent Pinchart
> 

-- 
Regards,
Niklas Söderlund
