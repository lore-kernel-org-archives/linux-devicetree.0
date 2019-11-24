Return-Path: <SRS0=+Vg9=ZQ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 097D6C432C0
	for <linux-devicetree@archiver.kernel.org>; Sun, 24 Nov 2019 13:28:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DB8D52073F
	for <linux-devicetree@archiver.kernel.org>; Sun, 24 Nov 2019 13:28:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726744AbfKXN2X (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 24 Nov 2019 08:28:23 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:40978 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726740AbfKXN2X (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 24 Nov 2019 08:28:23 -0500
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id E77B128FFBF;
        Sun, 24 Nov 2019 13:28:20 +0000 (GMT)
Date:   Sun, 24 Nov 2019 14:28:18 +0100
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
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 03/21] drm/exynos: Declare the DSI encoder as a
 bridge element
Message-ID: <20191124142818.516dfac4@collabora.com>
In-Reply-To: <20191124141727.45597a6e@collabora.com>
References: <20191023154512.9762-1-boris.brezillon@collabora.com>
        <20191023154512.9762-4-boris.brezillon@collabora.com>
        <20191124102433.GD4727@pendragon.ideasonboard.com>
        <20191124141727.45597a6e@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sun, 24 Nov 2019 14:17:27 +0100
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> > > @@ -1687,16 +1705,18 @@ static int exynos_dsi_bind(struct device *dev, struct device *master,
> > >  	drm_encoder_init(drm_dev, encoder, &exynos_dsi_encoder_funcs,
> > >  			 DRM_MODE_ENCODER_TMDS, NULL);
> > >  
> > > -	drm_encoder_helper_add(encoder, &exynos_dsi_encoder_helper_funcs);
> > > -
> > >  	ret = exynos_drm_set_possible_crtcs(encoder, EXYNOS_DISPLAY_TYPE_LCD);
> > >  	if (ret < 0)
> > >  		return ret;
> > >  
> > > +	/* Declare ourself as the first bridge element. */
> > > +	dsi->bridge.funcs = &exynos_dsi_bridge_funcs;
> > > +	drm_bridge_attach(encoder, &dsi->bridge, NULL);
> > > +
> > >  	if (dsi->in_bridge_node) {
> > >  		in_bridge = of_drm_find_bridge(dsi->in_bridge_node);
> > >  		if (in_bridge)
> > > -			drm_bridge_attach(encoder, in_bridge, NULL);
> > > +			drm_bridge_attach(encoder, in_bridge, &dsi->bridge);
> > >  	}  
> > 
> > Same as for patch 01/21, maybe this could be moved to this bridge's
> > attach operation ? Actually, now that I've read the code, this in_bridge
> > part looks weird. Why would the DSI encoder have an input bridge that is
> > has to manage itself ?
> 
> Yes, I know, it doesn't make any sense. Either we're dealing with a
> bridge which can be chained to other bridges (can be placed in the
> middle of a chain as well), or we're dealing with an encoder which
> precedes any bridges. In the latter case (which is how exynos_dsi is
> implemented) in_bridge doesn't have any meaning, and that's even worse
> since we're placing the so-called input bridge (AKA previous bridge)
> after our encoder (that's what drm_bridge_attach(encoder, in_bridge,
> NULL) does).

More on that topic: I checked the exynos dts we have in mainline and
no one is making use of the ports part of the exynos_dsim bindings, so
maybe we should just deprecate it. The other option would be to patch
the driver to act as a real bridge, but I can't do that without someone
testing my changes and I didn't get much feedback from Exynos
maintainers so far...
