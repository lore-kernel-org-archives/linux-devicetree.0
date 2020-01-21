Return-Path: <SRS0=tTw7=3K=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C230C2D0CE
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Jan 2020 09:16:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 286B520882
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Jan 2020 09:16:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729107AbgAUJQw (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 21 Jan 2020 04:16:52 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:42442 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725789AbgAUJQw (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 21 Jan 2020 04:16:52 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 6CDDB1C036D; Tue, 21 Jan 2020 10:16:50 +0100 (CET)
Date:   Tue, 21 Jan 2020 10:16:49 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org,
        =?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Merlijn Wajer <merlijn@wizzup.org>
Subject: Re: [PATCH] ARM: dts: motorola-cpcap-mapphone: Configure calibration
 interrupt
Message-ID: <20200121091649.GA6934@amd>
References: <20200119194501.17125-1-tony@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="/04w6evG8XlLl3ft"
Content-Disposition: inline
In-Reply-To: <20200119194501.17125-1-tony@atomide.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--/04w6evG8XlLl3ft
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun 2020-01-19 11:45:01, Tony Lindgren wrote:
> We added coulomb counter calibration support With commit 0cb90f071f73
> ("power: supply: cpcap-battery: Add basic coulomb counter calibrate
> support"), but we also need to configure the related interrupt.
>=20
> Without the interrupt calibration happens based on a timeout after two
> seconds, with the interrupt the calibration just gets done a bit faster.
>=20
> Cc: Merlijn Wajer <merlijn@wizzup.org>

Acked-by: Pavel Machek <pavel@ucw.cz>

Not for stable.

									Pavel
								=09
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--/04w6evG8XlLl3ft
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl4mwYEACgkQMOfwapXb+vKqOgCgvto+aTKjcR8Gywm33f1WWaJ7
p0QAoJuwuy2F8RuJIOhzUXq9BFuWSZqZ
=Qn6E
-----END PGP SIGNATURE-----

--/04w6evG8XlLl3ft--
