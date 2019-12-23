Return-Path: <SRS0=v2WM=2N=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8067CC2D0D4
	for <linux-devicetree@archiver.kernel.org>; Mon, 23 Dec 2019 07:46:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 56D952073A
	for <linux-devicetree@archiver.kernel.org>; Mon, 23 Dec 2019 07:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1577087204;
	bh=/ZZvuta/S/+fKcCNlswYo7DuCKNxJFaMwh4jCF/2RQw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=gLAw80WAD2rJcnyNYKgPS3DEvBgl5ArrzvPid/JmStGqS7d5HxQmnEYEY2Joyhpuu
	 gRERAiS/X4aE4XmYE+Syxg0s+gcRqu7pmS0XNbymZMUSfUh3rqtVSK9e5mFF+m8raQ
	 Nr8YQEKujujegCAqYcNBydczmn2fp4KA2TbZWtak=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726067AbfLWHqn (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 23 Dec 2019 02:46:43 -0500
Received: from mail.kernel.org ([198.145.29.99]:54604 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725880AbfLWHqn (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 23 Dec 2019 02:46:43 -0500
Received: from localhost (unknown [223.226.34.186])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4D532206CB;
        Mon, 23 Dec 2019 07:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1577087203;
        bh=/ZZvuta/S/+fKcCNlswYo7DuCKNxJFaMwh4jCF/2RQw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=W58n12nxt2ukx1IertvKkdbIbPdNohojsPFtKdnXG0AYWFCj6ld278zTzbiHHVwOn
         UsaLuI8fAsA3Aoiu53UwKBjtqi9YEnoBPCf0wvsTTW1XVxcvAurz6DAetP+uuSRy9v
         vr543O0ovuNs4dE1A3DhXWV3RQIr3Odnoncb0NDc=
Date:   Mon, 23 Dec 2019 13:16:38 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org, Vinod Koul <vinod.koul@intel.com>,
        dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Arnd Bergmann <arnd@arndb.de>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 10/14] dmaengine: ti: omap-dma: Pass sdma auxdata to
 driver and use it
Message-ID: <20191223074638.GZ2536@vkoul-mobl>
References: <20191217001925.44558-1-tony@atomide.com>
 <20191217001925.44558-11-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191217001925.44558-11-tony@atomide.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 16-12-19, 16:19, Tony Lindgren wrote:
> We can now start passing sdma auxdata to the dmaengine driver to start
> removing the platform based sdma init.

Acked-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
