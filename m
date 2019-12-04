Return-Path: <SRS0=zDkl=Z2=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4715C43603
	for <linux-devicetree@archiver.kernel.org>; Wed,  4 Dec 2019 09:15:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9287D20640
	for <linux-devicetree@archiver.kernel.org>; Wed,  4 Dec 2019 09:15:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="sX5L4odf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726166AbfLDJPy (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 4 Dec 2019 04:15:54 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:53698 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725994AbfLDJPy (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 4 Dec 2019 04:15:54 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 21FF12E5;
        Wed,  4 Dec 2019 10:15:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1575450951;
        bh=doXYPCSvABgiJK88FVctcozTFTsD7J1hmZz7i3MphpI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sX5L4odfl4lUqYjF83Ubr63SnJ+3IJsFwBDWGYFCDsEcP00+XFTF6zqOzOIJWCP/s
         ZxeTpTMHc+Lq4af3GqzaGV+9T6l7JihRlM4swQ+bHERplRM2rhE5UvrOeTAt40G4iE
         6JLLALQhE9vnRN5cme6tPUNqssCc2N8jh74akw/U=
Date:   Wed, 4 Dec 2019 11:15:44 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     dri-devel@lists.freedesktop.org,
        Lucas Stach <l.stach@pengutronix.de>,
        Chris Healy <cphealy@gmail.com>,
        Andrey Smirnov <andrew.smirnov@gmail.com>,
        Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
        kernel@collabora.com, Daniel Vetter <daniel@ffwll.ch>,
        Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Clark <robdclark@gmail.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH v4 00/11] drm: Add support for bus-format negotiation
Message-ID: <20191204091544.GC6705@pendragon.ideasonboard.com>
References: <20191203141515.3597631-1-boris.brezillon@collabora.com>
 <20191203181924.GU4730@pendragon.ideasonboard.com>
 <20191204100957.15406559@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191204100957.15406559@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Boris,

On Wed, Dec 04, 2019 at 10:09:57AM +0100, Boris Brezillon wrote:
> On Tue, 3 Dec 2019 20:19:24 +0200 Laurent Pinchart wrote:
> > On Tue, Dec 03, 2019 at 03:15:04PM +0100, Boris Brezillon wrote:
> > > This patch series aims at adding support for runtime bus-format
> > > negotiation between all elements of the
> > > 'encoder -> bridges -> connector/display' section of the pipeline.
> > > 
> > > In order to support that, we need drm bridges to fully take part in the
> > > atomic state validation process, which requires adding a
> > > drm_bridge_state and a new drm_bridge_funcs.atomic_check() hook.
> > > Once those basic building blocks are in place, we can add new hooks to
> > > allow bus format negotiation (those are called just before  
> > > ->atomic_check()). The bus format selection is done at runtime by  
> > > testing all possible combinations across the whole bridge chain until
> > > one is reported to work.
> > > 
> > > No Major changes in this v4. I think I addressed all comments I got
> > > from Neil and Laurent (thanks for the detailed reviews BTW). Note that
> > > this version only contains core changes. Once those changes are merged
> > > I'll send the imx/panel/lvds-codec specific bits.  
> > 
> > I think it would make sense to fast-track patches 01 to 07 (a bit
> > selfishly as I would have a need for them in omapdrm :-))
> 
> Will do that end of this week.

Thank you.

> >, but starting
> > from 08 I wonder if it wouldn't make more sense to merge them with the
> > imx/panel/lvds-codec bits to have a user.
> 
> I'd really like to see that happen early in this release cycle so we
> can catch bugs before those commits reach Linus' tree,

I have no issue merging all your patches early in the release cycle,
including the imx/panel/lvds-codec bits. Given the rebase required for
lvds-codec it may take a bit of time though, so I'm OK if you prefer
merging the core first, but I'm not sure it will help catching bugs if
it's unused :-)

> and the
> lvds-codec changes depend on your PR. Can we make sure this one is
> merged just after the MW has closed and the drm-next -> drm-misc-next
> back merge done just after that?

I've sent the pull request already, as soon as Dave or Daniel handles
it, you'll have the necessary dependencies.

-- 
Regards,

Laurent Pinchart
