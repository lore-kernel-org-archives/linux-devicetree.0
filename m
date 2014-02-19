From: Kevin Hao <haokexin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/4] of: reimplement the matching method for
 __of_match_node()
Date: Wed, 19 Feb 2014 15:58:12 +0800
Message-ID: <20140219075812.GE14031@pek-khao-d1.corp.ad.wrs.com>
References: <1392762680-1498-3-git-send-email-grant.likely@linaro.org>
 <1392790862-18025-1-git-send-email-haokexin@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JBi0ZxuS5uaEhkUZ"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1392790862-18025-1-git-send-email-haokexin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--JBi0ZxuS5uaEhkUZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 19, 2014 at 02:21:02PM +0800, Kevin Hao wrote:
> +		/*
> +		 * Matching compatible is better than matching type and name,
> +		 * and the specific compatible is better than the general.
> +		 */
> +		if (matches->compatible[0] &&
> +			 __of_device_is_compatible_score(node,
> +						matches->compatible, &score))
> +			score = INT_MAX - 4 * score;

It seems that we also need to adjust the above as what we do for the type
and name. The v3 is coming.

Thanks,
Kevin

--JBi0ZxuS5uaEhkUZ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQEcBAEBAgAGBQJTBGQUAAoJEJNY7TDerrFx4LMH/0Nfvr8v1VbSaIrqqWwTeFO2
nKkI0wjOQI6Ca1pJqC6GM3EcdO6aE1tS0hp385+7N0fnOUvg+RAzjA6gylTuEJIf
DYtMQZkpQ+RAKlbIeqs/uzBD/YjuHuVQR4v5Vu7khsePb91Y+ZgcmmgOagu6iFa5
yZn5UH98tosn1fo61p+p+ZwPl2qDM+xkPaHCdbslmqcKp4Pw3S9AmXmGKRgsruzo
mk2X7omQ2O1Yw2tkWhGSMKLk82LvD4Zg0h+PXoIq1iMNP4JkpyXOZidLIDplqJzS
T9xayZxoHBU6nGEGleORIBYuXIC0WYgOt41sKMY36WLssX0ZkZqD1tdahgkHOfA=
=aXlQ
-----END PGP SIGNATURE-----

--JBi0ZxuS5uaEhkUZ--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
