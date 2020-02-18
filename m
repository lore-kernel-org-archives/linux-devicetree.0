Return-Path: <SRS0=1Pza=4G=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7956FC34026
	for <linux-devicetree@archiver.kernel.org>; Tue, 18 Feb 2020 12:56:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 43C7120659
	for <linux-devicetree@archiver.kernel.org>; Tue, 18 Feb 2020 12:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1582030560;
	bh=xKyP8NoOxgChUudL/jyG/REWXfqdH+OzVfNdN1v4MBc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=c6gQmFTlgc4qmZ7xr4eqyfC0NTi2H3RGDdPPw2H4OttDP/w8Q4QUk7u3DaZXdWZen
	 pkz/ULPMtAKODZExosntd4ZC72VnvJmDVSxClAYJXRU2h8mXUl3bAuhub/kwMjzdJg
	 4aOvnhtJ5UW2aiA/wURBVJpkmIloAnHuuiSNMbjo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726399AbgBRMz7 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 18 Feb 2020 07:55:59 -0500
Received: from foss.arm.com ([217.140.110.172]:51652 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726043AbgBRMz7 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 18 Feb 2020 07:55:59 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 316511FB;
        Tue, 18 Feb 2020 04:55:59 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A616F3F703;
        Tue, 18 Feb 2020 04:55:58 -0800 (PST)
Date:   Tue, 18 Feb 2020 12:55:57 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Chuanhong Guo <gch981213@gmail.com>
Cc:     linux-mediatek@lists.infradead.org, linux-spi@vger.kernel.org,
        linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] rewrite mtk-quadspi spi-nor driver with spi-mem
Message-ID: <20200218125557.GD4232@sirena.org.uk>
References: <20200215065826.739102-1-gch981213@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="/3yNEOqWowh/8j+e"
Content-Disposition: inline
In-Reply-To: <20200215065826.739102-1-gch981213@gmail.com>
X-Cookie: No alcohol, dogs or horses.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--/3yNEOqWowh/8j+e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Feb 15, 2020 at 02:58:24PM +0800, Chuanhong Guo wrote:

> To keep patchset small for easier reviewing, there will be 3 patchsets
> including this one.
> 1. add the new driver, which is this patchset.
> 2. update existing dts for the new driver:
>    spi-max-frequency is missing in current mtk-quadspi binding. Old
>    driver parses child node manually so it doesn't need this, but
>    new spi-mem driver is probed via spi subsystem which requires the
>    presence of spi-max-frequency. Since this doesn't break old driver
>    support, I'll send this separately as a standalone patch.

This is an ABI break so you shouldn't be doing this, if the existing
binding works it should continue to work.

> 3. removing the old driver. I'll create this commit after 1 and 2 are
>    applied to avoid possible rebasing due to any changes in the old
>    driver.

This isn't great as it means we have a period with two drivers for the
same thing in tree which is at best going to be confusing.  There's no
advantage to splitting this out.

--/3yNEOqWowh/8j+e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5L3twACgkQJNaLcl1U
h9CQ0Af/bCSGtGQh9O/SezBLGjZ59DSJjcG/kJ2CB/e5Ub3WkveUKq3prcIpbWRZ
j7LZ1+3P0+IQJC2b4wWFTf6xOOoucP4Qb1qVBc1HyBt9SrqrrZ3SdEXzhbsYJ1Zq
tLGrQ37qdRhfSpspLm1N3FN+EBZuVW3tYPclxUjkHTE50mu0wmMAk4OXtrbyBKp7
H046klgqVPBXzTlP8mFTtp0/E/hYhrBUTqcEcUBTAw3nCMBMiVxUjdxRx+tB41CR
TBBlM9+VwbxRbrzZC9IL5S+l+Bi9EW2axbZ2zFG7vOTc+AoCIT/PxwyZBshr8Xoh
A7hM2b6D+BSbpRcPwjpZLi3E11d0ug==
=CyQ7
-----END PGP SIGNATURE-----

--/3yNEOqWowh/8j+e--
