Return-Path: <SRS0=uFL0=6E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60224C3815B
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Apr 2020 13:57:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3661920735
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Apr 2020 13:57:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="mkrf0mj2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726885AbgDTN53 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 20 Apr 2020 09:57:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726608AbgDTN53 (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Mon, 20 Apr 2020 09:57:29 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A235C061A0C
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2020 06:57:29 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id o10so8450436qtr.6
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2020 06:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=2Y6perFiVeQ3QgWqLdIJUPsNvFY3EZijv/H4bCO6lY4=;
        b=mkrf0mj2uMHggYNoMXheWws/vfopgkKMdOj2sk/jq91aSFV+FBOaAWfRgYM4xhELk7
         anpstJTVDOqB4qOo0kIzlwP5u+6LnNpFVukNArZe7hoXCLYhFl026KWaIuXtr4kZkZid
         IJPXMEIC09IH6YOe2rwd+xfDBeWBnrWSySHhYgTBZSWTKpo9IqVk8fy6bXSM56vwA15i
         B+iFKjqNtcVfDZUiEh19W3zpSzKpdAhDy9qMwP2cjBEKkXw0Ag44wC60d6gA72lrJVpw
         SXd4MaW5F4oNRRxVYpJvgy0d14clAWod3shTlEIMW54sI5mktrnVJXVbeAuYZDLtCCXN
         7OQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2Y6perFiVeQ3QgWqLdIJUPsNvFY3EZijv/H4bCO6lY4=;
        b=Z1g0FJ//zAUixz6FIvUm+cESxeTH+/17o52kZWfQLhBNuj8tHgumQugrswpmRm2vtX
         a3QHOBXPjAIROZIDA7ESDKRiipE3tJnE6ueykE/71XBuMm3yHfETkuvOBzogV+WORK/C
         D8O/4m438Z3RFz89Hx1/jnoFjDlOs8LusYVJw63SMTJ9seBvM1oMlf+5vGqyOKX35PPX
         ahU1PVmV0S4IhvkbQpeS8tZ6MoRi/NI22BbNvo4ahyV8PUB4HizywcBqISZO7uJ+Sn6z
         e0PqioItipMzFzd+EleAgmqSpz4UkF33ko16EoTcOLDFLRIAK22hORXgE06KTpkf0JB/
         fTQQ==
X-Gm-Message-State: AGi0PuYmCt+BF1hogVPOaGc+n+RAK2E9SVcQ6xdBS08RYBfjjWFQjnSz
        d+KuoQB8L8/20fzeQHeIj3vxxA==
X-Google-Smtp-Source: APiQypIj1R9FcMRfRka1KKXW7j9di+d85e9nm7Td/03CCkb8wDdEAIcizkSgGYTTocgktyzsVQW4zw==
X-Received: by 2002:ac8:82f:: with SMTP id u44mr15905874qth.198.1587391048363;
        Mon, 20 Apr 2020 06:57:28 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.57.212])
        by smtp.gmail.com with ESMTPSA id g14sm550791qtb.24.2020.04.20.06.57.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Apr 2020 06:57:27 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1jQWvP-0002ax-4d; Mon, 20 Apr 2020 10:57:27 -0300
Date:   Mon, 20 Apr 2020 10:57:27 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc:     Christoph Hellwig <hch@infradead.org>,
        iommu@lists.linux-foundation.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
        linux-mm@kvack.org, joro@8bytes.org, catalin.marinas@arm.com,
        will@kernel.org, robin.murphy@arm.com, kevin.tian@intel.com,
        baolu.lu@linux.intel.com, Jonathan.Cameron@huawei.com,
        jacob.jun.pan@linux.intel.com, christian.koenig@amd.com,
        zhangfei.gao@linaro.org, xuzaibo@huawei.com
Subject: Re: [PATCH v5 02/25] iommu/sva: Manage process address spaces
Message-ID: <20200420135727.GO26002@ziepe.ca>
References: <20200414170252.714402-1-jean-philippe@linaro.org>
 <20200414170252.714402-3-jean-philippe@linaro.org>
 <20200416072852.GA32000@infradead.org>
 <20200416085402.GB1286150@myrica>
 <20200416121331.GA18661@infradead.org>
 <20200420074213.GA3180232@myrica>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200420074213.GA3180232@myrica>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Apr 20, 2020 at 09:42:13AM +0200, Jean-Philippe Brucker wrote:
> On Thu, Apr 16, 2020 at 05:13:31AM -0700, Christoph Hellwig wrote:
> > On Thu, Apr 16, 2020 at 10:54:02AM +0200, Jean-Philippe Brucker wrote:
> > > On Thu, Apr 16, 2020 at 12:28:52AM -0700, Christoph Hellwig wrote:
> > > > > +	rcu_read_lock();
> > > > > +	hlist_for_each_entry_rcu(bond, &io_mm->devices, mm_node)
> > > > > +		io_mm->ops->invalidate(bond->sva.dev, io_mm->pasid, io_mm->ctx,
> > > > > +				       start, end - start);
> > > > > +	rcu_read_unlock();
> > > > > +}
> > > > 
> > > > What is the reason that the devices don't register their own notifiers?
> > > > This kinds of multiplexing is always rather messy, and you do it for
> > > > all the methods.
> > > 
> > > This sends TLB and ATC invalidations through the IOMMU, it doesn't go
> > > through device drivers
> > 
> > I don't think we mean the same thing, probably because of my rather
> > imprecise use of the word device.
> > 
> > What I mean is that the mmu_notifier should not be embedded into the
> > io_mm structure (whch btw, seems to have a way to generic name, just
> > like all other io_* prefixed names), but instead into the
> > iommu_bond structure.  That avoid the whole multiplexing layer.
> 
> Right, I can see the appeal. I still like having a single mmu notifier per
> mm because it ensures we allocate a single PASID per mm (as required by
> x86). I suppose one alternative is to maintain a hashtable of mm->pasid,
> to avoid iterating over all bonds during allocation.

I've been getting rid of hash tables like this.. Adding it to the
mm_struct does seem reasonable, I think PASID is a pretty broad
concept now.

Jason
