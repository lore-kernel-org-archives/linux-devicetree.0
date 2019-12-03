Return-Path: <SRS0=0idb=ZZ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25FEDC432C0
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Dec 2019 12:42:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 085E120684
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Dec 2019 12:42:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726098AbfLCMm2 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 3 Dec 2019 07:42:28 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:57196 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725954AbfLCMm2 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 3 Dec 2019 07:42:28 -0500
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id AA19128DB93;
        Tue,  3 Dec 2019 12:42:25 +0000 (GMT)
Date:   Tue, 3 Dec 2019 13:42:22 +0100
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
Subject: Re: [PATCH v3 19/21] drm/panel: simple: Add support for Toshiba
 LTA089AC29000 panel
Message-ID: <20191203134222.4c20161f@collabora.com>
In-Reply-To: <20191202171724.GS4929@pendragon.ideasonboard.com>
References: <20191023154512.9762-1-boris.brezillon@collabora.com>
        <20191023154512.9762-20-boris.brezillon@collabora.com>
        <20191202171724.GS4929@pendragon.ideasonboard.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, 2 Dec 2019 19:17:24 +0200
Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:

> Hi Boris,
> 
> Thank you for the patch.
> 
> On Wed, Oct 23, 2019 at 05:45:10PM +0200, Boris Brezillon wrote:
> > Add a new entry for the Toshiba LTA089AC29000 panel.
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > ---
> > Changes in v3:
> > * None
> > ---
> >  drivers/gpu/drm/panel/panel-simple.c | 36 ++++++++++++++++++++++++++++
> >  1 file changed, 36 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> > index 5d487686d25c..27c92b44bd95 100644
> > --- a/drivers/gpu/drm/panel/panel-simple.c
> > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > @@ -2937,6 +2937,39 @@ static const struct panel_desc toshiba_lt089ac29000 = {
> >  	.connector_type = DRM_MODE_CONNECTOR_LVDS,
> >  };
> >  
> > +static const struct drm_display_mode toshiba_lta089ac29000_mode = {
> > +	.clock = 79500,
> > +	.hdisplay = 1280,
> > +	.hsync_start = 1280 + 192,
> > +	.hsync_end = 1280 + 192 + 128,
> > +	.htotal = 1280 + 192 + 128 + 64,
> > +	.vdisplay = 768,
> > +	.vsync_start = 768 + 20,
> > +	.vsync_end = 768 + 20 + 7,
> > +	.vtotal = 768 + 20 + 7 + 3,
> > +	.vrefresh = 60,
> > +};
> > +
> > +static const struct panel_desc toshiba_lta089ac29000 = {
> > +	.modes = &toshiba_lta089ac29000_mode,
> > +	.num_modes = 1,
> > +	.size = {
> > +		.width = 194,
> > +		.height = 116,
> > +	},
> > +	/*
> > +	 * FIXME:
> > +	 * The panel supports 2 bus formats: jeida-24 and jeida-18. The
> > +	 * mode is selected through the 8b6b_SEL pin. If anyone ever needs
> > +	 * support for jeida-18 we should probably parse the 'data-mapping'
> > +	 * property.
> > +	 * In the unlikely event where 8b6b_SEL is connected to a GPIO, we'd
> > +	 * need a new infra to allow bus format negotiation at the panel level.
> > +	 */
> > +	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA,
> > +	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
> > +};
> > +
> >  static const struct drm_display_mode tpk_f07a_0102_mode = {
> >  	.clock = 33260,
> >  	.hdisplay = 800,
> > @@ -3392,6 +3425,9 @@ static const struct of_device_id platform_of_match[] = {
> >  	}, {
> >  		.compatible = "toshiba,lt089ac29000",
> >  		.data = &toshiba_lt089ac29000,
> > +	}, {
> > +		.compatible = "toshiba,lta089ac29000",  
> 
> Is this really different than "toshiba,lt089ac29000" ? Both have the
> exact same timing, the only difference is .bus_format, and according to
> https://www.avnet-integrated.eu/fileadmin/user_upload/Files/Displays/Colour_TFT/LT089AC29000.pdf
> the "toshiba,lt089ac29000" is an LVDS panel.

I think you can select the LVDS format on the LTA variant which you
can't do on the LT089AC29000. But I agree, LT089AC29000 is definitely
not an DPI/RGB panel. At the same time, changing the definition is
likely to break existing users :-(.

> 
> > +		.data = &toshiba_lta089ac29000,
> >  	}, {
> >  		.compatible = "tpk,f07a-0102",
> >  		.data = &tpk_f07a_0102,  
> 

