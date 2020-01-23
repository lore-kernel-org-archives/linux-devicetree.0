Return-Path: <SRS0=+P9T=3M=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6661C33CAA
	for <linux-devicetree@archiver.kernel.org>; Thu, 23 Jan 2020 08:07:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 89C9D217F4
	for <linux-devicetree@archiver.kernel.org>; Thu, 23 Jan 2020 08:07:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726061AbgAWIHH (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 23 Jan 2020 03:07:07 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:42638 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725955AbgAWIHG (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 23 Jan 2020 03:07:06 -0500
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id BFF75292656;
        Thu, 23 Jan 2020 08:07:03 +0000 (GMT)
Date:   Thu, 23 Jan 2020 09:07:00 +0100
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Jonas Karlman <jonas@kwiboo.se>
Cc:     dri-devel@lists.freedesktop.org,
        Lucas Stach <l.stach@pengutronix.de>,
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
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH v7 06/12] drm/bridge: Add the necessary bits to support
 bus format negotiation
Message-ID: <20200123090700.3b878cd5@collabora.com>
In-Reply-To: <cc8ce5e0-f502-e3ee-e677-eeb7ad532513@kwiboo.se>
References: <20200122111700.1924960-1-boris.brezillon@collabora.com>
        <20200122111700.1924960-7-boris.brezillon@collabora.com>
        <5a15dda1-0791-c1b6-94aa-4fed25bbcca9@kwiboo.se>
        <20200123083933.64fc98be@collabora.com>
        <cc8ce5e0-f502-e3ee-e677-eeb7ad532513@kwiboo.se>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, 23 Jan 2020 07:52:59 +0000 (UTC)
Jonas Karlman <jonas@kwiboo.se> wrote:

> On 2020-01-23 08:39, Boris Brezillon wrote:
> > On Wed, 22 Jan 2020 23:44:28 +0000 (UTC)
> > Jonas Karlman <jonas@kwiboo.se> wrote:
> >   
> >>> +static int
> >>> +drm_atomic_bridge_chain_select_bus_fmts(struct drm_bridge *bridge,
> >>> +					struct drm_crtc_state *crtc_state,
> >>> +					struct drm_connector_state *conn_state)
> >>> +{
> >>> +	struct drm_connector *conn = conn_state->connector;
> >>> +	struct drm_encoder *encoder = bridge->encoder;
> >>> +	struct drm_bridge_state *last_bridge_state;
> >>> +	unsigned int i, num_out_bus_fmts;
> >>> +	struct drm_bridge *last_bridge;
> >>> +	u32 *out_bus_fmts;
> >>> +	int ret = 0;
> >>> +
> >>> +	last_bridge = list_last_entry(&encoder->bridge_chain,
> >>> +				      struct drm_bridge, chain_node);
> >>> +	last_bridge_state = drm_atomic_get_new_bridge_state(crtc_state->state,
> >>> +							    last_bridge);
> >>> +
> >>> +	if (last_bridge->funcs->atomic_get_output_bus_fmts) {
> >>> +		const struct drm_bridge_funcs *funcs = last_bridge->funcs;
> >>> +
> >>> +		/*
> >>> +		 * If the driver implements ->atomic_get_output_bus_fmts() it
> >>> +		 * should also implement the atomic state hooks.
> >>> +		 */
> >>> +		if (WARN_ON(last_bridge_state))    
> >>
> >> This looks wrong, with this changed to WARN_ON(!last_bridge_state)
> >> my RK3328 HDMI2.0/YUV444/YUV420/10-bit branch at [1] starts working.
> >>
> >> With WARN_ON(last_bridge_state) I get:
> >>
> >> [    6.606658] WARNING: CPU: 0 PID: 167 at drivers/gpu/drm/drm_bridge.c:746 drm_atomic_bridge_chain_check+0x2b8/0x308
> >> [    6.606673] Hardware name: Pine64 Rock64 (DT)
> >>
> >> [    6.606754] Call trace:
> >> [    6.606759]  drm_atomic_bridge_chain_check+0x2b8/0x308
> >> [    6.606764]  drm_atomic_helper_check_modeset+0x89c/0xab8
> >> [    6.606768]  drm_atomic_helper_check+0x1c/0xa0
> >> [    6.606772]  drm_atomic_check_only+0x464/0x708
> >> [    6.606777]  drm_atomic_commit+0x18/0x58  
> > 
> > Add
> > 
> > const drm_bridge_funcs ... = {
> > 	...
> > 	.atomic_reset = drm_atomic_helper_bridge_reset,
> > 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> > 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> > 	...
> > };
> > 
> > and that should work.  
> 
> That is what I added and what made that this warning is being triggered.
> The comment state that atomic state is needed, but the check warns when there is a state.
> 
> I have this:
> 
> static const struct drm_bridge_funcs dw_hdmi_bridge_funcs = {
> 	...
> 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> 	.atomic_get_output_bus_fmts = dw_hdmi_bridge_atomic_get_output_bus_fmts,
> 	.atomic_get_input_bus_fmts = dw_hdmi_bridge_atomic_get_input_bus_fmts,
> 	.atomic_check = dw_hdmi_bridge_atomic_check,
> 	.atomic_reset = drm_atomic_helper_bridge_reset,
> 	...
> };
> 
> and
> 
> static const struct drm_bridge_funcs dw_hdmi_rockchip_bridge_funcs = {
> 	...
> 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> 	.atomic_get_input_bus_fmts = dw_hdmi_rockchip_get_input_bus_fmts,
> 	.atomic_check = dw_hdmi_rockchip_bridge_atomic_check,
> 	.atomic_reset = drm_atomic_helper_bridge_reset,
> };
> 
> after applying the following I got a hdmi signal again
> 
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index 0c28816146ba..7e7b0fac8f4f 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -743,7 +743,7 @@ drm_atomic_bridge_chain_select_bus_fmts(struct drm_bridge *bridge,
>  		 * If the driver implements ->atomic_get_output_bus_fmts() it
>  		 * should also implement the atomic state hooks.
>  		 */
> -		if (WARN_ON(last_bridge_state))
> +		if (WARN_ON(!last_bridge_state))
>  			return -EINVAL;

My bad, I didn't read your email carefully. You're right, I'll fix it
in v8.

Thanks,

Boris
