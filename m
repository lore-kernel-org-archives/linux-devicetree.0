Return-Path: <SRS0=ioLT=AU=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99F40C433DF
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Jul 2020 20:03:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 67551207DD
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Jul 2020 20:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594325003;
	bh=ksBG+gsXAy9YKXX0kS50DfpQgyWBjkvmITuov87Jqpg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=csPxQZcZFlX33mLbU+dt4ZT7YL9RIoU7/heB5QIrFa28OWf+WAYJsU51f7cZ/4KAq
	 yD/GmGUeGuStOSEJkj4kZuDU6C+mMIAbjkSPLlBnXDhdyLe5d1FRiwFnZ/90kEyBqw
	 Yhuq5L2LplHYRCUkDcBc9R4yZtlxBQoglwt8UM3o=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726290AbgGIUDX (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 9 Jul 2020 16:03:23 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:34115 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726193AbgGIUDW (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 9 Jul 2020 16:03:22 -0400
Received: by mail-io1-f66.google.com with SMTP id q74so3681964iod.1
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2020 13:03:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xVnLYByyzlTsmGIoIT0Rn0lgHoJ1iurwkE/MAFpFY+8=;
        b=K2bJjW4iQSRlT6tuJqrfOcfKRqTle6C0nzEZBlsMc4QUGVvFi+JeUKzLqZU6AIsoiw
         G+fVTmAHLy/gUtiN96p5WMXSr3CRTZvaJmZoec9Frb117FO1VyySDcuP35l8y7ImsZww
         xMl8Ks9nw0kZj04EXVvCBgVl1m4nriUYqRiZqPF5qWH+R8ysO56qp0ST9Iiyf4uSEIQP
         Vquvk/cO+Eh+AiTJzx1VUukmwaa5+EHfRLmOEpIuOR1q6MQebp52xdz9ezCqH+MX53G9
         zWEoaGXxpagaSsD9cQSoYgaoIPWoUNvbf/j8iGLLO6TmlGe8aHJm8ODMlBhMwQWgpwUZ
         eg4Q==
X-Gm-Message-State: AOAM530GdxZI+4siW4yfwdlxYCiaez0t8xwqaz/ZDJ7VliYVXFwJQGx7
        a46P/V9/ETyaYRexUOM9kg==
X-Google-Smtp-Source: ABdhPJy+ynC+nQTZHPsV15rOCIFh8rjSW8zvvSkqfq488KMdusP1oC+YKGtEndupVeqX++KTWFxjsQ==
X-Received: by 2002:a05:6638:11cb:: with SMTP id g11mr10581396jas.14.1594325001836;
        Thu, 09 Jul 2020 13:03:21 -0700 (PDT)
Received: from xps15 ([64.188.179.254])
        by smtp.gmail.com with ESMTPSA id p9sm2389323ilc.78.2020.07.09.13.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 13:03:21 -0700 (PDT)
Received: (nullmailer pid 799772 invoked by uid 1000);
        Thu, 09 Jul 2020 20:03:19 -0000
Date:   Thu, 9 Jul 2020 14:03:19 -0600
From:   Rob Herring <robh@kernel.org>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        juliensu@mxic.com.tw, Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        masonccyang@mxic.com.tw, devicetree@vger.kernel.org,
        linux-mtd@lists.infradead.org
Subject: Re: [PATCH v12 2/2] dt-bindings: mtd: Document boolean NAND ECC
 properties
Message-ID: <20200709200319.GA799550@bogus>
References: <20200630072822.26828-1-miquel.raynal@bootlin.com>
 <20200630072822.26828-3-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200630072822.26828-3-miquel.raynal@bootlin.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, 30 Jun 2020 09:28:22 +0200, Miquel Raynal wrote:
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
>  .../devicetree/bindings/mtd/nand-controller.yaml          | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
