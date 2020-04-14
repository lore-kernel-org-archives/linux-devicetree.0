Return-Path: <SRS0=DG9v=56=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33B11C2BB85
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 18:09:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1523420656
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 18:09:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="HUV9qAl0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503393AbgDNSJS (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Apr 2020 14:09:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731265AbgDNSJO (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 14 Apr 2020 14:09:14 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78322C061A0C
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2020 11:09:14 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id v7so14388347qkc.0
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2020 11:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=bv0sJf01GOa0wIzpOx9SRUfmEHLHh5Wp99C/Vrgdaec=;
        b=HUV9qAl0/LTHa4gW9R5GB8bZskgMoquMycxLWoNqVXVK2lCPXRRchgd9fNWmRJ3r3E
         MwOpBF6IYEAIRmh+0P+Mk/Xdy5ihB9c56BGZ9huMOY7437gGh4cXj2ES77WCdjN3h14P
         vz4I9nCHk4olhkup2TXyZYzBKURBuBpg2EVTYcri8bZwVCHw5clEERw7k1EtxwCQTnnM
         VJSbHXiqAULOv3ywp1xrIzqfxDneUHsXKLo7wHnHwkX7qU6WFdjY2E7rloSUWnmAC5gN
         4MMiLhwcwPZJrM0qv+cchcfFMGuVM8+32TSi5HJ9+6a8/GOL1PH/AfPEODAh7ce0zWHj
         Orfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=bv0sJf01GOa0wIzpOx9SRUfmEHLHh5Wp99C/Vrgdaec=;
        b=V2b+iEeQfV52QVRsOoTeNKTWNEPGssSGgypAU6U1lXq49aPmYghwLUThFKtqdmiUHF
         n3Y1BiOioqh69A1XTLOgmOCnxFJ93qMDbzKVGkkfrudoGsJfL0kfNI9w8MiQKj1eOWls
         D1TXddo7O51NH07A7SEg//DEuVEUBJ2q53clonTC/6bqnR0MD0KFeDkXvyREMYY7oTaZ
         Er8nk3m95B7Cm6Oy6DOB578UdG5Q0FHMuvd2QIUDNu+Y9eFvn+26Jas/LmFO9u5BQKjx
         T7EWiKaLoLX0Jb1Fv8hKwttrIuGfBzScDUhcmINnrpO4Tn8OxQpAM/yhrbV9VN1bVGzF
         Hh0w==
X-Gm-Message-State: AGi0PuYJ7o+2HTFkC+U4nfg6TO6BlvDMoalCNt1hEYIeggY8/JYolcGC
        dyCU75tpoCgkDZ8lFxMX/c10iQ==
X-Google-Smtp-Source: APiQypLF3T0ctlDMYDCZmNS5QXnrk26ya+xUobfqsrIExRvDdUeoVWUu8wspkPshY2Cg+OHu4MKS2Q==
X-Received: by 2002:a37:8645:: with SMTP id i66mr23325550qkd.229.1586887753646;
        Tue, 14 Apr 2020 11:09:13 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.57.212])
        by smtp.gmail.com with ESMTPSA id f13sm11354811qti.47.2020.04.14.11.09.12
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Apr 2020 11:09:13 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1jOPzk-0007ib-Gs; Tue, 14 Apr 2020 15:09:12 -0300
Date:   Tue, 14 Apr 2020 15:09:12 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc:     iommu@lists.linux-foundation.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
        linux-mm@kvack.org, joro@8bytes.org, catalin.marinas@arm.com,
        will@kernel.org, robin.murphy@arm.com, kevin.tian@intel.com,
        baolu.lu@linux.intel.com, Jonathan.Cameron@huawei.com,
        jacob.jun.pan@linux.intel.com, christian.koenig@amd.com,
        zhangfei.gao@linaro.org, xuzaibo@huawei.com,
        Andrew Morton <akpm@linux-foundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Christoph Hellwig <hch@infradead.org>,
        Dimitri Sivanich <sivanich@sgi.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v5 01/25] mm/mmu_notifiers: pass private data down to
 alloc_notifier()
Message-ID: <20200414180912.GH5100@ziepe.ca>
References: <20200414170252.714402-1-jean-philippe@linaro.org>
 <20200414170252.714402-2-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200414170252.714402-2-jean-philippe@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Apr 14, 2020 at 07:02:29PM +0200, Jean-Philippe Brucker wrote:
> The new allocation scheme introduced by commit 2c7933f53f6b
> ("mm/mmu_notifiers: add a get/put scheme for the registration") provides
> a convenient way for users to attach notifier data to an mm. However, it
> would be even better to create this notifier data atomically.
> 
> Since the alloc_notifier() callback only takes an mm argument at the
> moment, some users have to perform the allocation in two times.
> alloc_notifier() initially creates an incomplete structure, which is
> then finalized using more context once mmu_notifier_get() returns. This
> second step requires extra care to order memory accesses against live
> invalidation.
> 
> The IOMMU SVA module, which attaches an mm to multiple devices,
> exemplifies this situation. In essence it does:
> 
> 	mmu_notifier_get()
> 	  alloc_notifier()
> 	     A = kzalloc()
> 	  /* MMU notifier is published */
> 	A->ctx = ctx;				// (1)
> 	device->A = A;
> 	list_add_rcu(device, A->devices);	// (2)
> 
> The invalidate notifier, which may start running before A is fully
> initialized, does the following:
> 
> 	io_mm_invalidate(A)
> 	  list_for_each_entry_rcu(device, A->devices)
> 	    device->invalidate(A->ctx)

This could probably also have been reliably fixed by not having A->ctx
be allocated memory, but inlined into the notifier struct

But I can't think of a down side to not add a params either.

Reviewed-by: Jason Gunthorpe <jgg@mellanox.com>

Regards,
Jason
