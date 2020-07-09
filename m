Return-Path: <SRS0=ioLT=AU=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39C72C433E0
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Jul 2020 20:02:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 086E7207DD
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Jul 2020 20:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594324952;
	bh=E7XZ/K+ObpvmjoLpdQfpJD8bXLtD8AhmINmZjedrKtU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=gKjgaEJ+sUVXgav0nKi+ifueS9BGcS0143AZLQhF0tkepmTotl0J9bfl7znC4BHe/
	 DhknU0+QCJCWRH5hkq+ahrQhtJzuihLTwlH36eTzs5CttHvtEWyDvmyL/TO88yiy/H
	 Ajqf0HXJQDTX6EHC/rO5tPyvLwHRvXL3si3/PwEE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726444AbgGIUCb (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 9 Jul 2020 16:02:31 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:36990 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726262AbgGIUCa (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 9 Jul 2020 16:02:30 -0400
Received: by mail-il1-f194.google.com with SMTP id r12so3124134ilh.4
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2020 13:02:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GbTUX1hwKznFo8qdo7VPy0xviwT8SF70NrxL0PIGu+g=;
        b=Cxn/fqhbU/4dlOg5Oz2Hx4/Dk/QxPyD+A2OI6n8PfnPMG+YSwV4r0Af9XR3/Sk/BQu
         ch95w570Qn5Id7NwV2YTKFf3o7BSPI13BUw8Gmigw3IHCy81RafJ2FwZnLiPbwB0oPha
         83wHRcBZA4aSNSWgMuC0Xkcpea5fCKJ9vWX3c6yymCly3OugNbE1V3D5wp6lYQY6sU88
         NoK7G0cbRbdSpmZC1nbZjmj7PHX9naRc787yCY+SCgkJP6R9hJHnboeQbfLq/ZSi/hOX
         +GWlg+K9YKRLMc/jVYqdr9Ogql0pgDST7qBTusR3PBQrYY1hM1ziH54rdhlqNYyv8uVE
         +9RA==
X-Gm-Message-State: AOAM533shxEZk0b4Kq6+YOhuSeOJjeVMv0+qxDvAP7GP1UzZREyL8Jyf
        rVbJMzIBmXGEosxKSrcxZQ==
X-Google-Smtp-Source: ABdhPJz0QSJxq4uXeq0pX5m+bVycJTydWUAO2wtdZvzLlVGo+HlU3R6Ma3f/G0BZECagKS2h0xdMkA==
X-Received: by 2002:a92:5fc9:: with SMTP id i70mr50905844ill.176.1594324949752;
        Thu, 09 Jul 2020 13:02:29 -0700 (PDT)
Received: from xps15 ([64.188.179.254])
        by smtp.gmail.com with ESMTPSA id s190sm2496383ilc.28.2020.07.09.13.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 13:02:29 -0700 (PDT)
Received: (nullmailer pid 798537 invoked by uid 1000);
        Thu, 09 Jul 2020 20:02:28 -0000
Date:   Thu, 9 Jul 2020 14:02:28 -0600
From:   Rob Herring <robh@kernel.org>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Vignesh Raghavendra <vigneshr@ti.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        devicetree@vger.kernel.org, masonccyang@mxic.com.tw,
        linux-mtd@lists.infradead.org,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        juliensu@mxic.com.tw, Rob Herring <robh+dt@kernel.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Richard Weinberger <richard@nod.at>,
        Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v12 1/2] dt-bindings: mtd: Document nand-ecc-engine
Message-ID: <20200709200228.GA798487@bogus>
References: <20200630072822.26828-1-miquel.raynal@bootlin.com>
 <20200630072822.26828-2-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200630072822.26828-2-miquel.raynal@bootlin.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, 30 Jun 2020 09:28:21 +0200, Miquel Raynal wrote:
> This property is needed to precisely point to the hardware ECC engine
> to use when there are several of them available. Here, hardware also
> refers to the on-die possibility.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../devicetree/bindings/mtd/nand-controller.yaml    | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
