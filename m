From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sun7i: Add Goodix GT911 nodes for Wexler
 TAB7200
Date: Thu, 2 Apr 2015 20:50:08 +0200
Message-ID: <20150402185008.GC14618@lukather>
References: <1427789897-4085-1-git-send-email-mamlinav@gmail.com>
 <20150331144338.GG23664@lukather>
 <20150331223120.10199bf9e3fb41b16f879eca@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nmemrqcdn5VTmUEE"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150331223120.10199bf9e3fb41b16f879eca-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Aleksei Mamlin <mamlinav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--nmemrqcdn5VTmUEE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 31, 2015 at 10:31:20PM +0300, Aleksei Mamlin wrote:
> > > +		compatible =3D "goodix,gt911";
> > > +		reg =3D <0x5d>;
> > > +		interrupt-parent =3D <&pio>;
> > > +		interrupts =3D <21 IRQ_TYPE_NONE>; /* EINT21 (PH21) */
> >=20
> > Unfortunately, IRQ_TYPE_NONE is not a valid value for the GIC
> > bindings.
> >=20
>
> Hmm. Which value I must use in this case? IRQ type is set by the
> touchscreen controller driver, so I think that value must be 0.

Whatever the hardware is using. Presumably the same value than the
driver sets.

> >
> > You're also not adding a pinctrl group for that pin?
>
> No, because it works fine with this DT nodes. It seems that I should
> first configure pin to work in interrupt mode. Correct?

You don't have to, since the pio driver will already take care of
muxing it to the right function, but that will prevent any driver to
call pinctrl_request on the same pin.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--nmemrqcdn5VTmUEE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVHY9gAAoJEBx+YmzsjxAg7wwQALvcLXUY43PkmrWLV88eH1TJ
sXzzBcAc8vNZQURjNWt3y3MHJaoBB+2nmcnQ4yhnc6tZDiVn2aVhQ5c1vaxTOPLp
y+gRiukbry20QcnbO+qrIZIveBdg0Xvi8kVD3ixbiOO7tYyNXp9zGuu/7CvTaCRr
4dbrNy0+SVC/PFg1eH33AGnzR70F5UCaH5h29K/FGDlJcrd0HdpbLehxqXu5s4dm
/zs39lzRFO1QQ73xUScKyyXepNOgFDnyBw9Wj7nf3tcDvOwJweWm64SyV/gufLUo
Fwy1jCs2sv6rNwVhBSeKwyrdCiy3jFkrI3DzR53wzRbmwllzcIS+HcGKfOlbst7A
95Ls15y0R+4m+X73sN6Gf2WLRRxiq1WG474M4rTGAzEM7VFwJ1xikSYxbr5XBGzL
GPVE6rV/MhdX7ojwh/tuwtf5TDxxHCuh8p541J9+8WSZ5Mqj34zTOKPh/7N9eSvZ
5VWK/sPKe4AOwRS3IwhxarLAxIlS6g8MaLeMkStHSEoYMZeUVoSXDKmCk80MUfEk
0usVBfr29kd4of3WFtZ0caV0yBByMVJcs8qmjRR9oNQ9B3U9mMJwBw2WuMB18rC/
p/omkgmTuJJ7qjmaM8kcsRguda0t7DsVsun9JDANDXkZj88ZyB2LtiCBlPlITl2n
GmNPIviMA8abEcveA93M
=45Qk
-----END PGP SIGNATURE-----

--nmemrqcdn5VTmUEE--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
