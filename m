Return-Path: <SRS0=Nmyu=5B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6260C0044D
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Mar 2020 12:02:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8742D20736
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Mar 2020 12:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1584360164;
	bh=7Nw6Ad5yYFkBY2WuoZT5HtG+meJjN+nDBvOwGjqlN+8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=L2r040qP2YeQZSMRipjoctRtglyychWq36fT+hEy8AePQ1pb1Bs2fbZ7uBJFk5puT
	 sHPEmoMn3a/pk6X0Gfjc19z9g6FDLdThj046ZlimCmOrUCfHP2+Dc1ZoFabgkV1Uik
	 RjfRyZZVq16ubSS0U1LvCTh3sUXr4ASyXuEJJhqA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730895AbgCPMCo (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 16 Mar 2020 08:02:44 -0400
Received: from foss.arm.com ([217.140.110.172]:46950 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730845AbgCPMCo (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 16 Mar 2020 08:02:44 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A45430E;
        Mon, 16 Mar 2020 05:02:43 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8686A3F52E;
        Mon, 16 Mar 2020 05:02:42 -0700 (PDT)
Date:   Mon, 16 Mar 2020 12:02:41 +0000
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
Message-ID: <20200316120239.GC5010@sirena.org.uk>
References: <20200315134416.16527-1-sam@ravnborg.org>
 <20200315134416.16527-3-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="+xNpyl7Qekk2NvDX"
Content-Disposition: inline
In-Reply-To: <20200315134416.16527-3-sam@ravnborg.org>
X-Cookie: I thought YOU silenced the guard!
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--+xNpyl7Qekk2NvDX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Mar 15, 2020 at 02:43:42PM +0100, Sam Ravnborg wrote:

> Independent bindings can be SPI slaves which for example is
> the case for several panel bindings.

What is an "independent binding"?

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--+xNpyl7Qekk2NvDX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5vat4ACgkQJNaLcl1U
h9AzOAf/XEkdCuffpd/fsgpdHL+Pu3NzYZp3ZwNogHMb+wwTBF8GC/tL3YSIIxcf
MO6mdBel6u+/s4Zya5lkw2GBpJN5MY90y1Y+vEL2bsbDfclCnwYiblydUrAMAjQF
LDXmkRdQd48tqNuGFGQQVovfmBiLYTQs6IcQSuPpnqNmr/Wh/gQYYbcYpCOEglsJ
vhKGOjMb18xL6AQqPnBP9lS05klYBqNol3lRSqrmpBJP7GGaA1XE0EknPN6RWhzF
A2RNjN45VXZ2T1WJCGhj7WnjRp7crxKgFASHzIkjJo7evwQ+N4JvWub42Y0nkXvM
0/hXKAWxwiKrox0ehS7OL1qwBMADQg==
=7Ips
-----END PGP SIGNATURE-----

--+xNpyl7Qekk2NvDX--
