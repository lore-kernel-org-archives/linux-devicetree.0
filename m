From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH] of: Kconfig: Let OF_UNITTEST depend on "I2C=y" and "I2C_MUX=y"
Date: Fri, 13 Mar 2015 10:23:17 -0500
Message-ID: <CAL_Jsq+yNVoLXssSD=sh89soJw1twLLmK86DOQwqYVdo4Fjt7A@mail.gmail.com>
References: <BLU437-SMTP82811F6F904D6C74EE62E3B91E0@phx.gbl>
 <CAMuHMdXPONxoNm+stn5sx579kzWo6auVP7hrRv26VSGySr7K2A@mail.gmail.com> <2530315.qdy5ZZGCEr@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2530315.qdy5ZZGCEr@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Chen Gang <xili_gchen_5257@hotmail.com>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 4, 2015 at 1:49 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> On Wednesday 04 March 2015 16:04:23 Geert Uytterhoeven wrote:
>> > -       depends on OF_IRQ && OF_EARLY_FLATTREE
>> > +       depends on OF_IRQ && OF_EARLY_FLATTREE && I2C=y && I2C_MUX=y
>>
>> ... I think it would be better to replace "#if IS_ENABLED(CONFIG_XXX)" by
>> "#ifdef CONFIG_XXX" in drivers/of/unittest.c instead.
>>
>
> Agreed. I came across the same bug and came to the same conclusion as you.
>
> How about this:
>
> 8<----
> Subject: of: unittest: fix I2C dependency
>
> The unittest fails to link if I2C or I2C_MUX is a loadable module:
>
>   drivers/built-in.o: In function `selftest_i2c_mux_remove':
>   unittest.c:(.text+0xb0ce4): undefined reference to `i2c_del_mux_adapter'
>
> This changes the newly added IS_ENABLED() checks to use IS_BUILTIN()
> instead, which evaluates to false if the other driver is a module.
>
> Reported-by: Chen Gang <gang.chen.5i5j@gmail.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Fixes: d5e75500ca401 ("of: unitest: Add I2C overlay unit tests.")

Applied for 4.0. Thanks.

Rob

>
> diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
> index 0cf9a236d438..8daa49206c36 100644
> --- a/drivers/of/unittest.c
> +++ b/drivers/of/unittest.c
> @@ -979,7 +979,7 @@ static int of_path_platform_device_exists(const char *path)
>         return pdev != NULL;
>  }
>
> -#if IS_ENABLED(CONFIG_I2C)
> +#if IS_BUILTIN(CONFIG_I2C)
>
>  /* get the i2c client device instantiated at the path */
>  static struct i2c_client *of_path_to_i2c_client(const char *path)
> @@ -1445,7 +1445,7 @@ static void of_selftest_overlay_11(void)
>                 return;
>  }
>
> -#if IS_ENABLED(CONFIG_I2C) && IS_ENABLED(CONFIG_OF_OVERLAY)
> +#if IS_BUILTIN(CONFIG_I2C) && IS_ENABLED(CONFIG_OF_OVERLAY)
>
>  struct selftest_i2c_bus_data {
>         struct platform_device  *pdev;
> @@ -1584,7 +1584,7 @@ static struct i2c_driver selftest_i2c_dev_driver = {
>         .id_table = selftest_i2c_dev_id,
>  };
>
> -#if IS_ENABLED(CONFIG_I2C_MUX)
> +#if IS_BUILTIN(CONFIG_I2C_MUX)
>
>  struct selftest_i2c_mux_data {
>         int nchans;
> @@ -1695,7 +1695,7 @@ static int of_selftest_overlay_i2c_init(void)
>                         "could not register selftest i2c bus driver\n"))
>                 return ret;
>
> -#if IS_ENABLED(CONFIG_I2C_MUX)
> +#if IS_BUILTIN(CONFIG_I2C_MUX)
>         ret = i2c_add_driver(&selftest_i2c_mux_driver);
>         if (selftest(ret == 0,
>                         "could not register selftest i2c mux driver\n"))
> @@ -1707,7 +1707,7 @@ static int of_selftest_overlay_i2c_init(void)
>
>  static void of_selftest_overlay_i2c_cleanup(void)
>  {
> -#if IS_ENABLED(CONFIG_I2C_MUX)
> +#if IS_BUILTIN(CONFIG_I2C_MUX)
>         i2c_del_driver(&selftest_i2c_mux_driver);
>  #endif
>         platform_driver_unregister(&selftest_i2c_bus_driver);
> @@ -1814,7 +1814,7 @@ static void __init of_selftest_overlay(void)
>         of_selftest_overlay_10();
>         of_selftest_overlay_11();
>
> -#if IS_ENABLED(CONFIG_I2C)
> +#if IS_BUILTIN(CONFIG_I2C)
>         if (selftest(of_selftest_overlay_i2c_init() == 0, "i2c init failed\n"))
>                 goto out;
>
>
