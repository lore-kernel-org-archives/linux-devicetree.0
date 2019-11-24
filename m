Return-Path: <SRS0=+Vg9=ZQ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 516FEC432C0
	for <linux-devicetree@archiver.kernel.org>; Sun, 24 Nov 2019 07:48:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 27089207DD
	for <linux-devicetree@archiver.kernel.org>; Sun, 24 Nov 2019 07:48:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725948AbfKXHs5 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 24 Nov 2019 02:48:57 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:36486 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725913AbfKXHs5 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 24 Nov 2019 02:48:57 -0500
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 862EB283BB9;
        Sun, 24 Nov 2019 07:48:52 +0000 (GMT)
Date:   Sun, 24 Nov 2019 08:48:48 +0100
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
Subject: Re: [PATCH v3 07/21] drm/bridge: Make the bridge chain a
 double-linked list
Message-ID: <20191124084848.33a6bf01@collabora.com>
In-Reply-To: <d41c745d-3ddb-db99-8d1b-81a39dbcde3e@baylibre.com>
References: <20191023154512.9762-1-boris.brezillon@collabora.com>
        <20191023154512.9762-8-boris.brezillon@collabora.com>
        <d0da3b19-62c9-bf1d-8a41-3a6a06b82fb0@baylibre.com>
        <d41c745d-3ddb-db99-8d1b-81a39dbcde3e@baylibre.com>
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

Sorry for the late reply.

On Tue, 5 Nov 2019 17:02:30 +0100
Neil Armstrong <narmstrong@baylibre.com> wrote:

> Hi,
> 
> 
> On 25/10/2019 15:29, Neil Armstrong wrote:
> > On 23/10/2019 17:44, Boris Brezillon wrote:  
> >> So that each element in the chain can easily access its predecessor.
> >> This will be needed to support bus format negotiation between elements
> >> of the bridge chain.
> >>
> >> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> >> ---
> >> Changes in v3:
> >> * None
> >>
> >> Changes in v2:
> >> * Adjust things to the "dummy encoder bridge" change (patch 2 in this
> >>   series)
> >> ---
> >>  drivers/gpu/drm/drm_bridge.c  | 171 ++++++++++++++++++++++------------
> >>  drivers/gpu/drm/drm_encoder.c |  16 +---
> >>  include/drm/drm_bridge.h      |  12 ++-
> >>  include/drm/drm_encoder.h     |   9 +-
> >>  4 files changed, 135 insertions(+), 73 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> >> index 54c874493c57..c5cf8a9c4237 100644
> >> --- a/drivers/gpu/drm/drm_bridge.c
> >> +++ b/drivers/gpu/drm/drm_bridge.c  
> 
> [...]
> 
> >>  
> >> @@ -426,15 +471,23 @@ EXPORT_SYMBOL(drm_atomic_bridge_chain_post_disable);
> >>  void drm_atomic_bridge_chain_pre_enable(struct drm_bridge *bridge,
> >>  					struct drm_atomic_state *state)
> >>  {
> >> +	struct drm_encoder *encoder;
> >> +	struct drm_bridge *iter;
> >> +
> >>  	if (!bridge)
> >>  		return;
> >>  
> >> -	drm_atomic_bridge_chain_pre_enable(bridge->next, state);
> >> +	encoder = bridge->encoder;
> >> +	list_for_each_entry_reverse(iter, &bridge->encoder->bridge_chain,
> >> +				    chain_node) {  
> 
> This should use the encoder local variable in list_for_each_entry_reverse()
> 
> >> +		if (iter->funcs->atomic_pre_enable)
> >> +			iter->funcs->atomic_pre_enable(iter, state);
> >> +		else if (iter->funcs->pre_enable)
> >> +			iter->funcs->pre_enable(iter);
> >>  
> >> -	if (bridge->funcs->atomic_pre_enable)
> >> -		bridge->funcs->atomic_pre_enable(bridge, state);
> >> -	else if (bridge->funcs->pre_enable)
> >> -		bridge->funcs->pre_enable(bridge);
> >> +		if (iter == bridge)
> >> +			break;
> >> +	}
> >>  }
> >>  EXPORT_SYMBOL(drm_atomic_bridge_chain_pre_enable);
> >>  
> >> @@ -453,15 +506,19 @@ EXPORT_SYMBOL(drm_atomic_bridge_chain_pre_enable);
> >>  void drm_atomic_bridge_chain_enable(struct drm_bridge *bridge,
> >>  				    struct drm_atomic_state *state)
> >>  {
> >> +	struct drm_encoder *encoder;
> >> +
> >>  	if (!bridge)
> >>  		return;
> >>  
> >> -	if (bridge->funcs->atomic_enable)
> >> -		bridge->funcs->atomic_enable(bridge, state);
> >> -	else if (bridge->funcs->enable)
> >> -		bridge->funcs->enable(bridge);
> >> -
> >> -	drm_atomic_bridge_chain_enable(bridge->next, state);
> >> +	encoder = bridge->encoder;
> >> +	list_for_each_entry_from(bridge, &bridge->encoder->bridge_chain,
> >> +				 chain_node) {  
> 
> This should use encoder instead of bridge->encoder otherwise bridge will
> change and bridge->encoder->bridge_chain won't be valid during the for_each and
> cause the following :

Oops, indeed. I fixed the very same problem in another helper but
somehow missed those 2. Thanks for testing/reporting the bug.

Boris
