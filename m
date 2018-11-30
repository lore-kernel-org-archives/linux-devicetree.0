From: Andreas Kemnade <andreas@kemnade.info>
Subject: Re: [PATCH RFC 4/5] gnss: sirf: add a separate supply for a lna
Date: Fri, 30 Nov 2018 07:38:04 +0100
Message-ID: <20181130073804.1e57226f@kemnade.info>
References: <20181118215801.12280-1-andreas@kemnade.info>
        <20181118215801.12280-5-andreas@kemnade.info>
        <20181127180356.GA32751@localhost>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/BTjEbUtPs1dNVLJ671peYpD"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181127180356.GA32751@localhost>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: johan@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Discussions about the Letux Kernel <letux-kernel@openphoenux.org>
List-Id: devicetree@vger.kernel.org

--Sig_/BTjEbUtPs1dNVLJ671peYpD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, 27 Nov 2018 19:03:57 +0100
Pavel Machek <pavel@ucw.cz> wrote:

> Hi!
>=20
> > Devices might have a separate lna between antenna output of the gps
> > chip and the antenna which might have a separate supply =20
>=20
> Might have.
>=20
> > @@ -340,6 +349,12 @@ static int sirf_probe(struct serdev_device *serdev)
> >  		goto err_put_device;
> >  	}
> > =20
> > +	data->lna =3D devm_regulator_get(dev, "lna");
> > +	if (IS_ERR(data->lna)) {
> > +		ret =3D PTR_ERR(data->lna);
> > +		goto err_put_device;
> > +	}
> > + =20
>=20
> But it is not optional in the code. Probably should be?

well, if it no lna regulator is defined in the dtb, the regulator
framework will return a dummy regulator. devm_regulator_get_optional()
would not do that and would require more error checking in the code.
But if there is some rule which says that devm_regulator_get_optional()
should be used here, I can of course change that.
Before sending a v2, is that the only issue here?

Regards,
Andreas

--Sig_/BTjEbUtPs1dNVLJ671peYpD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE7sDbhY5mwNpwYgrAfb1qx03ikyQFAlwA2swACgkQfb1qx03i
kySlihAAgI5DPKdMqJIbrhgXmk5vhH+z5xvplIxqHczGRwSfYt+7JKNRtJbvGhwX
Pxi4oVEb72fOeNRItULe4/pCsC/G5DY2fYdw5G7iiqbdb1/9PdvXctsop67G0Fvs
P48doJ5eR3XQi8UFGi/jHJ3sWIqVNz9sHTM4yL8kvtVUpfia4+j6ivFZhXgKm8XX
0YTCACWdd4a8wbdZCvQT5oNktirTLsuVHlyR/DlTEzrPD6SpR1J8aFUdo5PbQ/yw
kuwoGZl+vADWcXkW8tyD2ebL1eCu059m652JjNIEtCHz7yihQgRTVpAkIgHL/YXI
V6HgS8Tz3QVMPMbJA5ffwYlEubwFWrdrYaC20C4d2TbxPuosFTXpdnDXxmYKWqHl
XMHiV29o25UscGixG+QHIugHfV9tJpzle6Ogiv/p+HGRvJx39j+sXeioLdDlPmAR
iiORgk2ocZCERYxV+BvzWFX2PRhwQmlhgdEIy9XdC4pQHAKcOV5N3n2+9CSa3ing
5mapahXMe4p3XiNb0LMFcIJtMaI0x01qgB+PfXVXa35tjW3j2pNSOHoC8lQdXSuQ
6U6riISyyKg8QJ8MWugci2xipM1z35pZ52oD9YuvLAcsKgsWGGlEvZ24uCpZW7zG
l8CaQx1YyzChw57BDEWzaUh/+wvtSJqBlFoYnnqDUP+48ST2tR0=
=gVCe
-----END PGP SIGNATURE-----

--Sig_/BTjEbUtPs1dNVLJ671peYpD--
