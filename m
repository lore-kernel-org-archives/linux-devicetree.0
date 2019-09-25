From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [v1, 1/1] gpio: dts: aspeed: Add SGPIO driver
Date: Wed, 25 Sep 2019 09:31:46 +0200
Message-ID: <CAMRc=MecTmtpauqTsdEmZipeDOHoCMAXx6X6Z4zjszr9_W-aeA@mail.gmail.com>
References: <1569352021-6383-1-git-send-email-hongweiz@ami.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1569352021-6383-1-git-send-email-hongweiz@ami.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hongwei Zhang <hongweiz@ami.com>
Cc: Andrew Jeffery <andrew@aj.id.au>, Linus Walleij <linus.walleij@linaro.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Joel Stanley <joel@jms.id.au>, devicetree <devicetree@vger.kernel.org>, linux-aspeed@lists.ozlabs.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Andrew Morton <akpm@linux-foundation.org>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Doug Anderson <armlinux@m.disordat.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Mike Rapoport <rppt@linux.ibm.com>, Russell King <linux@armlinux.org.uk>, Linux
List-Id: devicetree@vger.kernel.org

wt., 24 wrz 2019 o 21:07 Hongwei Zhang <hongweiz@ami.com> napisa=C5=82(a):
>
> Add SGPIO driver support for Aspeed AST2500 SoC.
>
> Signed-off-by: Hongwei Zhang <hongweiz@ami.com>
> ---
>  arch/arm/Kconfig                 |  2 ++
>  arch/arm/boot/dts/aspeed-g5.dtsi | 16 +++++++++++++++-
>  drivers/gpio/Kconfig             |  8 ++++++++
>  drivers/gpio/Makefile            |  1 +
>  4 files changed, 26 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 2436021..c9f08ab 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -1460,6 +1460,8 @@ config ARCH_NR_GPIO
>         default 416 if ARCH_SUNXI
>         default 392 if ARCH_U8500
>         default 352 if ARCH_VT8500
> +       default 312 if MACH_ASPEED_G5
> +       default 304 if MACH_ASPEED_G4
>         default 288 if ARCH_ROCKCHIP
>         default 264 if MACH_H4700
>         default 0
> diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-=
g5.dtsi
> index 00f05bd..85da7ea 100644
> --- a/arch/arm/boot/dts/aspeed-g5.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
> @@ -311,7 +311,7 @@
>                                 #gpio-cells =3D <2>;
>                                 gpio-controller;
>                                 compatible =3D "aspeed,ast2500-gpio";
> -                               reg =3D <0x1e780000 0x1000>;
> +                               reg =3D <0x1e780000 0x200>;
>                                 interrupts =3D <20>;
>                                 gpio-ranges =3D <&pinctrl 0 0 232>;
>                                 clocks =3D <&syscon ASPEED_CLK_APB>;
> @@ -319,6 +319,20 @@
>                                 #interrupt-cells =3D <2>;
>                         };
>
> +                       sgpio: sgpio@1e780200 {
> +                               #gpio-cells =3D <2>;
> +                               compatible =3D "aspeed,ast2500-sgpio";
> +                               gpio-controller;
> +                               interrupts =3D <40>;
> +                               reg =3D <0x1e780200 0x0100>;
> +                               clocks =3D <&syscon ASPEED_CLK_APB>;
> +                               interrupt-controller;
> +                               ngpios =3D <8>;
> +                               bus-frequency =3D <12000000>;
> +                               pinctrl-names =3D "default";
> +                               pinctrl-0 =3D <&pinctrl_sgpm_default>;
> +                       };
> +
>                         rtc: rtc@1e781000 {
>                                 compatible =3D "aspeed,ast2500-rtc";
>                                 reg =3D <0x1e781000 0x18>;
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index bb13c26..e94f903 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -120,6 +120,14 @@ config GPIO_ASPEED
>         help
>           Say Y here to support Aspeed AST2400 and AST2500 GPIO controlle=
rs.
>
> +config SGPIO_ASPEED
> +       bool "Aspeed SGPIO support"
> +       depends on (ARCH_ASPEED || COMPILE_TEST) && OF_GPIO
> +       select GPIO_GENERIC
> +       select GPIOLIB_IRQCHIP
> +       help
> +         Say Y here to support Aspeed AST2500 SGPIO functionality.
> +
>  config GPIO_ATH79
>         tristate "Atheros AR71XX/AR724X/AR913X GPIO support"
>         default y if ATH79
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index a4e9117..bebbd82 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -32,6 +32,7 @@ obj-$(CONFIG_GPIO_AMD_FCH)            +=3D gpio-amd-fch=
.o
>  obj-$(CONFIG_GPIO_AMDPT)               +=3D gpio-amdpt.o
>  obj-$(CONFIG_GPIO_ARIZONA)             +=3D gpio-arizona.o
>  obj-$(CONFIG_GPIO_ASPEED)              +=3D gpio-aspeed.o
> +obj-$(CONFIG_SGPIO_ASPEED)             +=3D sgpio-aspeed.o
>  obj-$(CONFIG_GPIO_ATH79)               +=3D gpio-ath79.o
>  obj-$(CONFIG_GPIO_BCM_KONA)            +=3D gpio-bcm-kona.o
>  obj-$(CONFIG_GPIO_BD70528)             +=3D gpio-bd70528.o
> --
> 2.7.4
>

This should be split into separate patches with one extending the
binding document and one adding actual support.

Bart
