From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/5] regulator: pwm: Prints error number when it fails
Date: Sat, 12 Mar 2016 13:05:43 +0700
Message-ID: <20160312060543.GV3898@sirena.org.uk>
References: <1457434405-30372-1-git-send-email-ldewangan@nvidia.com>
 <1457434405-30372-4-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="s0H35NU0PUc8VBh+"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1457434405-30372-4-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--s0H35NU0PUc8VBh+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 08, 2016 at 04:23:23PM +0530, Laxman Dewangan wrote:

> +		dev_err(&pdev->dev, "Failed to get PWM, %d\n", ret);

Pretty much everywhere else in the kernel we use "foo: %d\n" - please
use a consistent style.

--s0H35NU0PUc8VBh+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJW47G2AAoJECTWi3JdVIfQb9wH/3lCklezgp8xJHR10yCODkkm
oECex912AuYw7vYeCOap4AAscFdzhjh0dpZCWBXtH3tEC5Tkf7I0iTpQAmJKpEos
usAGvlSezhQwkgo8BqemMfLLaIfj43r1pI0E+RICupBZPKZJJ6WdVZFTp3/TrBkC
asmsrSdN+ZQsxeCzot4yZrOBptymma4YM6BNIIkVZ0+OppnCw1t6CRyC1dGS06ry
khmYJBObIsLXlFRtkoABUSgEBXyJDYYanszg0Tw05R1B3eUe8Lqnzk8HUEUHB3WO
CF8DlVW4IFBoxsnmzLT22zsUeY1QT7eNGgkppbt1vml+dIhcHQkly6JYwgoYNaw=
=Dteo
-----END PGP SIGNATURE-----

--s0H35NU0PUc8VBh+--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
