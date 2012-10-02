From: Thierry Reding <thierry.reding@avionic-design.de>
Subject: Re: [PATCH 1/2] pwm: pwm-tiecap: Add device-tree binding support for
 APWM driver
Date: Tue, 2 Oct 2012 08:00:14 +0200
Message-ID: <20121002060014.GA4298@avionic-0098.mockup.avionic-design.de>
References: <1348658863-29428-1-git-send-email-avinashphilip@ti.com>
 <1348658863-29428-2-git-send-email-avinashphilip@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FL5UXtIhxfXey3p5"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1348658863-29428-2-git-send-email-avinashphilip@ti.com>
Sender: linux-doc-owner@vger.kernel.org
To: "Philip, Avinash" <avinashphilip@ti.com>
Cc: grant.likely@secretlab.ca, rob.herring@calxeda.com, rob@landley.net, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, nsekhar@ti.com, gururaja.hebbar@ti.com
List-Id: devicetree@vger.kernel.org


--FL5UXtIhxfXey3p5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 26, 2012 at 04:57:42PM +0530, Philip, Avinash wrote:
[...]
> +#include <linux/platform_data/ti-pwmss.h>
[...]
> +static struct pwmss_platform_data am33xx_data =3D {
> +	.has_configspace	=3D true,
> +};

This structure is defined in a public header. I don't see why it has to,
given that it's only used to associate some data with an of_device_id
entry below. Since AM33xx never had anything but OF support in the
mainline kernel I don't think we should add platform data.

> +#ifdef CONFIG_OF
> +static const struct of_device_id ecap_of_match[] =3D {
> +	{
> +		.compatible	=3D "ti,am33xx-ecap",
> +		.data		=3D &am33xx_data,
> +	},
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, ecap_of_match);
> +#endif
> +

I don't quite see why we need to pass this platform data to the device
at all since there is no other variant anyway. I think this should only
be added if this turns out to be required at some point.

