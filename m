Return-Path: <SRS0=v2WM=2N=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA851C2D0D3
	for <linux-devicetree@archiver.kernel.org>; Mon, 23 Dec 2019 07:47:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B1CE22073A
	for <linux-devicetree@archiver.kernel.org>; Mon, 23 Dec 2019 07:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1577087230;
	bh=7KjJ2JevPcRa1TlUfOqwa3BNNiJI7zpa+MkXa581+DA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=fUD485OZMgiPaOM8BzcTOjl5Fgqj3SlCI4tW3dE8cTKAUYzw32z8/VgZ7MWechC4p
	 sr9SXhV/3/8YOokwcAzZlre91KmHtxjwdvbfTWBjYn87G9e80oVlVNT6Z5wo7MHJbN
	 mccUutqAfzmXahJ4o6zF4j6DPqmHefUvSay6Pt+w=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725880AbfLWHrJ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 23 Dec 2019 02:47:09 -0500
Received: from mail.kernel.org ([198.145.29.99]:54922 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725810AbfLWHrJ (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 23 Dec 2019 02:47:09 -0500
Received: from localhost (unknown [223.226.34.186])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0CF9C206CB;
        Mon, 23 Dec 2019 07:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1577087228;
        bh=7KjJ2JevPcRa1TlUfOqwa3BNNiJI7zpa+MkXa581+DA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DXXln2Mp8LEVVHx37cf+06aDsA+WOYCtPYmpVGH6B6CyjalHgtn9MF+xdogurzE8X
         klpf77y5ZZbB2D78d0x/EKhQ78hzwseFH23OzYbk1/PDO0AZYsssWjdP9Pw5eeusmi
         /3vMYmH/urHdt3ghAtHFpV2fHV7XVU1nwJb/ginE=
Date:   Mon, 23 Dec 2019 13:17:04 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org, Vinod Koul <vinod.koul@intel.com>,
        dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Arnd Bergmann <arnd@arndb.de>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 11/14] dmaengine: ti: omap-dma: Allocate channels directly
Message-ID: <20191223074704.GA2536@vkoul-mobl>
References: <20191217001925.44558-1-tony@atomide.com>
 <20191217001925.44558-12-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191217001925.44558-12-tony@atomide.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 16-12-19, 16:19, Tony Lindgren wrote:
> With the legacy IRQ handling gone, we can now start allocating channels
> directly in the dmaengine driver for device tree based SoCs.

Acked-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
