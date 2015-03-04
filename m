From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] of: Kconfig: Let OF_UNITTEST depend on "I2C=y" and "I2C_MUX=y"
Date: Wed, 4 Mar 2015 16:04:23 +0100
Message-ID: <CAMuHMdXPONxoNm+stn5sx579kzWo6auVP7hrRv26VSGySr7K2A@mail.gmail.com>
References: <BLU437-SMTP82811F6F904D6C74EE62E3B91E0@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BLU437-SMTP82811F6F904D6C74EE62E3B91E0@phx.gbl>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen Gang <xili_gchen_5257@hotmail.com>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 4, 2015 at 7:37 AM, Chen Gang <xili_gchen_5257@hotmail.com> wrote:
> They need several symbols which are in I2C and I2C_MUX, the related
> error:
>
>   drivers/built-in.o: In function `selftest_i2c_mux_remove':
>   unittest.c:(.text+0xb0ce4): undefined reference to `i2c_del_mux_adapter'
>   unittest.c:(.text+0xb0ce8): undefined reference to `i2c_del_mux_adapter'
>   drivers/built-in.o: In function `selftest_i2c_mux_probe':
>   unittest.c:(.text+0xb0f20): undefined reference to `i2c_add_mux_adapter'
>   unittest.c:(.text+0xb0f24): undefined reference to `i2c_add_mux_adapter'
>   unittest.c:(.text+0xb0f94): undefined reference to `i2c_del_mux_adapter'
>   unittest.c:(.text+0xb0f9c): undefined reference to `i2c_del_mux_adapter'
>   drivers/built-in.o: In function `selftest_i2c_bus_remove':
>   unittest.c:(.text+0xb10cc): undefined reference to `i2c_del_adapter'
>   unittest.c:(.text+0xb10d4): undefined reference to `i2c_del_adapter'
>   drivers/built-in.o: In function `selftest_i2c_bus_probe':
>   unittest.c:(.text+0xb1298): undefined reference to `i2c_add_numbered_adapter'
>   unittest.c:(.text+0xb12a0): undefined reference to `i2c_add_numbered_adapter'
>   drivers/built-in.o: In function `of_selftest_overlay':
>   unittest.c:(.init.text+0xc9d0): undefined reference to `i2c_register_driver'
>   unittest.c:(.init.text+0xc9dc): undefined reference to `i2c_register_driver'
>   unittest.c:(.init.text+0xcdb4): undefined reference to `i2c_del_driver'
>   unittest.c:(.init.text+0xcdb8): undefined reference to `i2c_del_driver'
>   drivers/built-in.o: In function `of_selftest_device_exists':
>   unittest.c:(.text.unlikely+0xd70): undefined reference to `of_find_i2c_device_by_node'
>   unittest.c:(.text.unlikely+0xd7c): undefined reference to `of_find_i2c_device_by_node'
>   make: *** [vmlinux] Error 1
>
> Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
> ---
>  drivers/of/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
> index 7bcaeec..b60fc66 100644
> --- a/drivers/of/Kconfig
> +++ b/drivers/of/Kconfig
> @@ -9,7 +9,7 @@ menu "Device Tree and Open Firmware support"
>
>  config OF_UNITTEST
>         bool "Device Tree runtime unit tests"

As this is "bool"...

> -       depends on OF_IRQ && OF_EARLY_FLATTREE
> +       depends on OF_IRQ && OF_EARLY_FLATTREE && I2C=y && I2C_MUX=y

... I think it would be better to replace "#if IS_ENABLED(CONFIG_XXX)" by
"#ifdef CONFIG_XXX" in drivers/of/unittest.c instead.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
