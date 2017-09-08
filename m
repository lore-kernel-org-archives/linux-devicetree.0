From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 05/10] dmaengine: sun6i: Move number of
 pchans/vchans/request to device struct
Date: Fri, 8 Sep 2017 16:37:10 +0200
Message-ID: <20170908143710.rhz6x3i776zrhbzo@flea.lan>
References: <20170903224100.17893-1-stefan.bruens@rwth-aachen.de>
 <20170903224100.17893-6-stefan.bruens@rwth-aachen.de>
 <20170904074355.niloziky42aki7bg@flea>
 <3533197.81BdoSVRz8@sbruens-linux>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="i5qul5ppysoi43r7"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBF6WZLGQKGQEZB4MCEY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <3533197.81BdoSVRz8@sbruens-linux>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: =?iso-8859-1?B?QnL8bnMs?= Stefan <Stefan.Bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
Cc: "linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Code Kipper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--i5qul5ppysoi43r7
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 04, 2017 at 02:30:59PM +0000, Br=C3=BCns, Stefan wrote:
> On Montag, 4. September 2017 09:43:55 CEST Maxime Ripard wrote:
> > On Mon, Sep 04, 2017 at 12:40:56AM +0200, Stefan Br=C3=BCns wrote:
> > > Preparatory patch: If the same compatible is used for different SoCs =
which
> > > have a common register layout, but different number of channels, the
> > > channel count can no longer be stored in the config. Store it in the
> > > device structure instead.
> > >=20
> > > Signed-off-by: Stefan Br=C3=BCns <stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
> >=20
> > As stated already, we already are going to have a different
> > compatible, and this is not something that will change from one
> > instance to the other. Having code is therefore:
> >   A) Making the code more complex
> >   B) For no particular reason.
>=20
> If the dma channel count (which is a standard dma binding, likely for a=
=20
> reason) goes into the devicetree, it has to be moved out of the config.
>
> The R40 (which has register manuals available) has the same register layo=
ut as=20
> the A64, but *does* have a different channel count. So you think it is a =
good=20
> idea to introduce a new compatible again?
>=20
> If you had been half as picky when merging the H3 and A83T support, we wo=
uld=20
> not have this mess now.
>=20
> There is also the H6, where there is no register manual available yet, bu=
t I =20
> bet it has the H3 (and A64, H5, R40) register layout, but unlikely the sa=
me=20
> number of DMA channels *and* the same number of ports.

The thing is that this kind of things usually grow organically until
you can't just add a simple if case any more.

I'm sorry you were at the tipping point, but I'm sure you also
understand that adding more to the mess until the next one shows up
isn't viable either.

That being said, thinking a bit more on that one, if you add to the
binding that we need to have both the current SoC compatible (to
workaround any variation / bugs we might encounter in the future) and
the "generation" one (to avoid adding one for each new IP), plus the
mandatory dma-channels / dma-requests properties, that would work for
me.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--i5qul5ppysoi43r7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZsqsVAAoJEBx+YmzsjxAg5lwP/1NM3BKsC+biAcayiv3LsUTp
FMiOu6HGOyOY66MWMvXXDL9OUyK3o1uE+1T2BNp1OoPwCU5w9WP1kF6F5k5JwdEm
95up+NEbHiwgwT73/QcckODnOzZzKG2/0GGnJzPugrMJjKmVRC2AzEPSOPnwS95B
dNAN0kz21aaQA9iFaauBYSnthykrHD8l/XXAx4q1A45wk5C/VP0zT9dtPWwK0ACR
WgivqD3Zc/vHoPfsacKbNW9pJITQn0eRrM+iHByH4x+8ZvhNveFxifzrV69JBIvg
y/9Q195Ai7DsGcTY3MlxNrG3mebAg/JKqXeCCn9tPYlrnUqLyDD/YwBbFCizbe/M
jWqSlGTVnLo1NRriqQTK/8eGLefR9ZN5VlWlHXP5dbRMIRNLMsG/kFNOiBO8R10p
Hz3tsgORYHYdGtLTA225SDhBMt+BOPa0vDSqzBxQfA63NsfAnpOqE7HBs4yDjy9E
afeUN8uTZPz7usI2f3MkRWTzN18ol8iKM84qGhrca6x9duti+cDHvmzRiaXUOKH0
jEuUGpXz/s+Ht6Br4HXU02Ajdu+RkuWD+8jDPBcIUIBKj9PXFKIOYoPkE3PXRZHq
9lUmdUS4hLL4W6ahTbLuMyiR0go/DKZ0xJsDrhL9KvalEe0Rl20rbwNHG534b2Jh
daIuXZN8NFLnYxShlN+g
=OUsa
-----END PGP SIGNATURE-----

--i5qul5ppysoi43r7--
