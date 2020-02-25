Return-Path: <SRS0=49W1=4N=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9F55C35DF9
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Feb 2020 08:44:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B89C420CC7
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Feb 2020 08:44:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729493AbgBYIo2 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 25 Feb 2020 03:44:28 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:36772 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729490AbgBYIo2 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 25 Feb 2020 03:44:28 -0500
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 2A4F5293DCC;
        Tue, 25 Feb 2020 08:44:26 +0000 (GMT)
Date:   Tue, 25 Feb 2020 09:44:23 +0100
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        dri-devel@lists.freedesktop.org,
        Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Andrey Smirnov <andrew.smirnov@gmail.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Rob Herring <robh+dt@kernel.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        devicetree@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        intel-gfx-trybot@lists.freedesktop.org, kernel@collabora.com,
        Chris Healy <cphealy@gmail.com>
Subject: Re: [PATCH v10 08/12] drm/bridge: lvds-codec: Implement basic bus
 format negotiation
Message-ID: <20200225094423.6fd2d6d5@collabora.com>
In-Reply-To: <20200225061543.GA9944@ravnborg.org>
References: <20200128135514.108171-1-boris.brezillon@collabora.com>
        <20200128135514.108171-9-boris.brezillon@collabora.com>
        <20200224230322.GE16163@pendragon.ideasonboard.com>
        <20200225061543.GA9944@ravnborg.org>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, 25 Feb 2020 07:15:43 +0100
Sam Ravnborg <sam@ravnborg.org> wrote:

> Hi Boris/Laurent.
> 
> > > +
> > > +	err = of_property_read_u32(np, "bus-width", &input_bus_width);
> > > +	of_node_put(np);
> > > +
> > > +	if (err) {
> > > +		lvds_codec->input_fmt = MEDIA_BUS_FMT_FIXED;
> > > +	} else if (input_bus_width == 18) {
> > > +		lvds_codec->input_fmt = MEDIA_BUS_FMT_RGB666_1X18;
> > > +	} else if (input_bus_width == 24) {
> > > +		lvds_codec->input_fmt = MEDIA_BUS_FMT_RGB888_1X24;
> > > +	} else {
> > > +		dev_dbg(dev, "unsupported bus-width value %u on port 0\n",
> > > +			input_bus_width);
> > > +		return -ENOTSUPP;  
> > 
> > ENOTSUPP is "Operation not supported", I'd go for -EINVAL.
> >   
> > > +	}  
> > 
> > Doesn't this apply to LVDS encoders only ? For LVDS decoders I don't
> > think we want to report an RGB format on the input.  
> 
> In panel-lvds we use the property "data-mapping" for the same purpose.
> To specify the MEDIA_BUS format.

I started with data-mapping, and was told (by Laurent IIRC) that
bus-width would be more appropriate for a DPI (AKA RGB) bus. I think it
has to do with the fact that fully-parallel buses always have one color
bit per-signal, while serial or partially-parallel buses can have
several color-bits per-signal, the assignment being described by this
'data-mapping' property. This being said, I can see a case where
data-mapping would be needed for DPI buses => RGB component ordering. A
24bit bus does not distinguish between RGB888 and BGR888.

> 
> It would be good to standardize on the same property, and maybe have the
> same binding descriptions for all.

As for the standardization, I'm all for it, but let's do that in a
second step, please.
