Return-Path: <SRS0=zDkl=Z2=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D607FC43603
	for <linux-devicetree@archiver.kernel.org>; Wed,  4 Dec 2019 09:00:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AD2B42073B
	for <linux-devicetree@archiver.kernel.org>; Wed,  4 Dec 2019 09:00:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726217AbfLDJAx (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 4 Dec 2019 04:00:53 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:47340 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726166AbfLDJAx (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 4 Dec 2019 04:00:53 -0500
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id C14B629112A;
        Wed,  4 Dec 2019 09:00:49 +0000 (GMT)
Date:   Wed, 4 Dec 2019 10:00:46 +0100
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Subject: Re: [PATCH v4 07/11] drm/bridge: Clarify the atomic enable/disable
 hooks semantics
Message-ID: <20191204100046.2b4aab64@collabora.com>
In-Reply-To: <20191203180223.GS4730@pendragon.ideasonboard.com>
References: <20191203141515.3597631-1-boris.brezillon@collabora.com>
        <20191203141515.3597631-8-boris.brezillon@collabora.com>
        <20191203180223.GS4730@pendragon.ideasonboard.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, 3 Dec 2019 20:02:23 +0200
Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:

> Hi Boris,
> 
> Thanks for the patch.
> 
> On Tue, Dec 03, 2019 at 03:15:11PM +0100, Boris Brezillon wrote:
> > The [pre_]enable/[post_]disable hooks are passed the old atomic state.
> > Update the doc and rename the arguments to make it clear.
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
> > ---
> > Changes in v4:
> > * Drop the doc update (Laurent)  
> 
> I was referring to the doc updates in drm_bridge.h only. Is there a
> reason you dropped the changes from drm_bridge.c ? I think those were
> good.

Oops, that's a mistake. I'll fix it before applying.

> 
> > * Add Rbs
> > 
> > Changes in v3:
> > * New patch
> > ---
> >  include/drm/drm_bridge.h | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> > index bfb0385163f1..d7d714023050 100644
> > --- a/include/drm/drm_bridge.h
> > +++ b/include/drm/drm_bridge.h
> > @@ -263,7 +263,7 @@ struct drm_bridge_funcs {
> >  	 * The @atomic_pre_enable callback is optional.
> >  	 */
> >  	void (*atomic_pre_enable)(struct drm_bridge *bridge,
> > -				  struct drm_atomic_state *state);
> > +				  struct drm_atomic_state *old_state);
> >  
> >  	/**
> >  	 * @atomic_enable:
> > @@ -288,7 +288,7 @@ struct drm_bridge_funcs {
> >  	 * The @atomic_enable callback is optional.
> >  	 */
> >  	void (*atomic_enable)(struct drm_bridge *bridge,
> > -			      struct drm_atomic_state *state);
> > +			      struct drm_atomic_state *old_state);
> >  	/**
> >  	 * @atomic_disable:
> >  	 *
> > @@ -311,7 +311,7 @@ struct drm_bridge_funcs {
> >  	 * The @atomic_disable callback is optional.
> >  	 */
> >  	void (*atomic_disable)(struct drm_bridge *bridge,
> > -			       struct drm_atomic_state *state);
> > +			       struct drm_atomic_state *old_state);
> >  
> >  	/**
> >  	 * @atomic_post_disable:
> > @@ -337,7 +337,7 @@ struct drm_bridge_funcs {
> >  	 * The @atomic_post_disable callback is optional.
> >  	 */
> >  	void (*atomic_post_disable)(struct drm_bridge *bridge,
> > -				    struct drm_atomic_state *state);
> > +				    struct drm_atomic_state *old_state);
> >  };
> >  
> >  /**  
> 

