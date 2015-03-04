From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] of: Kconfig: Let OF_UNITTEST depend on "I2C=y" and "I2C_MUX=y"
Date: Wed, 4 Mar 2015 21:58:52 +0200
Message-ID: <4A33443D-FD39-41F5-B474-33B68C69DC56@konsulko.com>
References: <BLU437-SMTP82811F6F904D6C74EE62E3B91E0@phx.gbl> <CAMuHMdXPONxoNm+stn5sx579kzWo6auVP7hrRv26VSGySr7K2A@mail.gmail.com> <2530315.qdy5ZZGCEr@wuerfel>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2530315.qdy5ZZGCEr@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Chen Gang <xili_gchen_5257-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Arnd,

> On Mar 4, 2015, at 21:49 , Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
>=20
> On Wednesday 04 March 2015 16:04:23 Geert Uytterhoeven wrote:
>>> -       depends on OF_IRQ && OF_EARLY_FLATTREE
>>> +       depends on OF_IRQ && OF_EARLY_FLATTREE && I2C=3Dy && I2C_MU=
X=3Dy
>>=20
>> ... I think it would be better to replace "#if IS_ENABLED(CONFIG_XXX=
)" by
>> "#ifdef CONFIG_XXX" in drivers/of/unittest.c instead.
>>=20
>=20
> Agreed. I came across the same bug and came to the same conclusion as=
 you.
>=20
> How about this:
>=20
> 8<----
> Subject: of: unittest: fix I2C dependency
>=20
> The unittest fails to link if I2C or I2C_MUX is a loadable module:
>=20
>  drivers/built-in.o: In function `selftest_i2c_mux_remove':
>  unittest.c:(.text+0xb0ce4): undefined reference to `i2c_del_mux_adap=
ter'
>=20
> This changes the newly added IS_ENABLED() checks to use IS_BUILTIN()
> instead, which evaluates to false if the other driver is a module.
>=20
> Reported-by: Chen Gang <gang.chen.5i5j-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> Fixes: d5e75500ca401 ("of: unitest: Add I2C overlay unit tests.")
>=20
> diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
> index 0cf9a236d438..8daa49206c36 100644
> --- a/drivers/of/unittest.c
> +++ b/drivers/of/unittest.c
> @@ -979,7 +979,7 @@ static int of_path_platform_device_exists(const c=
har *path)
> 	return pdev !=3D NULL;
> }
>=20
> -#if IS_ENABLED(CONFIG_I2C)
> +#if IS_BUILTIN(CONFIG_I2C)
>=20
> /* get the i2c client device instantiated at the path */
> static struct i2c_client *of_path_to_i2c_client(const char *path)
> @@ -1445,7 +1445,7 @@ static void of_selftest_overlay_11(void)
> 		return;
> }
>=20
> -#if IS_ENABLED(CONFIG_I2C) && IS_ENABLED(CONFIG_OF_OVERLAY)
> +#if IS_BUILTIN(CONFIG_I2C) && IS_ENABLED(CONFIG_OF_OVERLAY)
>=20
> struct selftest_i2c_bus_data {
> 	struct platform_device	*pdev;
> @@ -1584,7 +1584,7 @@ static struct i2c_driver selftest_i2c_dev_drive=
r =3D {
> 	.id_table =3D selftest_i2c_dev_id,
> };
>=20
> -#if IS_ENABLED(CONFIG_I2C_MUX)
> +#if IS_BUILTIN(CONFIG_I2C_MUX)
>=20
> struct selftest_i2c_mux_data {
> 	int nchans;
> @@ -1695,7 +1695,7 @@ static int of_selftest_overlay_i2c_init(void)
> 			"could not register selftest i2c bus driver\n"))
> 		return ret;
>=20
> -#if IS_ENABLED(CONFIG_I2C_MUX)
> +#if IS_BUILTIN(CONFIG_I2C_MUX)
> 	ret =3D i2c_add_driver(&selftest_i2c_mux_driver);
> 	if (selftest(ret =3D=3D 0,
> 			"could not register selftest i2c mux driver\n"))
> @@ -1707,7 +1707,7 @@ static int of_selftest_overlay_i2c_init(void)
>=20
> static void of_selftest_overlay_i2c_cleanup(void)
> {
> -#if IS_ENABLED(CONFIG_I2C_MUX)
> +#if IS_BUILTIN(CONFIG_I2C_MUX)
> 	i2c_del_driver(&selftest_i2c_mux_driver);
> #endif
> 	platform_driver_unregister(&selftest_i2c_bus_driver);
> @@ -1814,7 +1814,7 @@ static void __init of_selftest_overlay(void)
> 	of_selftest_overlay_10();
> 	of_selftest_overlay_11();
>=20
> -#if IS_ENABLED(CONFIG_I2C)
> +#if IS_BUILTIN(CONFIG_I2C)
> 	if (selftest(of_selftest_overlay_i2c_init() =3D=3D 0, "i2c init fail=
ed\n"))
> 		goto out;
>=20
>=20

Patch is fine. I=E2=80=99ll pick it up for the next batch of overlay pa=
tches.

Regards

=E2=80=94 Pantelis

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
