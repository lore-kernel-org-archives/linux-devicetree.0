From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RESUBMIT PATCH v3 7/8] regulator: sky81452: Add compatible
 string for device binding
Date: Tue, 7 Oct 2014 13:52:21 +0100
Message-ID: <20141007125221.GG4609@sirena.org.uk>
References: <1412657745-7812-1-git-send-email-jack.yoo@skyworksinc.com>
 <1412658667-8196-1-git-send-email-jack.yoo@skyworksinc.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wZwWzkkm73dI25u3"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1412658667-8196-1-git-send-email-jack.yoo-tjhQNA90jdKqndwCJWfcng@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gyungoh Yoo <gyungoh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jack.yoo-tjhQNA90jdKqndwCJWfcng@public.gmane.org
List-Id: devicetree@vger.kernel.org


--wZwWzkkm73dI25u3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 07, 2014 at 02:11:07PM +0900, Gyungoh Yoo wrote:
> Signed-off-by: Gyungoh Yoo <jack.yoo-tjhQNA90jdKqndwCJWfcng@public.gmane.org>

Several problems here:

 - I don't have patches 1-6 or the cover letter for this series - what
   are the dependencies?
 - I can't see any sign that my concerns about the driver not actually
   being reusable have been addressed here.
 - This patch appears to do way more than add a compatible string, for
   example:

> -	np = of_get_child_by_name(dev->parent->of_node, "regulator");
> -	if (unlikely(!np)) {
> +	if (!np) {
>  		dev_err(dev, "regulator node not found");
> -		return NULL;
> +		return ERR_PTR(-ENODATA);

--wZwWzkkm73dI25u3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUM+IEAAoJECTWi3JdVIfQYvQH/A6k+JAGfqKBx33HBmfSuDks
Tz/nTvj0KlH6/AB9rlUHZEl6pawKsVdKFYnWSZt4dIbHtQbVY96DgRM+OG+WiP2x
0W7/PBqg4nmXKWZbxQh9YhxBMXfdyoJEpkQhocqg5KWsb/6OAyxlb1Ba/O+dMQVJ
jtJix5+InoKTZLBX4zlQBPL7gp5ZcGRuMLbJSa7vmNRCdwwOu3pO2S5o+ZmUuYSp
lv8DywC3iS4ToFYI81b3aLtTkGobLp4bGBJTjuwpLI48GFt10aNl/Yd/WC4clb/m
lcz/LYjG5qf3tAFsUpG3gtEgOih27VjYRyE7ix5h1CSFZEvSyDJFt+fHcSNsAVA=
=hwNA
-----END PGP SIGNATURE-----

--wZwWzkkm73dI25u3--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
