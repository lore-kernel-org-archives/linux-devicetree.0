Return-Path: <SRS0=58Ja=6S=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A29BC47257
	for <linux-devicetree@archiver.kernel.org>; Mon,  4 May 2020 16:29:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 522E8206D9
	for <linux-devicetree@archiver.kernel.org>; Mon,  4 May 2020 16:29:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s6Hn20ig"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729594AbgEDQ3Q (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 4 May 2020 12:29:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729554AbgEDQ3P (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 4 May 2020 12:29:15 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39E60C061A0F
        for <devicetree@vger.kernel.org>; Mon,  4 May 2020 09:29:15 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id k1so21740625wrx.4
        for <devicetree@vger.kernel.org>; Mon, 04 May 2020 09:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/BYU4Om8WCi34VBttwlHwqi6sY2A9tyjvz9dkBW4YR0=;
        b=s6Hn20ig/1KbhienjCm7bWbYtxGwNnasjezCMNITDVyM/NfgWs1dMhB2gCybX/gMQM
         3PvzgyisZ2pcL/5UM64ddSx6TGvAftzzX2OE4x2ldSBevHUIJbL1Lh1SiucuLKAInJzC
         JyGj2737261kvOO484ymYbWd/jxHFDiMYcTkvLmUpxHi1Y6R9OGmzwL+SyZduBlcfchC
         yt06HQpOncV1dier8AcJ71lobnxArlTYPJOBYmytmIEueWGSRW/a8lt5bEx+1Kv93NkY
         QrDTWiKqlp5t4HiJUdr0nvqoLZypO0n42pp908ZiZk6LUi9G3Qz27wXfntChz79dBe0/
         HgwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/BYU4Om8WCi34VBttwlHwqi6sY2A9tyjvz9dkBW4YR0=;
        b=gQVvj5rXAuZ8V8tCAdP5UR1oeFHUREv/hjLJov/DnA2w66XZnsxyIpg8Vjze6XBApN
         bj7WKCm569/4E9gN3Ehvfzzvfqtp4oMO5SB7ARzH4/y/QQJJbwtUKkRhWSM9XDB45svm
         JoQA3R/KP53P8TLtOHBzqeDdsfmT8H/lh2WJcyxjxL6dLppTE9fHkRwQnboUdtW+734B
         7nVGDBn+83VVxKVA4kayCFY5Y7Ai46YHH1wbUhxiyTWG0YI9hSIki2eTlEG4LuEvnXsH
         Us62LIOYiik3QCrMz5fhexOIlkcoCAfT+ftv8xkKC0kZQ4WpklMjm5XLm2U37+/Wg0+7
         AC3A==
X-Gm-Message-State: AGi0PuaOW3C1siw0u45j0H9iWQBglVsSmGMzbmb/b9S8ZVB4UqCqXzPQ
        jdizYArE2dQ0TXgsrxHdrGzsaw==
X-Google-Smtp-Source: APiQypIHji+0UmZIp3eRiES/RsK7nvGgkSn0DrHKmgTnip/V9mOn0fBeB0vJOAU40Okt9fYQT7236g==
X-Received: by 2002:adf:ed86:: with SMTP id c6mr159739wro.124.1588609753958;
        Mon, 04 May 2020 09:29:13 -0700 (PDT)
Received: from myrica ([2001:171b:226e:c200:c43b:ef78:d083:b355])
        by smtp.gmail.com with ESMTPSA id l5sm13656680wmi.22.2020.05.04.09.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 09:29:13 -0700 (PDT)
Date:   Mon, 4 May 2020 18:29:03 +0200
From:   Jean-Philippe Brucker <jean-philippe@linaro.org>
To:     Xu Zaibo <xuzaibo@huawei.com>
Cc:     iommu@lists.linux-foundation.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
        linux-mm@kvack.org, joro@8bytes.org, catalin.marinas@arm.com,
        will@kernel.org, robin.murphy@arm.com, kevin.tian@intel.com,
        baolu.lu@linux.intel.com, Jonathan.Cameron@huawei.com,
        jacob.jun.pan@linux.intel.com, christian.koenig@amd.com,
        felix.kuehling@amd.com, zhangfei.gao@linaro.org, jgg@ziepe.ca,
        fenghua.yu@intel.com, hch@infradead.org
Subject: Re: [PATCH v6 01/25] mm: Add a PASID field to mm_struct
Message-ID: <20200504162903.GH170104@myrica>
References: <20200430143424.2787566-1-jean-philippe@linaro.org>
 <20200430143424.2787566-2-jean-philippe@linaro.org>
 <ffe0aca4-575b-98d3-0ba5-88d5e6eb29fe@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ffe0aca4-575b-98d3-0ba5-88d5e6eb29fe@huawei.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, May 04, 2020 at 09:52:44AM +0800, Xu Zaibo wrote:
> 
> On 2020/4/30 22:34, Jean-Philippe Brucker wrote:
> > Some devices can tag their DMA requests with a 20-bit Process Address
> > Space ID (PASID), allowing them to access multiple address spaces. In
> > combination with recoverable I/O page faults (for example PCIe PRI),
> > PASID allows the IOMMU to share page tables with the MMU.
> > 
> > To make sure that a single PASID is allocated for each address space, as
> > required by Intel ENQCMD, store the PASID in the mm_struct. The IOMMU
> > driver is in charge of serializing modifications to the PASID field.
> > 
> > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > ---
> > For the field's validity I'm thinking invalid PASID = 0. In ioasid.h we
> > define INVALID_IOASID as ~0U, but I think we can now change it to 0,
> > since Intel is now also reserving PASID #0 for Transactions without
> > PASID and AMD IOMMU uses GIoV for this too.
> > ---
> >   include/linux/mm_types.h | 4 ++++
> >   1 file changed, 4 insertions(+)
> > 
> > diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> > index 4aba6c0c2ba80..8db6472758175 100644
> > --- a/include/linux/mm_types.h
> > +++ b/include/linux/mm_types.h
> > @@ -534,6 +534,10 @@ struct mm_struct {
> >   		atomic_long_t hugetlb_usage;
> >   #endif
> >   		struct work_struct async_put_work;
> > +#ifdef CONFIG_IOMMU_SUPPORT
> > +		/* Address space ID used by device DMA */
> > +		unsigned int pasid;
> > +#endif
> Maybe '#ifdef CONFIG_IOMMU_SVA ... #endif' is more reasonable?

CONFIG_IOMMU_SVA enables a few helpers but IOMMU drivers don't have to use
them, so I think IOMMU_SUPPORT is more appropriate.

Thanks,
Jean
