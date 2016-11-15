From: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Subject: Re: [PATCH v4 2/2] Add support for OV5647 sensor
Date: Tue, 15 Nov 2016 15:52:25 +0100
Message-ID: <20161115145225.GA7746@amd>
References: <cover.1479129004.git.roliveir@synopsys.com>
 <36447f1f102f648057eb9038a693941794a6c344.1479129004.git.roliveir@synopsys.com>
 <20161115121032.GB7018@amd>
 <3b6863c4-e239-7b66-1d96-7f0326f507c5@roeck-us.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="NzB8fVQJ5HfG6fxh"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <3b6863c4-e239-7b66-1d96-7f0326f507c5-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: Ramiro Oliveira <Ramiro.Oliveira-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, dheitmueller-eb9eJ82Ua7k9XoPSrs7Ehg@public.gmane.org, slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, robert.jarzmik-GANU6spQydw@public.gmane.org, pali.rohar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, CARLOS.PALMINHA-HKixBCOQz3hWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org


--NzB8fVQJ5HfG6fxh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue 2016-11-15 05:50:32, Guenter Roeck wrote:
> On 11/15/2016 04:10 AM, Pavel Machek wrote:
> >Hi!
> >
> >>Add support for OV5647 sensor.
> >>
> >
> >>+static int ov5647_write(struct v4l2_subdev *sd, u16 reg, u8 val)
> >>+{
> >>+	int ret;
> >>+	unsigned char data[3] =3D { reg >> 8, reg & 0xff, val};
> >>+	struct i2c_client *client =3D v4l2_get_subdevdata(sd);
> >>+
> >>+	ret =3D i2c_master_send(client, data, 3);
> >>+	if (ret !=3D 3) {
> >>+		dev_dbg(&client->dev, "%s: i2c write error, reg: %x\n",
> >>+				__func__, reg);
> >>+		return ret < 0 ? ret : -EIO;
> >>+	}
> >>+	return 0;
> >>+}
> >
> >Sorry, this is wrong. It should something <0 any time error is detected.
> >
>=20
> It seems to me that it does return a value < 0 each time an error is dete=
cted.

Yep, you are right, sorry, I misparsed the code.

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--NzB8fVQJ5HfG6fxh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlgrISkACgkQMOfwapXb+vKuygCeLdkwDem4GhGA3D0QH6ipdj6T
P4gAn3hB/BjOzzahMfPEcuIDwrA6PEoX
=Oihm
-----END PGP SIGNATURE-----

--NzB8fVQJ5HfG6fxh--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
