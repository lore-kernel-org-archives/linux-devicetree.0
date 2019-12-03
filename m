Return-Path: <SRS0=0idb=ZZ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 714FCC432C0
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Dec 2019 12:38:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4EA9D2073F
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Dec 2019 12:38:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725954AbfLCMit (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 3 Dec 2019 07:38:49 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:57106 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725907AbfLCMit (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 3 Dec 2019 07:38:49 -0500
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 6133E28DB93;
        Tue,  3 Dec 2019 12:38:47 +0000 (GMT)
Date:   Tue, 3 Dec 2019 13:38:43 +0100
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
Subject: Re: [PATCH v3 17/21] dt-bindings: display: bridge:
 lvds-transmitter: Add new props
Message-ID: <20191203133843.32cab43e@collabora.com>
In-Reply-To: <20191202171140.GR4929@pendragon.ideasonboard.com>
References: <20191023154512.9762-1-boris.brezillon@collabora.com>
        <20191023154512.9762-18-boris.brezillon@collabora.com>
        <20191202171140.GR4929@pendragon.ideasonboard.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, 2 Dec 2019 19:11:40 +0200
Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:

> Hi Boris,
> 
> Thank you for the patch.
> 
> On Wed, Oct 23, 2019 at 05:45:08PM +0200, Boris Brezillon wrote:
> > Add the data-mapping property to describe the output bus format and
> > the bus-width property to describe the input bus format.
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > ---
> > Changes in v3:
> > * New patch
> > ---
> >  .../bindings/display/bridge/lvds-transmitter.txt    | 13 +++++++++++++  
> 
> Please note that lvds-transmitter has been renamed to lvds-codec and
> converted to YAML as part of a pull request I've recently sent ([1]).
> This patch will thus need to be rebased.

Let me know when it's been merged, I'll ask for a drm-next ->
drm-misc-next backmerge.

> 
> [1] https://patchwork.freedesktop.org/patch/342754/
> 
> >  1 file changed, 13 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt b/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt
> > index 60091db5dfa5..7b43b6f20279 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt
> > +++ b/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt
> > @@ -36,6 +36,19 @@ graph bindings specified in Documentation/devicetree/bindings/graph.txt.
> >  - Video port 0 for parallel input
> >  - Video port 1 for LVDS output
> >  
> > +Optional port 0 node properties:
> > +
> > +- bus-width: number of data lines use to transmit the RGB data.
> > +	     Can be 18 or 24.
> > +
> > +Optional port 1 node properties:
> > +
> > +- data-mapping: see Documentation/devicetree/bindings/display/panel/lvds.yaml
> > +		for more details about this LVDS data-mapping property.
> > +		Supported values:
> > +		"jeida-18"
> > +		"jeida-24"
> > +		"vesa-24"
> >  
> >  Example
> >  -------  
> 

