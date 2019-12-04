Return-Path: <SRS0=zDkl=Z2=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1B3FC43603
	for <linux-devicetree@archiver.kernel.org>; Wed,  4 Dec 2019 10:38:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C5E272068E
	for <linux-devicetree@archiver.kernel.org>; Wed,  4 Dec 2019 10:38:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="nYNUlz4r"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727445AbfLDKiT (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 4 Dec 2019 05:38:19 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:54606 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727429AbfLDKiT (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 4 Dec 2019 05:38:19 -0500
Received: from pendragon.ideasonboard.com (85-76-7-253-nat.elisa-mobile.fi [85.76.7.253])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DB93C2E5;
        Wed,  4 Dec 2019 11:38:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1575455896;
        bh=VYwRJOBjxh1800/WKysrFil7fftC0CbXVFmWz6HfoEg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nYNUlz4rM9JU3o4YMkEk4KMPylmWuw6KYLkdVB+mkhIffo3E1dnrgcYy4DpS/cGtU
         Py9TgpAhqAhVa3g8Fk4nA4QLi/JFiYFvgiv875y4s6oNT0pgasXvWTbaqcrI0e9tdw
         EpyXCl+nBxjN4iHOvMlwBeOvfl13FUpttkinZTWE=
Date:   Wed, 4 Dec 2019 12:38:06 +0200
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
Subject: Re: [PATCH v4 08/11] drm/bridge: Add a drm_bridge_state object
Message-ID: <20191204103806.GD6705@pendragon.ideasonboard.com>
References: <20191203141515.3597631-1-boris.brezillon@collabora.com>
 <20191203141515.3597631-9-boris.brezillon@collabora.com>
 <20191203181705.GT4730@pendragon.ideasonboard.com>
 <20191204100302.38096544@collabora.com>
 <20191204091255.GB6705@pendragon.ideasonboard.com>
 <20191204104207.38367944@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191204104207.38367944@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Boris,

On Wed, Dec 04, 2019 at 10:42:07AM +0100, Boris Brezillon wrote:
> On Wed, 4 Dec 2019 11:12:55 +0200 Laurent Pinchart wrote:
> > On Wed, Dec 04, 2019 at 10:03:02AM +0100, Boris Brezillon wrote:
> > > On Tue, 3 Dec 2019 20:17:05 +0200 Laurent Pinchart wrote:  
> > > > On Tue, Dec 03, 2019 at 03:15:12PM +0100, Boris Brezillon wrote:  
> > > > > One of the last remaining objects to not have its atomic state.
> > > > > 
> > > > > This is being motivated by our attempt to support runtime bus-format
> > > > > negotiation between elements of the bridge chain.
> > > > > This patch just paves the road for such a feature by adding a new
> > > > > drm_bridge_state object inheriting from drm_private_obj so we can
> > > > > re-use some of the existing state initialization/tracking logic.
> > > > > 
> > > > > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > > > > Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
> > > > > ---
> > > > > Changes in v4:
> > > > > * Fix the doc
> > > > > * Kill default helpers (inlined)    
> > > > 
> > > > I liked the default helpers, inlining their content makes the code more
> > > > difficult to follow in my opinion.  
> > > 
> > > I'll go back to this approach then. Should I keep the original helper
> > > names even though they're not globally visible (and should probably
> > > never be)?  
> > 
> > I agree they should probably never be visible, and I trust your
> > judgement on naming. Please double-check the documentation though, to
> > ensure that it matches the implementation.
> 
> Is there any point keeping the documentation if they're not exposed?

I'll let you decide on that, depending on if the documentation could
bring value or if the functions would be so trivial that it would be
overkill.

-- 
Regards,

Laurent Pinchart
