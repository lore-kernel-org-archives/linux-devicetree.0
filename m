From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sun7i: Add Goodix GT911 nodes for Wexler
 TAB7200
Date: Mon, 13 Apr 2015 18:09:51 +0200
Message-ID: <20150413160951.GJ29832@lukather>
References: <1427789897-4085-1-git-send-email-mamlinav@gmail.com>
 <20150331144338.GG23664@lukather>
 <20150331221420.3b65d2540c7dbe1d12611e12@gmail.com>
 <20150402092259.GK23664@lukather>
 <20150411191816.cdc5ec802b01028eb2913906@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="x+WOirvrtTKur1pg"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150411191816.cdc5ec802b01028eb2913906-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Aleksei Mamlin <mamlinav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--x+WOirvrtTKur1pg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 11, 2015 at 07:18:16PM +0300, Aleksei Mamlin wrote:
> On Thu, 2 Apr 2015 11:22:59 +0200
> Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
>=20
> > On Tue, Mar 31, 2015 at 10:14:20PM +0300, Aleksei Mamlin wrote:
> > > On Tue, 31 Mar 2015 07:43:38 -0700
> > > Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> > >=20
> > > > Hi,
> > > >=20
> > > > On Tue, Mar 31, 2015 at 11:18:17AM +0300, Aleksei Mamlin wrote:
> > > > > This patch adds nodes for the Goodix GT911 touchscreen controller=
 found
> > > > > on the Wexler TAB7200 tablet. Controller uses one of following I2C
> > > > > addresses: 0x5d or 0x14, so just add two nodes.
> > > >=20
> > > > In which case are these different addresses encountered? Different
> > > > revisions of the same board?
> > >
> > > According to the datasheet it is a feature of the controller.=20
> > > The address(0x5d or 0x14) can be configured using a reset sequence,
> > > which has not yet been implemented in the driver.
> >=20
> > Which address is set up by the bootloader then?
>
> I assume that bootloader(u-boot) didn't sets up any address, but touchscr=
een
> controller usually uses 0x5d. Sometimes, after hard reset, it uses 0x14.
> For this we need nodes on both adresses.

I'm confused, who changes that address then?

The controller itself?

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--x+WOirvrtTKur1pg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVK+pOAAoJEBx+YmzsjxAgxS4P/jC5ztpUmNEx/cyoxng9JyE7
S/GCTj9EDhK6klWfkgZPgJjjDf6yLHIPsAmnVXU9/U5WDtpx3m2KlhkdxVTJiQEG
9NImXja8uAbi3SnTXTumXKqPV2cpTSTSRM2T+uToElCRLb7ObXzFwfvJL0mYoV2Z
9NN0KIBJqP78sHsRczAb5j5hidIOzcG4v/TGRMH7rbQLieUgSECTzEiKlvdeypEv
wxN2kUawbTKnU7+EyDoB/m7n0CyV2A+/PtCM2CkUA7TiI9TYKeZcA0+eazEcyxba
mv5p3H71ZtoUstOk5JfKzVeQKCSGT9CDHQJy2XJPFOdq0lWlWQZLSS/IyyQ9n+GO
g4RPpmasTcxlY/Hwvu018hy1UlZFupm45B64P9yUG1KWdPK15U1rTz3kNrKBErKq
/l+vI75TO65vG0GVDAdRTu9/chs+HFsXLQnUWVGUY+jpN9ShtlOQk/Npj2Lafq9t
7w50sQ6BCDZuDYoKoBRAAZaVGJVrYKV6h/58ZCw0ztViuuCdr+hr8uB3HiTcx8Zd
fVlJxe7wQUDMoHQ6yHFXgEEhzW7TcV/huhw9SC8RNWAIgGq3W5zU1U3SGLdM4y7I
/AfLUgKZzkfu5g2UHNnJU/bPIbt4ThMrrBFZdMjtFZN8ETClCgREvj+bU/oKZD+a
QvWvaTgfbJqolIcwNqjV
=gcpf
-----END PGP SIGNATURE-----

--x+WOirvrtTKur1pg--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
