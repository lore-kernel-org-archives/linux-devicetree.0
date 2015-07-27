From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v7 3/5] clk: Supply the critical clock {init, enable,
 disable} framework
Date: Mon, 27 Jul 2015 09:25:49 +0200
Message-ID: <20150727072549.GP2564@lukather>
References: <1437570255-21049-1-git-send-email-lee.jones@linaro.org>
 <1437570255-21049-4-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="N5iGxCIPT7YMRg16"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1437570255-21049-4-git-send-email-lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


--N5iGxCIPT7YMRg16
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 22, 2015 at 02:04:13PM +0100, Lee Jones wrote:
> These new API calls will firstly provide a mechanisms to tag a clock as
> critical and secondly allow any knowledgeable driver to (un)gate clocks,
> even if they are marked as critical.
>=20
> Suggested-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> Signed-off-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  drivers/clk/clk.c            | 45 ++++++++++++++++++++++++++++++++++++++=
++++++
>  include/linux/clk-provider.h |  2 ++
>  include/linux/clk.h          | 30 +++++++++++++++++++++++++++++
>  3 files changed, 77 insertions(+)
>=20
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 61c3fc5..486b1da 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -46,6 +46,21 @@ static struct clk_core *clk_core_lookup(const char *na=
me);
> =20
>  /***    private data structures    ***/
> =20
> +/**
> + * struct critical -	Provides 'play' over critical clocks.  A clock can =
be
> + *			marked as critical, meaning that it should not be
> + *			disabled.  However, if a driver which is aware of the
> + *			critical behaviour wants to control it, it can do so
> + *			using clk_enable_critical() and clk_disable_critical().
> + *
> + * @enabled	Is clock critical?  Once set, doesn't change
> + * @leave_on	Self explanatory.  Can be disabled by knowledgeable drivers
> + */
> +struct critical {
> +	bool enabled;
> +	bool leave_on;
> +};
> +
>  struct clk_core {
>  	const char		*name;
>  	const struct clk_ops	*ops;
> @@ -75,6 +90,7 @@ struct clk_core {
>  	struct dentry		*dentry;
>  #endif
>  	struct kref		ref;
> +	struct critical		critical;
>  };
> =20
>  struct clk {
> @@ -995,6 +1011,10 @@ static void clk_core_disable(struct clk_core *clk)
>  	if (WARN_ON(clk->enable_count =3D=3D 0))
>  		return;
> =20
> +	/* Refuse to turn off a critical clock */
> +	if (clk->enable_count =3D=3D 1 && clk->critical.leave_on)
> +		return;
> +

I think it should be handled by a separate counting. Otherwise, if you
have two users that marked the clock as critical, and then one of them
disable it...

>  	if (--clk->enable_count > 0)
>  		return;
> =20
> @@ -1037,6 +1057,13 @@ void clk_disable(struct clk *clk)
>  }
>  EXPORT_SYMBOL_GPL(clk_disable);
> =20
> +void clk_disable_critical(struct clk *clk)
> +{
> +	clk->core->critical.leave_on =3D false;

=2E. you just lost the fact that it was critical in the first place.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--N5iGxCIPT7YMRg16
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVtdz9AAoJEBx+YmzsjxAgqqsP/j6JX9+XC9ux5TrgT6wRoApi
XhaqsKTx7RnbDViD983Gj5ydo2V0f8VYwE3hxx/OaMnvUMrupwvFD4Yv2AYiOAJL
xMuHYtkyC3nJXYW3eAQLhw8GVowVYEw4pGhF6BFu8MYXgT4bexYVzHZ+cwLIiK9w
tF3ertP8MmnSpjvGSy2msBzMXdqQvlD/SAFqtFResUKOGpsp/xiGyWaxBYtGSADj
CRBjsS317eE85cz0eDq0QwUi4HY0IZanXte5341giHD8NbhVDDapVXoZOtwkvpHZ
lvvvLVhi148bQWkdzC5Iu/MFgJrKcSn0TpzMWcs2TV3cHOicEyQtCe4NM60GeO7v
NUGwkSn5N8/S/aswSNSsazRJJV57E8OgI53/lCwrK6RuEp4D+evmoJGDijy8DUPz
HQj92hZgb4n2VKxuiW+F04ulLcrSma/I+z0wqrDyTt8FOrwakZvmq2tXmW9U1x0I
bqLOFhXVvyN3TroNYAG6FA5R5Fn9k286YQJXbuqve2P1TDoYUsEibgMaLV/8OY83
LBjr6CUwsPSi77sR2KZVlBou0Ipj5haMA7y+XGHsZ0dl2U4PJ6j1zDqMcI3tKHo+
aP+eaqX6HJ3IUSK8LMr+3yE74NPzM+c3xqFc3UFn/U776nfWBm7l7pDfB2YJAkVd
X60c35v53XNRN1J6iwR7
=1DpH
-----END PGP SIGNATURE-----

--N5iGxCIPT7YMRg16--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
