Return-Path: <SRS0=Bobf=ZU=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4218FC432C0
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 Nov 2019 16:40:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1741F2178F
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 Nov 2019 16:40:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726510AbfK1Qk0 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 28 Nov 2019 11:40:26 -0500
Received: from foss.arm.com ([217.140.110.172]:38210 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726446AbfK1Qk0 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 28 Nov 2019 11:40:26 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BFDF11FB;
        Thu, 28 Nov 2019 08:40:25 -0800 (PST)
Received: from bogus (e107155-lin.cambridge.arm.com [10.1.196.42])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DB5A33F6C4;
        Thu, 28 Nov 2019 08:40:24 -0800 (PST)
Date:   Thu, 28 Nov 2019 16:40:22 +0000
From:   Sudeep Holla <sudeep.holla@arm.com>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: [PATCH] Revert "arm64: dts: juno: add dma-ranges property"
Message-ID: <20191128164022.GB28000@bogus>
References: <20191126165355.6696-1-sudeep.holla@arm.com>
 <20191128154242.1035-1-sudeep.holla@arm.com>
 <1e0ad966-031a-1343-a83e-8536a678341c@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1e0ad966-031a-1343-a83e-8536a678341c@arm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Nov 28, 2019 at 03:58:28PM +0000, Robin Murphy wrote:
> On 28/11/2019 3:42 pm, Sudeep Holla wrote:
> > This reverts commit 193d00a2b35ee3353813b4006a18131122087205.
> >
> > Commit 951d48855d86 ("of: Make of_dma_get_range() work on bus nodes")
> > reworked the logic such that of_dma_get_range() works correctly
> > starting from a bus node containing "dma-ranges".
> >
> > Since on Juno we don't have a SoC level bus node and "dma-ranges" is
> > present only in the root node, we get the following error:
> >
> > OF: translation of DMA address(0) to CPU address failed node(/sram@2e000000)
> > OF: translation of DMA address(0) to CPU address failed node(/uart@7ff80000)
> > ...
> > OF: translation of DMA address(0) to CPU address failed node(/mhu@2b1f0000)
> > OF: translation of DMA address(0) to CPU address failed node(/iommu@2b600000)
> > OF: translation of DMA address(0) to CPU address failed node(/iommu@2b600000)
> > OF: translation of DMA address(0) to CPU address failed node(/iommu@2b600000)
> >
> > So let's fix it by dropping the "dma-ranges" property for now. We can
> > add it later with a proper SoC bus node and moving all the devices that
> > belong there along with the "dma-ranges" if required.
>
> Acked-by: Robin Murphy <robin.murphy@arm.com>
>

Thanks.

> As mentioned before, this is fine since it doesn't represent any kind of
> device-visible restriction; it was only there for completeness, and we've
> since given in to the assumption that missing "dma-ranges" implies a 1:1
> mapping anyway.
>

Agreed.

--
Regards,
Sudeep
