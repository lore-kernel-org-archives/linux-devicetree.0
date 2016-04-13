From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] regulator: DT: Add support to scale ramp delay based
 on platform behavior
Date: Wed, 13 Apr 2016 07:53:10 +0100
Message-ID: <20160413065310.GK14664@sirena.org.uk>
References: <20160331185945.GT2350@sirena.org.uk>
 <56FD7379.2000307@nvidia.com>
 <20160331192227.GU2350@sirena.org.uk>
 <56FD7F07.7010404@nvidia.com>
 <20160331203942.GV2350@sirena.org.uk>
 <56FE2009.4020302@nvidia.com>
 <20160401161121.GZ2350@sirena.org.uk>
 <570370E5.3070901@nvidia.com>
 <20160412010226.GO3351@sirena.org.uk>
 <570CF822.4050002@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Ah40dssYA/cDqAW1"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <570CF822.4050002-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Bjorn Andersson <bjorn-UYDU3/A3LUY@public.gmane.org>, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Gandhar Dighe <gdighe-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stuart Yates <syates-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--Ah40dssYA/cDqAW1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 12, 2016 at 06:59:06PM +0530, Laxman Dewangan wrote:

> I have put my understanding based on datasheet and observation but it seems
> I am missing some important information which is making difficult to
> understand further here.
> We are not crossing the maximum limit of the load on the rail per datasheet.
> We just changed the output capacitor in the platforms and saw deviation.

Well, we might be hitting an inrush limit as we attempt to ramp the
voltage up.

> I think I need to go again to Vendor to find out that why changing of
> capacitor making the deviation in ramp delay and what is the relation.
> Probably, that may help here.

Possibly.  It did also occur to me last night that having a Maxim
specific property which lets you specify a raw register value to
configure in cases where the board goes out of spec (as opposed to a
time which could be left specified as the real value) might solve the
problem without being too terrible from an interface point of view,
though something that's directly obvious from the schematic would be
much better.

--Ah40dssYA/cDqAW1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXDezVAAoJECTWi3JdVIfQPO8H/A1Tzw0MSCdRa1xg7lYZ95my
PizY6WxKzIAb4IBM1eCGCO4vyBtA2/Zm0IKDj1yvyqWsw8agq47X0R98fJgS2KO9
MzkQx1PAaA7mVroQLUOz34hZOeNuQfkrI+IoodP6hwacGps67gAErlzu9Gm4E8Rs
Q45eVIQLNmY6hj21831FFkI9PjblgNm217pAPRvqiwR6GCv3MW0+4Vq0MLzQf/U1
4GTb3SU0j8BFUmuLlD1sZ5o4YfnneVTXIMSE86y7plEQsfmJyn9J25AQbpCoezpJ
wLTxA/AbXIr5eDvwqk6aGZVNsy4oXTxhx3lc9JhK4JJapLG1FWCWAeQIDismzqI=
=nlWN
-----END PGP SIGNATURE-----

--Ah40dssYA/cDqAW1--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
