Return-Path: <SRS0=sOYF=2R=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EF2AC2D0DA
	for <linux-devicetree@archiver.kernel.org>; Fri, 27 Dec 2019 10:52:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CF51120828
	for <linux-devicetree@archiver.kernel.org>; Fri, 27 Dec 2019 10:52:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="uAfSsQvQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726408AbfL0KwK (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 27 Dec 2019 05:52:10 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:42946 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726379AbfL0KwK (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 27 Dec 2019 05:52:10 -0500
Received: from pendragon.ideasonboard.com (unknown [91.179.177.25])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 85597DD;
        Fri, 27 Dec 2019 11:52:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1577443926;
        bh=/CFUH+2v5r8EvvRcCuIBkge8Kv+Mm2MWAtWsFX787as=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uAfSsQvQzCK2qPA2o5twphOoQ/KZjuWFiPotSLTQp1gyoECwIWFHa6+Hl+7oR0nGb
         ty8HJNtmqwBPo7jq9krNRqvjTm1U6Cg9nDoVRtKuB9iWlSkokIwmipyB9TkpLI8gRe
         4h/M6v0uy31XSUeycvLbop3YOrP8sfxVGaOjk36U=
Date:   Fri, 27 Dec 2019 12:51:54 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Andrzej Hajda <a.hajda@samsung.com>
Cc:     Boris Brezillon <boris.brezillon@collabora.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        dri-devel@lists.freedesktop.org,
        Mark Rutland <mark.rutland@arm.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
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
Subject: Re: [PATCH v4 04/11] drm/bridge: Make the bridge chain a
 double-linked list
Message-ID: <20191227105154.GA4769@pendragon.ideasonboard.com>
References: <CGME20191203141542eucas1p23771a9c49ef18144c832fc536bdae61a@eucas1p2.samsung.com>
 <20191203141515.3597631-5-boris.brezillon@collabora.com>
 <4e901ab9-07d4-4238-7322-c7c5a3959513@samsung.com>
 <20191216155551.083dcbaf@collabora.com>
 <75a06e2a-4587-ee16-0f5d-af75fbe89793@samsung.com>
 <20191216162542.261c821c@collabora.com>
 <60f03d50-7c0f-c3d0-920f-0625c08b2171@samsung.com>
 <1010f5fc-0672-643c-4410-e053a928cb66@samsung.com>
 <20191224104422.25dbf980@collabora.com>
 <3a30de8e-9cc9-e3ff-a19a-45ea085ed9fc@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3a30de8e-9cc9-e3ff-a19a-45ea085ed9fc@samsung.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Andrzej,

