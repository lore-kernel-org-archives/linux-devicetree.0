From: Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] devicetree: Add video bus switch
Date: Mon, 6 Feb 2017 00:40:12 +0100
Message-ID: <20170205234011.nyttcpurodvoztor@earth>
References: <20161222100104.GA30917@amd>
 <20161222133938.GA30259@amd>
 <20161224152031.GA8420@amd>
 <20170203123508.GA10286@amd>
 <20170203130740.GB12291@valkosipuli.retiisi.org.uk>
 <20170203210610.GA18379@amd>
 <20170203213454.GD12291@valkosipuli.retiisi.org.uk>
 <20170204215610.GA9243@amd>
 <20170204223350.GF12291@valkosipuli.retiisi.org.uk>
 <20170205211219.GA27072@amd>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="hsa5w3nc3z4kwrea"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170205211219.GA27072@amd>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Cc: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>, mchehab-JsYNTwtnfakRB7SZvlqPiA@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ivo.g.dimitrov.75-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, pali.rohar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--hsa5w3nc3z4kwrea
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Feb 05, 2017 at 10:12:20PM +0100, Pavel Machek wrote:
> > > 9) Highly reconfigurable hardware - Julien Beraud
> > >=20
> > > - 44 sub-devices connected with an interconnect.
> > > - As long as formats match, any sub-device could be connected to any
> > > - other sub-device through a link.
> > > - The result is 44 * 44 links at worst.
> > > - A switch sub-device proposed as the solution to model the
> > > - interconnect. The sub-devices are connected to the switch
> > > - sub-devices through the hardware links that connect to the
> > > - interconnect.
> > > - The switch would be controlled through new IOCTLs S_ROUTING and
> > > - G_ROUTING.
> > > - Patches available:
> > >  http://git.linuxtv.org/cgit.cgi/pinchartl/media.git/log/?h=3Dxilinx-=
wip
> > >=20
> > > but the patches are from 2005. So I guess I'll need some guidance her=
e...
> >=20
> > Yeah, that's where it began (2015?), but right now I can only suggest to
> > wait until there's more. My estimate is within next couple of weeks /
> > months. But it won't be years.
>=20
> Ok, week or two would be ok, couple of months is not. And all I need
> is single hook in common structure.
>=20
> So if g_endpoint_config hook looks sane to _you_, I suggest we simply
> proceed. Now, maybe Mauro Carvalho Chehab <mchehab-JsYNTwtnfakRB7SZvlqPiA@public.gmane.org>
> or Laurent or Julien will want a different solution, but
> then... they'll have to suggest something doable now, not in couple of
> months.
>=20
> Does that sound like a plan?
>=20
> Mauro added to cc list, so we can get some input.

side note: It's an kernel-internal API only used by the media
subsystem. Code can be easily updated to use an improved API
at any time.

-- Sebastian

--hsa5w3nc3z4kwrea
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAliXt9gACgkQ2O7X88g7
+pqgRg//c7m63upARz98FCv0tKxC3zUETPs9tK+eRfntFmeJyDXeDz1G8jWtnU47
DQcQRR/RYPbYAbBg1+G0nmPZg2MYMzLMNvPHb05gppZOrPf7Yd+F6DgbxnqNR4sb
KUgH4EVrVtoez3smYZ/zUiSN9dGy+2XTZnf4RLQY+UAYIwpvXukkZ8mXcK01Mquw
IBkROg5xx6S+fMtn3HwJ565lhgI27NHxk2ydcN8Pw+TuOF9Rf2dg9oTU9oGOomCO
+5e6x8EiTsGrD894tmmHZvnl3JTw4gM5OF+j/NTGS/hbtHw+2nEfYI14hkzXmo27
LCG7RKyBDeRYTC+W3q2bmio+AKXS3Sl2UcPzzM3nwa6DkssEdTyL/bo5yPHkVmTH
Oe0LV4LPVRaB9YgIlnPxVgLTMsG3730O4I7bqXcanWqAIQd9uBLxJoNobz34VdK6
qHvbDQechmMQBe7vvMUsHCvKtJz3N6sK/rLm6bLXX9UlsQ/Rk5OQJQJQ0vUGVGHO
QtrXYT9b6frRingTMK3RLhfj6F7g7nOyTYPCD9aYVEnz+d86pGZDSsrIDI38G2nO
a4qZ5hIHtYEtZ2EuDj1AQoFPvQaT+Fp6C/VpqaXxReL9cU0i/y8sucqb1p7oxWbg
aqsGt1WtbIjN3IjA+9yri3br7dU/RPTy6EkxVX1phBXCMct7LwY=
=u1hu
-----END PGP SIGNATURE-----

--hsa5w3nc3z4kwrea--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
