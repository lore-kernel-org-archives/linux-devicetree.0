Return-Path: <SRS0=NYOC=62=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FE7BC54E8E
	for <linux-devicetree@archiver.kernel.org>; Tue, 12 May 2020 15:16:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6050520752
	for <linux-devicetree@archiver.kernel.org>; Tue, 12 May 2020 15:16:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech-se.20150623.gappssmtp.com header.i=@ragnatech-se.20150623.gappssmtp.com header.b="V31tIsd5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730229AbgELPQf (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 12 May 2020 11:16:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725888AbgELPQf (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 12 May 2020 11:16:35 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23282C061A0C
        for <devicetree@vger.kernel.org>; Tue, 12 May 2020 08:16:35 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id g4so14105201ljl.2
        for <devicetree@vger.kernel.org>; Tue, 12 May 2020 08:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=medoBnZOlZl9hymoyu3zjzXAjwwmD8iMZ32n+incw6I=;
        b=V31tIsd5txMvsiXUIn9OTB3g0C2LOJ0l0DeD9gAjxmUm9pnFtCcHKy94uxhNltQ1qU
         U3EOVy+Z5ndG90IvfSg/+KPBuZUsEvN3FWLx+W83xLd/oCqp91nGtKnCcEZQWZwG4l3i
         f17jM1QzmccbkWXc2FN9PkaEYGvwS3QVr2tjaTgwudjEfPapPK6jpPQ/jOfMvgCWCEWl
         X4xgKwC3Ckvo7wKcwtXbBzL13mzXBK9wFuRnQfF4CT7JzcWHa5DHdSUyGjuTGO9enhg9
         JRxJEYxzGt/rX18Hhehg0WznupknLd8OsQFpPHDchuOxSv1EzG032xvrgNbKAe55Y0jI
         Uw4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=medoBnZOlZl9hymoyu3zjzXAjwwmD8iMZ32n+incw6I=;
        b=eouuJmWTwAvXx44zg65/aAUKKEVC7nvxGvLsxR6mQbAeg4ZhJs3GgF5CWfYP3tNoST
         +LIFIYeAVf6QWl47huaSIXicssbUvgjwFYHyRre5QgG/+eqXlh+C7e8CvngEFQ3oGOa9
         +lr+gsuszjJVtDfWhHAXdNLriTLMhNPgI4RWPZ92wIHJhFnEMFBHHFYwNaZKL2Sc8Jz8
         DCZMEQcMnO0o+4LKT5kegmXN7e5LYq0RlpvrOCjpR9suZ20doRdGRFOBbbTINsaIT4dz
         0d/dunqJQ2Idoe2DP//ezes3e3u8N054RtbRwlsGKRoHyi9MtxsgqlJAtSn7lzilefkI
         htoA==
X-Gm-Message-State: AOAM530jMZEX5ZqFD5WL5aq/JCrd0PrtcCc9VOgKJQcXuS3SFkNzzK56
        cg5QoW1k2W2pZ/ujlK4Y/Iy+Xw==
X-Google-Smtp-Source: ABdhPJy+PZQoUVIudpoLgl7CeYef7pXDX+9tiu2poUGZbCoBMZJZvixryDJiLzZv2EPfA2wvxKAFbQ==
X-Received: by 2002:a2e:b609:: with SMTP id r9mr725803ljn.125.1589296593474;
        Tue, 12 May 2020 08:16:33 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id a2sm12707613ljj.53.2020.05.12.08.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 08:16:32 -0700 (PDT)
Date:   Tue, 12 May 2020 17:16:31 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: clock: renesas: div6: Convert to json-schema
Message-ID: <20200512151631.GA2542285@oden.dyn.berto.se>
References: <20200507075026.31941-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200507075026.31941-1-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Geert,

Thanks for your work.

