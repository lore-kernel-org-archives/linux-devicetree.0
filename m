Return-Path: <SRS0=0idb=ZZ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E930EC432C0
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Dec 2019 13:28:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BE45A2073B
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Dec 2019 13:28:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="uC/uYuaB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726115AbfLCN2d (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 3 Dec 2019 08:28:33 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:37314 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726074AbfLCN2d (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 3 Dec 2019 08:28:33 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 38E8B309;
        Tue,  3 Dec 2019 14:28:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1575379711;
        bh=8ReQL5yaxvRVkElkpcgUDGi0pgGxV8hS+QRHMVLH6Dg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uC/uYuaBb4VtgR98sjodf1WFciD7eYe4JZAMPVy0ANqgC/z9UvE389wd6un8XEH1m
         yN68/DBzPiMGV4PtpJRTauxzI9Lt5bu/4hIhgHv6V4pf8tmF6YXdXS2DqVx5G9ruNE
         fzJBLv/nLpMYX7mzdheR7neUgFiSAkgn+KcHWjuM=
Date:   Tue, 3 Dec 2019 15:28:24 +0200
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
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 19/21] drm/panel: simple: Add support for Toshiba
 LTA089AC29000 panel
Message-ID: <20191203132824.GR4730@pendragon.ideasonboard.com>
References: <20191023154512.9762-1-boris.brezillon@collabora.com>
 <20191023154512.9762-20-boris.brezillon@collabora.com>
 <20191202171724.GS4929@pendragon.ideasonboard.com>
 <20191203134222.4c20161f@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191203134222.4c20161f@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Boris,

On Tue, Dec 03, 2019 at 01:42:22PM +0100, Boris Brezillon wrote:
> On Mon, 2 Dec 2019 19:17:24 +0200 Laurent Pinchart wrote:
> > On Wed, Oct 23, 2019 at 05:45:10PM +0200, Boris Brezillon wrote:
> > > Add a new entry for the Toshiba LTA089AC29000 panel.
> > > 
> > > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > > ---
> > > Changes in v3:
> > > * None
> > > ---
> > >  drivers/gpu/drm/panel/panel-simple.c | 36 ++++++++++++++++++++++++++++
> > >  1 file changed, 36 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> > > index 5d487686d25c..27c92b44bd95 100644
> > > --- a/drivers/gpu/drm/panel/panel-simple.c
> > > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > > @@ -2937,6 +2937,39 @@ static const struct panel_desc toshiba_lt089ac29000 = {
> > >  	.connector_type = DRM_MODE_CONNECTOR_LVDS,
> > >  };
> > >  
> > > +static const struct drm_display_mode toshiba_lta089ac29000_mode = {
> > > +	.clock = 79500,
> > > +	.hdisplay = 1280,
> > > +	.hsync_start = 1280 + 192,
> > > +	.hsync_end = 1280 + 192 + 128,
> > > +	.htotal = 1280 + 192 + 128 + 64,
> > > +	.vdisplay = 768,
> > > +	.vsync_start = 768 + 20,
> > > +	.vsync_end = 768 + 20 + 7,
> > > +	.vtotal = 768 + 20 + 7 + 3,
> > > +	.vrefresh = 60,
> > > +};
> > > +
> > > +static const struct panel_desc toshiba_lta089ac29000 = {
> > > +	.modes = &toshiba_lta089ac29000_mode,
> > > +	.num_modes = 1,
> > > +	.size = {
> > > +		.width = 194,
> > > +		.height = 116,
> > > +	},
> > > +	/*
> > > +	 * FIXME:
> > > +	 * The panel supports 2 bus formats: jeida-24 and jeida-18. The
> > > +	 * mode is selected through the 8b6b_SEL pin. If anyone ever needs
> > > +	 * support for jeida-18 we should probably parse the 'data-mapping'
> > > +	 * property.
> > > +	 * In the unlikely event where 8b6b_SEL is connected to a GPIO, we'd
> > > +	 * need a new infra to allow bus format negotiation at the panel level.
> > > +	 */
> > > +	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA,
> > > +	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
> > > +};
> > > +
> > >  static const struct drm_display_mode tpk_f07a_0102_mode = {
> > >  	.clock = 33260,
> > >  	.hdisplay = 800,
> > > @@ -3392,6 +3425,9 @@ static const struct of_device_id platform_of_match[] = {
> > >  	}, {
> > >  		.compatible = "toshiba,lt089ac29000",
> > >  		.data = &toshiba_lt089ac29000,
> > > +	}, {
> > > +		.compatible = "toshiba,lta089ac29000",  
> > 
> > Is this really different than "toshiba,lt089ac29000" ? Both have the
> > exact same timing, the only difference is .bus_format, and according to
> > https://www.avnet-integrated.eu/fileadmin/user_upload/Files/Displays/Colour_TFT/LT089AC29000.pdf
> > the "toshiba,lt089ac29000" is an LVDS panel.
> 
> I think you can select the LVDS format on the LTA variant which you
> can't do on the LT089AC29000. But I agree, LT089AC29000 is definitely
> not an DPI/RGB panel. At the same time, changing the definition is
> likely to break existing users :-(.

Or the information could just be unused :-)

> > > +		.data = &toshiba_lta089ac29000,
> > >  	}, {
> > >  		.compatible = "tpk,f07a-0102",
> > >  		.data = &tpk_f07a_0102,  

-- 
Regards,

Laurent Pinchart
