Return-Path: <SRS0=UHbD=BI=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3589FC433E0
	for <linux-devicetree@archiver.kernel.org>; Wed, 29 Jul 2020 17:09:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1102420809
	for <linux-devicetree@archiver.kernel.org>; Wed, 29 Jul 2020 17:09:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726365AbgG2RJK (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 29 Jul 2020 13:09:10 -0400
Received: from asavdk3.altibox.net ([109.247.116.14]:48514 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726336AbgG2RJK (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 29 Jul 2020 13:09:10 -0400
Received: from ravnborg.org (unknown [188.228.123.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id C27EC20045;
        Wed, 29 Jul 2020 19:09:08 +0200 (CEST)
Date:   Wed, 29 Jul 2020 19:09:07 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Marek Vasut <marex@denx.de>
Cc:     dri-devel@lists.freedesktop.org, Eric Anholt <eric@anholt.net>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH V2 2/2] drm/bridge: tc358762: Add basic driver for
 Toshiba TC358762 DSI-to-DPI bridge
Message-ID: <20200729170907.GA1375231@ravnborg.org>
References: <20200729164554.114735-1-marex@denx.de>
 <20200729164554.114735-2-marex@denx.de>
 <20200729165604.GA1372716@ravnborg.org>
 <3f9702f1-062e-a43c-3297-eb5baacaa81c@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3f9702f1-062e-a43c-3297-eb5baacaa81c@denx.de>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
        a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
        a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8 a=nZwYH4Z7KE73ytJNG8gA:9
        a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Marek.

On Wed, Jul 29, 2020 at 07:02:51PM +0200, Marek Vasut wrote:
> On 7/29/20 6:56 PM, Sam Ravnborg wrote:
> [...]
> >> +static int tc358762_probe(struct mipi_dsi_device *dsi)
> >> +{
> >> +	struct device *dev = &dsi->dev;
> >> +	struct tc358762 *ctx;
> >> +	int ret;
> >> +
> >> +	ctx = devm_kzalloc(dev, sizeof(struct tc358762), GFP_KERNEL);
> >> +	if (!ctx)
> >> +		return -ENOMEM;
> >> +
> >> +	mipi_dsi_set_drvdata(dsi, ctx);
> > I cannot see why this is needed. If not used then delete it.
> > With the above addressed:
> > Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> > 
> > Let me know if I shall apply - but we have to wait until binding is
> > reviewed. And preferably one extra set of eyes on this driver.
> 
> [...]
> 
> >> +static int tc358762_remove(struct mipi_dsi_device *dsi)
> >> +{
> >> +	struct tc358762 *ctx = mipi_dsi_get_drvdata(dsi);
> >> +
> >> +	mipi_dsi_detach(dsi);
> >> +	drm_bridge_remove(&ctx->bridge);
> 
> Because it's used here in the remove callback.

Thanks - missed that.
So consider the point addressed by enlightning me.

	Sam
