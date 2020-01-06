Return-Path: <SRS0=ND8X=23=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11330C33C9B
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jan 2020 10:04:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DAD4D2072E
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jan 2020 10:04:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725821AbgAFKEB (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 6 Jan 2020 05:04:01 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:60028 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726478AbgAFKEB (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 6 Jan 2020 05:04:01 -0500
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id B63E927D7A1;
        Mon,  6 Jan 2020 10:03:57 +0000 (GMT)
Date:   Mon, 6 Jan 2020 11:03:54 +0100
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     dri-devel@lists.freedesktop.org,
        Mark Rutland <mark.rutland@arm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        kernel@collabora.com, Sam Ravnborg <sam@ravnborg.org>,
        Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
        Andrey Smirnov <andrew.smirnov@gmail.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Chris Healy <cphealy@gmail.com>, devicetree@vger.kernel.org,
        Jonas Karlman <jonas@kwiboo.se>,
        Rob Herring <robh+dt@kernel.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Seung-Woo Kim <sw0312.kim@samsung.com>
Subject: Re: [PATCH v5 1/4] drm/bridge: Add a drm_bridge_state object
Message-ID: <20200106110354.0a5cbc10@collabora.com>
In-Reply-To: <20191219101151.28039-2-narmstrong@baylibre.com>
References: <20191219101151.28039-1-narmstrong@baylibre.com>
        <20191219101151.28039-2-narmstrong@baylibre.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Neil,

On Thu, 19 Dec 2019 11:11:48 +0100
Neil Armstrong <narmstrong@baylibre.com> wrote:

> +/**
> + * drm_atomic_helper_duplicate_bridge_state() - Default duplicate state helper
> + * @bridge: bridge containing the state to duplicate
> + *
> + * Default implementation of &drm_bridge_funcs.atomic_duplicate().
> + *
> + * RETURNS:
> + * a valid state object or NULL if the allocation fails.
> + */
> +struct drm_bridge_state *
> +drm_atomic_helper_bridge_duplicate_state(struct drm_bridge *bridge)
> +{
> +	struct drm_bridge_state *new;
> +
> +	if (WARN_ON(!bridge->base.state))
> +		return NULL;
> +
> +	new = kzalloc(sizeof(*new), GFP_KERNEL);
> +	if (new)
> +		__drm_atomic_helper_bridge_duplicate_state(bridge, new);
> +
> +	return new;
> +}
> +EXPORT_SYMBOL(drm_atomic_helper_bridge_duplicate_state);

IIRC, Laurent suggested to make those functions private. I'd also
recommend changing the names to
drm_atomic_*default*_bridge_<action>_state() and dropping the kernel doc
header since making them static means they're no longer helper
functions.

Regards,

Boris
