Return-Path: <SRS0=mVKz=7P=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56B8AC433DF
	for <linux-devicetree@archiver.kernel.org>; Tue,  2 Jun 2020 20:56:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3D36A206C3
	for <linux-devicetree@archiver.kernel.org>; Tue,  2 Jun 2020 20:56:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726223AbgFBU46 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 2 Jun 2020 16:56:58 -0400
Received: from asavdk4.altibox.net ([109.247.116.15]:51586 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726174AbgFBU46 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 2 Jun 2020 16:56:58 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id 20B6180511;
        Tue,  2 Jun 2020 22:56:55 +0200 (CEST)
Date:   Tue, 2 Jun 2020 22:56:53 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Emil Velikov <emil.l.velikov@gmail.com>
Cc:     Liu Ying <victor.liu@nxp.com>,
        ML dri-devel <dri-devel@lists.freedesktop.org>,
        devicetree <devicetree@vger.kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>
Subject: Re: [PATCH 2/2] drm/panel: simple: Add support for KOE
 TX26D202VM0BWA panel
Message-ID: <20200602205653.GC56418@ravnborg.org>
References: <1590991880-24273-1-git-send-email-victor.liu@nxp.com>
 <CACvgo50UOby-xV_OYmM55VUXUbwLxK-q6bs2FoS_FuwB9ChYJg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACvgo50UOby-xV_OYmM55VUXUbwLxK-q6bs2FoS_FuwB9ChYJg@mail.gmail.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=G88y7es5 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=kj9zAlcOel0A:10 a=8AirrxEcAAAA:8 a=yWwjhyuKAAAA:8 a=nC4w6PE1AAAA:8
        a=pGLkceISAAAA:8 a=7gkXJVJtAAAA:8 a=rqLoeK0XAFqiYc_KYMYA:9
        a=CjuIK1q_8ugA:10 a=ST-jHhOKWsTCqRlWije3:22 a=Af9y4jXI75YbyZfcaVTS:22
        a=6x2acwxlnJam7TDHjV8g:22 a=E9Po1WZjFZOl8hwRPBS3:22
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Emil.

On Tue, Jun 02, 2020 at 01:46:19PM +0100, Emil Velikov wrote:
> On Tue, 2 Jun 2020 at 08:17, Liu Ying <victor.liu@nxp.com> wrote:
> >
> > This patch adds support for Kaohsiung Opto-Electronics Inc.
> > 10.1" TX26D202VM0BWA WUXGA(1920x1200) TFT LCD panel with LVDS interface.
> > The panel has dual LVDS channels.
> >
> > My panel is manufactured by US Micro Products(USMP).  There is a tag at
> > the back of the panel, which indicates the panel type is 'TX26D202VM0BWA'
> > and it's made by KOE in Taiwan.
> >
> > The panel spec from USMP can be found at:
> > https://www.usmicroproducts.com/sites/default/files/datasheets/USMP-T101-192120NDU-A0.pdf
> >
> > The below panel spec from KOE is basically the same to the one from USMP.
> > However, the panel type 'TX26D202VM0BAA' is a little bit different.
> > It looks that the two types of panel are compatible with each other.
> > http://www.koe.j-display.com/upload/product/TX26D202VM0BAA.pdf
> >
> > Cc: Thierry Reding <thierry.reding@gmail.com>
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > ---
> >  drivers/gpu/drm/panel/panel-simple.c | 34 ++++++++++++++++++++++++++++++++++
> >  1 file changed, 34 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> > index b6ecd15..7c222ec 100644
> > --- a/drivers/gpu/drm/panel/panel-simple.c
> > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > @@ -2200,6 +2200,37 @@ static const struct panel_desc koe_tx14d24vm1bpa = {
> >         },
> >  };
> >
> > +static const struct display_timing koe_tx26d202vm0bwa_timing = {
> > +       .pixelclock = { 151820000, 156720000, 159780000 },
> > +       .hactive = { 1920, 1920, 1920 },
> > +       .hfront_porch = { 105, 130, 142 },
> > +       .hback_porch = { 45, 70, 82 },
> > +       .hsync_len = { 30, 30, 30 },
> > +       .vactive = { 1200, 1200, 1200},
> > +       .vfront_porch = { 3, 5, 10 },
> > +       .vback_porch = { 2, 5, 10 },
> > +       .vsync_len = { 5, 5, 5 },
> > +};
> > +
> > +static const struct panel_desc koe_tx26d202vm0bwa = {
> > +       .timings = &koe_tx26d202vm0bwa_timing,
> > +       .num_timings = 1,
> > +       .bpc = 8,
> > +       .size = {
> > +               .width = 217,
> > +               .height = 136,
> > +       },
> > +       .delay = {
> > +               .prepare = 1000,
> > +               .enable = 1000,
> > +               .unprepare = 1000,
> > +               .disable = 1000,
> Ouch 1s for each delay is huge. Nevertheless it matches the specs so,
> the series is:
> Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
> 
> Sam, Thierry I assume you'll merge the series. Let me know if I should
> pick it up.
I am quite busy with non-linux stuff these days so fine if you can pick
them up. I like that simple panel patches are processed fast.

I expect to have some hours for linux work friday or saturday, but no
promises...

	Sam


> 
> -Emil
