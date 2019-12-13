Return-Path: <SRS0=VR/D=2D=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8277C43603
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Dec 2019 21:43:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 884C3206D8
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Dec 2019 21:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1576273381;
	bh=UACcVMHOgJvfjYNefCFcHrnDrDHVOrSmkkmyngceGpM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=h85jQwRMM9jvp99Eee7QyCDZRRxia33OqWRqR+XBW5Rvps6dUHB/BPGotbP4uStC9
	 Z48qY9XUNt2E3RKdw3am/FBVqE338XvcJlerVcNlBXF0et8Chzx4+1ALIAioJALwF9
	 +IDwiLGb9oxSNxPTJcg+wngbCNT0B2RphbBYJivc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725818AbfLMVnB (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 13 Dec 2019 16:43:01 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:35574 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725554AbfLMVnB (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 13 Dec 2019 16:43:01 -0500
Received: by mail-ot1-f66.google.com with SMTP id o9so779829ote.2
        for <devicetree@vger.kernel.org>; Fri, 13 Dec 2019 13:43:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=MQB7TjgV5T4jJMqF680Zx8rqtE1zr7TyNkD+NPMNF7I=;
        b=i3P5VopLnLCGSkFVvr34s36YjPDN2kSDnZXG+PhXwiQDG3RLGbFGAJY9RQu5N92u5w
         ta8eRVESr/5U3MLlRvC6AKANG6xDd4IpIeNwl6FKjpKXCB5BcmRe8APOyi+DPMeA3xq5
         xgLZ+z0RXH5Hhv2UJo6iG8n+QaVzyhQ57W9hG+mL+GmTGzn/FCNkIpEe7n75+t1W0Gcv
         ni7mXAcaYY5vmh2m1dhzr/LSAbUX+3t8RuektInH5/QEKM8l+tNP/UE3/OlVmNsOB3bc
         uhwj1TMZQ4wAlgbDp0JY+hR1/GGjJZXaC3VJqpm6tmjE7F3gEH1MlRRQZ0WsAMB5EnAO
         CL0Q==
X-Gm-Message-State: APjAAAXn6mnrI7678eHhMSJS9ouU6KejzUavrGpLnd3pe23auo4vnLE0
        C0Sdr1woVZkAzuD433tQew==
X-Google-Smtp-Source: APXvYqx7rWl74CdJfig+1YJkGKx/BE+J3zlPUfgUhv++wHBmfMeBJCoKxZuNeUbMU8aCLoWVjqAXSg==
X-Received: by 2002:a9d:6a8f:: with SMTP id l15mr16522804otq.59.1576273380100;
        Fri, 13 Dec 2019 13:43:00 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id s83sm3733871oif.33.2019.12.13.13.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2019 13:42:59 -0800 (PST)
Date:   Fri, 13 Dec 2019 15:42:58 -0600
From:   Rob Herring <robh@kernel.org>
To:     Joel Stanley <joel@jms.id.au>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Subject: Re: [PATCH v2 1/2] dt-bindings: mfd: Add ast2600 to ASPEED LPC
Message-ID: <20191213214258.GA7625@bogus>
References: <20191129000827.650566-1-joel@jms.id.au>
 <20191129000827.650566-2-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191129000827.650566-2-joel@jms.id.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Nov 29, 2019 at 10:38:26AM +1030, Joel Stanley wrote:
> The AST2600 has the same LPC layout as previous generation SoCs.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> v2: Fix cut and paste error in reset bindings
> ---
>  Documentation/devicetree/bindings/mfd/aspeed-lpc.txt | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt b/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
> index 86446074e206..a5d89aa9a3c1 100644
> --- a/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
> +++ b/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
> @@ -46,6 +46,7 @@ Required properties
>  - compatible:	One of:
>  		"aspeed,ast2400-lpc", "simple-mfd"
>  		"aspeed,ast2500-lpc", "simple-mfd"
> +		"aspeed,ast2600-lpc", "simple-mfd"
>  
>  - reg:		contains the physical address and length values of the Aspeed
>                  LPC memory region.
> @@ -64,6 +65,7 @@ BMC Node
>  - compatible:	One of:
>  		"aspeed,ast2400-lpc-bmc"
>  		"aspeed,ast2500-lpc-bmc"
> +		"aspeed,ast2600-lpc-bmc"
>  
>  - reg:		contains the physical address and length values of the
>                  H8S/2168-compatible LPC controller memory region
> @@ -128,6 +130,7 @@ Required properties:
>  - compatible:	One of:
>  		"aspeed,ast2400-lpc-ctrl";
>  		"aspeed,ast2500-lpc-ctrl";
> +		"aspeed,ast2600-lpc-ctrl";
>  
>  - reg:		contains offset/length values of the host interface controller
>  		memory regions
> @@ -168,6 +171,7 @@ Required properties:
>  - compatible:	One of:
>  		"aspeed,ast2400-lhc";
>  		"aspeed,ast2500-lhc";
> +		"aspeed,ast2600-lhc";
>  
>  - reg:		contains offset/length values of the LHC memory regions. In the
>  		AST2400 and AST2500 there are two regions.
> @@ -187,8 +191,11 @@ state of the LPC bus. Some systems may chose to modify this configuration.
>  
>  Required properties:
>  
> - - compatible:		"aspeed,ast2500-lpc-reset" or
> -			"aspeed,ast2400-lpc-reset"
> + - compatible:		One of:
> +			"aspeed,ast2400-reset";
> +			"aspeed,ast2500-reset";
> +			"aspeed,ast2600-reset";

Doesn't match what's in the driver.

Rob
