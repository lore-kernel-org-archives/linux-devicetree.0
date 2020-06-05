Return-Path: <SRS0=PVp5=7S=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C4A6C433E0
	for <linux-devicetree@archiver.kernel.org>; Fri,  5 Jun 2020 17:19:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 67401207D3
	for <linux-devicetree@archiver.kernel.org>; Fri,  5 Jun 2020 17:19:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727118AbgFERTY (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 5 Jun 2020 13:19:24 -0400
Received: from asavdk3.altibox.net ([109.247.116.14]:45050 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726026AbgFERTX (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 5 Jun 2020 13:19:23 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id 65EA52002F;
        Fri,  5 Jun 2020 19:19:20 +0200 (CEST)
Date:   Fri, 5 Jun 2020 19:19:19 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Doug Anderson <dianders@chromium.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        =?iso-8859-1?Q?S=F8ren?= Andersen <san@skov.dk>,
        Thierry Reding <thierry.reding@gmail.com>,
        Ville =?iso-8859-1?Q?Syrj=E4l=E4?= 
        <ville.syrjala@linux.intel.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH v1 4/6] drm: panel-simple: add Hitachi 3.5" QVGA panel
Message-ID: <20200605171919.GD207594@ravnborg.org>
References: <20200601083309.712606-1-sam@ravnborg.org>
 <20200601083309.712606-5-sam@ravnborg.org>
 <CAD=FV=WyErT-M=g74vyFjYHNQw9xj7ny_czHhjtUQbTDJUAjag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=FV=WyErT-M=g74vyFjYHNQw9xj7ny_czHhjtUQbTDJUAjag@mail.gmail.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=edQTgYMH c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8 a=pGLkceISAAAA:8
        a=xMIyQxNUmeVcW2nKupQA:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Doug.

On Mon, Jun 01, 2020 at 05:30:53PM -0700, Doug Anderson wrote:
> Hi,
> 
> On Mon, Jun 1, 2020 at 1:33 AM Sam Ravnborg <sam@ravnborg.org> wrote:
> >
> > This panel is used on evaluation boards for Atmel at91sam9261 and
> > at91sam6263.
> >
> > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Thierry Reding <thierry.reding@gmail.com>
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > ---
> >  drivers/gpu/drm/panel/panel-simple.c | 29 ++++++++++++++++++++++++++++
> >  1 file changed, 29 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> > index 8624bb80108c..25c96639631f 100644
> > --- a/drivers/gpu/drm/panel/panel-simple.c
> > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > @@ -1813,6 +1813,32 @@ static const struct panel_desc hannstar_hsd100pxn1 = {
> >         .connector_type = DRM_MODE_CONNECTOR_LVDS,
> >  };
> >
> > +static const struct drm_display_mode hitachi_tx09d71vm1cca_mode = {
> > +       .clock = 4965000,
> 
> This is the pixel clock in kHz, right?  So it runs at almost 5 Terahertz?
> 
> 
> > +       .hdisplay = 240,
> > +       .hsync_start = 240 + 0,
> > +       .hsync_end = 240 + 0 + 5,
> > +       .htotal = 240 + 0 + 5 + 1,
> > +       .vdisplay = 320,
> > +       .vsync_start = 320 + 0,
> > +       .vsync_end = 320 + 0 + 1,
> > +       .vtotal = 320 + 0 + 1 + 1,
> 
> Some random datasheet I found has really different numbers.  If the
> numbers above are what everyone is using then I suppose it's fine,
> just curious why the mismatch.

The timing comes from:
arch/arm/boot/dts/at91sam9263ek.dts - that include display timings for
the panel on the evaluation board.
I did not verify any datasheet - I just blindly copied what was there.
And clock was obviously not properly adjusted to khz.

Will fix in v2 - will also try to find a datasheet this time.

Thanks for noticing!

	Sam
