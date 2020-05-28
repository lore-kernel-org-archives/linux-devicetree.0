Return-Path: <SRS0=2ZKK=7K=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 308BEC433DF
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 May 2020 21:22:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0169020721
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 May 2020 21:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1590700930;
	bh=5pgAxZhSGqYHjj6wowJ9Izgfbl38u4nU14jlc82dM20=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=I0c5eHlAEjKRE01lKdS/Vm9FxoFaa28VLN+F1oMRl7AZXYM8+XSNiyvdQ/plxc9ZT
	 ScPkLT9ZKjKLTotKq4ihKfNIKP9PpvK/i7+HHRlvoTnUApxRA4XCQQjAeSkRMDW39C
	 TZAZwJOLdELzfDlMDHNOQaRwkL6Q6H10M8uGzpfI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436494AbgE1VWJ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 28 May 2020 17:22:09 -0400
Received: from mail-il1-f196.google.com ([209.85.166.196]:46014 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436527AbgE1VWI (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 28 May 2020 17:22:08 -0400
Received: by mail-il1-f196.google.com with SMTP id 9so362801ilg.12
        for <devicetree@vger.kernel.org>; Thu, 28 May 2020 14:22:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=To0MImAwjvqag3VAUNXV0DUtWR10A9REtHprkgmtmDY=;
        b=Zs0Vm9pwxy6Htedpxdahg9mwzoWpSudoXj8fhk2f/cZ1ExtkJ9jvtRlBBpfyK18m47
         wdGkjreHlWZ7tB1L8kM1WcBO7odId/YpJHdXZgnb0cHloKRmENpdsqEsvuoxTUn3TW1w
         EMZOJrW9i7D/MkS2BgPDJpoqnRAgQuDsakbNuyGreWgKwFX5J/WLT4Fnty++ynWmj51F
         hXUgNDqMqvwKkuRazaI6DAjgq3mw9Myvjo5w5MoOcUQmpIsMlIllvhUYW+A59bwknmUR
         +V7ZEsxBmCaIa3X5fdX1ataxVdkCFeZkD+5+CpURglvF353pEeiATJqb7WSh0q3d8VWt
         +Chw==
X-Gm-Message-State: AOAM5305N31tVoxo78TYs+5aJBlEGy2FxzKKZpa0iwmltb31KPEKjWdG
        snuFcwqFj8ME5jtXdbVkZQ==
X-Google-Smtp-Source: ABdhPJxPQCBhqRbh6yY1Y0SKjEPh0cgrS1kldGfVcUomDpSrOeTHfsYVtZpMp1cbWsXyfhkhQ9Tm+Q==
X-Received: by 2002:a92:d449:: with SMTP id r9mr4794314ilm.166.1590700927426;
        Thu, 28 May 2020 14:22:07 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id c70sm1216409ila.42.2020.05.28.14.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 14:22:06 -0700 (PDT)
Received: (nullmailer pid 708257 invoked by uid 1000);
        Thu, 28 May 2020 21:22:05 -0000
Date:   Thu, 28 May 2020 15:22:05 -0600
From:   Rob Herring <robh@kernel.org>
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     devicetree@vger.kernel.org, Richard Weinberger <richard@nod.at>,
        Tudor Ambarus <tudor.ambarus@microchip.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-mtd@lists.infradead.org,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Harvey Hunt <harveyhuntnexus@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 2/4] dt-bindings: mtd: nand: Document the generic
 rb-gpios property
Message-ID: <20200528212205.GA708162@bogus>
References: <20200519232454.374081-1-boris.brezillon@collabora.com>
 <20200519232454.374081-2-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200519232454.374081-2-boris.brezillon@collabora.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, 20 May 2020 01:24:52 +0200, Boris Brezillon wrote:
> A few drivers use this property to describe GPIO pins used to sample
> the NAND Ready/Busy state. Let's make it part of the generic binding
> doc.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
> Changes in v2:
> * New patch
> ---
>  Documentation/devicetree/bindings/mtd/nand-controller.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
