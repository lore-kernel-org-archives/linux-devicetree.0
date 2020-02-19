Return-Path: <SRS0=2Ix+=4H=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56096C34047
	for <linux-devicetree@archiver.kernel.org>; Wed, 19 Feb 2020 12:06:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2BD6D2465D
	for <linux-devicetree@archiver.kernel.org>; Wed, 19 Feb 2020 12:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1582113975;
	bh=IpLhAi9AooA4Gf4th3c5XahCCwCq9g4w7rArbqpTPwM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=Y5J/RsD5NcBBeJF9DwFdTiGJt6YZHADnAl4vXnfHyZpc9Z2MTBPQVgVskxSxEcMl8
	 7fyW1mLn5w1CkpATAGBs8jdfqoFi8h2+dLryd4QAhXkxUzNFYeLLBmLeIHvpQVgYUe
	 n4n8W8Xm0QQNUb3l4Zb6RckNFQLTt6efIYkQR0Kw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726617AbgBSMGO (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 19 Feb 2020 07:06:14 -0500
Received: from foss.arm.com ([217.140.110.172]:47502 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726495AbgBSMGO (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 19 Feb 2020 07:06:14 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E6B9731B;
        Wed, 19 Feb 2020 04:06:13 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6A28E3F6CF;
        Wed, 19 Feb 2020 04:06:13 -0800 (PST)
Date:   Wed, 19 Feb 2020 12:06:11 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     lgirdwood@gmail.com, heiko@sntech.de, alsa-devel@alsa-project.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-rockchip@lists.infradead.org, pgwipeout@gmail.com
Subject: Re: [PATCH v2 2/3] ASoC: rockchip: Make RK3328 GPIO_MUTE control
 explicit
Message-ID: <20200219120611.GB4488@sirena.org.uk>
References: <cover.1581376744.git.robin.murphy@arm.com>
 <5bc383ed1832f0f5d1dcb3c97ad92fd68e5217e3.1581376744.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="yNb1oOkm5a9FJOVX"
Content-Disposition: inline
In-Reply-To: <5bc383ed1832f0f5d1dcb3c97ad92fd68e5217e3.1581376744.git.robin.murphy@arm.com>
X-Cookie: FORTH IF HONK THEN
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--yNb1oOkm5a9FJOVX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 18, 2020 at 09:31:59PM +0000, Robin Murphy wrote:

>  - add fallback case to avoid possible Rock64 regressions

This should really have been called out in the changelog, were I reading
this cold I might've stopped at the changelog and said you needed to
keep the ABI stable for old boards.

--yNb1oOkm5a9FJOVX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5NJLMACgkQJNaLcl1U
h9A6EQf+M4FxgJh7NoGwjteEBX6uwLvxHTrgo0677EFqqDjc/b5TNCDU720Q7dbi
Mead2pPB06lQOHGO2piOu+A55lWuHX17hfnh9t1AECnZmZDQv/kTgZ/qb/yYU02d
rJLGP0+Uy8bYU3SAzIGZyC0RJ3MydsaHp5/w3qXNiTQ/RB90k4CkqeYpCw0uT9yX
8fgIUqUdiOgOvGjDn91teqXcoAjIU7VXfvz6yijqhqNynx1ybjgXklR1TJ2S2bZc
kY35dvMUXpVraf/NcNJMYZVBaMRHMqj7LmRGUUAcVZZ982bWNAXx1FOPzY19ri6v
NZyWPTowIagAhp65YyKen9nUh3a4sA==
=Inf+
-----END PGP SIGNATURE-----

--yNb1oOkm5a9FJOVX--
