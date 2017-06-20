From: Pavel Machek <pavel@ucw.cz>
Subject: Shawn Guo: your attetion is needed here Re: [PATCH v8 00/34] i.MX
 Media Driver
Date: Tue, 20 Jun 2017 10:29:33 +0200
Message-ID: <20170620082933.GA31799@amd>
References: <1496860453-6282-1-git-send-email-steve_longerbeam@mentor.com>
 <e7e4669c-2963-b9e1-edd7-02731a6e0f9c@xs4all.nl>
 <c0b69c93-b9cd-25e8-ea36-fc0600efdb69@gmail.com>
 <e4f152de-6e75-7654-178e-e6dcf9ad12f3@xs4all.nl>
 <43887f25-bb73-9020-0909-d275c319aaad@mentor.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6482425484587664972=="
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <43887f25-bb73-9020-0909-d275c319aaad@mentor.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Cc: mark.rutland@arm.com, andrew-ct.chen@mediatek.com, minghsiu.tsai@mediatek.com, sakari.ailus@linux.intel.com, nick@shmanahar.org, songjun.wu@microchip.com, Hans Verkuil <hverkuil@xs4all.nl>, Steve Longerbeam <steve_longerbeam@mentor.com>, robert.jarzmik@free.fr, devel@driverdev.osuosl.org, markus.heiser@darmarIT.de, laurent.pinchart+renesas@ideasonboard.com, shuah@kernel.org, linux@armlinux.org.uk, geert@linux-m68k.org, Steve Longerbeam <slongerbeam@gmail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de, arnd@arndb.de, mchehab@kernel.org, bparrot@ti.com, robh+dt@kernel.org, horms+renesas@verge.net.au, tiffany.lin@mediatek.com, linux-arm-kernel@lists.infradead.org, niklas.soderlund+renesas@ragnatech.se, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, jean-christophe.trotin@st.com, p.zabel@pengutronix.de, fabio.estevam@nxp.com
List-Id: devicetree@vger.kernel.org


--===============6482425484587664972==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9amGYk9869ThD9tj"
Content-Disposition: inline


--9amGYk9869ThD9tj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >> But as Pavel pointed out, in fact we are missing many
> >> Acks still, for all of the dts source changes (patches
> >> 4-14), as well as really everything else (imx-media staging
> >> driver patches).
> >=20
> > No Acks needed for the staging part. It's staging, so not held
> > to the same standards as non-staging parts. That doesn't mean
> > Acks aren't welcome, of course.
>=20
> Acks are wanted for particular i.MX DTS changes including device
> tree binding descriptions.
>=20
> Shawn, please bless the series.

Hmm. I changed the subject to grab Shawn's attetion.

But his acks should not be needed for forward progress. Yes, it would
be good, but he does not react -- so just reorder the series so that
dts changes come last, then apply the parts you can apply: driver can
go in.

And actually... if maintainer does not respond at all, there are ways
to deal with that, too...

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--9amGYk9869ThD9tj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAllI3OwACgkQMOfwapXb+vJsUwCeN0FaxtsVSviD6RVvAtcJrxe/
1e0An1zHdVdNIngiC+NTdrKsV/VOnJeu
=g3WY
-----END PGP SIGNATURE-----

--9amGYk9869ThD9tj--

--===============6482425484587664972==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devel mailing list
devel@linuxdriverproject.org
http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel

--===============6482425484587664972==--
