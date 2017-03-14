From: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Subject: Re: [PATCH v4 14/36] [media] v4l2-mc: add a function to inherit
 controls from a pipeline
Date: Tue, 14 Mar 2017 19:26:35 +0100
Message-ID: <20170314182635.GA3744@amd>
References: <20170310130733.GU21222@n2100.armlinux.org.uk>
 <c679f755-52a6-3c6f-3d65-277db46676cc@xs4all.nl>
 <20170310140124.GV21222@n2100.armlinux.org.uk>
 <cc8900b0-c091-b14b-96f4-01f8fa72431c@xs4all.nl>
 <20170310125342.7f047acf@vento.lan>
 <20170310223714.GI3220@valkosipuli.retiisi.org.uk>
 <20170311082549.576531d0@vento.lan>
 <20170311231456.GH21222@n2100.armlinux.org.uk>
 <20170312212904.GA7995@amd>
 <20170312193745.636df0bf@vento.lan>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="FL5UXtIhxfXey3p5"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170312193745.636df0bf-ch4gOOMV7nf/PtFMR13I2A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mauro Carvalho Chehab <mchehab-JsYNTwtnfakRB7SZvlqPiA@public.gmane.org>
Cc: Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, nick-gcszYUEDH4VrovVCs/uTlw@public.gmane.org, markus.heiser-O6JHGLzbNUwb1SvskN2V4Q@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, bparrot-l0cyMroinI0@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, sudipm.mukherjee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, jean-christophe.trotin-qxv4g6HH51o@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, robert.jarzmik-GANU6spQydw@public.gmane.org, songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sakari.ailus@linux.i
List-Id: devicetree@vger.kernel.org


--FL5UXtIhxfXey3p5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > Mid-layer is difficult... there are _hundreds_ of possible
> > pipeline setups. If it should live in kernel or in userspace is a
> > question... but I don't think having it in kernel helps in any way.
>=20
> Mid-layer is difficult, because we either need to feed some
> library with knowledge for all kernel drivers or we need to improve
> the MC API to provide more details.
>=20
> For example, several drivers used to expose entities via the
> generic MEDIA_ENT_T_DEVNODE to represent entities of different
> types. See, for example, entities 1, 5 and 7 (and others) at:
>
> > https://mchehab.fedorapeople.org/mc-next-gen/igepv2_omap3isp.png

Well... we provide enough information, so that device-specific code
does not have to be in kernel.

There are few types of ENT_T_DEVNODE there. "ISP CCP2" does not really
provide any functionality to the user. It just has to be there,
because the pipeline needs to be connected. "ISP Preview" provides
format conversion. "ISP Resizer" provides rescaling.

I'm not sure if it ever makes sense to use "ISP Preview
output". Normally you take data for display from "ISP Resizer
output". (Would there be some power advantage from that?)

> A device-specific code could either be hardcoding the entity number
> or checking for the entity strings to add some logic to setup
> controls on those "unknown" entities, a generic app won't be able=20
> to do anything with them, as it doesn't know what function(s) such
> entity provide.

Generic app should know if it wants RGGB10 data, then it can use "ISP
CCDC output", or if it wants "cooked" data suitable for display, then
it wants to use "ISP Resizer output". Once application knows what
output it wants, there's just one path through the system. So being
able to tell the ENT_T_DEVNODEs apart does not seem to be critical.

OTOH, for useful camera application, different paths are needed at
different phases.
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--FL5UXtIhxfXey3p5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAljINdsACgkQMOfwapXb+vLsJgCfTHi3WWXopxgQDoVYKBFeNCsX
1pIAoJCLkkQ1XeTTlDPgVbzaLaRyJWY5
=pshM
-----END PGP SIGNATURE-----

--FL5UXtIhxfXey3p5--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
