Return-Path: <SRS0=mth2=AK=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B94CC433DF
	for <linux-devicetree@archiver.kernel.org>; Mon, 29 Jun 2020 23:01:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 14AE5206C3
	for <linux-devicetree@archiver.kernel.org>; Mon, 29 Jun 2020 23:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1593471660;
	bh=3wP5b80abw1cycqVOac5xzbE4D1IDX+gIomCXaIgWxg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=RURQAnpuAt47L0A8iDoWgGFmGxX3WYzADo0R6VmuRmuhz2VhLCv9f/pf2DugeVFT2
	 nfhyhqc8fLqVgF7w2BXvhKLyBA0d8XOPGI27qqemMip5OK1u0r6SnSdzqknjq+zCCg
	 g++zHPZDAiLprKQvNNQ1VJivgbFbzf10PdRgUMrk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728541AbgF2XBA (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 29 Jun 2020 19:01:00 -0400
Received: from mail-il1-f195.google.com ([209.85.166.195]:36941 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728512AbgF2XA7 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 29 Jun 2020 19:00:59 -0400
Received: by mail-il1-f195.google.com with SMTP id r12so8782522ilh.4
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2020 16:00:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HDXW6Q7IXpGlVGwl/SyNPRj/AOT6XQANukWDkTboxtk=;
        b=eJXv3u2Ho/uybI8dVh8aPyLfMRFKIw222/bp64SEqEUE6HevFZ/C7YkVweJyeOXj0K
         NLH1YEdRcldNp+RAvXQf6Kp+QJKNcIU5+oDf7350RjgaT3rCLG9G3KI03aOnT4j1Sd5t
         pWEQUFUVocUkuFkqn8zo2QCoYwLwPjaqsQv+dudtjQR5wCwofKagcz7UL2bTcKbqzTWG
         BkcnbrMB44L/88bfRZnygo4Xuh9xpIO82p/Ne8ha0q9fGJN6SJ8vm3z+WENoZmA7p2Ld
         F4rsvXfZYXVX8Ctq06Bs32tN5iN9djx43LRsoFl1GuBHpAY43QyatWSS6S7fmn9/00Vn
         aG3g==
X-Gm-Message-State: AOAM530wLjlnKaKTAYOxPEf8AYmrdIcfZ0o1n2XbtQcz9IgD/eQk3hha
        rEly0ChqLtkzdJFY07jHeA==
X-Google-Smtp-Source: ABdhPJzXkkFIvPP45YSjX5PdPoReaMw/SNOfn8/6F8zjpSyem/3bYxO4nHSPF1bbwwX2kqMox3e3DA==
X-Received: by 2002:a92:4001:: with SMTP id n1mr18469020ila.269.1593471658159;
        Mon, 29 Jun 2020 16:00:58 -0700 (PDT)
Received: from xps15 ([64.188.179.255])
        by smtp.gmail.com with ESMTPSA id y20sm601993ioc.30.2020.06.29.16.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 16:00:57 -0700 (PDT)
Received: (nullmailer pid 3129721 invoked by uid 1000);
        Mon, 29 Jun 2020 23:00:54 -0000
Date:   Mon, 29 Jun 2020 17:00:54 -0600
From:   Rob Herring <robh@kernel.org>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        linux-mtd@lists.infradead.org,
        Boris Brezillon <boris.brezillon@collabora.com>,
        masonccyang@mxic.com.tw, juliensu@mxic.com.tw,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v11 1/2] dt-bindings: mtd: Document nand-ecc-engine
Message-ID: <20200629230054.GA3124427@bogus>
References: <20200626071357.21421-1-miquel.raynal@bootlin.com>
 <20200626071357.21421-2-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200626071357.21421-2-miquel.raynal@bootlin.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Jun 26, 2020 at 09:13:56AM +0200, Miquel Raynal wrote:
> This property is needed to precisely point to the hardware ECC engine
> to use when there are several of them available. Here, hardware also
> refers to the on-die possibility.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../devicetree/bindings/mtd/nand-controller.yaml     | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/nand-controller.yaml b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
> index 4a0798247d2d..0969d2e6720b 100644
> --- a/Documentation/devicetree/bindings/mtd/nand-controller.yaml
> +++ b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
> @@ -56,6 +56,18 @@ patternProperties:
>            (Linux will handle the calculations). soft_bch is deprecated
>            and should be replaced by soft and nand-ecc-algo.
>  
> +      nand-ecc-engine:
> +        maxItems: 1

maxItems is for arrays and this is a phandle. It needs a type reference.

> +        description:

You need '|' at the end if you want the formatting preserved.

> +	  A phandle on the hardware ECC engine if any. There are

A tab is not valid YAML. 

> +          basically three possibilities:
> +          1/ The ECC engine is part of the NAND controller, in this
> +          case the phandle should reference the parent node.
> +          2/ The ECC engine is part of the NAND part (on-die), in this
> +          case the phandle should reference the node itself.
> +          3/ The ECC engine is external, in this case the phandle should
> +          reference the specific ECC engine node.
> +
>        nand-ecc-placement:
>          allOf:
>            - $ref: /schemas/types.yaml#/definitions/string
> -- 
> 2.20.1
> 
