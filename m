From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v5 04/13] media: rc: sunxi: Add RXSTA bits definition
Date: Wed, 24 Jul 2019 10:24:59 +0200
Message-ID: <20190724082459.xsstansjxtyvu4st@flea>
References: <20190607231100.5894-1-peron.clem@gmail.com>
 <20190607231100.5894-5-peron.clem@gmail.com>
 <20190610095243.7xwp4xhauds22qzw@flea>
 <CAJiuCcfyjGTBbsjZQYj2p3KD6O-WaXhFe5NZrnKQwJYACmatUw@mail.gmail.com>
 <20190715121244.2vrsw6qa4fgp72fn@gofer.mess.org>
 <20190723062557.hnbi6hgrg4ecawkn@gofer.mess.org>
 <20190723070440.nfmhbrfykumxayjj@flea>
 <20190724053937.4ic5n35xtw2chjdy@gofer.mess.org>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="og4sfmz7wdyyword"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBXVL4DUQKGQER7UHZ7I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20190724053937.4ic5n35xtw2chjdy-3XSxi2G4b3iXFJAUJl40Xg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Sean Young <sean-hENCXIMQXOg@public.gmane.org>
Cc: =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--og4sfmz7wdyyword
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 24, 2019 at 06:39:37AM +0100, Sean Young wrote:
> On Tue, Jul 23, 2019 at 09:04:40AM +0200, Maxime Ripard wrote:
> > Hi Sean,
> >
> > On Tue, Jul 23, 2019 at 07:25:57AM +0100, Sean Young wrote:
> > > On Mon, Jul 15, 2019 at 01:12:45PM +0100, Sean Young wrote:
> > > > On Sun, Jul 14, 2019 at 04:32:22PM +0200, Cl=C3=A9ment P=C3=A9ron w=
rote:
> > > > > Hi Sean,
> > > > >
> > > > > You acked the whole v3 series but this patch has been introduced =
in v5
> > > > > could you ack this one too?
> > > >
> > > > Acked-by: Sean Young <sean-hENCXIMQXOg@public.gmane.org>
> > >
> > > So who's tree should this series go through? It seems mostly device t=
ree.
> > > Alternatively I'm happy to try it get merged via the media tree.
> >
> > Ideally the media bits should go through the media tree, the DT bits
> > will go through arm-soc
> >
> > So you can apply the patches 1-4, 7 and 10, I'll apply the rest.
> >
> > Does that work for you?
>
> Works for me, I'll add them to my next pull request to Mauro.

Applied 5, 6, 8, 9 and 11 to 13.

Thanks!
Maxmie

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
To view this discussion on the web, visit https://groups.google.com/d/msgid=
/linux-sunxi/20190724082459.xsstansjxtyvu4st%40flea.

--og4sfmz7wdyyword
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXTgV2wAKCRDj7w1vZxhR
xfJ7AP9T3lo+mjFXDqZN0Pz/4RMW3K3sSelGWolPV45h0MFvHAD/alxUyiaQdf/T
yqmAR4Jmj9ViaeByiHDySDrorxlVhw0=
=wgpG
-----END PGP SIGNATURE-----

--og4sfmz7wdyyword--
