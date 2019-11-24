Return-Path: <SRS0=+Vg9=ZQ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F06C2C43215
	for <linux-devicetree@archiver.kernel.org>; Sun, 24 Nov 2019 07:50:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D0CDC207DD
	for <linux-devicetree@archiver.kernel.org>; Sun, 24 Nov 2019 07:50:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726994AbfKXHuN (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 24 Nov 2019 02:50:13 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:36548 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726944AbfKXHuM (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 24 Nov 2019 02:50:12 -0500
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 2766728DBA0;
        Sun, 24 Nov 2019 07:50:11 +0000 (GMT)
Date:   Sun, 24 Nov 2019 08:50:08 +0100
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Neil Armstrong <narmstrong@baylibre.com>
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
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 09/21] drm/bridge: Add a drm_bridge_state object
Message-ID: <20191124085008.7f871adc@collabora.com>
In-Reply-To: <6e60e98e-46b2-a979-511e-4717bc6feadc@baylibre.com>
References: <20191023154512.9762-1-boris.brezillon@collabora.com>
        <20191023154512.9762-10-boris.brezillon@collabora.com>
        <6e60e98e-46b2-a979-511e-4717bc6feadc@baylibre.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, 5 Nov 2019 17:05:16 +0100
Neil Armstrong <narmstrong@baylibre.com> wrote:

> >  void drm_bridge_add(struct drm_bridge *bridge);
> >  void drm_bridge_remove(struct drm_bridge *bridge);
> >  struct drm_bridge *of_drm_find_bridge(struct device_node *np);
> > @@ -475,6 +543,56 @@ void drm_atomic_bridge_chain_pre_enable(struct drm_bridge *bridge,
> >  void drm_atomic_bridge_chain_enable(struct drm_bridge *bridge,
> >  				    struct drm_atomic_state *state);
> >  
> > +void __drm_atomic_helper_bridge_reset(struct drm_bridge *bridge,
> > +				      struct drm_bridge_state *state);
> > +struct drm_bridge_state *
> > +drm_atomic_helper_bridge_reset(struct drm_bridge *bridge);
> > +void drm_atomic_helper_bridge_destroy_state(struct drm_bridge *bridge,
> > +					    struct drm_bridge_state *state);
> > +void __drm_atomic_helper_bridge_duplicate_state(struct drm_bridge *bridge,
> > +						struct drm_bridge_state *new);
> > +struct drm_bridge_state *
> > +drm_atomic_helper_bridge_duplicate_state(struct drm_bridge *bridge);
> > +
> > +static inline struct drm_bridge_state *
> > +drm_atomic_get_bridge_state(struct drm_atomic_state *state,
> > +			    struct drm_bridge *bridge)
> > +{
> > +	struct drm_private_state *obj_state;
> > +
> > +	obj_state = drm_atomic_get_private_obj_state(state, &bridge->base);
> > +	if (!obj_state)
> > +		return NULL;  
> 
> drm_atomic_get_private_obj_state will return an error object on error, so should be:
> 	if (IS_ERR(obj_state))
>               return ERR_CAST(obj_state);

Right, I'll fix it in v4.

Thanks,

Boris
