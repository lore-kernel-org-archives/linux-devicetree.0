Return-Path: <SRS0=+P9T=3M=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87174C33CAA
	for <linux-devicetree@archiver.kernel.org>; Thu, 23 Jan 2020 07:37:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5BF9624125
	for <linux-devicetree@archiver.kernel.org>; Thu, 23 Jan 2020 07:37:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725785AbgAWHhX (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 23 Jan 2020 02:37:23 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:42160 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725777AbgAWHhX (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 23 Jan 2020 02:37:23 -0500
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 74F1A28CE86;
        Thu, 23 Jan 2020 07:37:20 +0000 (GMT)
Date:   Thu, 23 Jan 2020 08:37:17 +0100
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Lucas Stach <l.stach@pengutronix.de>,
        Chris Healy <cphealy@gmail.com>,
        Andrey Smirnov <andrew.smirnov@gmail.com>,
        Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
        kernel@collabora.com, Daniel Vetter <daniel@ffwll.ch>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH v7 01/12] drm/bridge: Add a drm_bridge_state object
Message-ID: <20200123083717.1264d9b4@collabora.com>
In-Reply-To: <20200122111700.1924960-2-boris.brezillon@collabora.com>
References: <20200122111700.1924960-1-boris.brezillon@collabora.com>
        <20200122111700.1924960-2-boris.brezillon@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, 22 Jan 2020 12:16:49 +0100
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> +
> +/**
> + * drm_atomic_get_bridge_state - get bridge state
> + * @state: global atomic state object
> + * @bridge: bridge to get state object for
> + *
> + * This function returns the bridge state for the given bridge, allocating it
> + * if needed. It will also grab the relevant bridge lock to make sure that the
> + * state is consistent.
> + *
> + * Returns:
> + *
> + * Either the allocated state or the error code encoded into the pointer. When
> + * the error is EDEADLK then the w/w mutex code has detected a deadlock and the
> + * entire atomic sequence must be restarted.
> + */
> +struct drm_bridge_state *
> +drm_atomic_get_bridge_state(struct drm_atomic_state *state,
> +			    struct drm_bridge *bridge)
> +{
> +	struct drm_private_state *obj_state;
> +
> +	obj_state = drm_atomic_get_private_obj_state(state, &bridge->base);
> +	if (IS_ERR(obj_state))
> +		return ERR_CAST(obj_state);
> +
> +	return drm_priv_to_bridge_state(obj_state);
> +}
> +EXPORT_SYMBOL(drm_atomic_get_bridge_state);
> +
> +/**
> + * drm_atomic_get_old_bridge_state - get old bridge state, if it exists
> + * @state: global atomic state object
> + * @bridge: bridge to grab
> + *
> + * This function returns the old bridge state for the given bridge, or NULL if
> + * the bridge is not part of the global atomic state.
> + */
> +struct drm_bridge_state *
> +drm_atomic_get_old_bridge_state(struct drm_atomic_state *state,
> +				struct drm_bridge *bridge)
> +{
> +	struct drm_private_state *obj_state;
> +
> +	obj_state = drm_atomic_get_old_private_obj_state(state, &bridge->base);
> +	if (!obj_state)
> +		return NULL;
> +
> +	return drm_priv_to_bridge_state(obj_state);
> +}
> +EXPORT_SYMBOL(drm_atomic_get_old_bridge_state);
> +
> +/**
> + * drm_atomic_get_new_bridge_state - get new bridge state, if it exists
> + * @state: global atomic state object
> + * @bridge: bridge to grab
> + *
> + * This function returns the new bridge state for the given bridge, or NULL if
> + * the bridge is not part of the global atomic state.
> + */
> +struct drm_bridge_state *
> +drm_atomic_get_new_bridge_state(struct drm_atomic_state *state,
> +				struct drm_bridge *bridge)
> +{
> +	struct drm_private_state *obj_state;
> +
> +	obj_state = drm_atomic_get_new_private_obj_state(state, &bridge->base);
> +	if (!obj_state)
> +		return NULL;
> +
> +	return drm_priv_to_bridge_state(obj_state);
> +}
> +EXPORT_SYMBOL(drm_atomic_get_new_bridge_state);
> +

Oops, I placed those helpers in the #ifdef CONFIG_DEBUG_FS section.

>  #endif
