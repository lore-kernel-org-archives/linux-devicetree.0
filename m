From: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Subject: Re: [PATCH v4 14/36] [media] v4l2-mc: add a function to inherit
 controls from a pipeline
Date: Sun, 12 Mar 2017 22:29:04 +0100
Message-ID: <20170312212904.GA7995@amd>
References: <20170304131329.GV3220@valkosipuli.retiisi.org.uk>
 <a7b8e095-a95c-24bd-b1e9-e983f18061c4@xs4all.nl>
 <20170310130733.GU21222@n2100.armlinux.org.uk>
 <c679f755-52a6-3c6f-3d65-277db46676cc@xs4all.nl>
 <20170310140124.GV21222@n2100.armlinux.org.uk>
 <cc8900b0-c091-b14b-96f4-01f8fa72431c@xs4all.nl>
 <20170310125342.7f047acf@vento.lan>
 <20170310223714.GI3220@valkosipuli.retiisi.org.uk>
 <20170311082549.576531d0@vento.lan>
 <20170311231456.GH21222@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="7JfCtLOvnd9MIVvH"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170311231456.GH21222-l+eeeJia6m9URfEZ8mYm6t73F7V6hmMc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Cc: Mauro Carvalho Chehab <mchehab-JsYNTwtnfakRB7SZvlqPiA@public.gmane.org>, Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, nick-gcszYUEDH4VrovVCs/uTlw@public.gmane.org, markus.heiser-O6JHGLzbNUwb1SvskN2V4Q@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, bparrot-l0cyMroinI0@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, sudipm.mukherjee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, jean-christophe.trotin-qxv4g6HH51o@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, robert.jarzmik-GANU6spQydw@public.gmane.org, songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sakari.ailus@linux.i
List-Id: devicetree@vger.kernel.org


--7JfCtLOvnd9MIVvH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat 2017-03-11 23:14:56, Russell King - ARM Linux wrote:
> On Sat, Mar 11, 2017 at 08:25:49AM -0300, Mauro Carvalho Chehab wrote:
> > This situation is there since 2009. If I remember well, you tried to wr=
ite
> > such generic plugin in the past, but never finished it, apparently beca=
use
> > it is too complex. Others tried too over the years.=20
> >=20
> > The last trial was done by Jacek, trying to cover just the exynos4 driv=
er.=20
> > Yet, even such limited scope plugin was not good enough, as it was never
> > merged upstream. Currently, there's no such plugins upstream.
> >=20
> > If we can't even merge a plugin that solves it for just *one* driver,
> > I have no hope that we'll be able to do it for the generic case.
>=20
> This is what really worries me right now about the current proposal for
> iMX6.  What's being proposed is to make the driver exclusively MC-based.
>=20
> What that means is that existing applications are _not_ going to work
> until we have some answer for libv4l2, and from what you've said above,
> it seems that this has been attempted multiple times over the last _8_
> years, and each time it's failed.

Yeah. We need a mid-layer between legacy applications and MC
devices. Such layer does not exist in userspace or in kernel.

> Loading the problem onto the user in the hope that the user knows
> enough to properly configure it also doesn't work - who is going to
> educate the user about the various quirks of the hardware they're
> dealing with?

We have docs. Users can write shell scripts. Still, mid-layer would be
nice.

> So, the problem space we have here is absolutely huge, and merely
> having a plugin that activates when you open a /dev/video* node
> really doesn't solve it.
>=20
> All in all, I really don't think "lets hope someone writes a v4l2
> plugin to solve it" is ever going to be successful.  I don't even
> see that there will ever be a userspace application that is anything
> more than a representation of the dot graphs that users can use to
> manually configure the capture system with system knowledge.
>=20
> I think everyone needs to take a step back and think long and hard
> about this from the system usability perspective - I seriously
> doubt that we will ever see any kind of solution to this if we
> continue to progress with "we'll sort it in userspace some day."

Mid-layer is difficult... there are _hundreds_ of possible
pipeline setups. If it should live in kernel or in userspace is a
question... but I don't think having it in kernel helps in any way.

Best regards,
									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--7JfCtLOvnd9MIVvH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAljFvaAACgkQMOfwapXb+vKR8gCcD5FQHJG8ZM1Y4tq2U1TLGrNL
oO4AnRfJMH3U5KWa7FUscWzOUqeOqHuw
=Ls/3
-----END PGP SIGNATURE-----

--7JfCtLOvnd9MIVvH--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
