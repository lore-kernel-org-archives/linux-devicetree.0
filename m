Return-Path: <SRS0=6ipe=3L=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 883D5C2D0DB
	for <linux-devicetree@archiver.kernel.org>; Wed, 22 Jan 2020 09:27:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6610420704
	for <linux-devicetree@archiver.kernel.org>; Wed, 22 Jan 2020 09:27:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727022AbgAVJ1Y (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 22 Jan 2020 04:27:24 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:58172 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725911AbgAVJ1X (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 22 Jan 2020 04:27:23 -0500
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id CAEAC28F6BA;
        Wed, 22 Jan 2020 09:27:21 +0000 (GMT)
Date:   Wed, 22 Jan 2020 10:27:19 +0100
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
Subject: Re: [PATCH v3 18/21] drm/bridge: panel: Propage bus format/flags
Message-ID: <20200122102719.1149f6f6@collabora.com>
In-Reply-To: <20191203101730.GP4730@pendragon.ideasonboard.com>
References: <20191023154512.9762-1-boris.brezillon@collabora.com>
        <20191023154512.9762-19-boris.brezillon@collabora.com>
        <20191203101730.GP4730@pendragon.ideasonboard.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Laurent,

Sorry for the late reply.

On Tue, 3 Dec 2019 12:17:30 +0200
Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:

> Hi Boris,
> 
> Thank you for the patch.
> 
> On Wed, Oct 23, 2019 at 05:45:09PM +0200, Boris Brezillon wrote:
> > So that the previous bridge element in the chain knows which input
> > format the panel bridge expects.
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > ---
> > Changes in v3:
> > * Adjust things to match the new bus-format negotiation approach
> > * Use drm_atomic_helper_bridge_propagate_bus_fmt
> > * Don't implement ->atomic_check() (the core now takes care of bus
> >   flags propagation)
> > 
> > Changes in v2:
> > * Adjust things to match the new bus-format negotiation approach
> > ---
> >  drivers/gpu/drm/bridge/panel.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
> > index f4e293e7cf64..a70c363a2bd0 100644
> > --- a/drivers/gpu/drm/bridge/panel.c
> > +++ b/drivers/gpu/drm/bridge/panel.c
> > @@ -127,6 +127,7 @@ static const struct drm_bridge_funcs panel_bridge_bridge_funcs = {
> >  	.enable = panel_bridge_enable,
> >  	.disable = panel_bridge_disable,
> >  	.post_disable = panel_bridge_post_disable,
> > +	.atomic_get_input_bus_fmts = drm_atomic_helper_bridge_propagate_bus_fmt,  
> 
> Shouldn't the format be retrieved from the panel instead of from the
> connector ? We're moving towards removing connector creation from
> bridges, so I think it would be more future-proof.

Right now the panel bus_format is not exposed by the drm_panel
abstraction (only panel_simple have access to this information through
their panel_desc). I'd rather not add new things to this series so I'm
in favor of keeping the current implementation, but I add this idea
(expose bus format through the drm_panel abstraction) to my TODO list.

Thanks,

Boris
