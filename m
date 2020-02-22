Return-Path: <SRS0=C9Bv=4K=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C7F7C35671
	for <linux-devicetree@archiver.kernel.org>; Sat, 22 Feb 2020 12:16:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0F506206EF
	for <linux-devicetree@archiver.kernel.org>; Sat, 22 Feb 2020 12:16:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726839AbgBVMQK (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 22 Feb 2020 07:16:10 -0500
Received: from asavdk3.altibox.net ([109.247.116.14]:54908 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726763AbgBVMQK (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 22 Feb 2020 07:16:10 -0500
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id 76BF420096;
        Sat, 22 Feb 2020 13:16:07 +0100 (CET)
Date:   Sat, 22 Feb 2020 13:16:06 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        devicetree@vger.kernel.org, Tony Lindgren <tony@atomide.com>,
        dri-devel@lists.freedesktop.org, Jyri Sarha <jsarha@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 3/3] drm/panel: simple: fix osd070t1718_19ts sync drive
 edge
Message-ID: <20200222121606.GB28287@ravnborg.org>
References: <20191114093950.4101-1-tomi.valkeinen@ti.com>
 <20191114093950.4101-4-tomi.valkeinen@ti.com>
 <20191202130717.GI4929@pendragon.ideasonboard.com>
 <a9cf515c-dbdd-e70d-5a89-1211c1049d16@ti.com>
 <20200214213902.GA22233@ravnborg.org>
 <b36c42ea-3162-7462-7a51-c7b63620404f@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b36c42ea-3162-7462-7a51-c7b63620404f@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=VwQbUJbxAAAA:8
        a=e5mUnYsNAAAA:8 a=hpB4IPYcf2GVrlox-QIA:9 a=CjuIK1q_8ugA:10
        a=AjGcO6oz07-iQ99wixmX:22 a=Vxmtnl_E_bksehYqCbjh:22
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Tomi.

> >>>> +++ b/drivers/gpu/drm/panel/panel-simple.c
> >>>> @@ -2397,7 +2397,8 @@ static const struct panel_desc osddisplays_osd070t1718_19ts = {
> >>>>    		.height = 91,
> >>>>    	},
> >>>>    	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
> >>>> -	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
> >>>> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE |
> >>>> +		DRM_BUS_FLAG_SYNC_DRIVE_POSEDGE,
> >>>>    	.connector_type = DRM_MODE_CONNECTOR_DPI,
> >>>>    };
> >>
> >> Can this be merged?
> > 
> > I have lost the original mail.
> > Can you re-send or provide a patchwork pointer or similar.
> > Then I will apply.
> 
> Here are lore and patchwork links. Note that the first two patches in the series have already been handled.
> 
> https://lore.kernel.org/dri-devel/20191114093950.rT5m86Xh0-a9FZGq7JipQ3O3vldctJYcvRdhxUMGBVE@z/#t
> 
> https://patchwork.freedesktop.org/series/69459/

Thanks for the pointers. It is now applied to drm-misc-next.

	Sam
