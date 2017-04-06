From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3] regulator: Add driver for voltage controlled
 regulators
Date: Thu, 6 Apr 2017 19:21:36 +0100
Message-ID: <20170406182136.yrwdoyqeuz4qxc6d@sirena.org.uk>
References: <20170331205035.126001-1-mka@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="zevge64hlv4wpbne"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170331205035.126001-1-mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--zevge64hlv4wpbne
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 31, 2017 at 01:50:35PM -0700, Matthias Kaehlcke wrote:

> +- compatible		  : must be "vctrl-regulator".
> +- regulator-min-microvolt : smallest voltage consumers may set
> +- regulator-max-microvolt : largest voltage consumers may set
> +- ctrl-regulator:	  : the name of the regulator supplying the control
> +			    voltage.

This looks good except for this bit where we read the regulator name out
of the DT, that's generally a sign of bad practice for things that are
less simple passives than things like this or fixed voltage regulators.
As with the supplies for fixed voltage regulators just pick a name for
the supply (ctrl seems fine to me) and use that, neither option is
perfect but at elast this less typing for everyone and it's consistent
with what other similar things are already doing.

--zevge64hlv4wpbne
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAljmhy8ACgkQJNaLcl1U
h9D3ygf/QqKl27xYmCuuVeg9JE3AOM3YAY5UTqo3gsL4JMhWSXJMITA++WsiuKLW
3bYJeHxYW7PxpgYJB1hxw1O1tXbh1qQLOeMpZJNb6vwcYtj+AyBngyAECHB1U1kY
cmLgyrU/LzH8LRtjm+SWTS/vLDiG0mCfTGrb9clK3SCyho1cg3bsrQhXQPpAlcg7
FndSlsnMzzrmoEq2rEm8i0hADNqFaZ5V4AJd9Ktuwq4kSq75/702YSluDMY9Nh45
lj2ypHw4UiX1FPfSN8S+xCbVn6R88kkDsI8zRpTjezgxFKv/qgCBvNXUaULInvAn
2uYHfSLICAmLUO8Fa1wgVwcIjYATtw==
=HHCZ
-----END PGP SIGNATURE-----

--zevge64hlv4wpbne--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
