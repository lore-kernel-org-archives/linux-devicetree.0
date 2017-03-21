From: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Subject: Re: [PATCH v4 14/36] [media] v4l2-mc: add a function to inherit
 controls from a pipeline
Date: Tue, 21 Mar 2017 12:11:05 +0100
Message-ID: <20170321111104.GA22939@amd>
References: <cc8900b0-c091-b14b-96f4-01f8fa72431c@xs4all.nl>
 <20170310125342.7f047acf@vento.lan>
 <20170310223714.GI3220@valkosipuli.retiisi.org.uk>
 <20170311082549.576531d0@vento.lan>
 <20170313124621.GA10701@valkosipuli.retiisi.org.uk>
 <20170314004533.3b3cd44b@vento.lan>
 <e0a6c60b-1735-de0b-21f4-d8c3f4b3f10f@xs4all.nl>
 <20170317114203.GZ21222@n2100.armlinux.org.uk>
 <44161453-02f9-0019-3868-7501967a6a82@linux.intel.com>
 <20170317102410.18c966ae@vento.lan>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="EeQfGwPcQSOJBaQU"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170317102410.18c966ae-ch4gOOMV7nf/PtFMR13I2A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mauro Carvalho Chehab <mchehab-JsYNTwtnfakRB7SZvlqPiA@public.gmane.org>
Cc: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>, Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, nick-gcszYUEDH4VrovVCs/uTlw@public.gmane.org, markus.heiser-O6JHGLzbNUwb1SvskN2V4Q@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, bparrot-l0cyMroinI0@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, sudipm.mukherjee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, jean-christophe.trotin-qxv4g6HH51o@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, robert.jarzmik-GANU6spQydw@public.gmane.org, songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, gregkh@linuxfoundatio
List-Id: devicetree@vger.kernel.org


--EeQfGwPcQSOJBaQU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > Making use of the full potential of the hardware requires using a more
> > expressive interface.=20
>=20
> That's the core of the problem: most users don't need "full potential
> of the hardware". It is actually worse than that: several boards
> don't allow "full potential" of the SoC capabilities.

Well, in kernel we usually try to support "full hardware" potential.

And we are pretty sure users would like to take still photos, even if
common v4l2 applications can not do it.

> > That's what the kernel interface must provide. If
> > we decide to limit ourselves to a small sub-set of that potential on the
> > level of the kernel interface, we have made a wrong decision. It's as
> > simple as that. This is why the functionality (and which requires taking
> > a lot of policy decisions) belongs to the user space. We cannot have
> > multiple drivers providing multiple kernel interfaces for the same hard=
ware.
>=20
> I strongly disagree. Looking only at the hardware capabilities without
> having a solution to provide what the user wants is *wrong*.

Hardware manufacturers already did this kind of research for us. They
don't usually include features noone wants...

> Another case: the cx25821 hardware supports 12 video streams,=20
> consuming almost all available bandwidth of an ePCI bus. Each video=20
> stream connector can either be configured to be capture or output, in
> runtime. The hardware vendor chose to hardcode the driver to provide
> 8 inputs and 4 outputs. Their decision was based in the fact that
> the driver is already very complex, and it satisfies their customer's=20
> needs. The cost/efforts of make the driver to be reconfigured in
> runtime were too high for almost no benefit.

Well, it is okay to provide 'limited' driver -- there's possibility to
fix the driver. But IMO it is not okay to provide 'limited' kernel
interface -- because if you try to fix it, you'll suddenly have
regressions.

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--EeQfGwPcQSOJBaQU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAljRCkgACgkQMOfwapXb+vKizwCggX0/6rJpBlyJuPet4dFev351
N+wAn07A9DStt2j0i8snJ1LcFXd24fdY
=tE3k
-----END PGP SIGNATURE-----

--EeQfGwPcQSOJBaQU--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
