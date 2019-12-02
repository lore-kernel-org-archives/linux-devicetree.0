Return-Path: <SRS0=pYa2=ZY=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 161FBC432C3
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Dec 2019 13:13:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E0A012146E
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Dec 2019 13:13:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="suffUEex"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727438AbfLBNNK (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 2 Dec 2019 08:13:10 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:58274 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727454AbfLBNNK (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 2 Dec 2019 08:13:10 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8640C309;
        Mon,  2 Dec 2019 14:13:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1575292388;
        bh=4k2gpT/sh1J3AYsg87ypOtWUJndOQu78qYrYWpTPQHQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=suffUEexrYMZs3dlyifyV1VrIfHrYwokI6CdDOCg8tobPI5wEsyBMVx35MsrBve9T
         fiTeMf/MN2k8KJTKsiUacf1KLkrNvHCVH+OMR+6ch4JEhRJqPm48CUQPKwNWjGcdTh
         01dKm8w90icQbZczBB6xXH2I6rrMRKcLNOJW6Zw4=
Date:   Mon, 2 Dec 2019 15:13:00 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Tony Lindgren <tony@atomide.com>, Jyri Sarha <jsarha@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: Re: [PATCH 0/3] drm/omap: fix am4 evm lcd
Message-ID: <20191202131300.GJ4929@pendragon.ideasonboard.com>
References: <20191114093950.4101-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191114093950.4101-1-tomi.valkeinen@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Tomi,

On Thu, Nov 14, 2019 at 11:39:47AM +0200, Tomi Valkeinen wrote:
> Hi Tony, Thierry, Laurent,
> 
> After the recent change of moving from omapdrm specific panel-dpi driver
> to the DRM simple panel, AM4 EVM/ePOS's panel is not working quite
> right. This series has fixes for it, but I'm not sure if these are the
> right ways to fix the issues, so comments welcome.
> 
> 1) Panel driver is not probed. With omapdrm's panel-dpi, the match
> happened with "panel-dpi" compatible string. Now with panel-simple, the
> match should happen with the panel model compatible string, which is
> "osddisplays,osd057T0559-34ts" in the DT file. However, no such
> compatible exists in panel-simple.

I've also noticed that we have a few other omap-based platforms that
got broken, for the same reason :-( We're missing driver support for
innolux,at070tn83, samsung,lte430wq-f0c and startek,startek-kd050c, and
we have a few nodes that use panel-dpi without any more precise
compatible string.

> Interestingly, the actual panel at least on my EVMs and ePOSes is not
> osd057T0559-34ts, but osd070t1718-19ts. Also, I was unable to find any
> information about osd057T0559-34ts. I don't know the history with this,
> so it is possible that the early versions of the boards did have
> osd057T0559-34ts, but was later changed to osd070t1718-19ts.
> 
> As osd070t1718-19ts is supported by panel-simple, changing the
> compatible string to osd070t1718-19ts in the DT file solves this one.
> 
> 2) Timings in DT file cause a kernel warning. Omapdrm's panel-dpi used
> video timings from the DT file, so they are present in all the DT files.
> panel-simple uses timings from a table in the panel-simple driver, but
> gives a kernel warning if the DT file contains timings.
> 
> This can be solved by removing the timings from the DT file.
> 
> 3) Sync drive edge is not right. This one might have been present also
> with panel-dpi, I didn't verify. The problem is that the panel-simple
> data for osddisplays_osd070t1718_19ts defines bus_flags for DE polarity
> and pixdata edge, but not for sync edge.
> 
> The datasheet for the panel does not give any hint on what the edge
> should be.  Omapdrm defaults to driving syncs on falling edge, which
> caused the image to be shifted one pixel to the right.
> 
> Adding DRM_BUS_FLAG_SYNC_DRIVE_POSEDGE bus_flag solves the problem. AM5
> EVM also has the same panel with the same behavior.
> 
> ====
> 
> The reason I'm not sure if the 1) and 2) fixes are correct is that
> they're breaking DT compatibility. Should we instead make changes to
> panel-simple to keep the same DT files working?

That's tempting, as breaking DT is quite bad, but that would require
adding a match on panel-dpi, and parsing timings in the panel-simple
driver. Thierry has always been opposed to that as far as I can tell,
and even if I don't share his point of view, I don't want to move in
this direction without a consensus.

Your series is fine in my opinion, as even if we decide to handle
backward compatibility in this case, changing the DT files in mainline
is still the right way to go (if only to avoid giving wrong examples).

> This would mean adding a new entry for the osd057T0559-34ts panel, but
> as we don't have datasheet for it, I think we could just append the
> compatible string to osd070t1718-19t's data.
> 
> It would also mean doing some change to the panel-simple code that gives
> the warning about timings in DT data. This might make sense, as I think
> we have other DT files with video timings too.
> 
> For 3), I think the patch is fine, but I'm not sure if the display
> controller driver should be able to deduce the sync drive edge from the
> pixdata drive edge. Are they usually the same? I have no idea...
> 
> Tomi Valkeinen (3):
>   ARM: dts: am437x-gp/epos-evm: fix panel compatible
>   ARM: dts: am437x-gp/epos-evm: drop unused panel timings
>   drm/panel: simple: fix osd070t1718_19ts sync drive edge
> 
>  arch/arm/boot/dts/am437x-gp-evm.dts  | 18 +-----------------
>  arch/arm/boot/dts/am43x-epos-evm.dts | 18 +-----------------
>  drivers/gpu/drm/panel/panel-simple.c |  3 ++-
>  3 files changed, 4 insertions(+), 35 deletions(-)

-- 
Regards,

Laurent Pinchart
