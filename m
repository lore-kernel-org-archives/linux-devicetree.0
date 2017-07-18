From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 3/9] regulator: mt6380: Add support for MT6380
Date: Tue, 18 Jul 2017 14:31:36 +0100
Message-ID: <20170718133136.xodadxf2crkcuhze@sirena.org.uk>
References: <cover.1500368529.git.sean.wang@mediatek.com>
 <0cd2be9a7058bb51fbbc7cc96101cba44fc081f6.1500368529.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="dfdkqc3sggxhs2dy"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <0cd2be9a7058bb51fbbc7cc96101cba44fc081f6.1500368529.git.sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, henryc.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, chen.zhong-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, chenglin.xu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--dfdkqc3sggxhs2dy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 18, 2017 at 05:49:23PM +0800, sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org wrote:

> +	if (!info->modeset_mask) {
> +		dev_err(&rdev->dev, "regulator %s doesn't support set_mode\n",
> +			info->desc.name);
> +		return -EINVAL;
> +	}

This is mostly fine but the mode operations all have this code - if the
regulator doesn't have modesetting facilities it just shouldn't have
the ops so the core can handle things in a standard fashion.  It'd mean
defining a separate set of operations for those regulators but that's
fine.

--dfdkqc3sggxhs2dy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlluDbcACgkQJNaLcl1U
h9B+Cwf9HSujIRg/u1J82rOg1ebZJhsoc12tnqLLt/yosdU7daQNJYsaA+GO6CaY
i8YKS9YAEU7fD9zJABlwE/lHnurMS5b4qcMROMQLgnEMiBSY1q96Z6AE/Fcz8Occ
JSK+bobhjz9m0qffEoagRid0z6uEr42uy1EuNxr5/Jhqx2rprghg2zIzKGdlibZC
7M263AYCl7nu+9ZRynAPab95ifF7UKgtLxyQpzLjfRi8QJirTVNBJLuie2MZO4og
1Esbl5dktqtCXvJA/bsYrhYYz0G3yGbzPGNkAPlqIYMy0Qo8T9bhWa9D7nr0lYPz
kk6VUE76SjFinEt9d0KogTWWXQdTMQ==
=Zjob
-----END PGP SIGNATURE-----

--dfdkqc3sggxhs2dy--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
