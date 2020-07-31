Return-Path: <SRS0=uLJJ=BK=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1535CC433DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 31 Jul 2020 16:53:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D36AA2245C
	for <linux-devicetree@archiver.kernel.org>; Fri, 31 Jul 2020 16:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1596214379;
	bh=L2qrI+ML+8DHJLapKkmYpEvFk+FqKeakceZasJgipGI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=MZonXuBIgKUvUWqVh0eOm7zou+mXc82gvE/PpG4D6DukzoNhpTMUC8wE4ofabrFP/
	 A4L91aK61RMJVlO8a/RkSuHoXvvVCd8ClK2sfko9c8Llt3/BZQMG+gFrLCtyUQOhAo
	 C8qNK/MjNcI+uy+0PRTOGKfOIY5GV/ByfZy0C3GI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729269AbgGaQw7 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 31 Jul 2020 12:52:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:43492 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728958AbgGaQw7 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 31 Jul 2020 12:52:59 -0400
Received: from localhost (unknown [122.171.202.192])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A427D206D8;
        Fri, 31 Jul 2020 16:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596214378;
        bh=L2qrI+ML+8DHJLapKkmYpEvFk+FqKeakceZasJgipGI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pzYUCz8oKpoDfmVQDz1V1Pj2WgVpB4dg2Yujspi895pJrKMGswHOC06ethn+T9Gf4
         MViR5SKuoPJbjLhqLIaIJ5zlbkEkEPRyMqi8zLtPuEphIavznYQ9Wnf8s6P6M6M5xt
         A5R47k5VUaLDtWIfWU0OcVl99D3SWsxEXfvu7x0M=
Date:   Fri, 31 Jul 2020 22:22:54 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Rob Herring <robh+dt@kernel.org>, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] dmaengine: dw: Activate FIFO-mode for memory
 peripherals only
Message-ID: <20200731165254.GG12965@vkoul-mobl>
References: <20200730154545.3965-1-Sergey.Semin@baikalelectronics.ru>
 <20200730154545.3965-3-Sergey.Semin@baikalelectronics.ru>
 <20200730162428.GU3703480@smile.fi.intel.com>
 <20200730163154.qqrlas4zrybvocno@mobilestation>
 <20200730164703.GY3703480@smile.fi.intel.com>
 <20200730171358.7yxnqavmszahlzfr@mobilestation>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200730171358.7yxnqavmszahlzfr@mobilestation>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 30-07-20, 20:13, Serge Semin wrote:
> On Thu, Jul 30, 2020 at 07:47:03PM +0300, Andy Shevchenko wrote:
> > On Thu, Jul 30, 2020 at 07:31:54PM +0300, Serge Semin wrote:
> > > On Thu, Jul 30, 2020 at 07:24:28PM +0300, Andy Shevchenko wrote:
> > > > On Thu, Jul 30, 2020 at 06:45:42PM +0300, Serge Semin wrote:
> > 
> > ...
> > 
> > > > > Thanks to the commit ???????????? ("dmaengine: dw: Initialize channel
> > 
> > ...
> > 
> > > > > Note the DMA-engine repository git.infradead.org/users/vkoul/slave-dma.git
> > > > > isn't accessible. So I couldn't find out the Andy' commit hash to use it in
> > > > > the log.

Yeah I moved tree to k.org after disk issue with infradead, change patch
was on dmaengine ML

> > > > It's dmaengine.git on git.kernel.org.
> > > 
> > > Ah, thanks! I've just found out that the repo address has been changed. But I've
> > > also scanned the "next" branch of the repo:
> > > https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git
> > > 
> > > Your commit isn't there. Am I missing something?
> > 
> 
> > It's a fix. It went to upstream branch (don't remember its name by heart in
> > Vinod's repo).

Yes it is Linus's tree now and in dmaengine you can find in fixes branch

https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git/commit/?h=fixes&id=99ba8b9b0d9780e9937eb1d488d120e9e5c2533d

> 
> Right. Found it. Thanks.
> 
> -Sergey
> 
> > 
> > -- 
> > With Best Regards,
> > Andy Shevchenko
> > 
> > 

-- 
~Vinod
