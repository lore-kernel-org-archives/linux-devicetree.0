From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] regulator: Add brcm,bcm63xx-regulator device tree
 binding
Date: Tue, 1 Dec 2015 22:16:15 +0000
Message-ID: <20151201221615.GY1929@sirena.org.uk>
References: <565A18DD.60108@simon.arlott.org.uk>
 <20151130121043.GX1929@sirena.org.uk>
 <565CB1CF.5040306@simon.arlott.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="w1kQleqTSl6UE45G"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <565CB1CF.5040306-qdVf85lJwsCyrPCCpiK2c/XRex20P6io@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Arlott <simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--w1kQleqTSl6UE45G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 30, 2015 at 08:30:07PM +0000, Simon Arlott wrote:

> +- offset: register offset
> +- mask: register enable mask
> +- startup-delay-us: startup time in microseconds

Why are these in the DT, I would expect that if this is a driver for a
specific SoC all these properties would be known as a result of that.

--w1kQleqTSl6UE45G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWXhwvAAoJECTWi3JdVIfQa38H/AltnCY/+X7MIX00TuF1EJwP
d0QBr0+TLONh3nwPo2itHb3WrJAulJVdvIlzJ9nynJlriZYdOvYTTd6qYoPWSRIQ
0Pf0Puj1w+0l8vPCKlbPCGaF0qroRQxXRn6ZeQKz53vBfQminSnyZebbEiTVCZ/W
9l1IUTHWFokak0guTL/sah7mj6qrWY8jypSwCV6nJZBVTvgwxunBI9zIuhjLE9sb
g7w9tcdxToXwvm1hsuEOCvdzRltF+SXsxNxa0iNscvlsqQqkV+59PiCG+bpKrHUA
rmAgl8xy+yPJCzUBpmSDZRF01ngJa9U42omKbBA12oGj3Z7d6PJIGbRM/VFAk74=
=zSU7
-----END PGP SIGNATURE-----

--w1kQleqTSl6UE45G--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
