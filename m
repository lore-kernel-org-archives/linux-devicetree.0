From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 4/4] regulator: core: Balance coupled regulators
 voltages
Date: Thu, 21 Dec 2017 13:34:56 +0000
Message-ID: <20171221133456.GF6754@sirena.org.uk>
References: <1512639975-22241-1-git-send-email-m.purski@samsung.com>
 <CGME20171207094754eucas1p1528c6c30135124430a5c703eb81de8d2@eucas1p1.samsung.com>
 <1512639975-22241-5-git-send-email-m.purski@samsung.com>
 <20171212115427.GG16323@sirena.org.uk>
 <0bca0d20-1ca8-be4c-a60e-bbc0c640ae41@samsung.com>
 <20171215151958.GH1827@finisterre>
 <d7555270-5be3-a104-233c-ac0e6383f41b@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="cz6wLo+OExbGG7q/"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <d7555270-5be3-a104-233c-ac0e6383f41b-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maciej Purski <m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--cz6wLo+OExbGG7q/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 21, 2017 at 02:29:14PM +0100, Maciej Purski wrote:

> Now I can understand your point, but I still have doubts what is the
> advantage of that solution. For non-coupled regulators we end up with
> useless data structure - coupling_desc. That also might cause some
> confusion. We expect coupled regulators to be a very rare case, so in most
> of the cases we will have a pointless structure in reg_dev with a pointer to
> itself. Maybe you suggest that coupling_desc should contain something
> different?

It's precisely because it's such an unusual case that I'm looking to see
it as part of the common path - if it's not then it seems very liklely
that it'll get broken down the line and nobody will notice because the
code is never run.  Yes, it's unusual but having the unusual thing be a
bit more visible than it is used seems better than having support there
that gets broken.

--cz6wLo+OExbGG7q/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlo7uH8ACgkQJNaLcl1U
h9D4agf+IzuIve1u2BqY7aoy9LzN1ZBWwvJGBI93nyobJG27hDCERn8dtnUuoZ0T
H9Uyn262WfD5nU46LElGhOPaXiQw2pkUzHOgir8T4YAXKnD9Ri9Vdnal9wLxpHBP
FiUAKFIE1Fnuexbg1uezZGpDR33lx2+AljojJ2qi/zhLji/0LLiEkR4VjKEMAa0V
X/bWLKjCeINKSxdu5xERehpnU10krax1Ub6fGyRYlpq2pafFcTFJ9MbbQqp4u0zT
B0uOXyxMG6wVPV/+vMk6RTL1dvrmifMIHdOGGF1kUJ0fIIoU0xnWRC1oQsQzBM4z
4gtcUfzfht7ta6ByZNfnAgvMcd3JJg==
=RpqG
-----END PGP SIGNATURE-----

--cz6wLo+OExbGG7q/--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
