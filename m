From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH (v2) 2/2] regulator: bcm63xx: Add BCM63xx fixed regulator
 device
Date: Tue, 1 Dec 2015 15:11:23 +0000
Message-ID: <20151201151123.GK1929@sirena.org.uk>
References: <565A18DD.60108@simon.arlott.org.uk>
 <20151130121043.GX1929@sirena.org.uk>
 <565CB1CF.5040306@simon.arlott.org.uk>
 <565CB1FF.9090407@simon.arlott.org.uk>
 <565CB3C6.30301@simon.arlott.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8VdhJeX3P1F5ipXj"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <565CB3C6.30301-qdVf85lJwsCyrPCCpiK2c/XRex20P6io@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Arlott <simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--8VdhJeX3P1F5ipXj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 30, 2015 at 08:38:30PM +0000, Simon Arlott wrote:
> The BCM63xx has one or more registers with bits that act as regulators
> to enable/disable power to individual chip peripherals.

Please don't submit new revisions of single patches in followup to an
existing series, it just makes everything more confusing.  If you need
to update a series please just post an update to the series.

--8VdhJeX3P1F5ipXj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWXbibAAoJECTWi3JdVIfQc+wH/09EjH+40rzX9zsg9yh6FV4w
fC7UW24hEW4lrFnbCNV2y08zTvvOcu4vH3eQQrkEk/JyLZjvMjbW50NeOrQxRN3P
TDA14IIjAaFQ5iEBEFI8JBzneBvxXulQcUXDRwP2J6qRUKWDBjpEey7oneK+aNw/
jYF76Cjvq1SQmu6GAHvYz2uHs8RzTCCE/Zoun5Xf/+2JgkEZi9pYZ/tjOsZjBZ0m
DQRBp9pY8XskJsxTZvxf0BFCxOTZ359LNB75BiDt/roK41WkOkqDJBjAhcsAokPd
apWpbFoRvXZT9qU33bS6RXK5AWXithU6P2fipUOt61v6jt+Z/fH+2YAphq+of4k=
=NHfs
-----END PGP SIGNATURE-----

--8VdhJeX3P1F5ipXj--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
