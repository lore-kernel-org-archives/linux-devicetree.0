Return-Path: <SRS0=8MPa=5Y=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A6E0C2D0EA
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Apr 2020 14:06:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3020420780
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Apr 2020 14:06:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728173AbgDHOGv (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Apr 2020 10:06:51 -0400
Received: from 8bytes.org ([81.169.241.247]:58532 "EHLO theia.8bytes.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728159AbgDHOGv (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 8 Apr 2020 10:06:51 -0400
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id A412A2CC; Wed,  8 Apr 2020 16:06:50 +0200 (CEST)
Date:   Wed, 8 Apr 2020 16:06:49 +0200
From:   Joerg Roedel <joro@8bytes.org>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Chen-Yu Tsai <wens@csie.org>, Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org
Subject: Re: [PATCH v2 2/4] iommu: Add Allwinner H6 IOMMU driver
Message-ID: <20200408140649.GI3103@8bytes.org>
References: <cover.a31c229a83f1d92e6928ae2adb70887da0fd44b3.1582222496.git-series.maxime@cerno.tech>
 <6864f0f28825bb7a2ec1c0d811a4aacdecf5f945.1582222496.git-series.maxime@cerno.tech>
 <20200302153606.GB6540@8bytes.org>
 <20200401114710.doioefzmjhte7jwu@gilmour.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200401114710.doioefzmjhte7jwu@gilmour.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Maxime,

On Wed, Apr 01, 2020 at 01:47:10PM +0200, Maxime Ripard wrote:
> As far as I understand it, the page table can be accessed concurrently
> since the framework doesn't seem to provide any serialization /
> locking, shouldn't we have some locks to prevent concurrent access?

The dma-iommu code makes sure that there are no concurrent accesses to
the same address-range of the page-table, but there can (and will) be
concurrent accesses to the same page-table, just for different parts of
the address space.

Making this lock-less usually involves updating non-leaf page-table
entries using atomic compare-exchange instructions.

> > > +	*pte_addr = sun50i_mk_pte(paddr, prot);
> > > +	sun50i_table_flush(sun50i_domain, pte_addr, 1);
> >
> > This maps only one page, right? But the function needs to map up to
> > 'size' as given in the parameter list.
> 
> It does, but pgsize_bitmap is set to 4k only (since the hardware only
> supports that), so we would have multiple calls to map, each time with
> a single page judging from:
> https://elixir.bootlin.com/linux/latest/source/drivers/iommu/iommu.c#L1948
> 
> Right?

Okay, you are right here. Just note that when this function is called
for every 4k page it should better be fast and avoid slow things like
TLB flushes.

> The vendor driver was doing something along those lines and I wanted
> to be conservative with the cache management if we didn't run into
> performances issues, but I'll convert to the iotlb callbacks then.

Yeah, that definitly helps performance.

Regards,

	Joerg
