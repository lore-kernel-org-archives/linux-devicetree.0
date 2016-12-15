From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2] ARM: dts: sunxi: Change node name for pwrseq pin on
 Olinuxino-lime2-emmc
Date: Thu, 15 Dec 2016 13:17:26 +0100
Message-ID: <20161215121726.hfrjk5kfgaifnkgq@lukather>
References: <20161214145724.42745-1-manu@bidouilliste.com>
 <20161214153013.bkdm3pu3osepfnn2@lukather>
 <20161215123533.f7e2373d2a9eb113ee7b0600@bidouilliste.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="vqahxu7gll2earpj"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161215123533.f7e2373d2a9eb113ee7b0600-xXdDKFdH5B3kFDPD4ZthVA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Emmanuel Vadot <manu-xXdDKFdH5B3kFDPD4ZthVA@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--vqahxu7gll2earpj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 15, 2016 at 12:35:33PM +0100, Emmanuel Vadot wrote:
>=20
>  Hi Maxime,
>=20
> On Wed, 14 Dec 2016 16:30:13 +0100
> Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
>=20
> > On Wed, Dec 14, 2016 at 03:57:24PM +0100, Emmanuel Vadot wrote:
> > > The node name for the power seq pin is mmc2@0 like the mmc2_pins_a on=
e.
> > > This makes the original node (mmc2_pins_a) scrapped out of the dtb and
> > > result in a unusable eMMC if U-Boot didn't configured the pins to the
> > > correct functions.
> > >=20
> > > Changes since v1:
> > >  * Rename the node mmc2-rst-pin
> >=20
> > That changelog should be after the ---. Removed it and applied.
> >=20
> > Thanks!
> > Maxime
>=20
>  Sorry, still kinda new at doing patches for Linux, will be more
> carefull next time.
>  Quick question, when you say applied, applied where exactly ? I had a
> quick look at your branches on git.kernel.org didn't find anything.

In general, my tree on kernel.org.

In this case, my local tree for now. We're right in the middle of the
merge window for 4.10, so in order not to pollute next and not to
confuse everyone (or rebasing a branch at some point), I just gather
the patches here. I'll publish a branch based on 4.10 as soon as
4.10-rc1 is released.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--vqahxu7gll2earpj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYUonRAAoJEBx+YmzsjxAgZz4P/1WBSQulhzOwpbEV7eQJidfa
Xe4rfUTIXA0bSUGxH2VP6xIDLOF4/tbWHPDCu4mErEqlJeV0UGmc3sF4hmpIi7L4
OA4fMeujgbIgb0AounEZJy+M37RUw+whC1m0e9XkC2ioA0UR4Rw4RUpJdGGtkJ8U
+p1GlXqn/eYsqR2XQP5BIfFQlSzKwxAcM5mCx0+3LpS3OiulC/ZoKlFh0dKhNdHO
ZQF3RdgKt+3hyxf3aDmi3W8V6SbGwec9HwmEtrkWqVdw2VcifjvNxz5qQWI8nPTx
N/VL5T3Vy1TLxyx8Ut11AJ9GXjUhIhsCGsR2+NFit/sYGIdyjij5oR4laTkHy4Qa
SAXDxbOnbklhxNagdXRBjgMWxWIYubFZp7r94T0RIC3WVQ/ubvR2LubgRfP5NROl
onBGDmaKu9rwv1sl0Tv402awd7yUXhujwDiCl0R7nU5313Zxvoslk33xY6sCvG9c
1ZH587M2t7yZw7niL3WZ/8KjrMtXOA7B4yyRqBDZwmD5rr6PioVrHqdFMhTOwn4t
gOq8ky/m4Y2P64Oj3A8/O2awLzVsBEE0jFffurW4epsC7yPzLcGMFmh4jBsnu2iN
Fsri7RefqO4qjn1PXQBem8N+vEPjga6S4hXnunh4ExVQxHJ59UGo6Q76Ebv4hkZr
i2mmSrGi4Zy+q0I5R/X1
=PLhR
-----END PGP SIGNATURE-----

--vqahxu7gll2earpj--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
