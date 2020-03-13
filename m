Return-Path: <SRS0=byNV=46=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F30CC10DCE
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Mar 2020 18:49:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1C943206E7
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Mar 2020 18:49:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YSCViQJZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727210AbgCMStj (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 13 Mar 2020 14:49:39 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:35148 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726475AbgCMStj (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 13 Mar 2020 14:49:39 -0400
Received: by mail-wr1-f68.google.com with SMTP id d5so13095243wrc.2
        for <devicetree@vger.kernel.org>; Fri, 13 Mar 2020 11:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=n5mYtOCDtTMhVqWWtnAYZbOGWU/dWKTocyI6VDmvai0=;
        b=YSCViQJZaGg2DUvC/y9nWfadomBbGcG6Yc2H1OzXvnfHCKOuZVoCgMGn/pjslTo8ya
         0cl9MB7EDnEVotRPszN48POnmTkQGumr6H3obdLPoAWYA04nArvbSjghLml7sbLgiUxb
         7XpW9HHmFFMVxGNAaXedK13YK/1mI8EIC0NIjBdgdQoCL77sjAW/ySBJYrlGyuv7WGlB
         d6NJdvFcy9BFs6QhNYKyv7z3Thd1SgkVBg6YaK1lBR4L9Qcc2snz6UzGUpAY5cFgnbMT
         Vsh/RJI2Ynibx4KNap+8iDk9GkG/+0n1sP5+aXXNQGxZA0vXUbyrBsYzH1wJ2H9n+gnb
         YF9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=n5mYtOCDtTMhVqWWtnAYZbOGWU/dWKTocyI6VDmvai0=;
        b=Mx4a0ZFTpAcbxUetVEdJkCvCtWwVrz7pGeDviZUasS59Ya/GTnGtYDZ8In4bMBSwQn
         bEFJZc7uNRcI9hYMEYr6M5+tDOpK1hqWD/elnM3StOrZi8k4ohn2tdWST4seqyvd7Eh9
         2cOIExvwwoxUkTt/NSqoSN5R1GFGv9F4xGmAOvZD07AiD7m70Y8rdhBp4pb8hpA9EU4D
         CosclF9euQQ67ZaRGSAo/Pq+YnacH9KKraHAUiRDvaMXtyEkxkVYn6mx/NA4E8/SwduD
         BfE2Q5a4D9xr8qlE2OTaKUQrDmwVNbQGKVD5Qeilk1M9DLPjFDLiRk7DqDZN0SgefkqA
         syHA==
X-Gm-Message-State: ANhLgQ31E9GCUZ2mC962/Ko1n1JGoFx3EDNEwsq0RvHu12UfUrpEeJro
        c7tpdaz9sPn21uTig8IigPSBag==
X-Google-Smtp-Source: ADFU+vvN3FXAj9zYtlcNhBdDVRPxlJ9d7a3bWAHNRudXD8VnpMI2LVPHlm82JRtMsY6Srjdmj0HUuA==
X-Received: by 2002:a5d:56c4:: with SMTP id m4mr5691817wrw.182.1584125376843;
        Fri, 13 Mar 2020 11:49:36 -0700 (PDT)
Received: from myrica ([2001:171b:226b:54a0:116c:c27a:3e7f:5eaf])
        by smtp.gmail.com with ESMTPSA id b203sm18625270wmc.45.2020.03.13.11.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2020 11:49:36 -0700 (PDT)
Date:   Fri, 13 Mar 2020 19:49:29 +0100
From:   Jean-Philippe Brucker <jean-philippe@linaro.org>
To:     Jason Gunthorpe <jgg@ziepe.ca>
Cc:     mark.rutland@arm.com, linux-pci@vger.kernel.org,
        linux-mm@kvack.org, will@kernel.org,
        Dimitri Sivanich <sivanich@sgi.com>, catalin.marinas@arm.com,
        zhangfei.gao@linaro.org, devicetree@vger.kernel.org,
        kevin.tian@intel.com, Arnd Bergmann <arnd@arndb.de>,
        robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        iommu@lists.linux-foundation.org,
        Andrew Morton <akpm@linux-foundation.org>,
        robin.murphy@arm.com, christian.koenig@amd.com
Subject: Re: [PATCH v4 01/26] mm/mmu_notifiers: pass private data down to
 alloc_notifier()
Message-ID: <20200313184929.GC2574@myrica>
References: <20200228143935.GA2156@myrica>
 <20200228144844.GQ31668@ziepe.ca>
 <20200228150427.GF2156@myrica>
 <20200228151339.GS31668@ziepe.ca>
 <20200306095614.GA50020@myrica>
 <20200306130919.GJ31668@ziepe.ca>
 <20200306143556.GA99609@myrica>
 <20200306145245.GK31668@ziepe.ca>
 <20200306161519.GB99609@myrica>
 <20200306174239.GM31668@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200306174239.GM31668@ziepe.ca>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Mar 06, 2020 at 01:42:39PM -0400, Jason Gunthorpe wrote:
> On Fri, Mar 06, 2020 at 05:15:19PM +0100, Jean-Philippe Brucker wrote:
> > On Fri, Mar 06, 2020 at 10:52:45AM -0400, Jason Gunthorpe wrote:
> > > On Fri, Mar 06, 2020 at 03:35:56PM +0100, Jean-Philippe Brucker wrote:
> > > > On Fri, Mar 06, 2020 at 09:09:19AM -0400, Jason Gunthorpe wrote:
> > > > > On Fri, Mar 06, 2020 at 10:56:14AM +0100, Jean-Philippe Brucker wrote:
> > > > > > I tried to keep it simple like that: normally mmu_notifier_get() is called
> > > > > > in bind(), and mmu_notifier_put() is called in unbind(). 
> > > > > > 
> > > > > > Multiple device drivers may call bind() with the same mm. Each bind()
> > > > > > calls mmu_notifier_get(), obtains the same io_mm, and returns a new bond
> > > > > > (a device<->mm link). Each bond is freed by calling unbind(), which calls
> > > > > > mmu_notifier_put().
> > > > > > 
> > > > > > That's the most common case. Now if the process is killed and the mm
> > > > > > disappears, we do need to avoid use-after-free caused by DMA of the
> > > > > > mappings and the page tables. 
> > > > > 
> > > > > This is why release must do invalidate all - but it doesn't need to do
> > > > > any more - as no SPTE can be established without a mmget() - and
> > > > > mmget() is no longer possible past release.
> > > > 
> > > > In our case we don't have SPTEs, the whole pgd is shared between MMU and
> > > > IOMMU (isolated using PASID tables).
> > > 
> > > Okay, but this just means that 'invalidate all' also requires
> > > switching the PASID to use some pgd that is permanently 'all fail'.
> > > 
> > > > At this point no one told the device to stop working on this queue,
> > > > it may still be doing DMA on this address space.
> > > 
> > > Sure, but there are lots of cases where a defective user space can
> > > cause pages under active DMA to disappear, like munmap for
> > > instance. Process exit is really no different, the PASID should take
> > > errors and the device & driver should do whatever error flow it has.
> > 
> > We do have the possibility to shut things down in order, so to me this
> > feels like a band-aid. 
> 
> ->release() is called by exit_mmap which is called by mmput. There are
> over a 100 callsites to mmput() and I'm not totally sure what the
> rules are for release(). We've run into problems before with things
> like this.

A concrete example of something that could go badly if mmput() takes too
long would greatly help. Otherwise I'll have a hard time justifying the
added complexity.

I wrote a prototype that removes the device driver callback from
release(). It works with SMMUv3, but complicates the PASID descriptor
code, which is already awful with my recent changes and this series.

> IMHO, due to this, it is best for release to be simple and have
> conservative requirements on context like all the other notifier
> callbacks. It is is not a good place to put complex HW fencing driver
> code.
> 
> In particular that link you referenced is suggesting the driver tear
> down could take minutes - IMHO it is not OK to block mmput() for
> minutes.
> 
> > The idea has come up before though [1], and I'm not strongly opposed
> > to this model, but I'm still not convinced it's necessary. It does
> > add more complexity to IOMMU drivers, to avoid printing out the
> > errors that we wouldn't otherwise see, whereas device drivers need
> > in any case to implement the logic that forces stop DMA.
> 
> Errors should not be printed to the kernel log for PASID cases
> anyhow. PASID will be used by unpriv user, and unpriv user should not
> be able to trigger kernel prints at will, eg by doing dma to nmap VA
> or whatever. 

I agree. There is a difference, though, between invalid mappings and the
absence of a pgd. The former comes from userspace issuing DMA on unmapped
buffers, while the latter is typically a device/driver error which
normally needs to be reported.

On Arm SMMUv3 they are handled differently by the hardware. But instead of
disabling the whole PASID context on mm exit, we can quietly abort
incoming transactions while waiting for unbind().

And I think the other IOMMUs treat invalid PASID descriptor the same as
invalid translation table descriptor. At least VT-d quietly returns a
no-translation response to ATS TR and rejects PRI PR. I haven't found the
equivalent in the AMD IOMMU spec yet.

Thanks,
Jean
