Return-Path: <SRS0=bvxT=57=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B64DAC3815B
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Apr 2020 16:25:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 905ED20936
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Apr 2020 16:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1586967911;
	bh=ZiiEJWE+wu3McFsArnPInISF/9NX/tuwqY8nuVLwc2s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=TAd9exZfmSvy9y1WT4JdmkeBb5SSjyvu4pO/Q/Q4QfzscKvcA5s6RLu6NauM8vhrf
	 LbHOgojvObSvBmkCLnozaDMxO+aR1If4GSxZ7hrUcCCDIhwam38i3IitowMbw2l8xv
	 2BQuGcd84NFcPCwux6nJNC1rG7IM677azRy5+WA4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1415764AbgDOQZK (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Apr 2020 12:25:10 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:41907 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1415762AbgDOQZI (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 15 Apr 2020 12:25:08 -0400
Received: by mail-ot1-f68.google.com with SMTP id f52so476516otf.8;
        Wed, 15 Apr 2020 09:25:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Zga3Axg4AT5xhbCrFrQxMp2BZq/R059ZDklzJpC3Co8=;
        b=NX/QsyETzfQeQWjVybIKk7EGcULqYfAAN3Lr+8wBchY/5Mym+AGK684z24HT22jbAX
         +Cf48VMBgcy79CCVBXqo4qq8PAa1yUYzTQmyn65uUbW8mmXQaZOnZgYA5Als6+Kkw+Wi
         K+L4ztxW0lDIXqUkNSQRioJu5mIVQT2T1jojS75mmnKl7uruD8KKFWN6tMkltzRn8jxf
         QqDWHrmFq/pqqeg6Y7rgmDMdyZahbTDhYqYrpoii5NXs13GsAfelUfyKCT3nPrye+lVa
         IG4ii8TIQ+f/VHoWqsGBnGh5g+QW2NKpMCu2aQdnJEKAAKwueD3/dQLhfbNIAPMPLFgI
         gT6g==
X-Gm-Message-State: AGi0PuZ0mbIKO56R8eZHuzUyr1jMNG1to7ktVNjAr2OphDp9ZFwaFDYp
        25XkTpl+dusZRsAUZ7dJig==
X-Google-Smtp-Source: APiQypINl7OyQa3PaOF751WZxAm/bPCscR305bWPfwG1uMxVqEXKaxQHQ8u9SHItlVMuj/jA4D/hqw==
X-Received: by 2002:a9d:6ac8:: with SMTP id m8mr13185143otq.262.1586967907640;
        Wed, 15 Apr 2020 09:25:07 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id n6sm3750539oof.35.2020.04.15.09.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 09:25:07 -0700 (PDT)
Received: (nullmailer pid 2481 invoked by uid 1000);
        Wed, 15 Apr 2020 16:25:06 -0000
Date:   Wed, 15 Apr 2020 11:25:06 -0500
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Joseph Lo <josephl@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 03/14] of: reserved-memory: Support multiple regions
 per device
Message-ID: <20200415162506.GA2402@bogus>
References: <20200409175238.3586487-1-thierry.reding@gmail.com>
 <20200409175238.3586487-4-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200409175238.3586487-4-thierry.reding@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu,  9 Apr 2020 19:52:27 +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> While the lookup/initialization code already supports multiple memory
> regions per device, the release code will only ever release the first
> matching memory region.
> 
> Enhance the code to release all matching regions. Each attachment of
> a region to a device is uniquely identifiable using a struct device
> pointer and a pointer to the memory region's struct reserved_mem.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/of/of_reserved_mem.c | 22 ++++++++++------------
>  1 file changed, 10 insertions(+), 12 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