On Fri, Dec 27, 2019 at 10:42:25AM +0100, Andrzej Hajda wrote:
> On 24.12.2019 10:44, Boris Brezillon wrote:
> > On Tue, 24 Dec 2019 10:16:49 +0100 Andrzej Hajda wrote:
> >> On 23.12.2019 10:55, Marek Szyprowski wrote:
> >>> On 16.12.2019 16:25, Boris Brezillon wrote:  
> >>>> On Mon, 16 Dec 2019 16:02:36 +0100 Marek Szyprowski wrote:  
> >>>>> On 16.12.2019 15:55, Boris Brezillon wrote:  
> >>>>>> On Mon, 16 Dec 2019 14:54:25 +0100
> >>>>>> Marek Szyprowski <m.szyprowski@samsung.com> wrote:  
> >>>>>>> On 03.12.2019 15:15, Boris Brezillon wrote:  
> >>>>>>>> So that each element in the chain can easily access its predecessor.
> >>>>>>>> This will be needed to support bus format negotiation between elements
> >>>>>>>> of the bridge chain.
> >>>>>>>>
> >>>>>>>> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> >>>>>>>> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
> >>>>>>>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>  
> >>>>>>>
> >>>>>>> I've noticed that this patch got merged to linux-next as commit
> >>>>>>> 05193dc38197021894b17239fafbd2eb1afe5a45. Sadly it breaks booting of
> >>>>>>> Samsung Exynos5250-based Arndale board. Booting stops after following
> >>>>>>> messages:
> >>>>>>>
> >>>>>>> [drm] Exynos DRM: using 14400000.fimd device for DMA mapping operations
> >>>>>>> exynos-drm exynos-drm: bound 14400000.fimd (ops fimd_component_ops)
> >>>>>>> exynos-drm exynos-drm: bound 14450000.mixer (ops mixer_component_ops)
> >>>>>>> exynos-drm exynos-drm: bound 14500000.dsi (ops exynos_dsi_component_ops)
> >>>>>>> exynos-drm exynos-drm: bound 14530000.hdmi (ops hdmi_component_ops)
> >>>>>>> [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
> >>>>>>> [drm] No driver support for vblank timestamp query.
> >>>>>>> [drm] Cannot find any crtc or sizes
> >>>>>>> [drm] Cannot find any crtc or sizes
> >>>>>>> [drm] Initialized exynos 1.1.0 20180330 for exynos-drm on minor 0
> >>>>>>>
> >>>>>>> I will try to debug this and provide more information soon.
> >>>>>>
> >>>>>> Can you try with this diff applied?  
> >>>>>
> >>>>> This patch doesn't change anything.  
> >>>>
> >>>> Okay. Can you do a list_for_each_entry() on both encoder->bridge_chain
> >>>> and dsi->bridge_chain (dump bridge pointers in a pr_info()) before and
> >>>> after the list_splice_init() call?  
> >>>
> >>> encoder->bridge_chain contains only one element. dsi->drive_chain is empty.
> >>>
> >>> Replacing that list_splice() with INIT_LIST_HEAD(&encoder->bridge_chain) 
> >>> fixed the boot issue.
> >
> > If INIT_LIST_HEAD() worked, I don't understand why replacing the
> > list_splice() call by a list_splice_init() (which doing a list_splice()
> > + INIT_LIST_HEAD()) didn't fix the problem. Are you sure the
> > list_splice_init() version doesn't work?
> >
> >>> It looks that this is related with the way the 
> >>> Exynos DSI handles bridges (in bridge and out brige?). Maybe Andrzej 
> >>> will give a bit more detailed comment and spread some light on this.  
> >>
> >> Hi Marek, Boris,
> >>
> >> I have not followed latest patches due to high work load, my bad. Marek
> >> thanks from pointing
> >>
> >> About ExynosDSI bridge handling:
> >>
> >> The order of calling encoder, bridge (and consequently panel) ops
> >> enforced by DRM core (bridge->pre_enable, encoder->enable,
> >> bridge->enable) does not fit to ExynosDSI hardware initialization
> >> sequence, if I remember correctly it does not fit to whole MIPI DSI
> >> standard (I think similar situation is with eDP). As a result DSI
> >> drivers must use some ugly workarounds, rely on HW properly coping with
> >> incorrect sequences, or, as in case of ExynosDSI driver, just avoid
> >> using encoder->bridge chaining and call bridge ops by itself when suitable.
> >
> > Yes, that's definitely hack-ish, and I proposed 2 solutions to address
> > that in previous versions of this patchset, unfortunately I didn't get
> > any feedback so I went for the less invasive option (keep the hack but
> > adapt it to the double-linked list changes), which still lead to
> > regressions :-/.
> >
> > Just a reminder of my 2 proposals:
> >
> > 1/ implement the bridge_ops->pre_enable/post_disable() hooks so you can
> >    split your enable/disable logic in 2 parts and make sure things are
> >    ready when the panel/next bridge tries to send DSI commands
> 
> If it means 'convert exynos_dsi to bridge' I do not think it will help -
> 
> - pre_enable op will be still called after pre_enable op of downstream
> bridge - and this is the main reason why exynos_dsi do not use encoder
> bridge chain - it needs to perform some operations BEFORE (pre)enabling
> downstream devices.
> 
> > 2/ move everything that's needed to send DSI commands out of the
> >    ->enable() path (maybe in runtime PM resume/suspend hooks) so you
> >    can call that in the DSI transfer path too
> 
> It looks like a solution for DSI protocol, where control bus is shared
> with data bus, but the problem is more general - we have source and sink
> connected with some local bus, which has some negotiation/enable/disable
> protocol/requirements. And drm_core/bridge framework enforces us to fit
> every such protocol to 'drm_bridge protocol' with few opses called in
> fixed order, without clearly defined purpose of each ops. That does not
> sound generic and results in multiple issues:
> 
> - different drivers uses different opses to perform the same thing,
> 
> - different drivers assumes different things about their sinks/sources
> in their opses,
> 
> - more complicated sequences does not fit at all to this model.
> 
> All this results in incompatibilities between drivers which become
> visible with devices used in different configurations/platforms.

I fully agree with you, not defining the semantics of the bridge
operations precisely was I believe a mistake, and we're paying the price
now. That's OK, we "just" need to fix it :-)

> > As pointed out by Laurent, #1 doesn't work because some panel drivers
> > send DSI commands in their ->prepare() hook, and ->pre_enable() methods
> > are called in reverse order, meaning that the DRM panel bridge driver
> > would try to issue DSI commands before the DSI host controllers is ready
> > to send them. I still thing #2 is a good option.
> >
> >> So proper patch converting to double-linked list should not try to
> >> splice ExynosDSI private bridge list with with encoder's, encoder's list
> >> should be always empty, as Marek suggested.
> >
> > That's exactly what I wanted to do: make the encoder's list empty after
> > attach() and restore it to its initial state before unregistering
> > the bridge, except I forgot that list_splice() doesn't call
> > INIT_LIST_HEAD(). It's still not clear to me why replacing the
> > list_splice() call by a list_splice_init() didn't work.
> > Also note that calling INIT_LIST_HEAD() only works if you have one
> > bridge in the chain, so if we go for that option we need a comment
> > explaining the limitations of this approach.

-- 
Regards,

Laurent Pinchart
