Return-Path: <SRS0=leSB=Z7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBB62C43603
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Dec 2019 09:43:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AE93C20726
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Dec 2019 09:43:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727299AbfLIJne (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 9 Dec 2019 04:43:34 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:40330 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727357AbfLIJne (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 9 Dec 2019 04:43:34 -0500
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 2A03928DF20;
        Mon,  9 Dec 2019 09:43:32 +0000 (GMT)
Date:   Mon, 9 Dec 2019 10:43:28 +0100
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
        Mark Rutland <mark.rutland@arm.com>,
        Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH v4 00/11] drm: Add support for bus-format negotiation
Message-ID: <20191209104328.7eeb707a@collabora.com>
In-Reply-To: <20191203181924.GU4730@pendragon.ideasonboard.com>
References: <20191203141515.3597631-1-boris.brezillon@collabora.com>
        <20191203181924.GU4730@pendragon.ideasonboard.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, 3 Dec 2019 20:19:24 +0200
Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:

> Hi Boris,
> 
> On Tue, Dec 03, 2019 at 03:15:04PM +0100, Boris Brezillon wrote:
> > This patch series aims at adding support for runtime bus-format
> > negotiation between all elements of the
> > 'encoder -> bridges -> connector/display' section of the pipeline.
> > 
> > In order to support that, we need drm bridges to fully take part in the
> > atomic state validation process, which requires adding a
> > drm_bridge_state and a new drm_bridge_funcs.atomic_check() hook.
> > Once those basic building blocks are in place, we can add new hooks to
> > allow bus format negotiation (those are called just before  
> > ->atomic_check()). The bus format selection is done at runtime by  
> > testing all possible combinations across the whole bridge chain until
> > one is reported to work.
> > 
> > No Major changes in this v4. I think I addressed all comments I got
> > from Neil and Laurent (thanks for the detailed reviews BTW). Note that
> > this version only contains core changes. Once those changes are merged
> > I'll send the imx/panel/lvds-codec specific bits.  
> 
> I think it would make sense to fast-track patches 01 to 07 (a bit
> selfishly as I would have a need for them in omapdrm :-)),

I just queued patches 1 to 7 to drm-misc-next.
