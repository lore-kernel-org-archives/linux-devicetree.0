From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 1/2] ARM: topology: Use a clock if possible to get the
 CPU frequency
Date: Mon, 30 Jun 2014 16:58:47 +0200
Message-ID: <20140630145847.GE28647@lukather>
References: <1404123143-13041-1-git-send-email-maxime.ripard@free-electrons.com>
 <1404123143-13041-2-git-send-email-maxime.ripard@free-electrons.com>
 <20140630102934.GV32514@n2100.arm.linux.org.uk>
 <CAKfTPtC+XcH122AytyZ=x1JVx9THmxCasJLA3Z1e17X_OmH1xA@mail.gmail.com>
 <20140630124919.GC28647@lukather>
 <CAKfTPtCgpc1J888hbqxoaF5UfcUoRwcpokme32WHPpsPAAawUQ@mail.gmail.com>
 <20140630140146.GD28647@lukather>
 <CAKfTPtAu+mSVO8dvg_Z6w_nYWndap+FY5VGKeg-0pae_4JqR=A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RpqchZ26BWispMcB"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKfTPtAu+mSVO8dvg_Z6w_nYWndap+FY5VGKeg-0pae_4JqR=A@mail.gmail.com>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vincent Guittot <vincent.guittot-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, LAK <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Nicolas Pitre <nico-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--RpqchZ26BWispMcB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30, 2014 at 04:48:35PM +0200, Vincent Guittot wrote:
> On 30 June 2014 16:01, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> w=
rote:
> > On Mon, Jun 30, 2014 at 03:27:21PM +0200, Vincent Guittot wrote:
> >> >> >> -             rate =3D of_get_property(cn, "clock-frequency", &l=
en);
> >> >> >> -             if (!rate || len !=3D 4) {
> >> >> >> -                     pr_err("%s missing clock-frequency propert=
y\n",
> >> >> >> -                             cn->full_name);
> >> >> >> +             clk =3D of_clk_get(cn, 0);
> >> >> >> +             if (!IS_ERR(clk))
> >> >> >> +                     rate =3D clk_get_rate(clk);
> >> >>
> >> >> We need the max frequency as it will be used to weight the different
> >> >> CPUs capacity. How do you ensure that the current clock rate is the
> >> >> max one ?
> >> >
> >> > Hmm, the clock-frequency attribute in the ePAPR is defined at the
> >> > current CPU frequency, not the max one.
> >>
> >> What means current frequency in device tree when DVFS is involved ?
> >
> > The ePAPR states that clock-frequency is supposed to be "the current
> > clock speed of the CPU in Hertz". It's exactly what my patch add.
> >
> > Now, you're right, DVFS would be an issue here with clock-frequency,
> > but this patch actually makes it easier to deal with, since you only
> > get a reference to a clock, and you can get its rate at any given
> > time.
>=20
> and what about using clk_round_rate(clk, ULONG_MAX) ?

Well, the clock itself might generate a frequency higher that what the
CPU can run at, so I'm not sure it's a valid assumption.

> We will not be dependent of when we parse DT

You lost me there. clk_round_rate and clk_get_rate are available at
the same time in the boot process, aren't they?

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--RpqchZ26BWispMcB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJTsXsnAAoJEBx+YmzsjxAgD3QP/1iXnegXcH/ETg1M/wP4O+Uo
t48+66/tUyvmRqEImK+iygT0GG9f6O2zzm8G+BcJgRMLibSp+Kte/iDcduQCQoao
9XkhzogOcRO1/3obytEkbuSHsIPIU83P4r8wgsUTF3H/b+FQriiSbxRPhpyl/LCu
+5ECebDeIv9rWoqM8DnuVRMZpwZ6Ph9z+gvz6/DHZot3UkONrNxYWrlsMY22MxTo
dtZwcaiHaMehNAtcvIszOe+ELCZF87GTTKfk22kY3iz8zmnYfHAWxoU2Sb2s+ad0
jm4F+QksGN+F6XZSjQbX1UP3iokBaU4GaKUo3wvxRFMOWlSMmV5wycantAoeXPxG
MEBsHiMx4dHL7o+RLYHLuLZtaSug1m1d+wyE2DhYpRFFzcD/jFAsEBtezOpp1PYf
Em1aUaUHzmjDdrbRHLPRrr32LH96Pl53ON/Wb3pdeXS268wmLY31jNOMhfhpyS9K
sJHeBx2OHv0a4wWcCBARDnV3EEMhYapqvpNyOYCo+oUjxbtjclOT3vhUVACT/bEy
XeFfqKe7IyfkuZ7ddD6sKKS3ISRi5Qi2xpgJDLDVOz5D0R2Zm6SoApjCg15gGBj/
qQJRwf8CUuVq3k2ZwOKzybTv4wILTNKX/OHHvN7jbIPpcduoYrL1RyvmsNZa0nMr
+/O8n7LpqBY25pVLfQju
=p0ES
-----END PGP SIGNATURE-----

--RpqchZ26BWispMcB--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
