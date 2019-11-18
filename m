Return-Path: <SRS0=UR7X=ZK=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C45CC432C0
	for <linux-devicetree@archiver.kernel.org>; Mon, 18 Nov 2019 16:01:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7079C21479
	for <linux-devicetree@archiver.kernel.org>; Mon, 18 Nov 2019 16:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1574092875;
	bh=Bu9vMLhhIiz9KwfV7bFauXtgssGkOPeExoWr0VvZXsI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=mbeAUy9Eybx5uvXoA/3Eq7GeBGcvNRazOimlpRTEnd77mUH6YQ6KO+DGErUVifKev
	 VQ7vSM1qGlgfnEkFrK+9d3psU3thQZv0jWSDeLXe7gtRBGbpoLBrPeZ99wFtikamWH
	 tklyU/TsraYq4GajGX/xc2IPWFl1uA9Hy0TOJAn4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727333AbfKRQBO (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 18 Nov 2019 11:01:14 -0500
Received: from foss.arm.com ([217.140.110.172]:36402 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726654AbfKRQBO (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 18 Nov 2019 11:01:14 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 14A32DA7;
        Mon, 18 Nov 2019 08:01:14 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7802F3F703;
        Mon, 18 Nov 2019 08:01:13 -0800 (PST)
Date:   Mon, 18 Nov 2019 16:01:11 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc:     lgirdwood@gmail.com, alsa-devel@alsa-project.org,
        kuninori.morimoto.gx@renesas.com, linus.walleij@linaro.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] bindings: sound: pcm3168a: Document optional RST gpio
Message-ID: <20191118160111.GH9761@sirena.org.uk>
References: <20191113124734.27984-1-peter.ujfalusi@ti.com>
 <20191113124734.27984-2-peter.ujfalusi@ti.com>
 <20191118130855.GE9761@sirena.org.uk>
 <5f824119-9b5b-5ad2-6915-d174f9cca8af@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="3ecMC0kzqsE2ddMN"
Content-Disposition: inline
In-Reply-To: <5f824119-9b5b-5ad2-6915-d174f9cca8af@ti.com>
X-Cookie: no maintenance:
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--3ecMC0kzqsE2ddMN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 18, 2019 at 04:46:26PM +0200, Peter Ujfalusi wrote:
> On 18/11/2019 15.08, Mark Brown wrote:

> > Please submit patches using subject lines reflecting the style for the
> > subsystem, this makes it easier for people to identify relevant patches.
> > Look at what existing commits in the area you're changing are doing and
> > make sure your subject lines visually resemble what they're doing.
> > There's no need to resubmit to fix this alone.

> What would be the appropriate subject line for
> Documentation/devicetree/bindings/sound

> Oops, I have missed the dt- prefix for the bindings for sure.

I prefer ASoC: but yeah, you missed dt-.

--3ecMC0kzqsE2ddMN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3SwEYACgkQJNaLcl1U
h9CqAQf/TzsDc61IPhX0l9gJTpyxpHP8aQwigm4y1DNpSWUcdHEoR0vSssiPAnLw
Pt2g9bSvrdUGiSEn9IkUGt4yWiCT0RyGUWSTsQ7/k78PCzGyGLrThmRRWnNu7s2b
qE7hGNfTMk6oThsMz03ytkIaZl40PJSopNCJHs5h73hkYkBWTZfSDW0XORUPrgYt
g5hx0bZJtYgwziZi05dFEW3KCpdaVSbyTZgULXAlVSpOhUbfcJpBl2K1rNcp1Opk
2KeKaWTJ59RxiEf9s32kFVxsKv9jXky55sMk6DrW8+Uwu98sZG/78xNrqXPu0T0d
pN4DN87GEqlrihD347osS1BBopRKNQ==
=fktM
-----END PGP SIGNATURE-----

--3ecMC0kzqsE2ddMN--
