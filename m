From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] regulator: DT: Add support to scale ramp delay based
 on platform behavior
Date: Tue, 12 Apr 2016 02:02:26 +0100
Message-ID: <20160412010226.GO3351@sirena.org.uk>
References: <20160331184553.GS2350@sirena.org.uk>
 <56FD6ED6.3020507@nvidia.com>
 <20160331185945.GT2350@sirena.org.uk>
 <56FD7379.2000307@nvidia.com>
 <20160331192227.GU2350@sirena.org.uk>
 <56FD7F07.7010404@nvidia.com>
 <20160331203942.GV2350@sirena.org.uk>
 <56FE2009.4020302@nvidia.com>
 <20160401161121.GZ2350@sirena.org.uk>
 <570370E5.3070901@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sGwo475CiIwWEjLI"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <570370E5.3070901-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Bjorn Andersson <bjorn-UYDU3/A3LUY@public.gmane.org>, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Gandhar Dighe <gdighe-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stuart Yates <syates-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--sGwo475CiIwWEjLI
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 05, 2016 at 01:31:41PM +0530, Laxman Dewangan wrote:
> On Friday 01 April 2016 09:41 PM, Mark Brown wrote:

> >>As per datasheet, There is no direct equation for ramp time deviation w=
hen
> >>regulator output current cross the regulator current limit.

> >OK, so it's really a current limit that's kicking in rather than a ramp
> >rate control (though if it's a current limit I'm still not clear why the
> >target rate limits where we cap)?  Can we do something based on the

> We are not having any control/configuration for this in this particular
> observations. All are set at maximum and still seeing this deviation.

I'm not sure how that follows from what I'm saying?  I'm saying we know
the limit, not that we can control the limit.

> During a DVS transition, the regulators output current will increase by
> COUT*dV/dt. In the event that the load current plus the additional current
> imposed by the DVS transition, reach the regulator=92s current limit, the
> current limit will be enforced. When the current limit is enforced, the
> advertised DVS transition rate (dV/dt) will not occur.

> Now there is not really equation that how it control dV/dt with required
> current vs regulator=92s current limit current limit.

I'm having a hard time tying this in with what you're saying.  You're
saying we have a predictable limit based on some hard maximum inrush
current but we can't tell what that limit is?  What I'd expect is that
we'd get the spec limit up to some maximum and then cap out at that.

> Working with HW team on LDO3 rail, we observed that Vendor recommend the
> Cout to 2.2uF. With having this capacitor in rail, we meet the advertised
> dv/dt i.e. 100mV/us.
> In Our platform, we have used 2x4.7uF for signal conditioning and we
> observed dv/dt went by half.
> When we changed the output capacitor to 2.2uF, we get exactly what vendor
> advertised.

The charge rate of the capactior should be a spec thing for the
capacitor shouldn't it? =20

> So can we derive the configured value from the ramp time (platform) and s=
ome
> multiplication factor? If this is not common way then probably maxim
> specific as suggested by Bjorn.

How can we use a multiple of the advertised limit if we can't tell what
the limit is going to be?

--sGwo475CiIwWEjLI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXDEkhAAoJECTWi3JdVIfQFlEH+wa32fM4T0XZ8vRpBB1g4vJV
+RcXXf1VwoDspeL8CKmELlL6GOfYknfIUVSSPkaJyYNBhxveEOduGBq/vDgVveFu
hiTuIagXNq6orsEP6gp7blkbsN0b4HzozQwuefWeeBSQ8wSD5bByrlSflk0a1aNv
DciUvDHtNFapKhtXQqaQLgXijcSRSVtZT6KhuahytVLTo3JxE+GR1bu+r/SjzuAS
YeeiLwnOgTI85I7EKR/jUhSP4Vdm9gQ9gNNVH9SLOoUMg+uKbY4Euv8ooJ+SzVP6
Sy0/sYMpQlyCVIBR4l+dL8vjDfa5wb49Cqh08Q/bdTfML2Cn2c0b7E33oof4cK4=
=jYeE
-----END PGP SIGNATURE-----

--sGwo475CiIwWEjLI--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
