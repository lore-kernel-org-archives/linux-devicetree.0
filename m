From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sun7i: Add Goodix GT911 nodes for Wexler
 TAB7200
Date: Mon, 13 Apr 2015 17:59:06 +0200
Message-ID: <20150413155906.GH29832@lukather>
References: <1427789897-4085-1-git-send-email-mamlinav@gmail.com>
 <20150331144338.GG23664@lukather>
 <20150331223120.10199bf9e3fb41b16f879eca@gmail.com>
 <20150402185008.GC14618@lukather>
 <20150411193614.83013f345aaa1123ef55ecbf@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="svZFHVx8/dhPCe52"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150411193614.83013f345aaa1123ef55ecbf-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Aleksei Mamlin <mamlinav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--svZFHVx8/dhPCe52
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 11, 2015 at 07:36:14PM +0300, Aleksei Mamlin wrote:
> On Thu, 2 Apr 2015 20:50:08 +0200
> Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
>=20
> > On Tue, Mar 31, 2015 at 10:31:20PM +0300, Aleksei Mamlin wrote:
> > > > > +		compatible =3D "goodix,gt911";
> > > > > +		reg =3D <0x5d>;
> > > > > +		interrupt-parent =3D <&pio>;
> > > > > +		interrupts =3D <21 IRQ_TYPE_NONE>; /* EINT21 (PH21) */
> > > >=20
> > > > Unfortunately, IRQ_TYPE_NONE is not a valid value for the GIC
> > > > bindings.
> > > >=20
> > >
> > > Hmm. Which value I must use in this case? IRQ type is set by the
> > > touchscreen controller driver, so I think that value must be 0.
> >=20
> > Whatever the hardware is using. Presumably the same value than the
> > driver sets.
> >=20
> > > >
> > > > You're also not adding a pinctrl group for that pin?
> > >
> > > No, because it works fine with this DT nodes. It seems that I should
> > > first configure pin to work in interrupt mode. Correct?
> >=20
> > You don't have to, since the pio driver will already take care of
> > muxing it to the right function, but that will prevent any driver to
> > call pinctrl_request on the same pin.
>
> It is still necessary?
> I see that you have accepted Hans de Goede's patches: http://www.spinics.=
net/lists/arm-kernel/msg411142.html

No, it's fine.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--svZFHVx8/dhPCe52
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVK+fKAAoJEBx+YmzsjxAggiEP/Rw6KhbGe3xPLP/pBiiGRiMA
pmhcd4C97pBQf3ehrtZxJwVjOT/rXpxf57Z6p4PaVs+VSvJgrXmWy1esNulxli84
5H68QmAeZq6Zxm6J3jCGtlw+xevAQkKka9slUfQ2nxLkCt3Sl2aYJ+vnp5981aLx
DGKj0crK0GZ3sttQMdXOW88Dii8FMx0zKyOxU8z67GsWn0WsJVm5577QNRka562f
yzEE+Y3OPS2lbXsEIikgkWPiAd29M4F6ZYMjm+4Uw9KM33eLN3fEQWDJj+her9nJ
KeKXiS1TFnreCPJEk64kEQYooxgddcNyH/3pUbpwT/VLEua/WSxl0SI8Z23pzBJB
X6vV6FAoszGiCPpDGl8BlH/RVeiqepyQYKpvyO+KvijPKN2noLtovEeA5hWX8zZT
CFEPB7xJjS5nkh3hGk9OMizS+HMdadrgyJOM0wIakqToaKNtFy2s3H21xG4IVhF1
Ju5YH9+D9QSEFRlpDWGsE1ElY9Whp/w1IguDrAlbp17tsLJ8MlvN/bYXPixMXgZS
Np0FDAP1D3TthUc+lnv5DSWwFwZ9z2nJZM4zPhuzXaW8Sc+0yQRLKIACcnhx5b4d
3i26Vd2QLZO10inMLC1ifbmFLRty4jblmR73Cpf4C3wA7vrLlAdw90UhI4lnNsnr
abPn/O0YBfxFKIfb662x
=hdR6
-----END PGP SIGNATURE-----

--svZFHVx8/dhPCe52--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
