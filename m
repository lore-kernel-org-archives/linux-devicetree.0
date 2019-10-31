Return-Path: <SRS0=y4GH=YY=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D2C3CA9ECB
	for <linux-devicetree@archiver.kernel.org>; Thu, 31 Oct 2019 13:04:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EF3212080F
	for <linux-devicetree@archiver.kernel.org>; Thu, 31 Oct 2019 13:04:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726821AbfJaNEP (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 31 Oct 2019 09:04:15 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:48000 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726462AbfJaNEP (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 31 Oct 2019 09:04:15 -0400
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 3442B290624;
        Thu, 31 Oct 2019 13:04:13 +0000 (GMT)
Date:   Thu, 31 Oct 2019 14:04:10 +0100
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Rob Herring <robh@kernel.org>
Cc:     dri-devel@lists.freedesktop.org,
        Mark Rutland <mark.rutland@arm.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        kernel@collabora.com, Sam Ravnborg <sam@ravnborg.org>,
        Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
        Andrey Smirnov <andrew.smirnov@gmail.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Chris Healy <cphealy@gmail.com>, devicetree@vger.kernel.org,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Seung-Woo Kim <sw0312.kim@samsung.com>
Subject: Re: [PATCH v3 17/21] dt-bindings: display: bridge:
 lvds-transmitter: Add new props
Message-ID: <20191031140410.47fca3ff@collabora.com>
In-Reply-To: <20191025195711.GA1074@bogus>
References: <20191023154512.9762-1-boris.brezillon@collabora.com>
        <20191023154512.9762-18-boris.brezillon@collabora.com>
        <20191025195711.GA1074@bogus>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, 25 Oct 2019 14:57:11 -0500
Rob Herring <robh@kernel.org> wrote:

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
> 
> This is already defined to be a panel property. Do we need it at both 
> ends?

That's a valid point. I'll patch the panel-simple driver to takes this
DT prop into account.
