From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 4/4] regulator: Prevent falling too fast
Date: Fri, 16 Sep 2016 19:48:57 +0100
Message-ID: <20160916184857.GC10189@sirena.org.uk>
References: <20160906190524.GB79728@google.com>
 <20160912185633.GH27946@sirena.org.uk>
 <20160913172140.GC62872@google.com>
 <20160915143945.GJ27974@sirena.org.uk>
 <20160915180223.GE62872@google.com>
 <20160916163253.GA10189@sirena.org.uk>
 <20160916183145.GF62872@google.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="bKyqfOwhbdpXa4YI"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160916183145.GF62872-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--bKyqfOwhbdpXa4YI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 16, 2016 at 11:31:45AM -0700, Matthias Kaehlcke wrote:
> El Fri, Sep 16, 2016 at 05:32:53PM +0100 Mark Brown ha dit:

> > It does sound rather like we ought to be representing this chip
> > directly in case it needs other workarounds.

> Ok, we'll consider this. It seems we can drop this patch since the
> regulator core is not the best place to address this problem.

Perhaps it is, perhaps it isn't - the above is a question about how we
describe this stuff.

--bKyqfOwhbdpXa4YI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJX3D6YAAoJECTWi3JdVIfQ6fwH/1oksFxevJGIApefJHXXObP0
lX8gBDPLpzG/7oy0XunJRxEvKpagAr6g/DgbmfAK025N/nLeZr3+olYKFcu99iY2
33s+6rl4+gg/8488h4Ivkt3NAdGA6vIHvE3iIdBwWGJLVep7e8tIJIC/ZpjJjSVo
zIZwomaiwxJt0o5MNjImkSGr/x0e/ZFOsbqLIcuJHhxjBQ4cirtkjHtbgJRpPTyc
7MEvjFs/NiwzJ/asQTtlYpgfMh3pl1ghe1moPKjsAOOBcQtIqr/MtGKwZgBqfgaC
Nj6zAVdoDuhw2545ww66XEybo+evoFArpSzJ0I2QtwnkAgsNpZjjUb6FUUFW95M=
=EJhT
-----END PGP SIGNATURE-----

--bKyqfOwhbdpXa4YI--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
