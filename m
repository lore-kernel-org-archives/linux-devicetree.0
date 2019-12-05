Return-Path: <SRS0=PToE=Z3=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBF5EC2D0BF
	for <linux-devicetree@archiver.kernel.org>; Thu,  5 Dec 2019 17:56:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 96057206DB
	for <linux-devicetree@archiver.kernel.org>; Thu,  5 Dec 2019 17:56:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech-se.20150623.gappssmtp.com header.i=@ragnatech-se.20150623.gappssmtp.com header.b="CyujlaIg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730189AbfLER4T (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 5 Dec 2019 12:56:19 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:33435 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730182AbfLER4T (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 5 Dec 2019 12:56:19 -0500
Received: by mail-lj1-f194.google.com with SMTP id 21so4656664ljr.0
        for <devicetree@vger.kernel.org>; Thu, 05 Dec 2019 09:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=c4t/2lH9ADnhGOla0nH+1fkWqSg9AnmdrIjfqIOk9Mk=;
        b=CyujlaIgveuIQDkTmHRARroODnsP0l8ebNnlLr/WwEPrOwxoaZlQ5YdC3DgODinCQJ
         1C8ddc4GaR6+7eqhAuEXg31uUCj25Cxi0wVoB+sGU9GWG6wDSgSPbUZI+ByIP4ah6M08
         UZhP+FgJwszIcvqzSztw0pERIUaFw5kVqyK1SxUgitraUbWqETN9gfFeO4R7pBmdfvBK
         Gjl0aBteS2rtODUFNnWnYJFZ/2h7lCzFTOn+6Gownz6WOFkDJU9zI9P2bwuYyGRjSXAs
         VJJNHdAVLJ2tt/NlY8AYKOJXaW9cQU/S0+4N/3eDBgO3XytmNMZ1JhAufPh5Mj88hiH5
         lZEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=c4t/2lH9ADnhGOla0nH+1fkWqSg9AnmdrIjfqIOk9Mk=;
        b=UHuacqNFJT9aXmqctYylef5uXbHx3yJt0nytRpuEv8KKGqZ2fsSw305gddHhfYCuIl
         hxp450VU9TZsJ6/IvnxuV6PolIG+xCcCSqBN/18k32MznoD+o0FkETDVvweyzaQeN9DE
         1mdO10YzZKSLAIi4v9nVvjos9JZ9bxSH73LoG1iCOHv1Uh0upGYn7guS4hIOCUfQrPKv
         mxJri7OLnUhhRBh1lM2rR4JazJJBjpWryCmXMzR2Om3H5oad3Vk74a3kEdwNSGkGUe4X
         vjlYG7bsUmC79SXdNniyb0JPFztfKDZfqeCBQLHxHxbaDja+mTPL4L/Gl+1qXaYRMRr9
         luJw==
X-Gm-Message-State: APjAAAVY+iECO9oXjsG4zpbiuOVzLwVuh4QxAEYWO4rFNVgrYKPulPj7
        09Tc/C02ghJLDH48ptBSX2jc7g==
X-Google-Smtp-Source: APXvYqztueSe84EvxOgy/5oWqGBVCnt1FjjfsdvaYI9RZmrsOXFgNBejQD6MS3BEIRTsJ7T1F5v8wg==
X-Received: by 2002:a05:651c:204f:: with SMTP id t15mr6593009ljo.240.1575568576925;
        Thu, 05 Dec 2019 09:56:16 -0800 (PST)
Received: from localhost (h-93-159.A463.priv.bahnhof.se. [46.59.93.159])
        by smtp.gmail.com with ESMTPSA id z13sm5332330ljh.21.2019.12.05.09.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2019 09:56:16 -0800 (PST)
Date:   Thu, 5 Dec 2019 18:56:15 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        "David S . Miller" <davem@davemloft.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: net: ravb: Document r8a77961 support
Message-ID: <20191205175615.GG28879@bigcity.dyn.berto.se>
References: <20191205134504.6533-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191205134504.6533-1-geert+renesas@glider.be>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Geert,

Thanks for your work.

On 2019-12-05 14:45:04 +0100, Geert Uytterhoeven wrote:
> Document support for the Ethernet AVB interface in the Renesas R-Car
> M3-W+ (R8A77961) SoC.
> 
> Update all references to R-Car M3-W from "r8a7796" to "r8a77960", to
> avoid confusion between R-Car M3-W (R8A77960) and M3-W+.
> 
> No driver update is needed.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  Documentation/devicetree/bindings/net/renesas,ravb.txt | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/renesas,ravb.txt b/Documentation/devicetree/bindings/net/renesas,ravb.txt
> index 5df4aa7f681154ee..87dad2dd8ca0cd6c 100644
> --- a/Documentation/devicetree/bindings/net/renesas,ravb.txt
> +++ b/Documentation/devicetree/bindings/net/renesas,ravb.txt
> @@ -21,7 +21,8 @@ Required properties:
>        - "renesas,etheravb-r8a774b1" for the R8A774B1 SoC.
>        - "renesas,etheravb-r8a774c0" for the R8A774C0 SoC.
>        - "renesas,etheravb-r8a7795" for the R8A7795 SoC.
> -      - "renesas,etheravb-r8a7796" for the R8A7796 SoC.
> +      - "renesas,etheravb-r8a7796" for the R8A77960 SoC.
> +      - "renesas,etheravb-r8a77961" for the R8A77961 SoC.
>        - "renesas,etheravb-r8a77965" for the R8A77965 SoC.
>        - "renesas,etheravb-r8a77970" for the R8A77970 SoC.
>        - "renesas,etheravb-r8a77980" for the R8A77980 SoC.
> @@ -37,8 +38,8 @@ Required properties:
>  - reg: Offset and length of (1) the register block and (2) the stream buffer.
>         The region for the register block is mandatory.
>         The region for the stream buffer is optional, as it is only present on
> -       R-Car Gen2 and RZ/G1 SoCs, and on R-Car H3 (R8A7795), M3-W (R8A7796),
> -       and M3-N (R8A77965).
> +       R-Car Gen2 and RZ/G1 SoCs, and on R-Car H3 (R8A7795), M3-W (R8A77960),
> +       M3-W+ (R8A77961), and M3-N (R8A77965).
>  - interrupts: A list of interrupt-specifiers, one for each entry in
>  	      interrupt-names.
>  	      If interrupt-names is not present, an interrupt specifier
> -- 
> 2.17.1
> 

-- 
Regards,
Niklas Söderlund
