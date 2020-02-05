Return-Path: <SRS0=uboK=3Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCBA4C35247
	for <linux-devicetree@archiver.kernel.org>; Wed,  5 Feb 2020 16:59:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 871F620674
	for <linux-devicetree@archiver.kernel.org>; Wed,  5 Feb 2020 16:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1580921997;
	bh=NdIdY6bOWJGa3XduBs/202shhJVzsc1q0N0undsE+dM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=MZCv2Bk0PI7zHccvoG2x5ajSSzX40wMUsT4hzKnOg2qL4QjvHlzAwsy92Dl3Ik+IY
	 kgCYIix5C5lOWLcGee+CSfpjIoxwnZjvr5GjFi916kRxxt/1AOlBKPF5rKWGXxBHpp
	 bvD8Ms+7Akc5n9+wOCWmugfr/STnUCvTgivm88RY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726748AbgBEQ75 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 5 Feb 2020 11:59:57 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:50455 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726534AbgBEQ75 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 5 Feb 2020 11:59:57 -0500
Received: by mail-wm1-f68.google.com with SMTP id a5so3288087wmb.0
        for <devicetree@vger.kernel.org>; Wed, 05 Feb 2020 08:59:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=J9lHfSmu3T+zxmC1zITBR2yHsBSPWAsbRFxY8FyMsrc=;
        b=l5tIzzD4poOBBGGtrNZPldjZ5jXVUnGYMD3vn87LdmPwRk3QU0HeN2TCImTxzAZCVc
         Rsu0PNVzpmDts0ulrAf7X0YCkwJaT9lNJDTC3NIjLp7JRv6nNBbKytbrpN4uMpdGesq0
         ODVCJ9Y7fub27HlafMfPynYskVNBXAwzyVFyRz858KaNj6RWdaXFVZYt1EGoRCBc3dBD
         KLgYmJwrAr7zOOd/Mx23LiBIWlfZEVSt+0Av5nsByNSgiGBNp9/B9fyBXRpG4qZrqyys
         ZKxgEyIcooK7fM7PPSTNxViphAD9dDwANfsUMMxO3q59FOA3gDldieufijq8svF8eYxD
         AD7g==
X-Gm-Message-State: APjAAAXkBUnqH9aGAoGh0MyNduVb11I0ZiA4yNZFxzAxUrTgr2d6h3Hx
        UPh4RDrLBVs4ApwHwNEle857WQ/O7g==
X-Google-Smtp-Source: APXvYqwfaXlfSsfF+wm++sfEE+zIl2j0FE22/dO4GsIAfIRi8XhgDdLrw3nChXJK0IJNAqxcc67ZAg==
X-Received: by 2002:a7b:c204:: with SMTP id x4mr6769750wmi.20.1580921994135;
        Wed, 05 Feb 2020 08:59:54 -0800 (PST)
Received: from rob-hp-laptop ([212.187.182.166])
        by smtp.gmail.com with ESMTPSA id x7sm510359wrq.41.2020.02.05.08.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2020 08:59:53 -0800 (PST)
Received: (nullmailer pid 11501 invoked by uid 1000);
        Wed, 05 Feb 2020 16:59:52 -0000
Date:   Wed, 5 Feb 2020 16:59:52 +0000
From:   Rob Herring <robh@kernel.org>
To:     Tomas Paukrt <tomaspaukrt@email.cz>
Cc:     devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mmc: omap-hsmmc: Fix SDIO interrupt
Message-ID: <20200205165952.GA11353@bogus>
References: <SaB.ZWWp.2HlNFL4wfl{.1UAAm}@seznam.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SaB.ZWWp.2HlNFL4wfl{.1UAAm}@seznam.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, 22 Jan 2020 21:10:39 +0100 (CET), "Tomas Paukrt" wrote:
> 
> SDIO interrupt must be specified correctly as IRQ_TYPE_LEVEL_LOW instead of GPIO_ACTIVE_LOW.
> 
> Signed-off-by: Tomas Paukrt <tomaspaukrt@email.cz>
> ---
>  Documentation/devicetree/bindings/mmc/ti-omap-hsmmc.txt      |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks.

Rob
