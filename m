From: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
Subject: Re: [PATCH 02/12] pinctrl: Add core pinctrl support for Aspeed SoCs
Date: Mon, 15 Aug 2016 10:06:52 +0930
Message-ID: <1471221412.27272.76.camel@aj.id.au>
References: <1468994313-13538-1-git-send-email-andrew@aj.id.au>
	 <1468994313-13538-3-git-send-email-andrew@aj.id.au>
	 <CACRpkdZ0p+jNHBV1AqhVWQ2Q8RRrHVfsAz3XU3_+f6My22=Zxg@mail.gmail.com>
	 <1470962022.27272.68.camel@aj.id.au>
	 <CACRpkdaN=wR4amskqMapTJzaTTMJZe2EQWRnyLMQkq_zuhr2eA@mail.gmail.com>
	 <1471049894.12231.41.camel@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-Kkmm5pzJ9XyCVSXgcQ3s"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1471049894.12231.41.camel-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--=-Kkmm5pzJ9XyCVSXgcQ3s
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2016-08-13 at 10:58 +1000, Benjamin Herrenschmidt wrote:
> On Fri, 2016-08-12 at 15:18 +0200, Linus Walleij wrote:
> >=20
> > I would probably prefer that option (introduce another field)
> > but you should make the overall decision, it's no strong opinion
> > from my side.
> >=20
> > >=20
> > > Would it be acceptable to document that requirement?
> It might make it a bit less nasty (and easier to change later on
> if necessary) to use some kind of:
>=20
> 	bool ast_signal_is_gpio(...)
>=20
> And stick the strcmp in there.

Yep, I'll do so for v2.

Cheers,

Andrew
--=-Kkmm5pzJ9XyCVSXgcQ3s
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXsQ6kAAoJEJ0dnzgO5LT5aNgP/3haTd+82bDoeVfUYU6v9yNk
FRY+AdbZDoZcD0szs62isNzp6OxmmUpzgKoP32WVZ1ly6YnUjqNFXGytiQYdjoeN
qxexicf56ICRC+KIevpQPFOk72Jyifj2e0YWFDAc3OLrEfd9wan/1kfvr06cb9PE
GL+TraBA9YWQ3yo7S0KirAYbY4uvaM63vJ7YcrxeoazU6l2A5wh+k+a1cXp7LXdD
llfdnc+2/v8RAfon+nSm0MYBEa6AQJoUAEdE3z+9+k/VfLNzMpqTDFesvEMXfIAd
UOLWXaYEg76wrH39gj2QDPCg112PgxjVGmbz4lRtrddzXU7/umtVbYWudNOOQtUV
r28Lky6RlmQsZZ7we9hlbI8oqr8whJTmVXUVzADklzYLxdXSNYY8gFbZ7QyTti4y
NNPvmHGhMVI5MtJ5zU+7kGc66qn4H3GIBfWjsRITPr14GCaz3DDi5Sq10Ui9PMki
bU87q+3326woIH4IKZB+T4RyppmHRoRqvlDwVawukyIKgGP3f4uPbJ1H5YrMYNdV
1kb0Z3o+1+NRgSPIWJeVrHK0S9kCw+fBtjm79Q/emxvP4v45R5313UdRP+cqCkUT
PcqUbXWzcOmBFdaHVADEpxVm7HhSdEkle7/5mBthdC8Vba2+PgmpXZwq6kK35SfW
lhU5QWdrdkJ/W89kUV+k
=5CeO
-----END PGP SIGNATURE-----

--=-Kkmm5pzJ9XyCVSXgcQ3s--

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
