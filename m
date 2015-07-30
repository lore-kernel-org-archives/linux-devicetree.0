From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v8 00/23] usb gadget update for OTG 2.0
Date: Wed, 29 Jul 2015 21:11:41 -0500
Message-ID: <20150730021141.GB3811@saruman.tx.rr.com>
References: <1437622667-6735-1-git-send-email-jun.li@freescale.com>
 <20150727072157.GA20654@shlinux2>
 <20150729150427.GA32418@saruman.tx.rr.com>
 <20150729232401.GA8175@shlinux2>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tsOsTdHNUZQcU9Ye"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150729232401.GA8175@shlinux2>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Li Jun <b47624-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, robh+d-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, macpaul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rogerq-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

--tsOsTdHNUZQcU9Ye
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 30, 2015 at 07:24:03AM +0800, Li Jun wrote:
> On Wed, Jul 29, 2015 at 10:04:27AM -0500, Felipe Balbi wrote:
> > On Mon, Jul 27, 2015 at 03:21:59PM +0800, Peter Chen wrote:
> > > On Thu, Jul 23, 2015 at 11:37:24AM +0800, Li Jun wrote:
> > > > Change for v8:
> > > > - Add Peter's ACk for chipidea driver; and Roger's Reviewed-by for =
patch
> > > >   07, 21~23.
> > > > - Add ci->is_otg condition before enable ci->gadget.is_otg for chip=
idea
> > > >   driver in patch 8.
> > > >=20
> > >=20
> > > Hi Felipe,
> > >=20
> > > For chipidea patches in this series, help to queue them in your tree=
=20
> > > please, thanks.
> >=20
> > all there, please make sure they're correct. There were so many versions
> > of this series that I might have picked up the wrong one :-p
> >=20
>=20
> Patch [8/23]: "usb: chipidea: set usb otg capabilities", you picked up th=
e V7,
> I have a small change for V8, others are correct.

Can you send an incremental diff, please ?

--=20
balbi

--tsOsTdHNUZQcU9Ye
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVuYfdAAoJEIaOsuA1yqREKe0P/2r9Hd6fx6/d7s6dB7qAEkLJ
5n2u4h9FuTvC/pC5inQQmmgNqH7NgEX8SPnzdeLn9yFkWAQGE19ogapaYtZ6sKh5
w7gwStcBvuuXnKKYjTg4VLs0yTwH+xZX3Wmj8ZQ4tUaisbj8xdegMNf/mkc8DjkA
fxYJzlZ+ByqqvQVOisI63XatM+x7QhJwoKBZAUQpzGpxaJgNY/sM5vpgRKUooPS8
m9tcaH0lH5/3tFhu5jUfx0tMtECrvQLI1jzl3nTty03NwMQZgi22U434/5/fJlL8
WOmzeLPAGBbL4mNk4qDz6ViZkp51Jwqvr1FFtWdyqHhEF5Ephx8dS/4MoWY7gFrs
6UuLKMXqPd/oIaQQ5ZYT+FxLu9WOPjloVoLiv84w0N4jmFb71psSpkel0JiEDZv7
jeSbtP1IxRVOcnX4FxClv7snYlWGvAxLKKN3/UKp/4Zuv+Fd+3JTj/xsS2reKp/2
FNJNvwBwiSi1WSjK/xE+yb8J4WbczJP7LifkUpw8VDUye34shjgMn0wQCdyZMxEW
oZg6f0cJtDKWV2x+zxT0UrWzgc5l3OPWLHGQQBe4KeIPNzTynHmWwjb6LbAZLssj
3fFx+C8pi+Tf6qJyK5JD+f8qktg5HDcbxxTjQmQdNfQ+0pAov7F/IktEpGdGIu3b
6599zxvqNHHdqkWqSm9r
=rcry
-----END PGP SIGNATURE-----

--tsOsTdHNUZQcU9Ye--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
