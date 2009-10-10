From: Wolfram Sang <w.sang@pengutronix.de>
Subject: Re: [RFC] scripts/get_maintainer: add emails based on keywords in
	the patch
Date: Sat, 10 Oct 2009 11:03:02 +0200
Message-ID: <20091010090302.GA11576@pengutronix.de>
References: <1255084379-12954-1-git-send-email-w.sang@pengutronix.de>
	<1255087406.16347.108.camel@Joe-Laptop.home>
	<1255114905.16347.137.camel@Joe-Laptop.home>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4995955202718623916=="
Return-path: <linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <1255114905.16347.137.camel@Joe-Laptop.home>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org
To: Joe Perches <joe@perches.com>
Cc: linuxppc-dev@ozlabs.org, devicetree-discuss@ozlabs.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--===============4995955202718623916==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mYCpIKhGyMATD0i+"
Content-Disposition: inline


--mYCpIKhGyMATD0i+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> Perhaps it's better to use the existing MAINTAINERS file
> and extend it with a new "K:" for keyword entry.

Yeah, makes sense to have everything in one file.

> +	K: Keyword perl regex pattern to match content in patch
> +	   All patterns are surrounded by "\b"
> +	   for instance: K: of_get_profile
> +	   will match patches that contain the word "of_get_profile"

=2E..in the lines which are changed?

> +OPEN FIRMWARE DEVICE TREE
> +L:	devicetree-discuss@lists.ozlabs.org
> +S:	Odd Fixes

Maintained, I'd say. Especially as Grant Likely recently said he wants to t=
ake care about OF.

> +K:	of_get_property

F: drivers/of/

Will check the script later this weekend.

Thanks,

   Wolfram

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--mYCpIKhGyMATD0i+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkrQTcYACgkQD27XaX1/VRucqQCfZdjsp0AVO2Y30Kcc4U0WFp2N
lXIAoIwf4CTFMevnXhrpIHOgfc685loC
=4dNO
-----END PGP SIGNATURE-----

--mYCpIKhGyMATD0i+--

--===============4995955202718623916==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linuxppc-dev mailing list
Linuxppc-dev@lists.ozlabs.org
https://lists.ozlabs.org/listinfo/linuxppc-dev
--===============4995955202718623916==--
