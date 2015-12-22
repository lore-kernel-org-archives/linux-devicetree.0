From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: next-20151222 build: 3 failures 13 warnings (next-20151222)
Date: Tue, 22 Dec 2015 12:22:28 +0000
Message-ID: <20151222122228.GL5727@sirena.org.uk>
References: <E1aBIky-0007nI-7t@optimist>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="njUEgrJvs9ryr/H/"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <E1aBIky-0007nI-7t@optimist>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andy Gross <agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, =?iso-8859-1?Q?Bj=F6rn?= Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "Ivan T. Ivanov" <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
Cc: kernel-build-reports-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--njUEgrJvs9ryr/H/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 22, 2015 at 08:57:20AM +0000, Build bot for Mark Brown wrote:

Today's linux-next fails to link an arm64 allmodconfig due to:

> ERROR: "of_irq_count" [drivers/pinctrl/qcom/pinctrl-ssbi-mpp.ko] undefined!
> ERROR: "of_irq_count" [drivers/pinctrl/qcom/pinctrl-ssbi-gpio.ko] undefined!
> ERROR: "of_irq_count" [drivers/pinctrl/qcom/pinctrl-spmi-mpp.ko] undefined!
> ERROR: "of_irq_count" [drivers/pinctrl/qcom/pinctrl-spmi-gpio.ko] undefined!

which are caused by ab4256cfeab91569 (pinctrl: qcom: pmic-gpio/mpp:
of_irq_count() == npins) which adds uses of irq_of_count() but that is
not exported so can't be used in modules.  I've just sent a patch adding
the export.

--njUEgrJvs9ryr/H/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWeUCDAAoJECTWi3JdVIfQDOgH/05kveaBhbb8lG+veY9ieUY3
739gL71e7941x8k7nkq5ZqZ2xttkB6yl6MZh0WUWuODfY0+Aq23YEXRSY0tSt/Lp
gjeND+8wLhObH4IQL2AhOpB0Zg9+DxX38qEEsD7QBdR1HKENyQgbv8INei1MRX0/
N4hNRsAk8es/zaXf2y1iE4Qyw+Xob7U+x2D3wlwXO3BKcy7u1iLPxPIb4EcA+KCE
zC4VCW2g6DEtID+IyfQ5Ra2qgTy6yPVN3HW86BJV17myfRokzp2QatfmBaogU7ub
lNqDZ9LI1OAHTrhM+IkFs9UM8a01NW82Z28s92yeXXdrdZQG/R7BVSKf/1Hy9Eg=
=dSuG
-----END PGP SIGNATURE-----

--njUEgrJvs9ryr/H/--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
