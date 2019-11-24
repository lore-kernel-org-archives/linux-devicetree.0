Return-Path: <SRS0=+Vg9=ZQ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 078DEC432C0
	for <linux-devicetree@archiver.kernel.org>; Sun, 24 Nov 2019 13:40:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DB3EA2071A
	for <linux-devicetree@archiver.kernel.org>; Sun, 24 Nov 2019 13:40:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726798AbfKXNkL (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 24 Nov 2019 08:40:11 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:41184 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726797AbfKXNkL (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 24 Nov 2019 08:40:11 -0500
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 47ED627C12F;
        Sun, 24 Nov 2019 13:40:09 +0000 (GMT)
Date:   Sun, 24 Nov 2019 14:40:06 +0100
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
Subject: Re: [PATCH v3 06/21] drm: Stop accessing encoder->bridge directly
Message-ID: <20191124144006.7e2fc959@collabora.com>
In-Reply-To: <20191124103926.GG4727@pendragon.ideasonboard.com>
References: <20191023154512.9762-1-boris.brezillon@collabora.com>
        <20191023154512.9762-7-boris.brezillon@collabora.com>
        <20191124103926.GG4727@pendragon.ideasonboard.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sun, 24 Nov 2019 12:39:26 +0200
Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:

> > @@ -1346,7 +1355,7 @@ void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
> >  				funcs->commit(encoder);
> >  		}
> >  
> > -		drm_atomic_bridge_chain_enable(encoder->bridge, old_state);
> > +		drm_atomic_bridge_chain_enable(bridge, old_state);
> >  	}
> >  
> >  	drm_atomic_helper_commit_writebacks(dev, old_state);
> > diff --git a/drivers/gpu/drm/drm_encoder.c b/drivers/gpu/drm/drm_encoder.c
> > index 80d88a55302e..4fe9e723e227 100644
> > --- a/drivers/gpu/drm/drm_encoder.c
> > +++ b/drivers/gpu/drm/drm_encoder.c
> > @@ -167,9 +167,10 @@ void drm_encoder_cleanup(struct drm_encoder *encoder)
> >  	 */
> >  
> >  	if (encoder->bridge) {
> > -		struct drm_bridge *bridge = encoder->bridge;
> > +		struct drm_bridge *bridge;
> >  		struct drm_bridge *next;
> >  
> > +		bridge = drm_bridge_chain_get_first_bridge(encoder);
> >  		while (bridge) {
> >  			next = bridge->next;  
> 
> Shouldn't this have been addressed in the previous patch ?
> 

It should and I will update patch 6 accordingly. This being said, it's
not a big deal since the code is patched to use
list_for_each_entry_safe() in patch 7 ;-).
