From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] regulator: of: Add support for parsing
 regulator_state for suspend state
Date: Mon, 9 Jun 2014 20:21:33 +0100
Message-ID: <20140609192133.GD5099@sirena.org.uk>
References: <1402309780-8118-1-git-send-email-cw00.choi@samsung.com>
 <1402309780-8118-2-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8ZMYqwT4qqBjIaog"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1402309780-8118-2-git-send-email-cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--8ZMYqwT4qqBjIaog
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 09, 2014 at 07:29:39PM +0900, Chanwoo Choi wrote:

> +		ret = of_property_read_u32(suspend_np, "regulator-mode", &pval);
> +		if (!ret)
> +			suspend_state->mode = pval;

If we're going to do that we'd need to define what modes mean in the DT
binding - currently there's no support for modes at all because it's
complicated to come up with sensible and meaningful generic defintions.

--8ZMYqwT4qqBjIaog
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTlgk6AAoJELSic+t+oim9/q8QAIKJOFdSQd/ypBHEeNkpLx9z
kG1tP1rTdYy/9jmI7Z82o5JFwWe6Qfo2qQEtnwLbbEy8g7GefoPF8wi1RvhHXCi3
Y7Fn6wmSd87/zofoF3pZ58O0M0L2BswChsao+PJv/2ZJ22XDW45tFs29ThcVRb6y
1G2MWsirqM/Rg1S2YUboZPlQIho6k9TCp/QsbamjOMwFdhLJCGJ2AG+8qEDwpuzd
m0eJw4LSMcH/exs49x0mcG3zaPeN8l0lKYADBxdozkTNC8sp4wycqUqj0l+n1Zhe
rgWqlwSZcKHt+Nx8iOvWqRE5XCHePELMSxTUIJgfQ23VA4io1UwleFi9lvGfRCvM
o2CIeys+cKI7CAUXn1dl8ADRwNesqThPlJ3GPsJfRz8imBQtpvn7l+1LmgEol/TU
nGtGq/uuHqbuqeKKiejqqpUTs+APBncUcoerF3NI85hGnXvW8Ka+c27fDMN9mjex
DKwMzU9BVcqsUV736VFgDoispjsszzaXgTI4YmuRFYPsojSIl8Hvuqu37o412bd3
wLrg1dsl/hLpRlLRfqMhgx3MrRnsOvgDz0Jm/2J45dDNhOnZdYq0b0Ge/r6rrbs1
zT/HYCzQNeB4z/SlumkKbG7HaNDmOU0GeLPuRbBKqiRPOLYleXrudIqj++GNYoPT
T6ru3av1xBw03yRChUJM
=co7W
-----END PGP SIGNATURE-----

--8ZMYqwT4qqBjIaog--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
