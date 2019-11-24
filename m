Return-Path: <SRS0=+Vg9=ZQ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E578C432C0
	for <linux-devicetree@archiver.kernel.org>; Sun, 24 Nov 2019 14:03:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1C3AC2075E
	for <linux-devicetree@archiver.kernel.org>; Sun, 24 Nov 2019 14:03:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XuSTDY3W"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726779AbfKXODD (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 24 Nov 2019 09:03:03 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:42718 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726744AbfKXODD (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 24 Nov 2019 09:03:03 -0500
Received: from pendragon.ideasonboard.com (fs96f9c64d.tkyc509.ap.nuro.jp [150.249.198.77])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DAA41D4B;
        Sun, 24 Nov 2019 15:02:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1574604179;
        bh=JgmHHeGu1exjlVg7487BMTSsBTL2Ro7ALzf3QcBcEvE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XuSTDY3WP5297aQEu8mJ0uWPTQaDjzNDwVzwTJCNS9g6J8Xd2+2xD9QPfHYtZ62NF
         NyE48k6qAgXtKW8jb4vfSCvqKSm4KcAx6fhdVwE8I7oY0mJwSbeRTbdKLwfeE1nsE9
         d9R+rzJ7/bYGNOOqeCnQcPj/O21AGaYkSAkhuiL0=
Date:   Sun, 24 Nov 2019 16:02:50 +0200
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
Subject: Re: [PATCH v3 03/21] drm/exynos: Declare the DSI encoder as a bridge
 element
Message-ID: <20191124140250.GI4727@pendragon.ideasonboard.com>
References: <20191023154512.9762-1-boris.brezillon@collabora.com>
 <20191023154512.9762-4-boris.brezillon@collabora.com>
 <20191124102433.GD4727@pendragon.ideasonboard.com>
 <20191124141727.45597a6e@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191124141727.45597a6e@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Boris,