>  static int __devinit ecap_pwm_probe(struct platform_device *pdev)
>  {
>  	int ret;
>  	struct resource *r;
>  	struct clk *clk;
>  	struct ecap_pwm_chip *pc;
> +	struct pwmss_platform_data *pdata =3D pdev->dev.platform_data;
> +	const struct of_device_id *match;
> +	u16 regval;
> +	struct pinctrl *pinctrl;
> +
> +	match =3D of_match_device(of_match_ptr(ecap_of_match), &pdev->dev);

I've never seen of_match_ptr() used this way. Maybe you should think
about not #ifdef'ing OF specific code at all. That way ecap_of_match
will always exist and you could use the IS_ENABLED() macro to
conditionalize at compile time. The compiler will probably be clever
enough to optimize the ecap_of_match away if OF is not enabled.

Given my comment earlier, since AM33xx is OF only you might just as well
add a depends on OF to this driver and things will become a lot easier.

> +
> +	if (match)
> +		pdata =3D (struct pwmss_platform_data *)match->data;
> +
> +	pinctrl =3D devm_pinctrl_get_select_default(&pdev->dev);
> +	if (IS_ERR(pinctrl))
> +		dev_warn(&pdev->dev, "failed to configure pins from driver\n");
> =20
>  	pc =3D devm_kzalloc(&pdev->dev, sizeof(*pc), GFP_KERNEL);
>  	if (!pc) {
> @@ -211,6 +268,8 @@ static int __devinit ecap_pwm_probe(struct platform_d=
evice *pdev)
> =20
>  	pc->chip.dev =3D &pdev->dev;
>  	pc->chip.ops =3D &ecap_pwm_ops;
> +	pc->chip.of_xlate =3D of_ecap_xlate;
> +	pc->chip.of_pwm_n_cells =3D PWM_CELL_SIZE;
>  	pc->chip.base =3D -1;
>  	pc->chip.npwm =3D 1;
> =20
> @@ -231,13 +290,56 @@ static int __devinit ecap_pwm_probe(struct platform=
_device *pdev)
>  	}
> =20
>  	pm_runtime_enable(&pdev->dev);
> +
> +	/*
> +	 * Some platform has extra PWM-subsystem common config space
> +	 * and requires special handling of clock gating.
> +	 */
> +	if (pdata && pdata->has_configspace) {
> +		r =3D platform_get_resource(pdev, IORESOURCE_MEM, 1);
> +		if (!r) {
> +			dev_err(&pdev->dev, "no memory resource defined\n");
> +			ret =3D -ENODEV;
> +			goto err_disable_clock;
> +		}
> +
> +		pc->config_base =3D devm_ioremap(&pdev->dev, r->start,
> +				resource_size(r));
> +		if (!pc->config_base) {
> +			dev_err(&pdev->dev, "failed to ioremap() registers\n");
> +			ret =3D -EADDRNOTAVAIL;
> +			goto err_disable_clock;
> +		}

Isn't this missing a request_mem_region()? I assume you don't do that
here because you need the same region in the EHRPWM driver, right? This
should be indication enough that the design is not right here. I think
we need a proper abstraction here. Can this not be done via PM runtime
support? If not, maybe this should be represented by clock objects since
the bit obviously enables a clock.

> +
> +		/* Enable ECAP clock gating at PWM-subsystem common config */
> +		pm_runtime_get_sync(&pdev->dev);
> +		regval =3D readw(pc->config_base + PWMSS_CLKCONFIG);
> +		regval |=3D PWMSS_ECAP_CLK_EN;
> +		writew(regval, pc->config_base + PWMSS_CLKCONFIG);
> +		pm_runtime_put_sync(&pdev->dev);
> +	}
> +
>  	platform_set_drvdata(pdev, pc);
>  	return 0;
> +
> +err_disable_clock:
> +	pm_runtime_disable(&pdev->dev);
> +	return ret;
>  }
> =20
>  static int __devexit ecap_pwm_remove(struct platform_device *pdev)
>  {
>  	struct ecap_pwm_chip *pc =3D platform_get_drvdata(pdev);
> +	u16 regval;
> +
> +	if (pc->config_base) {
> +		/* Disable ECAP clock gating at PWM-subsystem common config */
> +		pm_runtime_get_sync(&pdev->dev);
> +		regval =3D readw(pc->config_base + PWMSS_CLKCONFIG);
> +		regval &=3D ~PWMSS_ECAP_CLK_EN;
> +		writew(regval, pc->config_base + PWMSS_CLKCONFIG);
> +		pm_runtime_put_sync(&pdev->dev);
> +	}
> =20
>  	pm_runtime_put_sync(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
> @@ -247,6 +349,9 @@ static int __devexit ecap_pwm_remove(struct platform_=
device *pdev)
>  static struct platform_driver ecap_pwm_driver =3D {
>  	.driver =3D {
>  		.name =3D "ecap",
> +#ifdef CONFIG_OF
> +		.of_match_table =3D of_match_ptr(ecap_of_match),
> +#endif

If you use of_match_ptr() you don't need the additional #ifdef
CONFIG_OF. But as I already said I don't think you need this at all
anyway. You should really just depend on OF and be done with it.

Thierry

--FL5UXtIhxfXey3p5
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQaoLuAAoJEN0jrNd/PrOhMB0P/271N18vXFA0VwKa1EMTJSAC
CiajselnLgvaXrsYECic6lVZWEZsxgpHlu+1chk8YCLjV18mluq+ux2syI7vIUXh
nLGZ+CfEHdiK8w86fgkItsiSP4SFrR1xPM5alYIkpn4GHe9hTfysAi5pbSAMwYQi
h0JjLhbcNnmagMT4AGcfwJ0BOC29VlUmpktZYMSilIQ4j3WZP2Q83u3BxzSGSvRf
G4ye09juSQgEvxv+bJMOvt/HcIStSz/4xBIm2xcxPlJrpxEwXse8iLxpA2B/avu/
iAZEF12t/6JCyULbFPN3vcqt606wdmRuRE0alBdHmn5l4qxY8Q0jxtgL0gZrZkOz
XDbahlbT6EyaNQbIWD6+MN4FmrMNQRKEcXGKZ081ixr/s1tcHwpB5w+2RXUvrTXY
0m+RevgyZlJbJivtifSQOFdmaJfmRecCC01lp82HoLl2UIfAOvO1PxYOfEJS4/xC
LdHq5Qiyyp5qUP4xHQF4BKkR3ZkZhQKFcvsVUaMwSHUXq0c73xijA/mdDfLJRGyK
+7c5cDEoPchIP6xVpEPN1s26/lFe9qnVkS+oMuUmRHo1giQP8q7tHQZaHvdxDyDG
VLa8z9yCGHKbG3xXS2/a1V2pQfpIOjUIliSkbe3VUtIyBgM3X68qWq9Rr5cWr1Ih
TjSOQKjeONTL0L6bVHJI
=UkYO
-----END PGP SIGNATURE-----

--FL5UXtIhxfXey3p5--
