From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] regulator, dt: add dt support for tps6502x regulator
Date: Wed, 21 Oct 2015 13:19:25 +0100
Message-ID: <20151021121925.GC8232@sirena.org.uk>
References: <1445236033-27747-1-git-send-email-hs@denx.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Izn7cH1Com+I3R9J"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1445236033-27747-1-git-send-email-hs-ynQEQJNshbs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--Izn7cH1Com+I3R9J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 19, 2015 at 08:27:13AM +0200, Heiko Schocher wrote:

> --- /dev/null
> +++ b/arch/arm/boot/dts/tps65023.dtsi

If this file is needed there is something broken, if this file is not
needed then it is just noise since everything in it needs to be
overridden by users anyway.  Either way please remove it.

> +		vldo2_reg: regulator@4 {
> +			reg = <4>;
> +			regulator-compatible = "vldo2", "regulator-compatible";

Modern bindings no longer use regulator-compatible, they just use the
node name - please look at recently added bindings for examples.

--Izn7cH1Com+I3R9J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWJ4LMAAoJECTWi3JdVIfQWT4H/3iRlzqN8z50OQX6tcPyE2j8
wurPUJGVhmZ/mkIQ8kET0or0bbpmYnTq0fmE9mscOvpEjMgXkU0aa6G7x9IR7irn
6ZScyNhtxh8K2T2LwIL5da1kkEUeLPaguYJ/j/wDSy0TQ50HTCQXBsL83oH5KG6e
g0ToRNdbUoZ2p/AM8+rZB0PXgiIqLw1fkzqCH7DPxPrthBX9YMAO5nJZT182HZ2P
+bm2WeUJij/pRYWFL6igSQy4aWWetmVPRlXjij/qOe0HrUIfiTw+FugDt8XtNOri
YoEYQApUQO9LqFILYgegBCDo0dKF2vEYmeuFYU7eHw7MbYQrck1nOFzacFLDOT0=
=/BBn
-----END PGP SIGNATURE-----

--Izn7cH1Com+I3R9J--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
