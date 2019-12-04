Return-Path: <SRS0=zDkl=Z2=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45EE0C43603
	for <linux-devicetree@archiver.kernel.org>; Wed,  4 Dec 2019 09:13:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 14070206DB
	for <linux-devicetree@archiver.kernel.org>; Wed,  4 Dec 2019 09:13:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kzM7AUt6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725994AbfLDJNE (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 4 Dec 2019 04:13:04 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:53634 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725922AbfLDJNE (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 4 Dec 2019 04:13:04 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D183B2E5;
        Wed,  4 Dec 2019 10:13:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1575450782;
        bh=DLM5cCVpIiTvnsH3JC8xvKQelO/hR7BI0EPVs3eAlow=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kzM7AUt6QVwQbzGcNShmVYRGF7cZy0G56tTNhws6vdylDtSZ8mpivCzO0LoByFU9k
         zU6j7/26jWIr9N/aoDSA403924AQTD282woY3Q4bYH7XaJ0Z8qgMyBDjNeKTwGaX+y
         PR8Jc6UTa5egbU8wUD6/7IDC9j9L45y+yIA7Nau0=
Date:   Wed, 4 Dec 2019 11:12:55 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Boris Brezillon <boris.brezillon@collabora.com>
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
        devicetree@vger.kernel.org, Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH v4 08/11] drm/bridge: Add a drm_bridge_state object
Message-ID: <20191204091255.GB6705@pendragon.ideasonboard.com>
References: <20191203141515.3597631-1-boris.brezillon@collabora.com>
 <20191203141515.3597631-9-boris.brezillon@collabora.com>
 <20191203181705.GT4730@pendragon.ideasonboard.com>
 <20191204100302.38096544@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191204100302.38096544@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Boris,

On Wed, Dec 04, 2019 at 10:03:02AM +0100, Boris Brezillon wrote:
> On Tue, 3 Dec 2019 20:17:05 +0200 Laurent Pinchart wrote:
> > On Tue, Dec 03, 2019 at 03:15:12PM +0100, Boris Brezillon wrote:
> > > One of the last remaining objects to not have its atomic state.
> > > 
> > > This is being motivated by our attempt to support runtime bus-format
> > > negotiation between elements of the bridge chain.
> > > This patch just paves the road for such a feature by adding a new
> > > drm_bridge_state object inheriting from drm_private_obj so we can
> > > re-use some of the existing state initialization/tracking logic.
> > > 
> > > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > > Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
> > > ---
> > > Changes in v4:
> > > * Fix the doc
> > > * Kill default helpers (inlined)  
> > 
> > I liked the default helpers, inlining their content makes the code more
> > difficult to follow in my opinion.
> 
> I'll go back to this approach then. Should I keep the original helper
> names even though they're not globally visible (and should probably
> never be)?

I agree they should probably never be visible, and I trust your
judgement on naming. Please double-check the documentation though, to
ensure that it matches the implementation.

-- 
Regards,

Laurent Pinchart
