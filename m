Return-Path: <SRS0=mbMJ=64=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AAB9C433E0
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 May 2020 13:16:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3EBD720728
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 May 2020 13:16:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726037AbgENNQu (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 14 May 2020 09:16:50 -0400
Received: from 8bytes.org ([81.169.241.247]:42890 "EHLO theia.8bytes.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726073AbgENNQu (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 14 May 2020 09:16:50 -0400
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id A636E379; Thu, 14 May 2020 15:16:48 +0200 (CEST)
Date:   Thu, 14 May 2020 15:16:47 +0200
From:   Joerg Roedel <joro@8bytes.org>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Chen-Yu Tsai <wens@csie.org>, Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org
Subject: Re: [PATCH v4 0/5] iommu: Add Allwinner H6 IOMMU driver
Message-ID: <20200514131647.GK18353@8bytes.org>
References: <cover.b27dedd61e008ffcf55a028ccddda3bb4d21dfc8.1589378833.git-series.maxime@cerno.tech>
 <20200514123855.GI18353@8bytes.org>
 <20200514130900.k4gvr3zcajg3rouc@gilmour.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200514130900.k4gvr3zcajg3rouc@gilmour.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, May 14, 2020 at 03:09:00PM +0200, Maxime Ripard wrote:
> On Thu, May 14, 2020 at 02:38:55PM +0200, Joerg Roedel wrote:
> > On Wed, May 13, 2020 at 04:07:19PM +0200, Maxime Ripard wrote:
> > > Maxime Ripard (5):
> > >   dt-bindings: iommu: Add Allwinner H6 IOMMU bindings
> > >   dt-bindings: display: sun8i-mixer: Allow for an iommu property
> > >   iommu: Add Allwinner H6 IOMMU driver
> > >   arm64: dts: allwinner: h6: Add IOMMU
> > >   drm/sun4i: mixer: Call of_dma_configure if there's an IOMMU
> > 
> > Applied all to the IOMMU tree, thanks. The code lives in the
> > arm/allwinner branch.
> 
> Did you also merge the DTS and DRM patches?
> 
> Ideally, they should be merged through other trees to avoid the conflicts as
> much as possible (arm-soc and drm-misc respectively).
> 
> If it's an option, could you drop all of them but "dt-bindings: iommu: Add
> Allwinner H6 IOMMU bindings" and "iommu: Add Allwinner H6 IOMMU driver"?

Okay, just to be on the safe side, I am going to drop:

	dt-bindings: display: sun8i-mixer: Allow for an iommu property
	arm64: dts: allwinner: h6: Add IOMMU
	drm/sun4i: mixer: Call of_dma_configure if there's an IOMMU

from the iommu-tree?

I took them because you are also maintaining the DRM driver, which
counted as an implicit ACK for me :)


	Joerg

