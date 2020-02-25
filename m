Return-Path: <SRS0=49W1=4N=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAFBAC35DF2
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Feb 2020 06:15:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BEEEB2082F
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Feb 2020 06:15:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728983AbgBYGPw (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 25 Feb 2020 01:15:52 -0500
Received: from asavdk4.altibox.net ([109.247.116.15]:40592 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725837AbgBYGPw (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 25 Feb 2020 01:15:52 -0500
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id 4DB6B80509;
        Tue, 25 Feb 2020 07:15:45 +0100 (CET)
Date:   Tue, 25 Feb 2020 07:15:43 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Boris Brezillon <boris.brezillon@collabora.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Boris Brezillon <boris.brezillon@collabora.com>,
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
Message-ID: <20200225061543.GA9944@ravnborg.org>
References: <20200128135514.108171-1-boris.brezillon@collabora.com>
 <20200128135514.108171-9-boris.brezillon@collabora.com>
 <20200224230322.GE16163@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200224230322.GE16163@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
        a=juKz5vNY0a5tetdafiUA:9 a=CjuIK1q_8ugA:10
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Boris/Laurent.

> > +
> > +	err = of_property_read_u32(np, "bus-width", &input_bus_width);
> > +	of_node_put(np);
> > +
> > +	if (err) {
> > +		lvds_codec->input_fmt = MEDIA_BUS_FMT_FIXED;
> > +	} else if (input_bus_width == 18) {
> > +		lvds_codec->input_fmt = MEDIA_BUS_FMT_RGB666_1X18;
> > +	} else if (input_bus_width == 24) {
> > +		lvds_codec->input_fmt = MEDIA_BUS_FMT_RGB888_1X24;
> > +	} else {
> > +		dev_dbg(dev, "unsupported bus-width value %u on port 0\n",
> > +			input_bus_width);
> > +		return -ENOTSUPP;
> 
> ENOTSUPP is "Operation not supported", I'd go for -EINVAL.
> 
> > +	}
> 
> Doesn't this apply to LVDS encoders only ? For LVDS decoders I don't
> think we want to report an RGB format on the input.

In panel-lvds we use the property "data-mapping" for the same purpose.
To specify the MEDIA_BUS format.

It would be good to standardize on the same property, and maybe have the
same binding descriptions for all.

And "data-mapping" is a text string, which gives us more flexibility
than just a number, that for MEDIA_BUS_FMT seems required.

	Sam
