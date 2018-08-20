From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: Re: [PATCH] ARM: dts: sun8i: r40/v40: rewrite BPi
 M2 Berry DTS to rebase on M2 Ultra
Date: Mon, 20 Aug 2018 14:00:46 +0200
Message-ID: <20180820120046.7tonxtb52q43ocfq@flea>
References: <20180724163655.61365-1-icenowy@aosc.io>
 <20180726124119.dwne2sncws2p3sdi@flea>
 <dc8a28bcfbe082158bac5b097badb3ddf0f51ce8.camel@aosc.io>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gef5bru62hgkzpqm"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBB6W25LNQKGQEYMUZ22Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <dc8a28bcfbe082158bac5b097badb3ddf0f51ce8.camel-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--gef5bru62hgkzpqm
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

On Wed, Aug 08, 2018 at 06:36:56PM +0800, Icenowy Zheng wrote:
> =E5=9C=A8 2018-07-26=E5=9B=9B=E7=9A=84 14:41 +0200=EF=BC=8CMaxime Ripard=
=E5=86=99=E9=81=93=EF=BC=9A
> > On Wed, Jul 25, 2018 at 12:36:55AM +0800, Icenowy Zheng wrote:
> > > Banana Pi designs the BPi M2 Berry board to be software compatible
> > > with
> > > BPi M2 Ultra,
> >=20
> > Do you have a reference for this?
> >=20
> > > so it's based on M2 Ultra with some function cuts, including:
> > >=20
> > > - 2048MiB DRAM -> 1024MiB (this should be proceed by the
> > > bootloader);
> > > - dropped a LED;
> > > - dropped eMMC;
> > > - dropped USB2 and connect USB1 to a 4-port HUB.
> >=20
> > Is it the exhaustive list?
>=20
> I have asked Mikey from Sinovoip, and he has agreed this.
>=20
> Here's a list provided by him, which covers some things I forgot:
> - 2GiB -> 1GiB
> - no eMMC
> - no onboard microphone
> - no IR
> - no charging (and power jack to USB)
> - USB change
> - one less LED
>=20
> Should I add this to the device tree's comment?

Not really, because...

> >=20
> > I'm a bit reluctant to merge that kind of patches usually, since that
> > would also imply that each time someone will commit something to the
> > M2-Ultra, it would automatically apply to the M2-Berry, without any
> > easy way to tell and / or test.

... this still applies.

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

--gef5bru62hgkzpqm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlt6rW4ACgkQ0rTAlCFN
r3ScGQ/9FrHdE9AWrObaIPhRZd5VO2sFPBr/SECyAthbaX4lZgbYQK3E7ogdWVk8
g5MUEW7DIJ5FmlpDqq6qNEp2NL/XTtFgSlKmJ8JpiL8cNvfPa5GzXGkqIJnMdISu
yyN8/kxXr1McD5Vl/USxKdv/eqCimS8vfcQeFgmktIM8j9EDcO6r+BBXNFciun6R
JCPeEYWwM67DxAypXaosbw00YoAu7FXOiaVTBXsOS9YC37ZKnnH2OhkBZxZkiQ0x
GtsAo6mG1aCQloBwZ2tFBD9DEYNkFmS3Jr/+ZeHsCY0oKm/0S/mz35PhHDK+eFgD
+RRiFaE6KCu7M1E7YJ53PgoXT+RJNy/DXK7pJejwCR77TyVC7UoVpK0s/k0gc0ce
jJgOV0RxYn85FqRDJ+kBujL1N9yypMuCSHYme/KD3RvEQ2IdjGGPWFCEUPb5Pj7/
scZOe3BY8UB9Vt768gwDv1yAVZ/FwlXAk3TIwCOKnXx1puek6te//UWAqxyXntzR
FlLrOzMBfzk/DWfxl5XUghO85omb0eco8UvV5Xkycx21371LDn0/UgYpi4crhmj2
iFRiR7W9Jofw+Cs5brw6FLAoxyek2NMRMhCXYuRTLP8b6NG0R2S749/5aiIU/PTY
cx8tT4AD1APZZ6YUgfSiIY62czOJv5rcHWZfiPTqqBgNc1B3m0w=
=oeS9
-----END PGP SIGNATURE-----

--gef5bru62hgkzpqm--
