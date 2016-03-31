From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] regulator: DT: Add support to scale ramp delay based
 on platform behavior
Date: Thu, 31 Mar 2016 13:39:42 -0700
Message-ID: <20160331203942.GV2350@sirena.org.uk>
References: <20160331174741.GO2350@sirena.org.uk>
 <56FD62BA.3040406@nvidia.com>
 <20160331183130.GR2350@sirena.org.uk>
 <56FD6CF7.5080909@nvidia.com>
 <20160331184553.GS2350@sirena.org.uk>
 <56FD6ED6.3020507@nvidia.com>
 <20160331185945.GT2350@sirena.org.uk>
 <56FD7379.2000307@nvidia.com>
 <20160331192227.GU2350@sirena.org.uk>
 <56FD7F07.7010404@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qCb2VTfFGdRLn6RH"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <56FD7F07.7010404-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Bjorn Andersson <bjorn-UYDU3/A3LUY@public.gmane.org>, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Gandhar Dighe <gdighe-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stuart Yates <syates-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--qCb2VTfFGdRLn6RH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 01, 2016 at 01:18:23AM +0530, Laxman Dewangan wrote:
> On Friday 01 April 2016 12:52 AM, Mark Brown wrote:

> >So why doesn't the device end up configuring 100mV/us when asked for
> >50mv/us?  That's reasonably expected - the configured ramp rate is a
> >maximum rate given that this is used to limit inrush current.

> We did this to adjust device configuration to nearest higher side but this
> is not working well on some of cases.

> On same device, DCDC (SD) rails support 4 ramp configurations, 13.75mV/us,
> 27.5mV/us, 55mV/us and 100mV/us.

> HW team measured the  ramp time at 7.5mV/us when device configured at
> 27.5mV/uS.

> So as per above, it will be adjusted to 13.75mV/us (nearest higher side) for
> device configuration but this device need to configure for 27.5mV/us.

You're saying that the device is so bad at regulating the ramp rate that
it's not only failing to keep up with the desired ramp rate and capping
at whatever rate but it's also doing even worse if configured for a
slower rate?  That's not great, it sounds like it's doing the ramp
control via some sort of dead reckoning thing rather than by actually
ramping the voltage it's trying to regulate like it was asked to.

Is the error in the observed values a function of the capacitance that
we can calcuate here?

--qCb2VTfFGdRLn6RH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJW/YsJAAoJECTWi3JdVIfQb2kH/2Tc7Lhv8rnj7OiEUuvO6Lys
vn3A2MwOFl3H6MJmp1kMwzO6KR67kF/pFSohVKG85vNKBoqVJQg74NqvtoP52Cie
FLbf1YBWs+r5NXegK/dx4RXJdLL6ZEU7PxddnOKY/Od3AsQPDPgpVYbh2o9uDpdf
inCyRboZCt1bVFfPBi/gWUsLqo/3sPhYp0552++HRotz1lSt00VI6tBgngiJmNEH
GfFJcNzoS3NoYi8iHTz1cdyZmAedWK2GL0rhb9D0uQSDscrlerijlYa1V3WePx1J
2z+p/gCaaiWn6vwvEceZ+ecYfr2MNBhUoTLPKfwqw0C4MGiPdrl0pbZaU2w5veY=
=v42+
-----END PGP SIGNATURE-----

--qCb2VTfFGdRLn6RH--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