On 2020-05-07 09:50:26 +0200, Geert Uytterhoeven wrote:
> Convert the Renesas CPG DIV6 Clock Device Tree binding documentation to
> json-schema.
> 
> Drop R-Car Gen2 compatible values, which were obsoleted by the unified
> "Renesas Clock Pulse Generator / Module Standby and Software Reset" DT
> bindings.
> Update the example to match reality.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> To be queued in clk-renesas-for-v5.8.
> 
>  .../clock/renesas,cpg-div6-clock.yaml         | 60 +++++++++++++++++++
>  .../clock/renesas,cpg-div6-clocks.txt         | 40 -------------
>  2 files changed, 60 insertions(+), 40 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/renesas,cpg-div6-clock.yaml
>  delete mode 100644 Documentation/devicetree/bindings/clock/renesas,cpg-div6-clocks.txt
> 
> diff --git a/Documentation/devicetree/bindings/clock/renesas,cpg-div6-clock.yaml b/Documentation/devicetree/bindings/clock/renesas,cpg-div6-clock.yaml
> new file mode 100644
> index 0000000000000000..c55a7c494e013da5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/renesas,cpg-div6-clock.yaml
> @@ -0,0 +1,60 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/renesas,cpg-div6-clock.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas CPG DIV6 Clock
> +
> +maintainers:
> +  - Geert Uytterhoeven <geert+renesas@glider.be>
> +
> +description:
> +  The CPG DIV6 clocks are variable factor clocks provided by the Clock Pulse
> +  Generator (CPG). Their clock input is divided by a configurable factor from 1
> +  to 64.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - renesas,r8a73a4-div6-clock # R-Mobile APE6
> +          - renesas,r8a7740-div6-clock # R-Mobile A1
> +          - renesas,sh73a0-div6-clock  # SH-Mobile AG5
> +      - const: renesas,cpg-div6-clock
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    oneOf:
> +      - maxItems: 1
> +      - maxItems: 4
> +      - maxItems: 8
> +    description:
> +      For clocks with multiple parents, invalid settings must be specified as
> +      "<0>".
> +
> +  '#clock-cells':
> +    const: 0
> +
> +  clock-output-names: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - '#clock-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/r8a73a4-clock.h>
> +    sdhi2_clk: sdhi2_clk@e615007c {
> +            compatible = "renesas,r8a73a4-div6-clock", "renesas,cpg-div6-clock";
> +            reg = <0xe615007c 4>;
> +            clocks = <&pll1_div2_clk>, <&cpg_clocks R8A73A4_CLK_PLL2S>, <0>,
> +                     <&extal2_clk>;
> +            #clock-cells = <0>;
> +    };
> diff --git a/Documentation/devicetree/bindings/clock/renesas,cpg-div6-clocks.txt b/Documentation/devicetree/bindings/clock/renesas,cpg-div6-clocks.txt
> deleted file mode 100644
> index ae36ab84291988b7..0000000000000000
> --- a/Documentation/devicetree/bindings/clock/renesas,cpg-div6-clocks.txt
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -* Renesas CPG DIV6 Clock
> -
> -The CPG DIV6 clocks are variable factor clocks provided by the Clock Pulse
> -Generator (CPG). Their clock input is divided by a configurable factor from 1
> -to 64.
> -
> -Required Properties:
> -
> -  - compatible: Must be one of the following
> -    - "renesas,r8a73a4-div6-clock" for R8A73A4 (R-Mobile APE6) DIV6 clocks
> -    - "renesas,r8a7740-div6-clock" for R8A7740 (R-Mobile A1) DIV6 clocks
> -    - "renesas,r8a7790-div6-clock" for R8A7790 (R-Car H2) DIV6 clocks
> -    - "renesas,r8a7791-div6-clock" for R8A7791 (R-Car M2-W) DIV6 clocks
> -    - "renesas,r8a7793-div6-clock" for R8A7793 (R-Car M2-N) DIV6 clocks
> -    - "renesas,r8a7794-div6-clock" for R8A7794 (R-Car E2) DIV6 clocks
> -    - "renesas,sh73a0-div6-clock" for SH73A0 (SH-Mobile AG5) DIV6 clocks
> -    and "renesas,cpg-div6-clock" as a fallback.
> -  - reg: Base address and length of the memory resource used by the DIV6 clock
> -  - clocks: Reference to the parent clock(s); either one, four, or eight
> -    clocks must be specified.  For clocks with multiple parents, invalid
> -    settings must be specified as "<0>".
> -  - #clock-cells: Must be 0
> -
> -
> -Optional Properties:
> -
> -  - clock-output-names: The name of the clock as a free-form string
> -
> -
> -Example
> --------
> -
> -	sdhi2_clk: sdhi2_clk@e615007c {
> -		compatible = "renesas,r8a73a4-div6-clock", "renesas,cpg-div6-clock";
> -		reg = <0 0xe615007c 0 4>;
> -		clocks = <&pll1_div2_clk>, <&cpg_clocks R8A73A4_CLK_PLL2S>,
> -			 <0>, <&extal2_clk>;
> -		#clock-cells = <0>;
> -		clock-output-names = "sdhi2ck";
> -	};
> -- 
> 2.17.1
> 

-- 
Regards,
Niklas Söderlund
