From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 6/6] dt-bindings: pwm-regulator: Document enable-gpio
 property
Date: Wed, 22 Jun 2016 11:36:23 +0100
Message-ID: <20160622103623.GL28202@sirena.org.uk>
References: <20160622082558.20935-1-acourbot@nvidia.com>
 <20160622082558.20935-7-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aYrjF+tKt+ApYAdb"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160622082558.20935-7-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org


--aYrjF+tKt+ApYAdb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 22, 2016 at 05:25:58PM +0900, Alexandre Courbot wrote:
> Add and document the enable-gpio property. Its behavior is similar to
> the property of the same name found in GPIO regulator and fixed
> regulator.

Please submit patches using subject lines reflecting the style for the
subsystem.  This makes it easier for people to identify relevant
patches.

> +Optional properties:
> +--------------------
> +- enable-gpio:		GPIO to use to enable/disable the regulator
> +

The DT people are going to want this to be -gpios.

--aYrjF+tKt+ApYAdb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXamomAAoJECTWi3JdVIfQ87EH/29ZNmWS68Q2wCAKoTJqTAho
/SW9FWGPYCibUdaxv/2bk94p0Uu0dMLIIvQ5asD2gaC+1JJ3O2YGQVhlTa93yidk
zun0pkGNeC/F3iUiSswAAPYiAUyYDUFmoW9Vs6kXf7SNdlpCHJwQOwgmfUzSywtb
4jx5aZ9rwTyaJhkl2YoJgv1iP7txFwCTZV07r2o0wU+v8t7gTeTZY34jYozDjSMb
vZ4/Hi+wDl2T6l2OakVq49wMrLQK0gvlmBqTW3w0j9r/ZIAmNTNOdjvQTmjWBxq4
+p0vCwttmMA/bem0flgtwSKB91r8HnNzS83mWXdYyFruA9jn2zM/6BmlQQfs4Y0=
=yn3y
-----END PGP SIGNATURE-----

--aYrjF+tKt+ApYAdb--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
