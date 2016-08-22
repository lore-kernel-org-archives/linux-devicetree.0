From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/9] regulator: core: Try full range when adjusting
 regulators to constraints
Date: Mon, 22 Aug 2016 19:09:32 +0100
Message-ID: <20160822180932.GW22076@sirena.org.uk>
References: <20160821021125.1521-1-wens@csie.org>
 <20160821021125.1521-4-wens@csie.org>
 <20160822162907.GO22076@sirena.org.uk>
 <20160822175205.h76hurjaopnosymc@vip.cybercity.dk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="NO4xtVTk6ycZDAf4"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160822175205.h76hurjaopnosymc-1EA3ORoCGBhoJ7GROcy7lA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rask Ingemann Lambertsen <ccc94453-1EA3ORoCGBhoJ7GROcy7lA@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--NO4xtVTk6ycZDAf4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 22, 2016 at 07:52:05PM +0200, Rask Ingemann Lambertsen wrote:
> On Mon, Aug 22, 2016 at 05:29:07PM +0100, Mark Brown wrote:

> > This seems like you have buggy constraints, constraints which allow
> > voltages that can't physically be satisfied don't make obvious sense.

> No, it's for cases like this (see the cubietruck4 or a80-optimus dts
> patches):

> 			reg_bldo4: bldo4 {
> 				regulator-min-microvolt = <1080000>;
> 				regulator-max-microvolt = <1320000>;
> 				regulator-name = "vcc12-hsic";
> 			};

> The regulator can do 1100000 uV, 1200000 uV and 1300000 uV, all of which
> are within the constraints, so obviously the constraints can be satisfied,
> yet the regulator core fails do so with a message like this:

Sure, but the constraints also say that you can do 1.32V which the
system is not physically capable of delivering.  That's not a good sign
for the constraints, it suggests that at least the capabilities of the
regulator have not been taken into consideration when setting up the
constraints.

--NO4xtVTk6ycZDAf4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXuz/bAAoJECTWi3JdVIfQDzcH/0nx+52RhyCVL9xr//FY5iDh
mSyxk+FVH2LJiTh1TpUFCIvTJlU/AaLJ1L+gHgNNu2qj4t929b2HTLwU1W0T8fSG
GDEIIg8R0Ra5H7U3MdyVidmUKkl2l8xcW4OR2pBhwRLf0FdQJPqAZ1xCyWaXzI5c
zLIaUtMapnPCswR8PwmbqylJrDOojdNCltEknGnP2CU17lYvKzrybLSMCeBMid5n
lF3tr6i3MeEdvWiDY957CIn4+slRaIdqPv61FZRdBlgT+LHEJ7+SQ6MIT79SHPAF
kDl5N0EMr5m+dwiUa0A7tm2tCgGCJuxbiKeD0llsGq+W8958gosIH7kd+bkxv1Q=
=Pm1W
-----END PGP SIGNATURE-----

--NO4xtVTk6ycZDAf4--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
