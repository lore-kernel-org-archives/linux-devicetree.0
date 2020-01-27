Return-Path: <SRS0=m/6z=3Q=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 951B7C2D0DB
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jan 2020 17:49:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 72AAF214D8
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jan 2020 17:49:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725908AbgA0RtY (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 27 Jan 2020 12:49:24 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:34442 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725893AbgA0RtY (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 27 Jan 2020 12:49:24 -0500
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id B25BB28C174;
        Mon, 27 Jan 2020 17:49:21 +0000 (GMT)
Date:   Mon, 27 Jan 2020 18:49:18 +0100
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     dri-devel@lists.freedesktop.org,
        Lucas Stach <l.stach@pengutronix.de>,
        Chris Healy <cphealy@gmail.com>,
        Andrey Smirnov <andrew.smirnov@gmail.com>,
        Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
        kernel@collabora.com, Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, intel-gfx-trybot@lists.freedesktop.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH v9 01/12] drm/bridge: Add a drm_bridge_state object
Message-ID: <20200127184918.60b3cdf3@collabora.com>
In-Reply-To: <20200127172652.GB43062@phenom.ffwll.local>
References: <20200127110043.2731697-1-boris.brezillon@collabora.com>
        <20200127110043.2731697-2-boris.brezillon@collabora.com>
        <20200127172652.GB43062@phenom.ffwll.local>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, 27 Jan 2020 18:26:52 +0100
Daniel Vetter <daniel@ffwll.ch> wrote:

> On Mon, Jan 27, 2020 at 12:00:32PM +0100, Boris Brezillon wrote:
> > One of the last remaining objects to not have its atomic state.
> > 
> > This is being motivated by our attempt to support runtime bus-format
> > negotiation between elements of the bridge chain.
> > This patch just paves the road for such a feature by adding a new
> > drm_bridge_state object inheriting from drm_private_obj so we can
> > re-use some of the existing state initialization/tracking logic.
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> > Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
> > Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > ---
> > Changes in v9:
> > * Clarify the fact that the bridge->atomic_reset() and
> >   {connector,plane,crtc,...}->reset() semantics are different
> > * Move the drm_atomic_private_obj_init() call back to
> >   drm_bridge_attach()
> > * Check the presence of ->atomic_duplicate_state instead of  
> >   ->atomic_reset in drm_atomic_add_encoder_bridges()  
> > * Fix copy&paste errors in the atomic bridge state helpers doc
> > * Add A-b/R-b tags
> > 
> > Changes in v8:
> > * Move bridge state helpers out of the CONFIG_DEBUGFS section
> > 
> > Changes in v7:
> > * Move helpers, struct-defs, ... to atomic helper files to avoid the
> >   drm -> drm_kms_helper -> drm circular dep
> > * Stop providing default implementation for atomic state reset,
> >   duplicate and destroy hooks (has to do with the helper/core split)
> > * Drop all R-b/T-b as helpers have now be moved to other places  
> 
> ^^ we generally keep the changelog when committing in drm, since it
> contains useful stuff.

Alright (I tend to forget that drm does things differently). I find it a
bit redundant given the final commit also contains a patchwork link
which contains all revisions + the discussion that happened on each
version.

> If you don't want to do that, then at least update
> the commit message to make sure all the design discussion is reflected in
> there somewhere. Which atm it definitely isn't.

I'll update the commit messages to add those changelogs.
