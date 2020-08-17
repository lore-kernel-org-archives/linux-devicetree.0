Return-Path: <SRS0=+eHa=B3=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D77F9C433E1
	for <linux-devicetree@archiver.kernel.org>; Mon, 17 Aug 2020 19:30:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AB9DC2065D
	for <linux-devicetree@archiver.kernel.org>; Mon, 17 Aug 2020 19:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1597692635;
	bh=CA4+33mvAi9bCJK9mJMkAaOtaidy2/wJ9bGF+iDFvhE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=RGTabEMTyBt90r6lxZssyK7Yo4lVLnfTe6ULeCJ5TiD8bldJyimsMKNFQ1vZZtU+Y
	 dLOIys7eD4WCdb/3lFigKzD3PFxZnqrBojqo0cUX5VvdTO9cd0660NoRmSg+dvGmrn
	 ZvAHmxgIxydkUxakdZhkw5VAvqzU20oLPm+yA2Pc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731975AbgHQTa1 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 17 Aug 2020 15:30:27 -0400
Received: from mail-io1-f42.google.com ([209.85.166.42]:32911 "EHLO
        mail-io1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390306AbgHQTaO (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 17 Aug 2020 15:30:14 -0400
Received: by mail-io1-f42.google.com with SMTP id g14so18889223iom.0;
        Mon, 17 Aug 2020 12:30:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=e1YBnijyooiMmGUl6bQPbkF8jV9bZqxe6/wwsQeLU4Y=;
        b=duOIGl3tJUPi0LSFzYrw4l6mxc5YGmtukkRRKLvPfmulJfmrv6a/vRtmLQhKmQf9gi
         90YrKliXC+s0dOGkUqLcdNPvckE8U+DWh3lwH0pZueM/C5zmUbLmHQeoh9F3hdIGjaKY
         xm4lVVsBoCAlSsBPNeo9i79jjmE8atJyEIbRXKNsPZw6nnBegOLmzrUBeahIm0mNlvgP
         VHsD+54lhcvhQJI9XvtHHafSoUrkCD4NJSJQ8nULXcB1YaDQdG4BnfgGXI8ZeRDkA4aQ
         KKqDkAZDpdwze0xLhMPlAMp6MBJeqCo5zWKqYcH37aUwUyunW0AGJ26kOiNLHS9nRhgJ
         MWvA==
X-Gm-Message-State: AOAM530QmIReZW4sv9J1BlnnbwTBx5blQyEFaafjVnZl0CJNt8ESLrWh
        jVtxgl3NzKzrM1ihQVCDbHhLRfp4lw==
X-Google-Smtp-Source: ABdhPJxdApwU9BTSt+xJsE5ExVFYthMwi7bNqm69vB6HcGf0tBcnBuOqHr+cHTH//FmicQwXhwGSPw==
X-Received: by 2002:a6b:3f85:: with SMTP id m127mr13653516ioa.108.1597692613398;
        Mon, 17 Aug 2020 12:30:13 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
        by smtp.gmail.com with ESMTPSA id 187sm10347174ile.52.2020.08.17.12.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 12:30:12 -0700 (PDT)
Received: (nullmailer pid 1405902 invoked by uid 1000);
        Mon, 17 Aug 2020 19:30:12 -0000
Date:   Mon, 17 Aug 2020 13:30:12 -0600
From:   Rob Herring <robh@kernel.org>
To:     Colin King <colin.king@canonical.com>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Frank Rowand <frowand.list@gmail.com>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH][V3] of/address: check for invalid range.cpu_addr
Message-ID: <20200817193012.GA1405869@bogus>
References: <20200817113208.523805-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200817113208.523805-1-colin.king@canonical.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, 17 Aug 2020 12:32:08 +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently invalid CPU addresses are not being sanity checked resulting in
> SATA setup failure on a SynQuacer SC2A11 development machine. The original
> check was removed by and earlier commit, so add a sanity check back in
> to avoid this regression.
> 
> Fixes: 7a8b64d17e35 ("of/address: use range parser for of_dma_get_range")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
> 
> V2: print message using pr_err and don't print range.cpu_addr as it's always
>     going to be OF_BAD_ADDR so the information is pointless.
> V3: print the bus address to help diagnose issues
> 
> ---
>  drivers/of/address.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Applied, thanks!
