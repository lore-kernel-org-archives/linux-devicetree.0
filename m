Return-Path: <SRS0=lsCC=4C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08562C35242
	for <linux-devicetree@archiver.kernel.org>; Fri, 14 Feb 2020 21:39:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D3866222C4
	for <linux-devicetree@archiver.kernel.org>; Fri, 14 Feb 2020 21:39:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389072AbgBNVjJ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 14 Feb 2020 16:39:09 -0500
Received: from asavdk3.altibox.net ([109.247.116.14]:49928 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388193AbgBNVjJ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 14 Feb 2020 16:39:09 -0500
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id C993D20022;
        Fri, 14 Feb 2020 22:39:04 +0100 (CET)
Date:   Fri, 14 Feb 2020 22:39:02 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        devicetree@vger.kernel.org, Tony Lindgren <tony@atomide.com>,
        dri-devel@lists.freedesktop.org, Jyri Sarha <jsarha@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 3/3] drm/panel: simple: fix osd070t1718_19ts sync drive
 edge
Message-ID: <20200214213902.GA22233@ravnborg.org>
References: <20191114093950.4101-1-tomi.valkeinen@ti.com>
 <20191114093950.4101-4-tomi.valkeinen@ti.com>
 <20191202130717.GI4929@pendragon.ideasonboard.com>
 <a9cf515c-dbdd-e70d-5a89-1211c1049d16@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a9cf515c-dbdd-e70d-5a89-1211c1049d16@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=sozttTNsAAAA:8
        a=P1BnusSwAAAA:8 a=pE7bLHUCcVxUAAEgjrMA:9 a=CjuIK1q_8ugA:10
        a=aeg5Gbbo78KNqacMgKqU:22 a=D0XLA9XvdZm18NrgonBM:22
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Tomi.

On Mon, Feb 10, 2020 at 10:15:33AM +0200, Tomi Valkeinen wrote:
> Hi Thierry,
> 
> On 02/12/2019 15:07, Laurent Pinchart wrote:
> > Hi Tomi,
> > 
> > Thank you for the patch.
> > 
> > On Thu, Nov 14, 2019 at 11:39:50AM +0200, Tomi Valkeinen wrote:
> > > The panel datasheet says that the panel samples at falling edge, but
> > > does not say anything about h/v sync signals. Testing shows that if the
> > > sync signals are driven on falling edge, the picture on the panel will
> > > be slightly shifted right.
> > > 
> > > Setting sync drive edge to the same as data drive edge fixes this issue.
> > > 
> > > Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> > 
> > I don't have access to the documentation, but this makes sense, so
> > 
> > Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > 
> > > ---
> > >   drivers/gpu/drm/panel/panel-simple.c | 3 ++-
> > >   1 file changed, 2 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> > > index 5d487686d25c..0784536ae6af 100644
> > > --- a/drivers/gpu/drm/panel/panel-simple.c
> > > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > > @@ -2397,7 +2397,8 @@ static const struct panel_desc osddisplays_osd070t1718_19ts = {
> > >   		.height = 91,
> > >   	},
> > >   	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
> > > -	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
> > > +	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE |
> > > +		DRM_BUS_FLAG_SYNC_DRIVE_POSEDGE,
> > >   	.connector_type = DRM_MODE_CONNECTOR_DPI,
> > >   };
> 
> Can this be merged?

I have lost the original mail.
Can you re-send or provide a patchwork pointer or similar.
Then I will apply.

PS. Mail had been stuck in my spam quarantine so did not get it until
now.

	Sam
