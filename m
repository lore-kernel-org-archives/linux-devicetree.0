Return-Path: <SRS0=c2W6=4V=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 410F4C3F2D1
	for <linux-devicetree@archiver.kernel.org>; Wed,  4 Mar 2020 14:09:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1418220848
	for <linux-devicetree@archiver.kernel.org>; Wed,  4 Mar 2020 14:09:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g8SWXvPT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726440AbgCDOJt (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 4 Mar 2020 09:09:49 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:35838 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726275AbgCDOJt (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 4 Mar 2020 09:09:49 -0500
Received: by mail-wr1-f68.google.com with SMTP id r7so2583700wro.2
        for <devicetree@vger.kernel.org>; Wed, 04 Mar 2020 06:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=EpXtvX1PfW3FZz13OtRHOjQvZ2fsaz2TnoP+n0E2ZUg=;
        b=g8SWXvPTyPZzLcsUAC4+i3gEYS7VjOjujoBVioj8kKYK73oXfKh+MAvo8mRWnu071C
         gxiMmhvSdwjKzrw34AWvhgikZX0Hrhz4jre0uVLyzI7CZYL/VDsf5gHJObclPdLagxZi
         s+6qEVWA3DXyXew+YkVb+rgAVC49YN8D3mPAbPfbz2b2vq1fO6ty0UB+H65pdv6FjJ6Y
         v3/70bPC/jxD75YgWO2V9B7pyWv0bv8SImmbScC8XftPtCDEBeJXHlj8SYkcVTIy6y7V
         32lZyBoyNgNFy1f0QHfB5NbM0+cCHEojMhPDvMZmAXMM6fqrb+f7yzzdQe1b3vIru/ak
         r5Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EpXtvX1PfW3FZz13OtRHOjQvZ2fsaz2TnoP+n0E2ZUg=;
        b=m7XUKefnW9HwPXgzLZSL8fyPsx+w7mrq04IfSavFSAF2xb2k3sizSl4GrA4zksh4La
         WV3JBioSbCN8R4OtZmJ+6wcWRtbLhkyTb/vanJhCtF5X5FDZev3xXtp5Yj0izT0cDDvd
         wfVKIJpriMRYIesKEBre8wJcsu/0TrpoxLZA1q7vkBJpZd0utuHXPoGn4EOevJITvQBh
         Tmwcx6oAcomTwz5sDmG+IkR++Q9MmykfFnVmlkd2lcYBcIT5fCeR4QP2q86YTbtJJmyn
         PLpiRVc9M0g6Ltdua0bD0/xjNom/CafC9bsbOX3aWNM91Iit16XHDo1lK9/Xg6wM8XeV
         DLJQ==
X-Gm-Message-State: ANhLgQ3E+qo8FxYYIY/X85VcvpBcAJemMJpfnjfSOZvRnR4VXJlP6+3M
        cIVt1HqIgnSxdhJOESaBeHAzKg==
X-Google-Smtp-Source: ADFU+vtZMIq6Jg8tdrdLMObmNELyKi8gzYZ2wKQ8Qt7PTkGgWzXVAaeuMwK7RkrXzELghSD1BcL3DQ==
X-Received: by 2002:adf:e542:: with SMTP id z2mr4532686wrm.150.1583330987727;
        Wed, 04 Mar 2020 06:09:47 -0800 (PST)
Received: from myrica ([2001:171b:c9a8:fbc0:116c:c27a:3e7f:5eaf])
        by smtp.gmail.com with ESMTPSA id q12sm41792293wrg.71.2020.03.04.06.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2020 06:09:46 -0800 (PST)
Date:   Wed, 4 Mar 2020 15:09:40 +0100
From:   Jean-Philippe Brucker <jean-philippe@linaro.org>
To:     Xu Zaibo <xuzaibo@huawei.com>
Cc:     iommu@lists.linux-foundation.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
        linux-mm@kvack.org, mark.rutland@arm.com, kevin.tian@intel.com,
        Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
        catalin.marinas@arm.com, robin.murphy@arm.com, robh+dt@kernel.org,
        zhangfei.gao@linaro.org, will@kernel.org, christian.koenig@amd.com
Subject: Re: [PATCH v4 23/26] iommu/arm-smmu-v3: Add stall support for
 platform devices
Message-ID: <20200304140940.GC646000@myrica>
References: <20200224182401.353359-1-jean-philippe@linaro.org>
 <20200224182401.353359-24-jean-philippe@linaro.org>
 <db6fc8c2-2ff3-631f-2294-c1b49acd27aa@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <db6fc8c2-2ff3-631f-2294-c1b49acd27aa@huawei.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Feb 26, 2020 at 04:44:53PM +0800, Xu Zaibo wrote:
> Hi,
> 
> 
> On 2020/2/25 2:23, Jean-Philippe Brucker wrote:
> > From: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
> > 
> > The SMMU provides a Stall model for handling page faults in platform
> > devices. It is similar to PCI PRI, but doesn't require devices to have
> > their own translation cache. Instead, faulting transactions are parked and
> > the OS is given a chance to fix the page tables and retry the transaction.
> > 
> > Enable stall for devices that support it (opt-in by firmware). When an
> > event corresponds to a translation error, call the IOMMU fault handler. If
> > the fault is recoverable, it will call us back to terminate or continue
> > the stall.
> > 
> > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > ---
> >   drivers/iommu/arm-smmu-v3.c | 271 ++++++++++++++++++++++++++++++++++--
> >   drivers/iommu/of_iommu.c    |   5 +-
> >   include/linux/iommu.h       |   2 +
> >   3 files changed, 269 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/iommu/arm-smmu-v3.c b/drivers/iommu/arm-smmu-v3.c
> > index 6a5987cce03f..da5dda5ba26a 100644
> > --- a/drivers/iommu/arm-smmu-v3.c
> > +++ b/drivers/iommu/arm-smmu-v3.c
> > @@ -374,6 +374,13 @@
> >   #define CMDQ_PRI_1_GRPID		GENMASK_ULL(8, 0)
> >   #define CMDQ_PRI_1_RESP			GENMASK_ULL(13, 12)
> [...]
> > +static int arm_smmu_page_response(struct device *dev,
> > +				  struct iommu_fault_event *unused,
> > +				  struct iommu_page_response *resp)
> > +{
> > +	struct arm_smmu_cmdq_ent cmd = {0};
> > +	struct arm_smmu_master *master = dev_iommu_fwspec_get(dev)->iommu_priv;
> Here can use 'dev_to_master' ?

Certainly, good catch

Thanks,
Jean
