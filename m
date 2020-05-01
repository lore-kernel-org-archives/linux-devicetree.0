Return-Path: <SRS0=mas4=6P=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 298D9C4724C
	for <linux-devicetree@archiver.kernel.org>; Fri,  1 May 2020 12:55:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0531D21582
	for <linux-devicetree@archiver.kernel.org>; Fri,  1 May 2020 12:55:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="Nq8HOg9n"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728712AbgEAMzR (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 1 May 2020 08:55:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728585AbgEAMzQ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 1 May 2020 08:55:16 -0400
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com [IPv6:2607:f8b0:4864:20::f43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3C91C061A0E
        for <devicetree@vger.kernel.org>; Fri,  1 May 2020 05:55:16 -0700 (PDT)
Received: by mail-qv1-xf43.google.com with SMTP id w18so4676845qvs.3
        for <devicetree@vger.kernel.org>; Fri, 01 May 2020 05:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=P0z8kBnXrlZIDie1dLQeqogN9MwmVy7z4o7SA4TqzwU=;
        b=Nq8HOg9n7Z+VdnITQnbqqVABmWu3/6twaYJ7q1ZG6DqOfwLX2pqDKfEDSh+EIm/he8
         8XxNujX7EOvHA+Z3U42zDC/h9oN+aKWNxlISO0Rq2tTCVZNWNCIrJWk7sh2DWdjcVwvU
         wCvE4KNEgpOv+mKqLqLC6erVH6iCBHZ3nggeOEQIkaDvn7IPj2tAyOj9O8z6V4Qx2f1V
         20zcGw/GN8o0n+NfO/8kyZsltT7TcTtCKSej9x25s7Vy8ZXZSAEGpL08aolIMnLihAqM
         O4lVQbo50EUAWIw62edP+hXhKTif6IJbYSGaALf2LAPuTPfJPTwd2r2FjwrGZ5t7qGNY
         ydVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=P0z8kBnXrlZIDie1dLQeqogN9MwmVy7z4o7SA4TqzwU=;
        b=Sxgfzso4uigeOIk8D0qW06nqRl+0IrepFMmVi3p/axdnw83CzVzbZZYj5gF4C7s3OT
         3j+s2Pjdf+gxwyGTM95akVsrfdWuyhqjX8bRI+ZeUhE2UidCLnkRxbUHijZbtTN/w/PD
         3/moTHw8SKAd39XZ4AYYu6d5URQa548ftnw+6UZGgneg10AGWmP7cU/l20jyHCaITLfO
         v7JGwmR6v0oSvQM9BX7U9dyateM+JT/0AE3qxID90uu2oSHGZ0/SGIc78rg7+8rs/3Fy
         Goc0ePAFN50KwjWS/xmZ4x0+o7dWXPeOG8vpqDn9U606Au6OxZ3Z3kmMWtosuEU5qPR0
         xing==
X-Gm-Message-State: AGi0PubXbFfMRADxSgIOlC5ApbVjZKzxKQmVkwZmKCEoBzq1MZ+LQK4b
        DB/XBKicS8v4ShB9RjhI8F1DZA==
X-Google-Smtp-Source: APiQypJcH2wlws52fFFXitF6KkzvvmTMs6scpT5jXa1TBx4TcLMsA/h0u5FOFpvXuuZfcR/nYumjiA==
X-Received: by 2002:a05:6214:a4e:: with SMTP id ee14mr3877158qvb.121.1588337715542;
        Fri, 01 May 2020 05:55:15 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.57.212])
        by smtp.gmail.com with ESMTPSA id 28sm2645211qkp.10.2020.05.01.05.55.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 May 2020 05:55:14 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1jUVCD-0007LO-33; Fri, 01 May 2020 09:55:13 -0300
Date:   Fri, 1 May 2020 09:55:13 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Christoph Hellwig <hch@infradead.org>
Cc:     Jean-Philippe Brucker <jean-philippe@linaro.org>,
        iommu@lists.linux-foundation.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
        linux-mm@kvack.org, fenghua.yu@intel.com, kevin.tian@intel.com,
        catalin.marinas@arm.com, robin.murphy@arm.com,
        zhangfei.gao@linaro.org, felix.kuehling@amd.com, will@kernel.org,
        christian.koenig@amd.com
Subject: Re: [PATCH v6 17/25] iommu/arm-smmu-v3: Implement
 iommu_sva_bind/unbind()
Message-ID: <20200501125513.GN26002@ziepe.ca>
References: <20200430143424.2787566-1-jean-philippe@linaro.org>
 <20200430143424.2787566-18-jean-philippe@linaro.org>
 <20200501121552.GA6012@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200501121552.GA6012@infradead.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, May 01, 2020 at 05:15:52AM -0700, Christoph Hellwig wrote:
> > @@ -432,6 +432,7 @@ config ARM_SMMU_V3
> >  	tristate "ARM Ltd. System MMU Version 3 (SMMUv3) Support"
> >  	depends on ARM64
> >  	select IOMMU_API
> > +	select IOMMU_SVA
> >  	select IOMMU_IO_PGTABLE_LPAE
> >  	select GENERIC_MSI_IRQ_DOMAIN
> 
> Doesn't this need to select MMU_NOTIFIER now?
> 
> > +	struct mmu_notifier_ops		mn_ops;
> 
> Note: not a pointer.
> 
> > +	/* If bind() was already called for this (dev, mm) pair, reuse it. */
> > +	list_for_each_entry(bond, &master->bonds, list) {
> > +		if (bond->mm == mm) {
> > +			refcount_inc(&bond->refs);
> > +			return &bond->sva;
> > +		}
> > +	}

I also would like it if searching for mms in linked lists was not
necessary, this is kind of the point of 'get'

Is this a side effect of the earlier remark to get rid of the linked
list inside the notifier?

> Or we could enhance the mmu_notifier_get to pass a private
> oaque instance ID pointer, which is checked in addition to the ops,
> and you could probably kill off the bonds list and lookup.

This might be the best option if it can absorb the above search..

Jason
