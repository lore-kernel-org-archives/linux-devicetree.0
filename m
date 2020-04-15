Return-Path: <SRS0=bvxT=57=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0089C3815B
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Apr 2020 16:17:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8E2FB20656
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Apr 2020 16:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1586967472;
	bh=zP3lZ8cIaF1xN3mOhhjx+SXGY2uwLZfMaLq+cugMpB0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=eR4gocfuEGI7u0jdq9YH7ykRc7HuLPBA63tFtvq1bMgqsdZ7wAGUZ3V8Hpj4dMRES
	 eoZfCAi3LMbxtbEf6+/lDZnpPmOZbYy/bUw8VV9L91odG9DxvAK1xnZCOLLJ/SyU3s
	 +3VipsO3GF/2kszVa1xZTVfk8OCXkD7fJvL+CwaY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407097AbgDOQRv (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Apr 2020 12:17:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:34636 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2406838AbgDOQRu (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 15 Apr 2020 12:17:50 -0400
Received: from localhost (unknown [106.201.106.187])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EBD3120656;
        Wed, 15 Apr 2020 16:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586967470;
        bh=zP3lZ8cIaF1xN3mOhhjx+SXGY2uwLZfMaLq+cugMpB0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gUWW7cntAUTAnTbxd/cZ2tr4jipCWJRHbreDzAm/RrO6G0pC0G0fkjNsc7VZv3zEQ
         orfWsfIwk65UF8ptT7MIcEnP662Df60Na1D5U4Iame0Cg/inAMto6HOojbRnZmaGoT
         smTtPa5RDe4yS9gEKhO5dkvLL8IRFkxpRAo+K4Cs=
Date:   Wed, 15 Apr 2020 21:47:39 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     dmaengine@vger.kernel.org,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: dma: uniphier-xdmac: switch to single reg
 region
Message-ID: <20200415161739.GA72691@vkoul-mobl>
References: <20200401032150.19767-1-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200401032150.19767-1-yamada.masahiro@socionext.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 01-04-20, 12:21, Masahiro Yamada wrote:
> The reg in the example "<0x5fc10000 0x1000>, <0x5fc20000 0x800>"
> is wrong. The register region of this controller is much smaller,
> and there is no other hardware register interleaved. There is no
> good reason to split it into two regions.
> 
> Just use a single, contiguous register region.
> 
> While I am here, I made the 'dma-channels' property mandatory because
> otherwise there is no way to determine the number of the channels.
> 
> Please note the original binding was merged recently. Since there
> is no user yet, this change has no actual impact.

Applied, thanks

-- 
~Vinod
