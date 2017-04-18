From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH 1/3] drm/vc4: Turn the V3D clock on at runtime.
Date: Tue, 18 Apr 2017 12:23:50 -0700
Message-ID: <87tw5lldtl.fsf@eliezer.anholt.net>
References: <20170418191157.18517-1-eric@anholt.net>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170418191157.18517-1-eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain

Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org> writes:

> For the Raspberry Pi's bindings, the power domain also implicitly
> turns on the clock and deasserts reset, but for the new Cygnus port we
> start representing the clock in the devicetree.

> +	v3d->clk = devm_clk_get(dev, "v3d_clk");
> +	if (IS_ERR(v3d->clk)) {
> +		int ret = PTR_ERR(v3d->clk);
> +
> +		if (ret == -ENODEV) {

Apparently I hadn't booted this on RPi yet.  This is supposed to be
-ENOENT.

> +			/* bcm2835 didn't have a clock reference in the DT. */
> +			ret = 0;
> +			v3d->clk = NULL;
> +		} else {
> +			if (ret != -EPROBE_DEFER)
> +				dev_err(dev, "Failed to get V3D clock: %d\n",
> +					ret);
> +			return ret;
> +		}
> +	}

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlj2Z8YACgkQtdYpNtH8
nujEZRAAspu9+nIn6ocSbJfegJrrF1WkC0wTbzqyB1d5lfWO+2eVZ36KCF8rQGEJ
KWMJTPGEzoILPtFMuoGazlNbnroMMhuPtVJqyfmtchMhWkTAIwxfzqQIUR7dsBRo
lP+RiTHE6KQZvGlMEL84UXzNoo1/lF+2zrBWDmxrvYrjWt5SnZ7S9RiSro5LMPug
sKAeweBMG5Twq82kCG/EBBIvjN4rDUQWUdtyeaB/rR7OisuBxOlqcpju4zdFz/mW
QKFlbhzefyxOepDNHbhYSZ0Qxx1Zww5fcZyGJIhoY0iMx0J5liMd9aT9v0TXs5Wc
obnuPDxxKqaKUWdOr3gP2eCsnb4egNduk9+f/j01pF14AOsBex3c+9GNy1FcUUCf
Bw4NGuqHapn5HFnJvAI7pdw/4y9vRh/0uJ2WUk3GW+/xvGyDupJBddzO83fl/Chy
c8HYgxt2PLAqPVon6igTYdaprVsbDmG7e7+Oiq+orlTcJJZDX42/oaz9R+wzxwx3
hPN+2GvU6WE7eXUsMX0trO5527W+p2piFHkbqMAME65uqpyhQlGTLPIiVrGphlTh
o2VfjOlMZuwBrdeXUrRYwPuzqoHHadpzZTKH/7c5DEof1wsXgIpW5panPhjPI4NQ
j9dZx+XoQiTnHBPn5NMAfF/kttLOSlTUhJNeZYOxQvU7oZrmK7Q=
=ruS9
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
