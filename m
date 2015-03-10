From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] libfdt: Add fdt_path_offset_namelen()
Date: Tue, 10 Mar 2015 11:17:11 +1100
Message-ID: <20150310001711.GB30335@voom.fritz.box>
References: <1425654758-2575-1-git-send-email-peter@hurleysoftware.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9zSXsLTf0vkW971A"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1425654758-2575-1-git-send-email-peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--9zSXsLTf0vkW971A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 06, 2015 at 10:12:38AM -0500, Peter Hurley wrote:
> Properties may contain path names which are not NUL-terminated.
> For example, the 'stdout-path' property allows the form 'path:options',
> where the ':' character terminates the path specifier.
>=20
> Allow these path names to be used in-place for path descending;
> add fdt_path_offset_namelen(), which limits the path name to 'namelen'
> characters.
>=20
> Reimplement fdt_path_offset() as a trivial wrapper.
>=20
> Signed-off-by: Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>

I think this function is a good idea, however I would like to see a
testcase for it.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--9zSXsLTf0vkW971A
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJU/jgHAAoJEGw4ysog2bOSqpIP/0FyHDhuH2CQnxqw+/l1TjrQ
QnfPskR/q43MXfla0NqqKSvKbz2EwZzq2LryrAyKI8UEp5gXxHG1Sk3cXRYAFSTf
m1gCGU52wK1tiF+nvZyJmylWgtLf9TbfPENa2kpYHov8NdQfN1BHh5Zi4oU3JErA
FfVm2efq+9izypgULvNpOZqxYOPyWuYm/BqsU15uBsC90Yds85/3rusYfnGzlZKz
cKAT6TNilr8k/EMIWyWNdV1JiOLv1HmeUT8kxvO3xWUeCf++sYyTpIB4+fC8pPjr
DtyTtc8QQtZ7D/rD7lQuuXw/myfnKrc9AAfHFmVeN0VcNQ7JHkuZ2pdjhLWg9bY5
+x+SKZdo0qD3GWIGwOdMvHz1TgBcUalf5BtYyfveyA7xRrtNnwpbheoB5RdMlnTB
XC96KoC9uIVcdCgTNVAYvhJ9n41+CgoJdEKvip590sx+THiayQd18aZDneRQdjHv
q82RX+5Pv1tBuvsJ5UzqZPwRqvzvYf4OAd/Xp71czotv70AMljMeL5BWgJ9ZcnA+
5IbyGnYpzwqS3r2tBAcrjVHA0QXTcvnZDeJuifjAB/C8n5w7lT9uUPaJ9bwITrSc
aLWcg6sa/fq5+fDa+ltOfCRjpcH2FgCH09yANhinPOhfJNhko+XFqjBVGvdC9XDQ
VvS76XfrTuY+zcJ8mWje
=jkmI
-----END PGP SIGNATURE-----

--9zSXsLTf0vkW971A--
--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
