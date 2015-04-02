From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sun7i: Add Goodix GT911 nodes for Wexler
 TAB7200
Date: Thu, 2 Apr 2015 11:22:59 +0200
Message-ID: <20150402092259.GK23664@lukather>
References: <1427789897-4085-1-git-send-email-mamlinav@gmail.com>
 <20150331144338.GG23664@lukather>
 <20150331221420.3b65d2540c7dbe1d12611e12@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7e8BFhNxqpjiNKz7"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150331221420.3b65d2540c7dbe1d12611e12-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Aleksei Mamlin <mamlinav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--7e8BFhNxqpjiNKz7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 31, 2015 at 10:14:20PM +0300, Aleksei Mamlin wrote:
> On Tue, 31 Mar 2015 07:43:38 -0700
> Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
>=20
> > Hi,
> >=20
> > On Tue, Mar 31, 2015 at 11:18:17AM +0300, Aleksei Mamlin wrote:
> > > This patch adds nodes for the Goodix GT911 touchscreen controller fou=
nd
> > > on the Wexler TAB7200 tablet. Controller uses one of following I2C
> > > addresses: 0x5d or 0x14, so just add two nodes.
> >=20
> > In which case are these different addresses encountered? Different
> > revisions of the same board?
>
> According to the datasheet it is a feature of the controller.=20
> The address(0x5d or 0x14) can be configured using a reset sequence,
> which has not yet been implemented in the driver.

Which address is set up by the bootloader then?

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--7e8BFhNxqpjiNKz7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVHQpzAAoJEBx+YmzsjxAgftoP/RaxXVCk2TiPdIeL3wUruw+I
oxn7PvZnf1mdYa8yYsoi4eNTkHANhw2tCg92PBU9cWVgv7YCqpWS6zlfGvkCSpyX
E4M024e6crMajLnKvkGAeWGQqRdIgnbPb9LZCMB+GkSR4z5jzg+vaihy0hnRtX8d
anFDLWzFrR90b+H2zx0A0/J1pY7y2TXpKzJlvBB0O+6tUsHYsfcxWrRcFFeufakJ
HIKfHJnRBLwllbzEbHxGAyt+5F4CaVk7jjC3dUcId9XuknAlPP5XvRtc2bPKtvWP
kz6yESWGLXaqp0rh7vulr8NKutpL/a9QZhkjxaStcnD5ndRDdro92Jh++gDN4Nqa
JgFy/BoAEZEn6VESNud6L7yUX49gMR6CaAg5f+HOhL6yJwUGujAwUO143S23ly3H
TycrGrBRuSqY0cIHXvhdokxWke+MGAQbdI9ImMekz8qfGTfftYxKGj+vO4c9ZZhn
obRJKbKU+E3Cl652fAPSMFOxH40gyL9y6q35ZoQFxSP8XgzkrpKQnvCiS/NuAcpt
usqo1W48kTnHEx9aBzKs/zS37Wxy/19d7oRwN7snCfRtmkWgn1Tw+BLqCSGR6iRG
mLiU0O1izwmyMGqj28tVcmBDnnfy7jA3c+7hMjHO7jpPg7rzJ8DS96Q7tPfak5H+
UOvTSTMV6u/lgWVZEHlE
=wuSk
-----END PGP SIGNATURE-----

--7e8BFhNxqpjiNKz7--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
