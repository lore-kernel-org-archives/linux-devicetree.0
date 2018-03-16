Return-Path: <SRS0=C/sM=GG=vger.kernel.org=devicetree-owner@kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:34719 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750826AbeCPWKY (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 16 Mar 2018 18:10:24 -0400
Date: Fri, 16 Mar 2018 23:10:22 +0100
From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v3] leds: add LED driver for CR0014114 board
Message-ID: <20180316221022.GC6069@amd>
References: <20180312155829.12365-1-oleg@kaa.org.ua>
 <20180313124548.12074-1-oleg@kaa.org.ua>
 <20180316211424.GB6069@amd>
 <5e8476ed-fce8-5ff3-6a98-9f1eb244adcd@kaa.org.ua>
 <20180316213338.GA5116@amd>
 <d676d163-49ea-0164-d399-1f6d50767125@kaa.org.ua>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="Pk6IbRAofICFmK5e"
Content-Disposition: inline
In-Reply-To: <d676d163-49ea-0164-d399-1f6d50767125@kaa.org.ua>
Sender: devicetree-owner@vger.kernel.org
To: Oleh Kravchenko <oleg@kaa.org.ua>
Cc: devicetree@vger.kernel.org, linux-leds@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--Pk6IbRAofICFmK5e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri 2018-03-16 23:40:36, Oleh Kravchenko wrote:
> Did you mean to do "recount" every 1000 brightness changes?

If that works, yes.

My idea was... you are already using schedule_work, so why not
schedule_delayed_work() and get rid of timer?

https://static.lwn.net/images/pdf/LDD3/ch07.pdf

									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--Pk6IbRAofICFmK5e
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlqsQM4ACgkQMOfwapXb+vJeswCeJ13FWNp/S3bVw14LZXHdVby8
lgkAnRehYmgie0TMGZhj8wDmmxiQdO5e
=kmyg
-----END PGP SIGNATURE-----

--Pk6IbRAofICFmK5e--
