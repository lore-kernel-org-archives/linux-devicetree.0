Return-Path: <SRS0=ioLT=AU=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FE54C433DF
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Jul 2020 10:47:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EF4A620708
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Jul 2020 10:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594291623;
	bh=6/rApGkbbYST5JvxhRUvbAUGIMJ3KILYpTuJ0fuqsNU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=Duv3SvEYNSBTCtHAOVGWoXfueMKoNizo8XSFG2msZEWQuM3sGcftXaD4SWKvS6ipn
	 FlhntxAp9zbQenFAsk6dOcLCsHE6xlBlJdZpt8BIMEA4GUAOZBdIkK5r5kRbJsSCtp
	 Shu4oy0umj2ysOdUBMXXzQoaIM2muVj9V5eBuozA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726418AbgGIKrC (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 9 Jul 2020 06:47:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:57178 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726302AbgGIKrC (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 9 Jul 2020 06:47:02 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9E429206DF;
        Thu,  9 Jul 2020 10:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594291622;
        bh=6/rApGkbbYST5JvxhRUvbAUGIMJ3KILYpTuJ0fuqsNU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=V99vztrVZEtPZ16vKtfDrScur775LyWVD/FeT2ujdUXaXwnv+wxabLt3zCN5U1A7q
         sRWJWsfAJiUBGnYiz+7pu1qVjwBZu+okaiFZqqJudnE0Cqhy3kP4lafUVlzQ7WbZDp
         d/jpgvuQmhJ5BkJfPy4E4c6hhIfqoPHPw/fiyOm0=
Date:   Thu, 9 Jul 2020 11:46:56 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Tzung-Bi Shih <tzungbi@google.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        ALSA development <alsa-devel@alsa-project.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 0/3] ASoC: mediatek: mt8183: support machine driver for
 rt1015
Message-ID: <20200709104656.GC4960@sirena.org.uk>
References: <20200708113233.3994206-1-tzungbi@google.com>
 <159422758800.28431.1053466753613230176.b4-ty@kernel.org>
 <CA+Px+wXPoW-VU-SXSZoBdMY7zSxWf3qxWJZGOE2hT4riwT8XtA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="JWEK1jqKZ6MHAcjA"
Content-Disposition: inline
In-Reply-To: <CA+Px+wXPoW-VU-SXSZoBdMY7zSxWf3qxWJZGOE2hT4riwT8XtA@mail.gmail.com>
X-Cookie: You will be married within a year.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--JWEK1jqKZ6MHAcjA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 09, 2020 at 10:31:04AM +0800, Tzung-Bi Shih wrote:
> On Thu, Jul 9, 2020 at 1:00 AM Mark Brown <broonie@kernel.org> wrote:

> > [2/3] ASoC: mt8183: add compatible string for using rt1015
> >       commit: ab1ba5252f611c0efabca5fca81f5717445da47b

> I am curious about the 2nd patch's title.  Did you change it from
> "dt-bindings" to "ASoC" intentionally?

Yes.

--JWEK1jqKZ6MHAcjA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8G9Z8ACgkQJNaLcl1U
h9CenAf/UZi7LX4cjS0ryll6n/UDNUo7KrxtJ3eY8wRmFfmNLnHFu/rSsRkpgIGk
h2YIl2qhHps9r8Ru5m0G2Flj4B5e9GjKAtEjKB3zqKHY+wCKt+shVOAH9nKw4tF9
cXZl7Mnap837vbzqtO4443S/N9Xpa2RfPdLC7/7R+veTbb7f/+kM+yYM9DOE4FiH
JWhPMrJUDVF6bTcHG6N/n2/9mmv25rhkTnv/ogYVGc4ekZe6nPc0QzU9UCIbGGHd
zMUXFSJwt6VtydcZlvIwh+OdjO5fAvz2YSw6hvAXR+qCFmPrwVVgPJqgmyA/PlXZ
eXBdS/A4GQ84XKWvbmrpJVUIb0SSkg==
=yswb
-----END PGP SIGNATURE-----

--JWEK1jqKZ6MHAcjA--
