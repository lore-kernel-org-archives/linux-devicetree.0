From: Quentin Schulz <quentin.schulz@bootlin.com>
Subject: Re: [PATCH v2 0/5] net: phy: mscc: add support for VSC8584 and
 VSC8574 Microsemi quad-port PHYs
Date: Mon, 8 Oct 2018 09:06:13 +0200
Message-ID: <20181008070613.oblez3hryx5cxk3v@qschulz>
References: <20181004131710.14978-1-quentin.schulz@bootlin.com>
 <20181005.144243.1971242720262167660.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="34ipe57f45vaxlwi"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181005.144243.1971242720262167660.davem@davemloft.net>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>
Cc: alexandre.belloni@bootlin.com, ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, andrew@lunn.ch, f.fainelli@gmail.com, allan.nielsen@microchip.com, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, thomas.petazzoni@bootlin.com, antoine.tenart@bootlin.com
List-Id: devicetree@vger.kernel.org


--34ipe57f45vaxlwi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

On Fri, Oct 05, 2018 at 02:42:43PM -0700, David Miller wrote:
> From: Quentin Schulz <quentin.schulz@bootlin.com>
> Date: Thu,  4 Oct 2018 15:17:05 +0200
>=20
> > I suggest patches 1 to 3 go through net tree and patches 4 and 5 go
> > through MIPS tree. Patches going through net tree and those going throu=
gh
> > MIPS tree do not depend on one another.
>=20
> Sounds like a good plan but patches 1-3 do not apply to net-next, please
> respin.
>=20

Could it be because we're missing the patch series dependency? This
series depends on
https://lore.kernel.org/lkml/20181004124728.9821-1-quentin.schulz@bootlin.c=
om/
which isn't merged yet.

I'll address the comment in the aforementioned patch series ASAP, send a
new version and respin this patch series at the same time.

Thanks,
Quentin

--34ipe57f45vaxlwi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEXeEYjDsJh38OoyMzhLiadT7g8aMFAlu7AeUACgkQhLiadT7g
8aO+Nw/8CnNPFt7oJHFjvbYUPmOcH/DMNApRmyGMm3buPau5JPLDtgI/Sy9/b7ML
rEV1cXtD54Owl57HFklT+IlpP9H0dFRg1Kcju1IiouVPemzuPOn6vjwNpEvDq3fp
9a1k4sPXTwOhbNGhZmcdunetWgmOLBbTi3C8PrbLp/vZAKVG877ExivPn2aID3u7
oC5z39L9jYKwJW31gJgvXNb7a5y0f3f+AHjHK1VVwYdHOWH8MS29lEj1T7svqj4u
XQvhba8gnfR2+e59Bf+1tviGo+HPVKrosOrCV9W/tyWZsJTut/cv79Tqs6o0vpBv
UlCB+epffuntLACFhU+Z05RpLWHaW9iTHW5unanrvK5Xd7Nl/BAZGU7XAd070f9/
+GaTqqbw2HOD+QTfCA7O/agX+inJ0SLZVOM46rOo0r9/A1Bf0njKlwQlsZ8HZFM9
5s4hNljo3RqE5r15qz7NGusc+sYKlYp9hqyD/ICYq6BHoXnnfO2GU/T32Fpfj4Uk
lbMRy6zA082/r8Idbko9ppAYTagOEIgHfoxGJtxUY8FbOeS3vqIjJ0BqqGTYcRAE
1b1ry57MwzlGvtrLd8zlE2PVSuPIyd5h0I2HjZonQBelRyL2SZVdz7p3DYIIlWT5
eDyTHXWFKjo+/ffeLuTPm0wf9XtMo+Mb9cFSRlE8NBsoKjEdk84=
=LbGF
-----END PGP SIGNATURE-----

--34ipe57f45vaxlwi--
