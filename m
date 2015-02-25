From: Felipe Balbi <balbi@ti.com>
Subject: Re: SPDX-License-Identifier
Date: Wed, 25 Feb 2015 16:00:47 -0600
Message-ID: <20150225220047.GS11136@saruman.tx.rr.com>
References: <5306F458.9010706@monstr.eu>
 <20140221160442.GA17506@kroah.com>
 <5307790A.4050806@monstr.eu>
 <20140221161246.GM31902@saruman.home>
 <53077C5F.9000407@monstr.eu>
 <54CF9B12.2070807@denx.de>
 <20150202160622.GA9852@kroah.com>
 <54D24BA4.3070509@denx.de>
 <20150205064130.GB22075@kroah.com>
 <20150225214950.GB29527@amd>
Reply-To: <balbi@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yBTw3iMQSKDA2CaE"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150225214950.GB29527@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@denx.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Stefan Roese <sr@denx.de>, monstr@monstr.eu, balbi@ti.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Wolfgang Denk <wd@denx.de>
List-Id: devicetree@vger.kernel.org

--yBTw3iMQSKDA2CaE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 25, 2015 at 10:49:51PM +0100, Pavel Machek wrote:
> Hi!
>=20
> > > >Is one tag per directory sufficient?  Is one tag per file sufficient?
> > > >How about one tag per package?  If package, then isn't a single tag =
for
> > > >the whole kernel source tree sufficient, as we all know the overall
> > > >license for the kernel source tree.
> > >=20
> > > We really need one tag per file.
> >=20
> > I fail to see the justification for this, why?  Why not per directory?
> > Why not per function?  Why not per driver?  Why not per line?  Why not
> > per project?  Who has dictated this seemingly arbitrary rule?
>=20
> That's how licenses are done today.
>=20
> Why would I like to see SPDX?
>=20
> So that GPL header at begining of each file becomes one line... and so
> that if it is BSD/GPL dual licensed is plain to see, and I don't have
> to read the notices saying "oh this is gpl.. but if you want to,
> delete gpl above and use license below".

why isn't git grep -e 'MODULE_LICENSE' enough ? It's also a single line
and gives you the license for that driver.

> > Our DCO process ensures that.
> >=20
> > > - Some parts of the Linux source code are also used by other projects.
> > >   Or are derived from other projects. Because of this they are
> > >   explicitly licensed under different licenses than the GPLv2
> > >   (compatible to it though of course). Or are dual-licensed. So that
> > >   they can be used by these other projects.
> >=20
> > That's fine, we encourage that and want to see that happen.  How will
> > SPDX change that at all?  It's obvious as to the license of the files
> > that this happens with, why do anything extra?
>=20
> Well, sometimes parsing license agreements at the top of file is
> interesting, that's where SPDX would help, and that's why having
> single SPDX per linux kernel would not work.

if you can parse SPDX, why can't you parse MODULE_LICENSE() ?

--=20
balbi

--yBTw3iMQSKDA2CaE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJU7kYPAAoJEIaOsuA1yqREmMIQAJ9kkeWedbxCU2yL54kvQ59m
aIyfxPc0sPJAB1ZDEmXKYGsVS8abVsPjbK83HNIdsbM33RD4tMDACY5e/rgW5XhO
uN3+E6gzx4kM0Hjlaw4X1jMKt4hEXt1XkC/5EHxFOVAdqy/ng//Z2VZYvDLom+dK
Vfo/CeFKEzcGqEe56OkPtkr8n5Jtm+GDqeaSPShKEbrSgtvVZNHC79GGzrfFUfrW
L2b2UipEwrW5v1TXPY5LCXdEe1agoatXNox/R+ipXljJpa/xIqxtapqPeANWU6/p
kz69NjZxjilohwmBp+8fMjSvVqXcXWUJDi73jJnmOFamjJy4ciGWOHSS9GQob/de
6Ky4g8gmj6sg/SGiNsKLKOtgqAS/KnlUsyjC7V8uZKoH3CmlpptzKyUky0IN4Y3N
k6JxoGO2FcoEzgSrEi5s7XJYd7MYCU4Hs++gZ8N9g3pjWW+ePrXLw8KA5vzCRMl8
Hfh3nUU4dH2WE6KZvlAxG/OCy15OXVSYvbloSvdQ0ib7Q4K0NQT6J+O1cuit9fkL
VY6Hc+uBDK3+jGHG7h1vrt0CfEEJTk3yCUWa7t/t7VNhC60+kfhXELQ6++f9qZTU
RDq5iD9P8ur5/ucztS3RS+o0/kLTshnbGuPWWwUmO6fB/Ujf99KET2RANFCVq/Df
cWRkjEwjj8iNxglyyR2b
=HdJ3
-----END PGP SIGNATURE-----

--yBTw3iMQSKDA2CaE--
