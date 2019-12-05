Return-Path: <SRS0=PToE=Z3=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7925AC43603
	for <linux-devicetree@archiver.kernel.org>; Thu,  5 Dec 2019 20:36:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4838220707
	for <linux-devicetree@archiver.kernel.org>; Thu,  5 Dec 2019 20:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1575578181;
	bh=b/Yf7qvRstKwzAeR524akm54cWHmM4U4/70lSMtTjps=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=DoQYsQHx0K0uFV+z44d+VfouwYSD1QaeFH/ZKafhnzaTvhPzM33jMDoX/dVz94QWA
	 +lSHUqC2oetH/AXMyRvPypHP4RcUa2AQ6v/q2P05GJOAebrX+TDn+2oVmqCMsuA/dD
	 1hMDGzKsiAkYvNIxChFwHr2xnqi0ZFKsN4F7hA+A=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729450AbfLEUgU (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 5 Dec 2019 15:36:20 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:35752 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729187AbfLEUgU (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 5 Dec 2019 15:36:20 -0500
Received: by mail-oi1-f195.google.com with SMTP id k196so4058248oib.2
        for <devicetree@vger.kernel.org>; Thu, 05 Dec 2019 12:36:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ZxDdi4tWZwGx16qsUivpeEYi/QdxFDG6lu1aaAIGIhQ=;
        b=pM+8n4j1E6UQU5/oNCTG6okK0CR0OXOlQIvfpRfmo5TZoYMKd0hNkeEcpC9a5Qw0ww
         /F8PuKRD3k18D+KFLfOCcq6GSb1g4b/bOEWjYUikfEqK5M3VLUtr2yh64x/ri8K/CH7R
         /940qIeNEFc1sJi6m2ogygblRQ08r+yNsPjEveSfXHZunFa7oIA0lLBYGS37AAl8kEhs
         3yr4zGIjBJSM3E8tkcUvaM0f6MvX9WFmLMurgcJIoH8tWxdc7VeC6Cs2jWZfi1LneDgf
         VI0I+VXaIWZP5M1odMPeoPPVx2jqDzBYHNF/Cv7SuR8Dq1Q8OWQsv0jnbK5eQVLDFHzb
         8JxQ==
X-Gm-Message-State: APjAAAWMRc9iDCuiBSOjs5U+Ob+IV8/XoUj09QrprUvtwp0HFR6dena0
        E/XfgoZf/6kJk66cPLcRFA==
X-Google-Smtp-Source: APXvYqzYl1PiM/lOBJJsKXVawc+2jiuwRnCBFFqCTTpp7sRvT16zLjnLLQFobFKmhv+5fOCdXqzUnw==
X-Received: by 2002:aca:ad11:: with SMTP id w17mr9342474oie.85.1575578179673;
        Thu, 05 Dec 2019 12:36:19 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id e6sm3766415otl.12.2019.12.05.12.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2019 12:36:18 -0800 (PST)
Date:   Thu, 5 Dec 2019 14:36:18 -0600
From:   Rob Herring <robh@kernel.org>
To:     Haren Myneni <haren@linux.vnet.ibm.com>
Cc:     linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org,
        mpe@ellerman.id.au, npiggin@gmail.com, mikey@neuling.org,
        herbert@gondor.apana.org.au, sukadev@linux.vnet.ibm.com,
        hbabu@us.ibm.com
Subject: Re: [PATCH 01/14] powerpc/vas: Describe vas-port and interrupts
 properties
Message-ID: <20191205203618.GA26880@bogus>
References: <1574816523.13250.4.camel@hbabu-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1574816523.13250.4.camel@hbabu-laptop>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Nov 26, 2019 at 05:02:03PM -0800, Haren Myneni wrote:
> [PATCH 01/14] powerpc/vas: Describe vas-port and interrupts properties

Something wrong here with the subject in the body.

> 
> Signed-off-by: Haren Myneni <haren@us.ibm.com>
> ---
>  Documentation/devicetree/bindings/powerpc/ibm,vas.txt | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/powerpc/ibm,vas.txt b/Documentation/devicetree/bindings/powerpc/ibm,vas.txt
> index bf11d2f..12de08b 100644
> --- a/Documentation/devicetree/bindings/powerpc/ibm,vas.txt
> +++ b/Documentation/devicetree/bindings/powerpc/ibm,vas.txt
> @@ -11,6 +11,8 @@ Required properties:
>    window context start and length, OS/User window context start and length,
>    "Paste address" start and length, "Paste window id" start bit and number
>    of bits)
> +- ibm,vas-port : Port address for the interrupt.

What's the size of this property?

> +- interrupts: IRQ value for each VAS instance and level.
>  
>  Example:
>  
> @@ -18,5 +20,8 @@ Example:
>  		compatible = "ibm,vas", "ibm,power9-vas";
>  		reg = <0x6019100000000 0x2000000 0x6019000000000 0x100000000 0x8000000000000 0x100000000 0x20 0x10>;
>  		name = "vas";
> +		interrupts = <0x1f 0>;
> +		interrupt-parent = <&mpic>;
>  		ibm,vas-id = <0x1>;
> +		ibm,vas-port = <0x6010001000000>;
>  	};
> -- 
> 1.8.3.1
> 
> 
> 
