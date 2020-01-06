Return-Path: <SRS0=ND8X=23=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12279C33C8C
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jan 2020 11:52:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CF9FE20731
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jan 2020 11:52:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WpPOMyPU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725821AbgAFLwU (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 6 Jan 2020 06:52:20 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:56386 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725787AbgAFLwU (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 6 Jan 2020 06:52:20 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A4B9F52F;
        Mon,  6 Jan 2020 12:52:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1578311537;
        bh=wSJwPUJzX9dLQHof5jpN8W8WQqNmAk63bu25yksqFy8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WpPOMyPUYbjijg/PMQUnO4BHZpc+MKgZpuwIAmgFQbHbYUNXHjV8e0Qygnr9Wma8B
         Vryr9h6K1/v0Kk4t87ed7RfagAA1M5jAKrWpPvR1VZRHcA4ROYlK20ws+yZgUGEOuF
         LtmnOko1sCZ1srtnjwXleOEuKz0HbtbIaiZIdVcM=
Date:   Mon, 6 Jan 2020 13:52:07 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        dri-devel@lists.freedesktop.org,
        Mark Rutland <mark.rutland@arm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
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
Message-ID: <20200106115207.GB4853@pendragon.ideasonboard.com>
References: <20191219101151.28039-1-narmstrong@baylibre.com>
 <20191219101151.28039-2-narmstrong@baylibre.com>
 <20200106110354.0a5cbc10@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200106110354.0a5cbc10@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Jan 06, 2020 at 11:03:54AM +0100, Boris Brezillon wrote:
> On Thu, 19 Dec 2019 11:11:48 +0100 Neil Armstrong wrote:
> 
> > +/**
> > + * drm_atomic_helper_duplicate_bridge_state() - Default duplicate state helper
> > + * @bridge: bridge containing the state to duplicate
> > + *
> > + * Default implementation of &drm_bridge_funcs.atomic_duplicate().
> > + *
> > + * RETURNS:
> > + * a valid state object or NULL if the allocation fails.
> > + */
> > +struct drm_bridge_state *
> > +drm_atomic_helper_bridge_duplicate_state(struct drm_bridge *bridge)
> > +{
> > +	struct drm_bridge_state *new;
> > +
> > +	if (WARN_ON(!bridge->base.state))
> > +		return NULL;
> > +
> > +	new = kzalloc(sizeof(*new), GFP_KERNEL);
> > +	if (new)
> > +		__drm_atomic_helper_bridge_duplicate_state(bridge, new);
> > +
> > +	return new;
> > +}
> > +EXPORT_SYMBOL(drm_atomic_helper_bridge_duplicate_state);
> 
> IIRC, Laurent suggested to make those functions private. I'd also
> recommend changing the names to
> drm_atomic_*default*_bridge_<action>_state() and dropping the kernel doc
> header since making them static means they're no longer helper
> functions.

Please note that static functions may still benefit from documentation.
In this specific case the documentation can probably be dropped, but if
other functions have useful comments, please keep them.

-- 
Regards,

Laurent Pinchart
