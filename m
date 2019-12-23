Return-Path: <SRS0=v2WM=2N=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22EADC2D0D3
	for <linux-devicetree@archiver.kernel.org>; Mon, 23 Dec 2019 07:47:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E4C312081E
	for <linux-devicetree@archiver.kernel.org>; Mon, 23 Dec 2019 07:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1577087262;
	bh=4xIpyul81ZB6jziSHYOg8wZLR7P2OO3hPO/6T4WzP9I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=dgRyRKfPe1+rhkVAzJrPe1od924UP995bq/vhn5Dlc5vK1qF84JgYO/gLmdK9QC5q
	 etWvdVa4haQe30t/+khoXnUbGNBP2vSpa1P+RgnSk3gAc8CLGVy8Q4CD0QeOQGEHh2
	 xY76IyqgZfQ9L07o2nfCK7vyfYiveTnaTsqUhpB0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725959AbfLWHrl (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 23 Dec 2019 02:47:41 -0500
Received: from mail.kernel.org ([198.145.29.99]:55442 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725810AbfLWHrl (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 23 Dec 2019 02:47:41 -0500
Received: from localhost (unknown [223.226.34.186])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D7FD920709;
        Mon, 23 Dec 2019 07:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1577087260;
        bh=4xIpyul81ZB6jziSHYOg8wZLR7P2OO3hPO/6T4WzP9I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sj264GW4NWW558WLPO7JhumGISP1AW3mT83azNaMc30GCm41ZkGCwn45FLST/eDPC
         qNag4qDsVEKOArRkvFq+0kXd2rzcZk2F7XDS6PkGixRFhdcuexZ0vPylIC/DYLaxHS
         6IXXYXTNrWOAsQSIEGGu23cAyHBKsBi1glCbuHvs=
Date:   Mon, 23 Dec 2019 13:17:36 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org, Vinod Koul <vinod.koul@intel.com>,
        dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Arnd Bergmann <arnd@arndb.de>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 12/14] dmaengine: ti: omap-dma: Use cpu notifier to block
 idle for omap2
Message-ID: <20191223074736.GB2536@vkoul-mobl>
References: <20191217001925.44558-1-tony@atomide.com>
 <20191217001925.44558-13-tony@atomide.com>
 <20191217002716.GT35479@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191217002716.GT35479@atomide.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 16-12-19, 16:27, Tony Lindgren wrote:
> * Tony Lindgren <tony@atomide.com> [191217 00:20]:
> > diff --git a/drivers/dma/ti/omap-dma.c b/drivers/dma/ti/omap-dma.c
> > --- a/drivers/dma/ti/omap-dma.c
> > +++ b/drivers/dma/ti/omap-dma.c
> > +	case CPU_CLUSTER_PM_ENTER:
> > +		while (1) {
> > +			lch = find_next_bit(od->lch_bitmap, od->lch_count,
> > +					    lch + 1);
> > +			if (lch >= od->lch_count)
> > +				break;
> > +			c = od->lch_map[lch];
> > +			if (!c)
> > +				continue;
> > +			if (omap_dma_chan_read(c, CCR) & CCR_ENABLE) {
> > +				pr_info("XXX %s: lch%i busy\n", __func__, lch);
> > +				return NOTIFY_BAD;
> 
> Oops the pr_info line here can be dropped :)

feel free to add my after after fixing :)

Acked-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
