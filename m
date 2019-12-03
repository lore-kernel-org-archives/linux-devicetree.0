Return-Path: <SRS0=0idb=ZZ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8906BC432C3
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Dec 2019 10:15:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5FB5B206F0
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Dec 2019 10:15:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Yh9CIC75"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725957AbfLCKPq (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 3 Dec 2019 05:15:46 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:32894 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726484AbfLCKPp (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 3 Dec 2019 05:15:45 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 95F77309;
        Tue,  3 Dec 2019 11:15:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1575368143;
        bh=IVjK8/i+nUnppQ/CIcHWTcjPI3l6ji3A4nJKjmHK8yo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Yh9CIC75iZWShzztTl8a4pNolc5OLR+UhoRSwH7JGWrwQhZKXVASfzBKX0a5A8Wjz
         k3ObQUJRIxTtCKDoDpTrO7gzol9qYMVcUddfj2JfT2Smes/ASPt9BgAcO5UNql2tct
         Yluk4X7jUpbO99J6tniahgQiouHVyZgGXVTlJ/8s=
Date:   Tue, 3 Dec 2019 12:15:37 +0200
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
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 12/21] drm/bridge: Add an ->atomic_check() hook
Message-ID: <20191203101537.GO4730@pendragon.ideasonboard.com>
References: <20191023154512.9762-1-boris.brezillon@collabora.com>
 <20191023154512.9762-13-boris.brezillon@collabora.com>
 <20191202170336.GP4929@pendragon.ideasonboard.com>
 <20191203111151.28d86f53@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191203111151.28d86f53@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Boris,

On Tue, Dec 03, 2019 at 11:11:51AM +0100, Boris Brezillon wrote:
> On Mon, 2 Dec 2019 19:03:36 +0200 Laurent Pinchart wrote:
> 
> > > +	/**
> > > +	 * @atomic_check:
> > > +	 *
> > > +	 * This method is responsible for checking bridge state correctness.
> > > +	 * It can also check the state of the surrounding components in chain
> > > +	 * to make sure the whole pipeline can work properly.  
> > 
> > As explained in the review of the RFC, I think it's a mistake not to
> > define the semantics of this operation precisely, and in particular not
> > to define explictly what parameters bridge drivers are allowed to modify
> > here. I however don't want to make this a prerequisite for your series,
> > so
> > 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > 
> > but I'm sure we'll regret this later when different bridges will have
> > slightly incompatible implementations.
> 
> Nothing prevents us from working on this clarification after the patch
> series has been merged. I just said I couldn't come up with a good
> set of rules on my own, as I don't really know what bridge->mode_fixup()
> allows us to modify in the first place.

We can of course work on it later, but we both know it won't happen for
some time, until different bridges will behave differently and we'll
have to sort a really big mess :-)

-- 
Regards,

Laurent Pinchart
