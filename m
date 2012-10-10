From: Kent Yoder <key@linux.vnet.ibm.com>
Subject: Re: [PATCH v2] TPM: Provide a tpm_tis OF driver
Date: Wed, 10 Oct 2012 11:24:28 -0500
Message-ID: <20121010162428.GA5013@ennui.austin.ibm.com>
References: <20121002210453.GA12231@obsidianresearch.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20121002210453.GA12231@obsidianresearch.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
Cc: linux-kernel@vger.kernel.org, tpmdd-devel@lists.sourceforge.net, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

Hi Jason,

On Tue, Oct 02, 2012 at 03:04:53PM -0600, Jason Gunthorpe wrote:
> This provides an open firwmare driver binding for tpm_tis. OF
> is useful on arches where PNP is not used.
>=20
> Allow the tpm_tis driver to be selected if OF is compiled in.
>=20
> Signed-off-by: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
> ---
>  drivers/char/tpm/Kconfig   |    2 +-
>  drivers/char/tpm/tpm_tis.c |   79 ++++++++++++++++++++++++++++++++++=
+--------
>  2 files changed, 65 insertions(+), 16 deletions(-)
>=20
> v2 changes:
>  - Add irq_autoprobe to tpm_tis_init to simplify the logic around
>    the autoprobe function
>  - Use platform functions in tis_of_probe_one
>  - Rename tis_drv to tis_driver to silence MODPOST warnings
>  - checkpatch cleanups
>  - Do not attempt to auto-probe the TPM on OF configurations
>=20
[cut]
> @@ -768,7 +770,7 @@ static int tpm_tis_pnp_resume(struct pnp_dev *dev=
)
>  	return ret;
>  }
>=20
> -static struct pnp_device_id tpm_pnp_tbl[] __devinitdata =3D {
> +static const struct pnp_device_id tpm_pnp_tbl[] __devinitdata =3D {
>  	{"PNP0C31", 0},		/* TPM */
>  	{"ATM1200", 0},		/* Atmel */
>  	{"IFX0102", 0},		/* Infineon */
> @@ -792,7 +794,7 @@ static __devexit void tpm_tis_pnp_remove(struct p=
np_dev *dev)
>  }
>=20
>=20
> -static struct pnp_driver tis_pnp_driver =3D {
> +static const struct pnp_driver tis_pnp_driver =3D {
>  	.name =3D "tpm_tis",
>  	.id_table =3D tpm_pnp_tbl,
>  	.probe =3D tpm_tis_pnp_init,

  Why change the structs to const here? This generates warnings for me:

drivers/char/tpm/tpm_tis.c: In function =E2=80=98init_tis=E2=80=99:
drivers/char/tpm/tpm_tis.c:885:3: warning: passing argument 1 of
=E2=80=98pnp_register_driver=E2=80=99 discards =E2=80=98const=E2=80=99 =
qualifier from pointer target
type [enabled by default]
In file included from drivers/char/tpm/tpm_tis.c:24:0:
include/linux/pnp.h:469:5: note: expected =E2=80=98struct pnp_driver *=E2=
=80=99 but
argument is of type =E2=80=98const struct pnp_driver *=E2=80=99
drivers/char/tpm/tpm_tis.c: In function =E2=80=98cleanup_tis=E2=80=99:
drivers/char/tpm/tpm_tis.c:930:3: warning: passing argument 1 of
=E2=80=98pnp_unregister_driver=E2=80=99 discards =E2=80=98const=E2=80=99=
 qualifier from pointer target
type [enabled by default]
In file included from drivers/char/tpm/tpm_tis.c:24:0:
include/linux/pnp.h:470:6: note: expected =E2=80=98struct pnp_driver *=E2=
=80=99 but
argument is of type =E2=80=98const struct pnp_driver *=E2=80=99

> @@ -821,12 +823,52 @@ static int tpm_tis_resume(struct device *dev)
>=20
>  static SIMPLE_DEV_PM_OPS(tpm_tis_pm, tpm_pm_suspend, tpm_tis_resume)=
;
>=20
> -static struct platform_driver tis_drv =3D {
> +#ifdef CONFIG_OF
> +static const struct of_device_id tis_of_platform_match[] __devinitda=
ta =3D {
> +	{.compatible =3D "tcg,tpm_tis"},
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, tis_of_platform_match);
> +
> +static int __devinit tis_of_probe_one(struct platform_device *pdev)
> +{
> +	const struct resource *res;
> +	int irq;
> +
> +	if (!pdev->dev.of_node)
> +		return -ENODEV;
> +
> +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res)
> +		return -ENODEV;
> +
> +	irq =3D platform_get_irq(pdev, 0);
> +	if (irq < 0)
> +		irq =3D 0;
> +	return tpm_tis_init(&pdev->dev, res->start, res->end - res->start +=
 1,
> +			    irq, 0);
> +}
> +
> +static int __devexit tis_of_remove_one(struct platform_device *odev)
> +{
> +	struct tpm_chip *chip =3D dev_get_drvdata(&odev->dev);
> +	tpm_dev_vendor_release(chip);
> +	kfree(chip);
> +	return 0;
> +}
> +#endif
> +
> +static struct platform_driver tis_driver =3D {
>  	.driver =3D {
>  		.name =3D "tpm_tis",
>  		.owner		=3D THIS_MODULE,
>  		.pm		=3D &tpm_tis_pm,
> +		.of_match_table =3D of_match_ptr(tis_of_platform_match),
>  	},

  Patch v2 removes the ifdef around of_match_table, which now generates
an error:

drivers/char/tpm/tpm_tis.c:867:3: error: implicit declaration of
function =E2=80=98of_match_ptr=E2=80=99 [-Werror=3Dimplicit-function-de=
claration]
drivers/char/tpm/tpm_tis.c:867:34: error: =E2=80=98tis_of_platform_matc=
h=E2=80=99
undeclared here (not in a function)

Kent

> +#ifdef CONFIG_OF
> +	.probe =3D tis_of_probe_one,
> +	.remove =3D __devexit_p(tis_of_remove_one)
> +#endif
>  };
>=20
>  static struct platform_device *pdev;
> @@ -842,15 +884,22 @@ static int __init init_tis(void)
>  		return pnp_register_driver(&tis_pnp_driver);
>  #endif
>=20
> -	rc =3D platform_driver_register(&tis_drv);
> +	rc =3D platform_driver_register(&tis_driver);
>  	if (rc < 0)
>  		return rc;
> -	if (IS_ERR(pdev=3Dplatform_device_register_simple("tpm_tis", -1, NU=
LL, 0)))
> +	/* TIS_MEM_BASE is only going to work on x86.. */
> +#ifndef CONFIG_OF
> +	pdev =3D platform_device_register_simple("tpm_tis", -1, NULL, 0);
> +	if (IS_ERR(pdev)) {
> +		platform_driver_unregister(&tis_driver);
>  		return PTR_ERR(pdev);
> -	if((rc=3Dtpm_tis_init(&pdev->dev, TIS_MEM_BASE, TIS_MEM_LEN, 0)) !=3D=
 0) {
> +	}
> +	rc =3D tpm_tis_init(&pdev->dev, TIS_MEM_BASE, TIS_MEM_LEN, 0, 1);
> +	if (rc !=3D 0) {
>  		platform_device_unregister(pdev);
> -		platform_driver_unregister(&tis_drv);
> +		platform_driver_unregister(&tis_driver);
>  	}
> +#endif
>  	return rc;
>  }
>=20
> @@ -882,7 +931,7 @@ static void __exit cleanup_tis(void)
>  	}
>  #endif
>  	platform_device_unregister(pdev);
> -	platform_driver_unregister(&tis_drv);
> +	platform_driver_unregister(&tis_driver);
>  }
>=20
>  module_init(init_tis);
> --=20
> 1.7.5.4
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kerne=
l" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
>=20