On Sun, Nov 24, 2019 at 02:17:27PM +0100, Boris Brezillon wrote:
> On Sun, 24 Nov 2019 12:24:33 +0200 Laurent Pinchart wrote:
> > On Wed, Oct 23, 2019 at 05:44:54PM +0200, Boris Brezillon wrote:
> > > Encoder drivers will progressively transition to the drm_bridge
> > > interface in place of the drm_encoder one.
> > > 
> > > Converting the Exynos DSI encoder driver to this approach allows us to
> > > use the ->pre_{enable,disable}()  hooks and get rid of the hack
> > > resetting encoder->bridge.next (which was needed to control the
> > > encoder/bridge enable/disable sequence).
> > > 
> > > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > > ---
> > > Changes in v3:
> > > * Embed a drm_bridge object in exynos_dsi since drm_encoder no longer
> > >   has a dummy bridge
> > > 
> > > Changes in v2:
> > > * New patch (replacement for "drm/exynos: Get rid of exynos_dsi->out_bridge")
> > > ---
> > >  drivers/gpu/drm/exynos/exynos_drm_dsi.c | 89 +++++++++++++++----------
> > >  1 file changed, 55 insertions(+), 34 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> > > index 72726f2c7a9f..3915f50b005e 100644
> > > --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> > > +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> > > @@ -252,10 +252,10 @@ struct exynos_dsi_driver_data {
> > >  
> > >  struct exynos_dsi {
> > >  	struct drm_encoder encoder;
> > > +	struct drm_bridge bridge;
> > >  	struct mipi_dsi_host dsi_host;
> > >  	struct drm_connector connector;
> > >  	struct drm_panel *panel;
> > > -	struct drm_bridge *out_bridge;
> > >  	struct device *dev;
> > >  
> > >  	void __iomem *reg_base;
> > > @@ -291,6 +291,11 @@ static inline struct exynos_dsi *encoder_to_dsi(struct drm_encoder *e)
> > >  	return container_of(e, struct exynos_dsi, encoder);
> > >  }
> > >  
> > > +static inline struct exynos_dsi *bridge_to_dsi(struct drm_bridge *b)
> > > +{
> > > +	return container_of(b, struct exynos_dsi, bridge);
> > > +}
> > > +
> > >  enum reg_idx {
> > >  	DSIM_STATUS_REG,	/* Status register */
> > >  	DSIM_SWRST_REG,		/* Software reset register */
> > > @@ -1374,25 +1379,38 @@ static void exynos_dsi_unregister_te_irq(struct exynos_dsi *dsi)
> > >  	}
> > >  }
> > >  
> > > -static void exynos_dsi_enable(struct drm_encoder *encoder)
> > > +static void exynos_dsi_pre_enable(struct drm_bridge *bridge)
> > >  {
> > > -	struct exynos_dsi *dsi = encoder_to_dsi(encoder);
> > > +	struct exynos_dsi *dsi = bridge_to_dsi(bridge);
> > >  	int ret;
> > >  
> > >  	if (dsi->state & DSIM_STATE_ENABLED)
> > >  		return;  
> > 
> > This can probably be removed now as the core should ensure that
> > double-enable or double-disable never occurs, but it can be done in a
> > separate patch.
> 
> Except the enable/disable() implementations handle failures (the
> framework does not expect those to fails BTW), and I guess it's
> important to know the actual HW state in order to keep runtime PM
> get/put calls balanced.
> 
> > >  
> > >  	pm_runtime_get_sync(dsi->dev);
> > > -	dsi->state |= DSIM_STATE_ENABLED;
> > >  
> > >  	if (dsi->panel) {
> > >  		ret = drm_panel_prepare(dsi->panel);
> > >  		if (ret < 0)
> > >  			goto err_put_sync;
> > > -	} else {
> > > -		drm_bridge_pre_enable(dsi->out_bridge);
> > >  	}  
> > 
> > It would be nice to switch to the drm panel bridge, but that can also be
> > done on top of this series.
> 
> I agree, just didn't want to add more stuff to this series.
> 
> > >  
> > > +	dsi->state |= DSIM_STATE_ENABLED;
> > > +	return;
> > > +
> > > +err_put_sync:
> > > +	pm_runtime_put(dsi->dev);
> > > +}
> > > +
> > > +static void exynos_dsi_enable(struct drm_bridge *bridge)
> > > +{
> > > +	struct exynos_dsi *dsi = bridge_to_dsi(bridge);
> > > +	int ret;
> > > +
> > > +	if (!(dsi->state & DSIM_STATE_ENABLED) ||
> > > +	    (dsi->state & DSIM_STATE_VIDOUT_AVAILABLE))
> > > +		return;
> > > +
> > >  	exynos_dsi_set_display_mode(dsi);
> > >  	exynos_dsi_set_display_enable(dsi, true);
> > >  
> > > @@ -1400,8 +1418,6 @@ static void exynos_dsi_enable(struct drm_encoder *encoder)
> > >  		ret = drm_panel_enable(dsi->panel);
> > >  		if (ret < 0)
> > >  			goto err_display_disable;
> > > -	} else {
> > > -		drm_bridge_enable(dsi->out_bridge);
> > >  	}
> > >  
> > >  	dsi->state |= DSIM_STATE_VIDOUT_AVAILABLE;
> > > @@ -1410,28 +1426,30 @@ static void exynos_dsi_enable(struct drm_encoder *encoder)
> > >  err_display_disable:
> > >  	exynos_dsi_set_display_enable(dsi, false);
> > >  	drm_panel_unprepare(dsi->panel);  
> > 
> > Does this belong here, as drm_panel_prepare() was called in
> > exynos_dsi_pre_enable() ?
> 
> Nope, this one should be dropped.
> 
> > > -
> > > -err_put_sync:
> > > -	dsi->state &= ~DSIM_STATE_ENABLED;
> > > -	pm_runtime_put(dsi->dev);
> > >  }
> > >  
> > > -static void exynos_dsi_disable(struct drm_encoder *encoder)
> > > +static void exynos_dsi_disable(struct drm_bridge *bridge)
> > >  {
> > > -	struct exynos_dsi *dsi = encoder_to_dsi(encoder);
> > > +	struct exynos_dsi *dsi = bridge_to_dsi(bridge);
> > > +
> > > +	if (!(dsi->state & DSIM_STATE_VIDOUT_AVAILABLE))
> > > +		return;
> > > +
> > > +	drm_panel_disable(dsi->panel);
> > > +	exynos_dsi_set_display_enable(dsi, false);
> > > +	dsi->state &= ~DSIM_STATE_VIDOUT_AVAILABLE;
> > > +}
> > > +
> > > +static void exynos_dsi_post_disable(struct drm_bridge *bridge)
> > > +{
> > > +	struct exynos_dsi *dsi = bridge_to_dsi(bridge);
> > >  
> > >  	if (!(dsi->state & DSIM_STATE_ENABLED))
> > >  		return;
> > >  
> > > -	dsi->state &= ~DSIM_STATE_VIDOUT_AVAILABLE;
> > > -
> > > -	drm_panel_disable(dsi->panel);
> > > -	drm_bridge_disable(dsi->out_bridge);
> > > -	exynos_dsi_set_display_enable(dsi, false);
> > >  	drm_panel_unprepare(dsi->panel);
> > > -	drm_bridge_post_disable(dsi->out_bridge);
> > > -	dsi->state &= ~DSIM_STATE_ENABLED;
> > >  	pm_runtime_put_sync(dsi->dev);
> > > +	dsi->state &= ~DSIM_STATE_ENABLED;
> > >  }
> > >  
> > >  static enum drm_connector_status
> > > @@ -1499,9 +1517,11 @@ static int exynos_dsi_create_connector(struct drm_encoder *encoder)
> > >  	return 0;
> > >  }
> > >  
> > > -static const struct drm_encoder_helper_funcs exynos_dsi_encoder_helper_funcs = {
> > > +static const struct drm_bridge_funcs exynos_dsi_bridge_funcs = {
> > > +	.pre_enable = exynos_dsi_pre_enable,
> > >  	.enable = exynos_dsi_enable,
> > >  	.disable = exynos_dsi_disable,
> > > +	.post_disable = exynos_dsi_post_disable,
> > >  };
> > >  
> > >  static const struct drm_encoder_funcs exynos_dsi_encoder_funcs = {
> > > @@ -1520,9 +1540,7 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
> > >  
> > >  	out_bridge  = of_drm_find_bridge(device->dev.of_node);
> > >  	if (out_bridge) {
> > > -		drm_bridge_attach(encoder, out_bridge, NULL);
> > > -		dsi->out_bridge = out_bridge;
> > > -		encoder->bridge = NULL;
> > > +		drm_bridge_attach(encoder, out_bridge, &dsi->bridge);
> > >  	} else {
> > >  		int ret = exynos_dsi_create_connector(encoder);
> > >  
> > > @@ -1575,19 +1593,19 @@ static int exynos_dsi_host_detach(struct mipi_dsi_host *host,
> > >  				  struct mipi_dsi_device *device)
> > >  {
> > >  	struct exynos_dsi *dsi = host_to_dsi(host);
> > > +	struct drm_bridge *out_bridge = dsi->bridge.next;
> > >  	struct drm_device *drm = dsi->encoder.dev;
> > >  
> > >  	if (dsi->panel) {
> > >  		mutex_lock(&drm->mode_config.mutex);
> > > -		exynos_dsi_disable(&dsi->encoder);
> > > +		exynos_dsi_disable(&dsi->bridge);
> > > +		exynos_dsi_post_disable(&dsi->bridge);
> > >  		drm_panel_detach(dsi->panel);
> > >  		dsi->panel = NULL;
> > >  		dsi->connector.status = connector_status_disconnected;
> > >  		mutex_unlock(&drm->mode_config.mutex);
> > > -	} else {
> > > -		if (dsi->out_bridge->funcs->detach)
> > > -			dsi->out_bridge->funcs->detach(dsi->out_bridge);
> > > -		dsi->out_bridge = NULL;
> > > +	} else if (out_bridge && out_bridge->funcs->detach) {
> > > +		out_bridge->funcs->detach(out_bridge);  
> > 
> > Maybe drm_bridge_detach() ?
> 
> This function is not exported, and I suppose that's why they used the
> function pointer in this driver. I bet there's a good reason for not
> exposing this function...

Indeed, my bad. It's called by drm_encoder_cleanup(), I assume it's not
enough ? If there's a good use case for exporting it, then I think it
should be exported.

> > >  	}
> > >  
> > >  	if (drm->mode_config.poll_enabled)
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

Can we get input from the exynos maintainers ? Or is the driver not
actively maintained anymore ?

> TBH, I didn't want to go that far and fix existing drivers when I
> started this series, so I think I'll rework the patchset to get rid of
> the VC4 and exynos patches, even if that means having 2 drivers that
> mess up with the encoder->bridge_chain list.

I don't mind the above changes really (and the one for VC4 seems pretty
fine so far).

-- 
Regards,

Laurent Pinchart
