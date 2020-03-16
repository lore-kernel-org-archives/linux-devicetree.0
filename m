Return-Path: <SRS0=Nmyu=5B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1225C0044D
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Mar 2020 16:35:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B618920663
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Mar 2020 16:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1584376541;
	bh=W+hMJfrg0nxdA/VQ5YRqb9oneKn9x7RUCwZazeZBJhQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=mPjNg511DHo3q7xelAGZGLZeVPMLbOXGik0mJ2CJfOPZIJC+Zm415hu2V21yUDp6L
	 4ZxjEGTxcmhX9TPWT2Cj+x7ESsTFhkbzE7A3kBmx62njgfogicgkfqhtoJbcdsevqi
	 reOy3f5vmENGIRTixh7/W/13qJwmkJreyjp7+4SA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732108AbgCPQfl (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 16 Mar 2020 12:35:41 -0400
Received: from foss.arm.com ([217.140.110.172]:51774 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732065AbgCPQfl (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 16 Mar 2020 12:35:41 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 145371FB;
        Mon, 16 Mar 2020 09:35:40 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 931FB3F534;
        Mon, 16 Mar 2020 09:35:39 -0700 (PDT)
Date:   Mon, 16 Mar 2020 16:35:38 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
        Alexandre Courbot <acourbot@nvidia.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Brian Masney <masneyb@onstation.org>,
        Chris Zhong <zyw@rock-chips.com>,
        Douglas Anderson <dianders@chromium.org>,
        Guido Gunther <agx@sigxcpu.org>, Heiko Schocher <hs@denx.de>,
        Nikolaus Schaller <hns@goldelico.com>,
        Hoegeun Kwon <hoegeun.kwon@samsung.com>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
        Jonathan Bakker <xc-racer2@live.ca>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Lin Huang <hl@rock-chips.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-spi@vger.kernel.org, Marco Franchi <marco.franchi@nxp.com>,
        Marek Belisko <marek@goldelico.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Maxime Ripard <mripard@kernel.org>,
        Nickey Yang <nickey.yang@rock-chips.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Peter Rosin <peda@axentia.se>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Purism Kernel Team <kernel@puri.sm>,
        Robert Chiras <robert.chiras@nxp.com>,
        Sandeep Panda <spanda@codeaurora.org>,
        Stefan Mavrodiev <stefan@olimex.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        Vinay Simha BN <simhavcs@gmail.com>,
        Werner Johansson <werner.johansson@sonymobile.com>
Subject: Re: [PATCH v1 02/36] dt-bindings: spi: support non-spi bindings as
 SPI slaves
Message-ID: <20200316163538.GJ5010@sirena.org.uk>
References: <20200315134416.16527-1-sam@ravnborg.org>
 <20200315134416.16527-3-sam@ravnborg.org>
 <20200316120239.GC5010@sirena.org.uk>
 <20200316132844.GA22822@ravnborg.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="3MMMIZFJzhAsRj/+"
Content-Disposition: inline
In-Reply-To: <20200316132844.GA22822@ravnborg.org>
X-Cookie: I thought YOU silenced the guard!
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--3MMMIZFJzhAsRj/+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 16, 2020 at 02:28:44PM +0100, Sam Ravnborg wrote:
> On Mon, Mar 16, 2020 at 12:02:41PM +0000, Mark Brown wrote:
> > On Sun, Mar 15, 2020 at 02:43:42PM +0100, Sam Ravnborg wrote:

> > > Independent bindings can be SPI slaves which for example is
> > > the case for several panel bindings.

> > What is an "independent binding"?

> For several panels we have device trees that looks like this:

So what you're trying to do is define a generic class for SPI slaves
which are just normal children of SPI nodes?  I really can't get to
there from your changelog so we need some work there - in particular
"non-spi bindings" is *very* confusing as as far as I can see these are
bindings for SPI devices.

> The bindings are child of the spi controller node, but not specified
> in the same binding file as the spi controller node.

Of course not, this how all buses work isn't it?

> So SPI slaves can now reference spi-slave.yaml to get access to
> the SPI slave properties - and the copies can be avoided.
> Likewise spi-controller.yml now references spi-slave.yaml.

> This was the best way I saw it could be done.

Rob didn't do the binding conversion but he did review it - I'm a bit
surprised that there's issues here?

Also shouldn't there be some constraint that these devices have to be
the child of a SPI controller or something?  Just including a file
doesn't look right for something like class definition.

--3MMMIZFJzhAsRj/+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5vqtkACgkQJNaLcl1U
h9D9Jgf7BDsLTp/6OG/zIxXw5pr33X7ZgheGEgzqYDaH/LK45lJUNdpYb2eTABDv
Jg1MzeqqPxP1ppvEvmo3VRdudgU+m+hKTtHAbIwVnxY32nmSAweUnDySfKWCNl/1
LZXTrA6hFaFU4AmTj3iCIbNe4mHY9jt5f+DZN/31ZNr43VGfjXvqpSei/exRu+/i
Hnh0w0MvGQVHfD3V6AMGlaFrhLO59ZR6KPxXfQCGlJRfCuAgrjgJUK+0KSGsDf48
oTef8wJIjDm4r8LCFdN10GzODwdcLE6HGGzWl8pB1sEfKP4p4tFtWOTh/JIyTQZM
dHvwfKrDy65fP8P6ytpHy352wV8kQw==
=nY4o
-----END PGP SIGNATURE-----

--3MMMIZFJzhAsRj/+--
