From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v7 2/8] clk: sunxi: Implement MMC phase control
Date: Wed, 19 Feb 2014 09:36:06 +0100
Message-ID: <20140219083606.GR3142@lukather>
References: <20140217095907.15040.81893.stgit@pagira.o2s.ch>
 <20140217100221.15040.47203.stgit@pagira.o2s.ch>
 <20140218141532.GH3142@lukather>
 <20140219052125.8345.70717@quantum>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Kuk/n493crKO4rgR"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140219052125.8345.70717@quantum>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: David =?iso-8859-1?Q?Lanzend=F6rfer?= <david.lanzendoerfer-Z7Kmv9EsliU@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ulf Hansson =?iso-8859-1?B?PHVsZi5oYW5zc29uQGxpbmFyby5vcmc+LCBMYXVy?= =?iso-8859-1?Q?ent_Pinchart_=3Claurent=2Epinchart+renesas=40ideasonboard?= =?iso-8859-1?B?LmNvbT4sIFNpbW9uIEJhYXR6IDxnbWJub21pc0BnbWFpbC5jb20+LCBI?= =?iso-8859-1?Q?ans_de_Goede_=3Chdegoede=40redhat=2Ecom=3E=2C_Emilio_L=F3p?= =?iso-8859-1?B?ZXogPGVtaWxpb0BlbG9wZXouY29tLmFyPiwgbGludXgtbW1jQHZnZXIu?= =?iso-8859-1?Q?kernel=2Eorg=2C_Chris_Ball_=3Cchris=40printf=2Enet=3E=2C_l?= =?iso-8859-1?Q?inux-kernel=40vger=2Ekernel=2Eorg=2C_H_Hartley_Sweeten_=3C?= =?iso-8859-1?Q?hsweeten=40visionengravers=2Ecom=3E=2C_linux-sunxi=40googl?= =?iso-8859-1?Q?egroups=2Ecom=2C_Tejun_Heo_=3Ctj=40kernel=2Eorg=3E?= =?iso-8859-1?Q?=2C?= Guennadi Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, din
List-Id: devicetree@vger.kernel.org


--Kuk/n493crKO4rgR
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mike,

