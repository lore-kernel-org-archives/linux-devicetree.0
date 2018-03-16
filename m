Return-Path: <SRS0=C/sM=GG=vger.kernel.org=devicetree-owner@kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:33910 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751902AbeCPVdk (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 16 Mar 2018 17:33:40 -0400
Date: Fri, 16 Mar 2018 22:33:38 +0100
From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v3] leds: add LED driver for CR0014114 board
Message-ID: <20180316213338.GA5116@amd>
References: <20180312155829.12365-1-oleg@kaa.org.ua>
 <20180313124548.12074-1-oleg@kaa.org.ua>
 <20180316211424.GB6069@amd>
 <5e8476ed-fce8-5ff3-6a98-9f1eb244adcd@kaa.org.ua>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="d6Gm4EdcadzBjdND"
Content-Disposition: inline
In-Reply-To: <5e8476ed-fce8-5ff3-6a98-9f1eb244adcd@kaa.org.ua>
Sender: devicetree-owner@vger.kernel.org
To: Oleh Kravchenko <oleg@kaa.org.ua>
Cc: devicetree@vger.kernel.org, linux-leds@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--d6Gm4EdcadzBjdND
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri 2018-03-16 23:29:22, Oleh Kravchenko wrote:
> I can track state of recount stuff inside private struct,
> it will allow to drop work and timer fields.
>=20
> You will agree with it?

That will not help much. Would it be possible to get away without the
timer, for example? Just schedule work for the future?

									Pavel
								=09
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--d6Gm4EdcadzBjdND
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlqsODIACgkQMOfwapXb+vKDmgCeK80SqayzXndsaKpDlJpbCxI8
hKQAoMPNY1mIfQv92M0yR/vC65R4ke7/
=7fOz
-----END PGP SIGNATURE-----

--d6Gm4EdcadzBjdND--
