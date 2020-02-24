Return-Path: <SRS0=+Je1=4M=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FE20C38BFA
	for <linux-devicetree@archiver.kernel.org>; Mon, 24 Feb 2020 22:34:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0013F2176D
	for <linux-devicetree@archiver.kernel.org>; Mon, 24 Feb 2020 22:34:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Dv9ULSM0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727762AbgBXWeZ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 24 Feb 2020 17:34:25 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:59564 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726651AbgBXWeZ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 24 Feb 2020 17:34:25 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 74EA310CA;
        Mon, 24 Feb 2020 23:34:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1582583663;
        bh=Lz6gfaLcR4zUsewQHWvaxEutcbYD0+HKXxn05yO4svE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Dv9ULSM0lv7dd9u3oAQbXhFggbQcrl5iBUadpIc0CcEMEZwd2a3YWPS4GPTCQdy+p
         B/t+8CvhxxDxva+8YP85zyIPsv+wdI913q7hZDZXU5t1wJ1CAgJ9ifbDdmRkp9J8g3
         nTag4T2MLDKr3rG+qeMayBw0hfdFb4pK6T5kNgUk=
Date:   Tue, 25 Feb 2020 00:34:00 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     dri-devel@lists.freedesktop.org,
        Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Andrey Smirnov <andrew.smirnov@gmail.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Rob Herring <robh+dt@kernel.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        devicetree@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        intel-gfx-trybot@lists.freedesktop.org, kernel@collabora.com,
        Sam Ravnborg <sam@ravnborg.org>,
        Chris Healy <cphealy@gmail.com>
Subject: Re: [PATCH v10 10/12] drm/bridge: panel: Propage bus format/flags
Message-ID: <20200224223400.GB29578@pendragon.ideasonboard.com>
References: <20200128135514.108171-1-boris.brezillon@collabora.com>
 <20200128135514.108171-11-boris.brezillon@collabora.com>
 <20200131182505.51366470@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200131182505.51366470@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Boris,

Thank you for the patch.

On Fri, Jan 31, 2020 at 06:25:05PM +0100, Boris Brezillon wrote:
> And the typo (Propage -> Propagate) is still there :-(. Fixing it right
> now so I don't forget.
> 
> On Tue, 28 Jan 2020 14:55:12 +0100 Boris Brezillon wrote:
> > So that the previous bridge element in the chain knows which input
> > format the panel bridge expects.

I've been told multiple times by Tomi that the commit message should be
readable by itself, not just as a continuation of the subject line. I
was annoyed in the beginning, as I had to change my habits, but I think
it's an actual improvement. You may want to pay attention to that too in
the future.

> > v10:
> > * Add changelog to the commit message
> > 
> > v8 -> v9:
> > * No changes
> > 
> > v7:
> > * Set atomic state hooks explicitly
> > 
> > v4 -> v6:
> > * Not part of the series
> > 
> > v3:
> > * Adjust things to match the new bus-format negotiation approach
> > * Use drm_atomic_helper_bridge_propagate_bus_fmt
> > * Don't implement ->atomic_check() (the core now takes care of bus
> >   flags propagation)
> > 
> > v2:
> > * Adjust things to match the new bus-format negotiation approach
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

With the typo fixed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> > ---
> >  drivers/gpu/drm/bridge/panel.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
> > index f66777e24968..dcc72bd7df30 100644
> > --- a/drivers/gpu/drm/bridge/panel.c
> > +++ b/drivers/gpu/drm/bridge/panel.c
> > @@ -127,6 +127,10 @@ static const struct drm_bridge_funcs panel_bridge_bridge_funcs = {
> >  	.enable = panel_bridge_enable,
> >  	.disable = panel_bridge_disable,
> >  	.post_disable = panel_bridge_post_disable,
> > +	.atomic_reset = drm_atomic_helper_bridge_reset,
> > +	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> > +	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> > +	.atomic_get_input_bus_fmts = drm_atomic_helper_bridge_propagate_bus_fmt,
> >  };
> >  
> >  /**

-- 
Regards,

Laurent Pinchart
