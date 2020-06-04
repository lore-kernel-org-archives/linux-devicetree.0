Return-Path: <SRS0=QtGe=7R=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1848EC433DF
	for <linux-devicetree@archiver.kernel.org>; Thu,  4 Jun 2020 23:08:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E2816207ED
	for <linux-devicetree@archiver.kernel.org>; Thu,  4 Jun 2020 23:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1591312089;
	bh=/h+HNDvr9yYtXCzEgPATtWxNm3cQ7KYrQLb+bdeLQ78=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=uvSrpUZhv0mgUkb+AU4xJOviU4pjE4+rJ1tJdh7vFoi2ifQ+06nPoO8FK3NMAxeLy
	 9lHSvWqTrrnLyrx088OZ8ncFEbdddHNLtZP4WGDNxAtQaCRDVsQDqUpM9jXDPe7xaE
	 8p1pvV5HkpZ7gMd33eiwyaqM1x2JqFQ1L0NoMqnY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725497AbgFDXIJ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 4 Jun 2020 19:08:09 -0400
Received: from mail-il1-f196.google.com ([209.85.166.196]:45150 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725863AbgFDXIJ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 4 Jun 2020 19:08:09 -0400
Received: by mail-il1-f196.google.com with SMTP id 9so7720546ilg.12
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2020 16:08:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jRy2xtFWKNlAqAVXEHvJHfSiEZWhYR4CV8B2YeBv94Q=;
        b=TA64C9W/dWvZk5NCvTkAAlPP8qKUeEwlcOLvk7ecnKUoEwSKTnuK8VKWuCxS+b2QpN
         Zl8rteESRz4IDDc7C1dy2t9N1hsimPm60DR+hbMlCooVSgcpW9lYFQlkUlskP0WtB+8t
         8Sozpy2BCivhMe8yHeh56NfEnARdQOkMVhF4yD2p+c7Ead0Eoi+hSIWd81xpr8dqSZns
         a5U2aE93w2QbuE8Ne6TVl68TSTP5p381sljSTYsmtzWK6Atc/obsgdrR6nooXbXPo6T3
         ZSkl3OpZX9mSpdPHWbzBlchPZQpzGBr3j6lZSahiuUPy1hopJyDwRs9tK0N2E8kG8AxT
         Xa6g==
X-Gm-Message-State: AOAM530xugoX65i0Plo+iDa77A71et7mmLSzcLi1zyGJLiHqefnYx1CC
        yGeI4f9TvfuobPajVQEjlw==
X-Google-Smtp-Source: ABdhPJxBwqg2KjhkMQTT+Bjb8yKCzHP3CMKvZqePsJSASFJh55N1HQlDha382TaJKKuPgN6f4WReOQ==
X-Received: by 2002:a92:7901:: with SMTP id u1mr6285248ilc.52.1591312086941;
        Thu, 04 Jun 2020 16:08:06 -0700 (PDT)
Received: from xps15 ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id z16sm2022433ilz.64.2020.06.04.16.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2020 16:08:05 -0700 (PDT)
Received: (nullmailer pid 17414 invoked by uid 1000);
        Thu, 04 Jun 2020 23:08:04 -0000
Date:   Thu, 4 Jun 2020 17:08:04 -0600
From:   Rob Herring <robh@kernel.org>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        linux-mtd@lists.infradead.org,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        linux-arm-kernel@lists.infradead.org,
        Mason Yang <masonccyang@mxic.com.tw>,
        Julien Su <juliensu@mxic.com.tw>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH v10 07/20] dt-bindings: mtd: Document boolean NAND ECC
 properties
Message-ID: <20200604230804.GA13821@bogus>
References: <20200603175759.19948-1-miquel.raynal@bootlin.com>
 <20200603175759.19948-8-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200603175759.19948-8-miquel.raynal@bootlin.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Jun 03, 2020 at 07:57:46PM +0200, Miquel Raynal wrote:
> Document nand-use-soft-ecc-engine and nand-no-ecc-engine properties.
> The former is here to force software correction, the latter prevents
> any correction to happen.
> 
> These properties (along with nand-ecc-engine) are supposed to be more
> accurate than the current nand-ecc-modes wich is very misleading and
> very often people think it is mandatory while the core should be
> relied upon to decide which correction to handle.
> 
> nand-ecc-mode was already inacurate, but it becomes totally
> problematic with setups where there are several hardware engines.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  Documentation/devicetree/bindings/mtd/nand-controller.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/nand-controller.yaml b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
> index 0969d2e6720b..a3750978ebb8 100644
> --- a/Documentation/devicetree/bindings/mtd/nand-controller.yaml
> +++ b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
> @@ -68,6 +68,12 @@ patternProperties:
>            3/ The ECC engine is external, in this case the phandle should
>            reference the specific ECC engine node.
>  
> +      nand-use-soft-ecc-engine: true
> +        description: Use a software ECC engine.

Humm, I'm surprised this is valid YAML. nand-use-soft-ecc-engine can't 
be both a boolean and a map (aka schema, aka dict).

nand-use-soft-ecc-engine:
  type: boolean
  description: ...

> +
> +      nand-no-ecc-engine: true
> +        description: Do not use any ECC correction.
> +
>        nand-ecc-placement:
>          allOf:
>            - $ref: /schemas/types.yaml#/definitions/string
> -- 
> 2.20.1
> 
