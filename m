Return-Path: <SRS0=jmN2=2I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCBB9C2D0CD
	for <linux-devicetree@archiver.kernel.org>; Wed, 18 Dec 2019 22:18:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9D72721D7D
	for <linux-devicetree@archiver.kernel.org>; Wed, 18 Dec 2019 22:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1576707493;
	bh=A+xasi2y41lW5y7F1X7IeYglYw0EFpj9DD59PhNuJ38=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=0If3zmNAI7jluR8tDEe5wSqG38TOrCPfp9fXjO4zM4+Oo31N23I0CXpow/NzvLLJF
	 PYoDKxQbWSuMoTB8kMeTcSX17ZV+CAefdn3WBSEMwPWtSaHpCeL/AkPBOXTkU4qgmR
	 AQI/X5Dp+L4spHAfxIc2u74eBahYwgAGkbY134I8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726704AbfLRWSL (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 18 Dec 2019 17:18:11 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:37524 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726701AbfLRWSL (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 18 Dec 2019 17:18:11 -0500
Received: by mail-oi1-f194.google.com with SMTP id h19so2048885oih.4
        for <devicetree@vger.kernel.org>; Wed, 18 Dec 2019 14:18:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=uYxswBgZAiTLI2tTYUd7v8zHT1mrovfVUjVCk1N6olY=;
        b=aBWot61ata9jxxWNH1gOytZJh9quDcDqUMagrii3o9qbcEMfcgm4SBDXlRxFB1Pjyg
         VEfEjFfZkijZ3boWONTE5xF69ceGQwWirYOjpq0bGOpBw2o1usQkTngP1cyO3xPsud1t
         C/5feaIMRDS3sDTboOMUUZCpOpIEFCulZR8fPPrq7XfBupjNyzwFOTwrtECQg/RXSGH8
         4bsKjz69e1RZXMv/7FzbqraviN/Dbs1d6sYmeQC0nuHUV+JJwRj1yUHAyaqmkemvm0ET
         UUbqc3y8bwkS5xoQ1xACtxdTNTbAlKRnWyDwy4qH3T0X3P0VRJYJO3AzM4JIvREshXqx
         YF9w==
X-Gm-Message-State: APjAAAXQMfKNyc7CfqIICDZJvtb363Y9GUBWHTpD4EB3a24zia26E5Cw
        6gkfv34RB8sOnKPyO4IrbA==
X-Google-Smtp-Source: APXvYqx1/vDB+TcHIO9sTlIA5oKvGc9NKrFg+21wXmHM5ouHlzRBUgHOjtgzGeFA5nBhdY34QJj2rw==
X-Received: by 2002:aca:1e0e:: with SMTP id m14mr1633487oic.114.1576707490155;
        Wed, 18 Dec 2019 14:18:10 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id r13sm1275547oic.52.2019.12.18.14.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2019 14:18:09 -0800 (PST)
Date:   Wed, 18 Dec 2019 16:18:09 -0600
From:   Rob Herring <robh@kernel.org>
To:     Haren Myneni <haren@linux.ibm.com>
Cc:     mpe@ellerman.id.au, hch@infradead.org, devicetree@vger.kernel.org,
        mikey@neuling.org, herbert@gondor.apana.org.au, npiggin@gmail.com,
        linuxppc-dev@lists.ozlabs.org, sukadev@linux.vnet.ibm.com
Subject: Re: [PATCH V3 01/13] powerpc/vas: Describe vas-port and interrupts
 properties
Message-ID: <20191218221808.GA20302@bogus>
References: <1576561080.16318.6531.camel@hbabu-laptop>
 <1576561720.16318.6532.camel@hbabu-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1576561720.16318.6532.camel@hbabu-laptop>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Dec 16, 2019 at 09:48:40PM -0800, Haren Myneni wrote:
> 

Commit message?

> Signed-off-by: Haren Myneni <haren@us.ibm.com>

Your author and S-o-b emails don't match.

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

64-bit?

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
