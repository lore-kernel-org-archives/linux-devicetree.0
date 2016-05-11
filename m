From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH RESEND 1/2] regulator: Add support for parsing operation
 mode
Date: Wed, 11 May 2016 15:46:32 +0100
Message-ID: <20160511144632.GH6261@sirena.org.uk>
References: <1462959090-2877-1-git-send-email-henryc.chen@mediatek.com>
 <1462959090-2877-2-git-send-email-henryc.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xQmOcGOVkeO43v2v"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1462959090-2877-2-git-send-email-henryc.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Henry Chen <henryc.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--xQmOcGOVkeO43v2v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 11, 2016 at 05:31:29PM +0800, Henry Chen wrote:

> +- regulator-allow-change-mode: allow the regulator mode to be configured
> +- regulator-supported-modes: Regulators can run in a variety of different operating
> +  modes depending on output load. This allows further system power savings by
> +  selecting the best (and most efficient) regulator mode for a desired load.
> +  The definition for each of these operation is defined at
> +  include/linux/regulator/consumer.h

It really isn't OK for a DT binding to be documented by referencing
Linux kernel internals.

> +	0: FAST.
> +	1: NORMAL.
> +	2: IDLE.
> +	3: STANDBY.

The problem with these is that they don't really mean anything outside
of a specific regulator.  This makes it very hard to make them at all
interoperable, and is also incompatible with the way we're currently
handling the modes elsewhere in the bindings.  If we're going to make an
ABI of this we need to have something with abstraction in it but it's
hard to see how to abstract modes since they're so implementation
specific, even if the mechanisms are similar the different load ranges
that regulators support mean that what's a very taxing load for one
regulator may be nothing to another.

--xQmOcGOVkeO43v2v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXM0XGAAoJECTWi3JdVIfQXaEH/ir8TUe8a3SqSLLwGwueng6o
MdcL0Ae3iEaFhdT59kKRHgB70ORdEBRFQnt8I4uG3acHyuupy+JTyuP/7V3RXQJ5
unGcqP30uXuhAgWMOCk0c3j/FAzH8Cd3TEymKn6qxQLRDLuRfdOf3DFes17WV0Qh
t9DhOYGMSZeSRbUVN3zwlw3kFn612lqkuOegb5nrGes8Emp1db2g2e3hLz1vcDMR
hAZ5PGpQlR0rW3EhHH/p35RUF5H2HpBs2EQLDWElSE9o5TepDyU2zgz8Ur/xrDEk
5GYQL5emoS9lQIQ/J39yT/ci5R63Rcw20YXNRDbmqspafF5aAadaL9c18sM1Q6c=
=JSAM
-----END PGP SIGNATURE-----

--xQmOcGOVkeO43v2v--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