On Tue, Feb 18, 2014 at 09:21:25PM -0800, Mike Turquette wrote:
> Quoting Maxime Ripard (2014-02-18 06:15:32)
> > Hi,
> >=20
> > On Mon, Feb 17, 2014 at 11:02:21AM +0100, David Lanzend=F6rfer wrote:
> > > From: Emilio L=F3pez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>
> > >=20
> > > Signed-off-by: Emilio L=F3pez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>
> >=20
> > You're missing your Signed-off-by here too.  Remember, for every patch
> > you send, your Signed-off-by must be there, regardless wether you're
> > the author or not.
> >=20
> > A commit log would be very much welcome too.
> >=20
> > Now, down to the patch itself, I remember Mike saying that he would
> > prefer adding a function in the framework instead of hardcoding
> > it. Mike, what's your feeling on this? Would merging this seem
> > reasonnable to you as is, or do you want to take this to the
> > framework?
>=20
> Hi Maxime & Emilio,
>=20
> Maybe something like the following RFC? If it seems sufficient for this
> case then I will post to the wider list with an eye towards merging it
> for 3.15. I've Cc'd Dinh since this came up on the socfpga thread as
> well.
>=20
> Regards,
> Mike
>=20
>=20
>=20
> From 56fa297591be5c5e22df6d2ca43fccf285a45636 Mon Sep 17 00:00:00 2001
> From: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Date: Tue, 18 Feb 2014 20:33:50 -0800
> Subject: [PATCH] clk: introduce clk_set_phase function & callback
>=20
> A common operation for a clock signal generator is to shift the phase of
> that signal. This patch introduces a new function to the clk.h API to
> dynamically adjust the phase of a clock signal. Additionally this patch
> introduces support for the new function in the common clock framework
> via the .set_phase call back in struct clk_ops.
>=20
> Signed-off-by: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
> This patch is totally untested. It may make your board burst into
> flames.
>=20
>  drivers/clk/clk.c            | 84 ++++++++++++++++++++++++++++++++++++++=
+++---
>  include/linux/clk-private.h  |  1 +
>  include/linux/clk-provider.h |  5 +++
>  include/linux/clk.h          | 29 +++++++++++++++
>  4 files changed, 115 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index ea2ca9f..635170a 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -106,11 +106,11 @@ static void clk_summary_show_one(struct seq_file *s=
, struct clk *c, int level)
>  	if (!c)
>  		return;
> =20
> -	seq_printf(s, "%*s%-*s %-11d %-12d %-10lu %-11lu",
> +	seq_printf(s, "%*s%-*s %-11d %-12d %-10lu %-11lu %-3d",
>  		   level * 3 + 1, "",
>  		   30 - level * 3, c->name,
>  		   c->enable_count, c->prepare_count, clk_get_rate(c),
> -		   clk_get_accuracy(c));
> +		   clk_get_accuracy(c), clk_get_phase(c));
>  	seq_printf(s, "\n");
>  }
> =20
> @@ -132,8 +132,8 @@ static int clk_summary_show(struct seq_file *s, void =
*data)
>  {
>  	struct clk *c;
> =20
> -	seq_printf(s, "   clock                        enable_cnt  prepare_cnt =
 rate        accuracy\n");
> -	seq_printf(s, "--------------------------------------------------------=
-------------------------\n");
> +	seq_printf(s, "   clock                        enable_cnt  prepare_cnt =
 rate        accuracy   phase\n");
> +	seq_printf(s, "--------------------------------------------------------=
---------------------------------\n");
> =20
>  	clk_prepare_lock();
> =20
> @@ -171,6 +171,7 @@ static void clk_dump_one(struct seq_file *s, struct c=
lk *c, int level)
>  	seq_printf(s, "\"prepare_count\": %d,", c->prepare_count);
>  	seq_printf(s, "\"rate\": %lu", clk_get_rate(c));
>  	seq_printf(s, "\"accuracy\": %lu", clk_get_accuracy(c));
> +	seq_printf(s, "\"phase\": %d", clk_get_phase(c));
>  }
> =20
>  static void clk_dump_subtree(struct seq_file *s, struct clk *c, int leve=
l)
> @@ -257,6 +258,11 @@ static int clk_debug_create_one(struct clk *clk, str=
uct dentry *pdentry)
>  	if (!d)
>  		goto err_out;
> =20
> +	d =3D debugfs_create_u32("clk_phase", S_IRUGO, clk->dentry,
> +			(u32 *)&clk->phase);
> +	if (!d)
> +		goto err_out;
> +
>  	d =3D debugfs_create_x32("clk_flags", S_IRUGO, clk->dentry,
>  			(u32 *)&clk->flags);
>  	if (!d)
> @@ -1766,6 +1772,76 @@ out:
>  EXPORT_SYMBOL_GPL(clk_set_parent);
> =20
>  /**
> + * clk_set_phase - adjust the phase shift of a clock signal
> + * @clk: clock signal source
> + * @degrees: number of degrees the signal is shifted
> + *
> + * Shifts the phase of a clock signal by the specified degrees. Returns =
0 on
> + * success, -EERROR otherwise.
> + *
> + * This function makes no distiction about the input or reference signal=
 that
> + * we adjust the clock signal phase against. For example phase locked-lo=
op
> + * clock signal generators we may shift phase with respect to feedback c=
lock
> + * signal input, but for other cases the clock phase may be shifted with
> + * respect to some other, unspecified signal.
> + *
> + * Additionally the concept of phase shift does not propagate through th=
e clock
> + * tree hierarchy, which sets it appart from clock rates and clock accur=
acy. A
> + * parent clock phase attribute does not have an impact on the phase att=
ribute
> + * of a child clock.
> + */
> +int clk_set_phase(struct clk *clk, int degrees)

Actually, while this is what I had in mind too, we'd need a bit more
control here. We have two phases to control (namely, input and
sample).

Maybe passing an additional enum to tell which phase we want to
adjust, that could easily be extended by new drivers need would fit
our need here?

Thanks!
Maxime


--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--Kuk/n493crKO4rgR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iQIcBAEBAgAGBQJTBGz2AAoJEBx+YmzsjxAgkP4P/jdHNrNwDKzwrYOfdiZPEziw
9kb2K8Iujal7PFiWhZ9C1lwaWhyXlK309h7geFFF6rZ2V/wzcGVzab2V3v1ftLTA
Yy20JwnIzC2lQAQt7Gl94B/YwWvIfKWj+Nrxu4jDx5Bx7jP9ER+JnYfHcATw9i0b
QALPV8qKysJbgEZCzDO2bYoipaSnLxvQYVn1hT+aMQs8MMgaWWrgA63WiQfpsdUu
twhsuqNe9kPThRAqLYs40RPt05fNiglIvD+rt3b2GBvSZvESSuQ8bd1CGkCMG/xk
tI+sHYeeLzQ+uLxv1w9HNUYyJ59H2g05pUnAdwvd4YA8V1JVEWnlu53P7o5rEdIH
LM8HPHVm6UMJn4cfg3d/d2rxaNcKoN/GXAs7TNkw5DJgrkhZjxFtzMSN0JHX8D+P
N0ne/DXcq2USiqiP7YvZRztK4x7cPabEGU1ToJc69YYw7rMFKKfYDmrEsmNTzscL
6xjqf5nji8Elu8FB4VBRoiWtT9nkgulipDnHhn3hIlc9I4S4kFOu2IAXqnY4FotA
cyZj1fzJ6pwFnJNmfxn6DJuGOBlNEkuQTun7xV41DiJiwtWbLLMd0Zk25KuQFe2S
HYzEYiJfVZCgcz8sFMJ66qcEoXa+rJV+K845jSXDLWBh6cTZ6Xa0ax8FLRx1n9H/
GftLL2UgC7vMLRmGw7m/
=zqRd
-----END PGP SIGNATURE-----

--Kuk/n493crKO4rgR--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
