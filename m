Return-Path: <SRS0=mth2=AK=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7753FC433E0
	for <linux-devicetree@archiver.kernel.org>; Mon, 29 Jun 2020 21:42:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4FAB220656
	for <linux-devicetree@archiver.kernel.org>; Mon, 29 Jun 2020 21:42:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=verdurent-com.20150623.gappssmtp.com header.i=@verdurent-com.20150623.gappssmtp.com header.b="OQH0L9cB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727930AbgF2VmT (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 29 Jun 2020 17:42:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727917AbgF2Sh5 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 29 Jun 2020 14:37:57 -0400
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com [IPv6:2607:f8b0:4864:20::a44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0D0FC02A545
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2020 05:51:33 -0700 (PDT)
Received: by mail-vk1-xa44.google.com with SMTP id 66so289476vka.13
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2020 05:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=verdurent-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xHEvnwaXIaI22DXPizYpJcrsTL4/AwhMEQ6IhYTQKlQ=;
        b=OQH0L9cBVHLRgTVZhw1jd+9UWSypZQN30gG3yvEpHJvc2VXIoNz+hyJGcfUcBU+7e4
         oCc7XEKBqBQPleKnUVnLbIp6WsDfC+WCcVQhpW8dNcfHdlE37M0unZrcRr+0gg3/aEvf
         PMdPFYwgtQ+R9ZtNcXAgyQyPNtpr4cbByuURBHAnjcHM+1N71I+sWI1yfCbGzQcEdiAN
         yY4uALwvM8jRmBCwqjPgXEIl4AGsHRadzBeA2q8DcqrH+lwiFBEB3A6DNV046uaF3RHg
         gXgPPRlYEZ8ZU+Sn3QHjIt7k5b5qK/HGOI6FP26Yjc3r+mq7qoc4ZOwpVuG+VUgxyPPT
         2jyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xHEvnwaXIaI22DXPizYpJcrsTL4/AwhMEQ6IhYTQKlQ=;
        b=DHjyZTIfabtU+eQFAct6Z0GNFLXzLuZCZY1zanvfP2otVjQIz6NZfioydsFyM6lVHu
         TB+UMznB0lnJv8yx2+p7x/fQM6fzIw6WX8s8fkmKPxrIkII72T2OrNNysZcRczNZOkhT
         oVC5m3oMXPZhzrwHR2Q4pwSKc94cPSI8N0qejqjFpmJJ6FFDI0AcNXYt9slPvQEtbG8j
         n/Mk0pC6hYh7lL6MISDI3i9eeo+Jng2dTjM/TkY4dknLpmHg+tvwBaSI2wxFOsz0jkqg
         H3QmuPZc7uLVAy93PXNc6aZxoXHEvNp/tiBAdosgK6G7Haof18sRhfWMc1tTgjl+dnqN
         CGNg==
X-Gm-Message-State: AOAM533ok54OepvLE2An6BdgL2EcF2qh3B/TF0rKWmG+yI7FzrvfnjaL
        kBbW86x4BYb8XD/63EFZGG9K+7F+b+I4P+eANYZbZg==
X-Google-Smtp-Source: ABdhPJxV2IA2m9d5l16yBy3n1SZ0g7UHEZV6/cJ+b6V/XLPjujs0azTgjgMwltUJn2YBO0p0U04OWasRwsCDgvXmOEE=
X-Received: by 2002:ac5:c189:: with SMTP id z9mr9880244vkb.79.1593435092807;
 Mon, 29 Jun 2020 05:51:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200619151541.15069-1-geert+renesas@glider.be>
In-Reply-To: <20200619151541.15069-1-geert+renesas@glider.be>
From:   Amit Kucheria <amit.kucheria@verdurent.com>
Date:   Mon, 29 Jun 2020 18:21:21 +0530
Message-ID: <CAHLCerMfp42VHDxhCfnFmxphic0OVD55ZzmzwnrEvfF6WUARgg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: thermal: rcar-thermal: Improve schema validation
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Linux PM list <linux-pm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Jun 19, 2020 at 8:45 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
>   - Document missing "#thermal-sensor-cells",
>   - Factor out common required properties,
>   - "interrupts", "clocks", and "power-domains" are required on R-Mobile
>     APE6, too,
>   - Invert logic to simplify descriptions,
>   - Add "additionalProperties: false".
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Amit Kucheria <amit.kucheria@linaro.org>

> ---
>  .../bindings/thermal/rcar-thermal.yaml        | 53 ++++++++++++-------
>  1 file changed, 34 insertions(+), 19 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/thermal/rcar-thermal.yaml b/Documentation/devicetree/bindings/thermal/rcar-thermal.yaml
> index 0994693d240f9ff4..88787b98992fe7c9 100644
> --- a/Documentation/devicetree/bindings/thermal/rcar-thermal.yaml
> +++ b/Documentation/devicetree/bindings/thermal/rcar-thermal.yaml
> @@ -59,25 +59,40 @@ properties:
>    resets:
>      maxItems: 1
>
> -if:
> -  properties:
> -    compatible:
> -      contains:
> -        enum:
> -          - renesas,thermal-r8a73a4 # R-Mobile APE6
> -          - renesas,thermal-r8a7779 # R-Car H1
> -then:
> -  required:
> -    - compatible
> -    - reg
> -else:
> -  required:
> -    - compatible
> -    - reg
> -    - interrupts
> -    - clocks
> -    - power-domains
> -    - resets
> +  '#thermal-sensor-cells':
> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +
> +allOf:
> +  - if:
> +      not:
> +        properties:
> +          compatible:
> +            contains:
> +              enum:
> +                - renesas,thermal-r8a73a4 # R-Mobile APE6
> +                - renesas,thermal-r8a7779 # R-Car H1
> +    then:
> +      required:
> +        - resets
> +        - '#thermal-sensor-cells'
> +
> +  - if:
> +      not:
> +        properties:
> +          compatible:
> +            contains:
> +              const: renesas,thermal-r8a7779 # R-Car H1
> +    then:
> +      required:
> +        - interrupts
> +        - clocks
> +        - power-domains
> +
> +additionalProperties: false
>
>  examples:
>    # Example (non interrupt support)
> --
> 2.17.1
>
