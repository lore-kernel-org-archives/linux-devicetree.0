From: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Subject: Re: [PATCH] devicetree: Add video bus switch
Date: Fri, 22 Dec 2017 10:24:52 +0100
Message-ID: <20171222092452.GA16581@amd>
References: <20161023200355.GA5391@amd>
 <20170203213454.GD12291@valkosipuli.retiisi.org.uk>
 <20170204215610.GA9243@amd>
 <75694885.3PuLWzx4qN@avalon>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="dDRMvlgZJXvWKvBx"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <75694885.3PuLWzx4qN@avalon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ivo.g.dimitrov.75-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pali.rohar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--dDRMvlgZJXvWKvBx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > I don't really object using g_endpoint_config() as a temporary soluti=
on;
> > > I'd like to have Laurent's opinion on that though. Another option is =
to
> > > wait, but we've already waited a looong time (as in total).
> >=20
> > Laurent, do you have some input here? We have simple "2 cameras
> > connected to one signal processor" situation here. We need some way of
> > passing endpoint configuration from the sensors through the switch. I
> > did this:
>=20
> Could you give me a bit more information about the platform you're target=
ing:=20
> how the switch is connected, what kind of switch it is, and what endpoint=
=20
> configuration data you need ?

Platform is Nokia N900, Ivaylo already gave pointer to schematics.

Switch is controlled using GPIO, and basically there's CSI
configuration that would normally be in the device tree, but now we
have two CSI configurations to select from...

> > 9) Highly reconfigurable hardware - Julien Beraud
> >=20
> > - 44 sub-devices connected with an interconnect.
> > - As long as formats match, any sub-device could be connected to any
> > - other sub-device through a link.
> > - The result is 44 * 44 links at worst.
> > - A switch sub-device proposed as the solution to model the
> > - interconnect. The sub-devices are connected to the switch
> > - sub-devices through the hardware links that connect to the
> > - interconnect.
> > - The switch would be controlled through new IOCTLs S_ROUTING and
> > - G_ROUTING.
> > - Patches available:
> >  http://git.linuxtv.org/cgit.cgi/pinchartl/media.git/log/?h=3Dxilinx-wip
> >=20
> > but the patches are from 2005. So I guess I'll need some guidance here.=
=2E.
>=20
> You made me feel very old for a moment. The patches are from 2015 :-)

Sorry about that :-).
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--dDRMvlgZJXvWKvBx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlo8z2QACgkQMOfwapXb+vJsZgCbBTP/TSZqeMt9ztNZwy8vgxeo
Dv0AoJlt7/yNRop9DRe4vJWCTXucHDJy
=Ec4d
-----END PGP SIGNATURE-----

--dDRMvlgZJXvWKvBx--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
