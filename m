From: Adam Ford <aford173@gmail.com>
Subject: Re: [PATCH v4 4/5] ARM: dts: da850-evm: enable cpufreq
Date: Mon, 15 Apr 2019 08:10:14 -0500
Message-ID: <CAHCN7xK2BKasMUt-Ytnfw1yewtZePcQhe4PRUQCMG_T8dsVHpQ@mail.gmail.com>
References: <20190412134437.14864-1-brgl@bgdev.pl> <20190412134437.14864-5-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190412134437.14864-5-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, David Lechner <david@lechnology.com>, arm-soc <linux-arm-kernel@lists.infradead.org>, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: devicetree@vger.kernel.org

On Fri, Apr 12, 2019 at 8:44 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> Enable cpufreq-dt support for da850-evm. The cvdd is supplied by the
> tps6507 pmic with configurable output voltage. By default da850-evm

 It's just a little minor typo, but technically, the PMIC is TPS65070.

> boards support frequencies up to 375MHz so enable this operating
> point.
>
Reviewed-by: Adam Ford <aford173@gmail.com>

> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  arch/arm/boot/dts/da850-evm.dts | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/arch/arm/boot/dts/da850-evm.dts b/arch/arm/boot/dts/da850-evm.dts
> index f04bc3e15332..f94bb38fdad9 100644
> --- a/arch/arm/boot/dts/da850-evm.dts
> +++ b/arch/arm/boot/dts/da850-evm.dts
> @@ -191,6 +191,19 @@
>         };
>  };
>
> +&cpu {
> +       cpu-supply = <&vdcdc3_reg>;
> +};
> +
> +/*
> + * The standard da850-evm kits and SOM's are 375MHz so enable this operating
> + * point by default. Higher frequencies must be enabled for custom boards with
> + * other variants of the SoC.
> + */
> +&opp_375 {
> +       status = "okay";
> +};
> +
>  &sata {
>         status = "okay";
>  };
> --
> 2.21.0
>
