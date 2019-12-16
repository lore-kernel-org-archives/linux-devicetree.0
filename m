Return-Path: <SRS0=KHEV=2G=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5D1AC43603
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Dec 2019 15:25:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 82696205C9
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Dec 2019 15:25:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728259AbfLPPZt (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 16 Dec 2019 10:25:49 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:60820 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728173AbfLPPZt (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 16 Dec 2019 10:25:49 -0500
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 0033B28AC2E;
        Mon, 16 Dec 2019 15:25:45 +0000 (GMT)
Date:   Mon, 16 Dec 2019 16:25:42 +0100
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     dri-devel@lists.freedesktop.org,
        Mark Rutland <mark.rutland@arm.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
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
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH v4 04/11] drm/bridge: Make the bridge chain a
 double-linked list
Message-ID: <20191216162542.261c821c@collabora.com>
In-Reply-To: <75a06e2a-4587-ee16-0f5d-af75fbe89793@samsung.com>
References: <20191203141515.3597631-1-boris.brezillon@collabora.com>
        <CGME20191203141542eucas1p23771a9c49ef18144c832fc536bdae61a@eucas1p2.samsung.com>
        <20191203141515.3597631-5-boris.brezillon@collabora.com>
        <4e901ab9-07d4-4238-7322-c7c5a3959513@samsung.com>
        <20191216155551.083dcbaf@collabora.com>
        <75a06e2a-4587-ee16-0f5d-af75fbe89793@samsung.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, 16 Dec 2019 16:02:36 +0100
Marek Szyprowski <m.szyprowski@samsung.com> wrote:

> Hi Boris,
> 
> On 16.12.2019 15:55, Boris Brezillon wrote:
> > On Mon, 16 Dec 2019 14:54:25 +0100
> > Marek Szyprowski <m.szyprowski@samsung.com> wrote:  
> >> On 03.12.2019 15:15, Boris Brezillon wrote:  
> >>> So that each element in the chain can easily access its predecessor.
> >>> This will be needed to support bus format negotiation between elements
> >>> of the bridge chain.
> >>>
> >>> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> >>> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
> >>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>  
> >> I've noticed that this patch got merged to linux-next as commit
> >> 05193dc38197021894b17239fafbd2eb1afe5a45. Sadly it breaks booting of
> >> Samsung Exynos5250-based Arndale board. Booting stops after following
> >> messages:
> >>
> >> [drm] Exynos DRM: using 14400000.fimd device for DMA mapping operations
> >> exynos-drm exynos-drm: bound 14400000.fimd (ops fimd_component_ops)
> >> exynos-drm exynos-drm: bound 14450000.mixer (ops mixer_component_ops)
> >> exynos-drm exynos-drm: bound 14500000.dsi (ops exynos_dsi_component_ops)
> >> exynos-drm exynos-drm: bound 14530000.hdmi (ops hdmi_component_ops)
> >> [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
> >> [drm] No driver support for vblank timestamp query.
> >> [drm] Cannot find any crtc or sizes
> >> [drm] Cannot find any crtc or sizes
> >> [drm] Initialized exynos 1.1.0 20180330 for exynos-drm on minor 0
> >>
> >> I will try to debug this and provide more information soon.
> >>  
> > Can you try with this diff applied?  
> 
> This patch doesn't change anything.

Okay. Can you do a list_for_each_entry() on both encoder->bridge_chain
and dsi->bridge_chain (dump bridge pointers in a pr_info()) before and
after the list_splice_init() call?

> 
> > --->8---  
> > diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> > index 3955f84dc893..118ecedc7621 100644
> > --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> > +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> > @@ -1523,7 +1523,7 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
> >          if (out_bridge) {
> >                  drm_bridge_attach(encoder, out_bridge, NULL);
> >                  dsi->out_bridge = out_bridge;
> > -               list_splice(&encoder->bridge_chain, &dsi->bridge_chain);
> > +               list_splice_init(&encoder->bridge_chain, &dsi->bridge_chain);
> >          } else {
> >                  int ret = exynos_dsi_create_connector(encoder);
> >   
> > diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
> > index 6c5b80ad6154..e1378d48210f 100644
> > --- a/drivers/gpu/drm/vc4/vc4_dsi.c
> > +++ b/drivers/gpu/drm/vc4/vc4_dsi.c
> > @@ -1613,7 +1613,7 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
> >           * from our driver, since we need to sequence them within the
> >           * encoder's enable/disable paths.
> >           */
> > -       list_splice(&dsi->encoder->bridge_chain, &dsi->bridge_chain);
> > +       list_splice_init(&dsi->encoder->bridge_chain, &dsi->bridge_chain);
> >   
> >          if (dsi->port == 0)
> >                  vc4_debugfs_add_regset32(drm, "dsi0_regs", &dsi->regset);
> > @@ -1639,7 +1639,7 @@ static void vc4_dsi_unbind(struct device *dev, struct device *master,
> >           * Restore the bridge_chain so the bridge detach procedure can happen
> >           * normally.
> >           */
> > -       list_splice(&dsi->bridge_chain, &dsi->encoder->bridge_chain);
> > +       list_splice_init(&dsi->bridge_chain, &dsi->encoder->bridge_chain);
> >          vc4_dsi_encoder_destroy(dsi->encoder);
> >   
> >          if (dsi->port == 1)
> >
> >  
> Best regards

