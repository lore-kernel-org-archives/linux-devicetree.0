Return-Path: <SRS0=fjOU=5C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21862C10F29
	for <linux-devicetree@archiver.kernel.org>; Tue, 17 Mar 2020 11:39:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E3A9820719
	for <linux-devicetree@archiver.kernel.org>; Tue, 17 Mar 2020 11:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1584445146;
	bh=XG5Yndl8KraFzVwkRpY4n3HABlpeI+co8st5hpG0BA0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=z+g9rUaw/ryxN//3yQ/6rIXTpP9idbTjQ+WaehHKJvJe20k1xvX9hTf4d15r3MZ9l
	 WCU9G0kYFokgNNiULg0t21MHNCgjyFPMeybof2eO2lA8sERmtXHPz5+67n1MoE5AvH
	 K2HktWoeM8FLhEUBGJzHJzjtVJYMEq4wLa0gjdUU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725995AbgCQLjF (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 17 Mar 2020 07:39:05 -0400
Received: from foss.arm.com ([217.140.110.172]:36110 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725794AbgCQLjF (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 17 Mar 2020 07:39:05 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 42FBE1FB;
        Tue, 17 Mar 2020 04:39:04 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C22AE3F534;
        Tue, 17 Mar 2020 04:39:03 -0700 (PDT)
Date:   Tue, 17 Mar 2020 11:39:02 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Maxime Ripard <maxime@cerno.tech>, dri-devel@lists.freedesktop.org,
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
Message-ID: <20200317113902.GA3971@sirena.org.uk>
References: <20200315134416.16527-1-sam@ravnborg.org>
 <20200315134416.16527-3-sam@ravnborg.org>
 <20200316204850.gggeyjulgiy53i7x@gilmour.lan>
 <20200316214346.GA23637@ravnborg.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="h31gzZEtNLTqOjlF"
Content-Disposition: inline
In-Reply-To: <20200316214346.GA23637@ravnborg.org>
X-Cookie: There's only one everything.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--h31gzZEtNLTqOjlF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 16, 2020 at 10:43:46PM +0100, Sam Ravnborg wrote:
> On Mon, Mar 16, 2020 at 09:48:50PM +0100, Maxime Ripard wrote:

> > All the SPI devices will be declared under a spi controller node that
> > will validate its child nodes (and thus the devices) already.

> This was the missing piece - thanks.
> And as Mark put it "why is this suddenly an issue"?
> Turns out this is already properly handled and I made up an issue.
> Maybe Mark tried to explian it to me already...

No, I didn't actually understand how it worked - I was just pretty sure
that it should and trusted that Rob and Maxime had got it right.

--h31gzZEtNLTqOjlF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5wttMACgkQJNaLcl1U
h9BF/Qf/e1f3FiL65tLxhJHgSVGWUtvYFUQ6BgqVznQPLNNNIGBfYV1AQsue7zDt
t4vHT0WIpuT/meGsf6ZOMs/tQlq7gQK2+tZzTJEyFCpV1oRmUjdxX63sJtsPVV3T
6rcE1CWMOlAAWIPfegrrkfLvK/LjS7bzRLhYYo7NCgqiRnCMOjsAZawCJtyWYep7
ffPIaxTv+73EvIDvy7/CYjsJRHUGbHtta8CiKb3cm0urAvtvLbcx0ppLHhyr9GcJ
L8uBdMkWd3DRDQM/fPUNmyuWSqGRZwBJmhU+z+jN9bKlQqIC4Iw7JytoE6IOgtg8
9AoTLBvS4BqnlQTGit3CFa6sWdqwIg==
=Df56
-----END PGP SIGNATURE-----

--h31gzZEtNLTqOjlF--
