From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: Re: [PATCH] ARM: dts: sun8i: r40/v40: rewrite BPi
 M2 Berry DTS to rebase on M2 Ultra
Date: Mon, 20 Aug 2018 17:02:01 +0200
Message-ID: <20180820150201.t2qoqvpsd66arprz@flea>
References: <20180724163655.61365-1-icenowy@aosc.io>
 <20180726124119.dwne2sncws2p3sdi@flea>
 <dc8a28bcfbe082158bac5b097badb3ddf0f51ce8.camel@aosc.io>
 <20180820120046.7tonxtb52q43ocfq@flea>
 <2782CDF6-C36F-49EF-97AE-75382C416489@aosc.io>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ubiy6wokou235udw"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBB5NP5PNQKGQENOIOE4Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <2782CDF6-C36F-49EF-97AE-75382C416489-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--ubiy6wokou235udw
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 20, 2018 at 08:06:21PM +0800, Icenowy Zheng wrote:
>=20
>=20
> =E4=BA=8E 2018=E5=B9=B48=E6=9C=8820=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=88=
8:00:46, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> =E5=86=99=E5=88=B0:
> >Hi!
> >
> >On Wed, Aug 08, 2018 at 06:36:56PM +0800, Icenowy Zheng wrote:
> >> =E5=9C=A8 2018-07-26=E5=9B=9B=E7=9A=84 14:41 +0200=EF=BC=8CMaxime Ripa=
rd=E5=86=99=E9=81=93=EF=BC=9A
> >> > On Wed, Jul 25, 2018 at 12:36:55AM +0800, Icenowy Zheng wrote:
> >> > > Banana Pi designs the BPi M2 Berry board to be software
> >compatible
> >> > > with
> >> > > BPi M2 Ultra,
> >> >=20
> >> > Do you have a reference for this?
> >> >=20
> >> > > so it's based on M2 Ultra with some function cuts, including:
> >> > >=20
> >> > > - 2048MiB DRAM -> 1024MiB (this should be proceed by the
> >> > > bootloader);
> >> > > - dropped a LED;
> >> > > - dropped eMMC;
> >> > > - dropped USB2 and connect USB1 to a 4-port HUB.
> >> >=20
> >> > Is it the exhaustive list?
> >>=20
> >> I have asked Mikey from Sinovoip, and he has agreed this.
> >>=20
> >> Here's a list provided by him, which covers some things I forgot:
> >> - 2GiB -> 1GiB
> >> - no eMMC
> >> - no onboard microphone
> >> - no IR
> >> - no charging (and power jack to USB)
> >> - USB change
> >> - one less LED
> >>=20
> >> Should I add this to the device tree's comment?
> >
> >Not really, because...
> >
> >> >=20
> >> > I'm a bit reluctant to merge that kind of patches usually, since
> >that
> >> > would also imply that each time someone will commit something to
> >the
> >> > M2-Ultra, it would automatically apply to the M2-Berry, without any
> >> > easy way to tell and / or test.
> >
> >... this still applies.
>=20
> But I think few developers will have both boards at the same time.

Which is only making it worse, because then someone with only the BPI
m2-ultra, when changing the DT, will not be able to tell that:

 - it's applied to the M2-Berry too,
 - if it works on the M2-Berry.

Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--ubiy6wokou235udw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlt61+gACgkQ0rTAlCFN
r3T6cA/9HJs6NWHZ6nfVmUQT5rFNFR6ovzGPpAqny2McXM8oc1+Ytcj3tYqC6WZf
H/kqoZzK6qU+Xmkw0l0kK0OIaQ7SYAhwQ5o1JzFoMewaiD5X2YpNfU55sX93qbc8
bu5EW8nsm/knwFx1zFFVEmkA2TykOM8L3f1jj4xqqEfSfdIWjWL9ZvArNT6W5pvE
zIZsUFmaaMb+Z+ndSGzzMdJtzDR+832kyiugqYjwy9GNAh0WhNpqetaR0owhjqc2
/R3Emcdc4cpZl1zCE8mRPp6F69RhwXEvSZz7TqWQDaGBP/okuFsp+ULgHu06uJ18
DOGtUc7PeqKJobXXftG20HiA05COno/2ta/iRBEv5D7O64X7saSOY5Kl3GHKcgt7
WB5agJ8w4Tg8G4+n6MP5mmmJdjH3uNAiZPb6TR7Ex7MDf6gJiO4OJt2NIpimzz77
9E+PAe6KR1ZgZjSpE+8ZO+7iUrOA7ehQP5D4cgtj3RomnCCWBsBoa4Ct0yP9Feob
pvEZ+iWW9aYRuq2BaOIyBWn4Sd9h4RuBleMJ9qJuqpAZkd/E131qf7qFPvwGb0rD
w7cUtFtjLEp8bXukUavxkyXFJeTBI0zQxsdy0OETJ1137RE5P3FwtVUgeWQVIL3P
k4ABBfC6s8c2FpxE2ZkqC0PrtUDvEiprPSZ0gNfitlj7VGQiqYg=
=bOvK
-----END PGP SIGNATURE-----

--ubiy6wokou235udw--
