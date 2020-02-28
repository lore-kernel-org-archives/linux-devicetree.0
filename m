Return-Path: <SRS0=Dihy=4Q=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3711BC3F2D1
	for <linux-devicetree@archiver.kernel.org>; Fri, 28 Feb 2020 12:24:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0C6AC246AF
	for <linux-devicetree@archiver.kernel.org>; Fri, 28 Feb 2020 12:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1582892699;
	bh=lHeiZkUFT50I1aHZURTGG+8Xh19E+2k3Jot1vyW6wa8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=e0E9nfS4pL9BnXnhtNpM93kWQbSeh/VEq0tY/PlDsCnXn4kc4h6Izt3TDmpSNFYVT
	 VvcVn1RcXd326psxc883cSBfNwbVW6dWqlJ7cCNKqg03x9sNeHiPQo15yM0j2b28CG
	 mxRJRTqq2n+hWxdYNJSZRjSSsYFAW7DXXyIfcFiM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725769AbgB1MY6 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 28 Feb 2020 07:24:58 -0500
Received: from mail.kernel.org ([198.145.29.99]:48380 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725536AbgB1MY6 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 28 Feb 2020 07:24:58 -0500
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C5160246A8;
        Fri, 28 Feb 2020 12:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582892697;
        bh=lHeiZkUFT50I1aHZURTGG+8Xh19E+2k3Jot1vyW6wa8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ei0SgnMDLBplCZABy8+Eu8+L6pRhwOuzjn3z0sE+LPCTuokU/xMc1N5MaVu57PN7d
         fVj2SvtWnaD6o3KgwWsT7gt5+dC60l/V9zCc3leMZc/SsKbL+TVoZwph7nzPrqMWFr
         73sRboapNwIAZ+owBO7gn2yCM+cXH+b16g+vseIs=
Date:   Fri, 28 Feb 2020 12:24:53 +0000
From:   Will Deacon <will@kernel.org>
To:     Mark Rutland <mark.rutland@arm.com>
Cc:     Robin Murphy <robin.murphy@arm.com>, catalin.marinas@arm.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 5/5] arm64: perf: Support new DT compatibles
Message-ID: <20200228122453.GD3275@willie-the-truck>
References: <cover.1582312530.git.robin.murphy@arm.com>
 <6e5087621bd8112a35733054689d7c785b4bdde5.1582312530.git.robin.murphy@arm.com>
 <20200228121712.GF36089@lakrids.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200228121712.GF36089@lakrids.cambridge.arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Feb 28, 2020 at 12:17:13PM +0000, Mark Rutland wrote:
> On Fri, Feb 21, 2020 at 07:35:32PM +0000, Robin Murphy wrote:
> > Add support for matching the new PMUs. For now, this just wires them up
> > as generic PMUv3 such that people writing DTs for new SoCs can do the
> > right thing, and at least have architectural and raw events be usable.
> > We can come back and fill in event maps for sysfs and/or perf tools at
> > a later date.
> > 
> > Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> 
> Thanks for putting this together!
> 
> Acked-by: Mark Rutland <mark.rutland@arm.com>
> 
> Will, are you happy to queue this and the previous patch?

Sure thing. I haven't queued anything for 5.7 yet, but I'll flag these
two so I don't forget.

Will
