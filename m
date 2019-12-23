Return-Path: <SRS0=v2WM=2N=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D725C2D0D4
	for <linux-devicetree@archiver.kernel.org>; Mon, 23 Dec 2019 07:44:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1A5282081E
	for <linux-devicetree@archiver.kernel.org>; Mon, 23 Dec 2019 07:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1577087044;
	bh=1fLYrfmnbwD9b8lNPzTWF67ECI0Gh5tx3/rYZlRUoiQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=duWH2ZKkbBiMQwvYDJtvMa8L3xzjXwsFA6KCWMCcCVRyq+61Yl4mBUBCjc0NzKhAy
	 Sl0PXmQ4XF/ExBAOvf3CZCnnqKU55agILkjySIWxCrMw6Z1HKXbYG/rXd7g5GldXMv
	 uJInxpWwQ3sj3vUHoNBf++NeuGfIkz1mXMCGJcfI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726177AbfLWHoD (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 23 Dec 2019 02:44:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:53886 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725810AbfLWHoD (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 23 Dec 2019 02:44:03 -0500
Received: from localhost (unknown [223.226.34.186])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E26DA206CB;
        Mon, 23 Dec 2019 07:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1577087042;
        bh=1fLYrfmnbwD9b8lNPzTWF67ECI0Gh5tx3/rYZlRUoiQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=k6YTi1DRmTzx4s/t1aBzQNsLmbb9Clp9CfMtLV3f/6wxZ8HgfQV8BhAErXZQvElG7
         RMmpHcDXyK0Y9aDXIDI1utUKAW58TVX8gwaHX9IyM48m8K9fqpTHROslXVqeR3SJxQ
         pUcphECEjTwE/6LCDdyrG1BHahNvanIwv1gUsKIQ=
Date:   Mon, 23 Dec 2019 13:13:58 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org, Vinod Koul <vinod.koul@intel.com>,
        dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Arnd Bergmann <arnd@arndb.de>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 08/14] dmaengine: ti: omap-dma: Add device tree match
 data and use it for cpu_pm
Message-ID: <20191223074358.GX2536@vkoul-mobl>
References: <20191217001925.44558-1-tony@atomide.com>
 <20191217001925.44558-9-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191217001925.44558-9-tony@atomide.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 16-12-19, 16:19, Tony Lindgren wrote:
> With old DMA code disabled for handling DMA requests for device tree based
> SoCs, we can move omap3 specific context save and restore to the dmaengine
> driver.
> 
> Let's do this by adding cpu_pm notifier handling to save and restore context,
> and enable it based on device tree match data. This way we can use the match
> data later to configure more SoC specific features later on too.
> 
> Note that we only clear the channels in use while the platform code also
> clears reserved channels 0 and 1 on high-security SoCs. Based on testing
> on n900, this is not needed though and the system idles just fine.
> 
> With the dmaengine driver handling context save and restore, we must now
> remove the old custom calls for context save and restore.

Acked-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
