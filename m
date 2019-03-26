From: Adam Ford <aford173@gmail.com>
Subject: Re: [PATCH v2 3/4] ARM: dts: da850-evm: enable cpufreq
Date: Tue, 26 Mar 2019 09:15:53 -0500
Message-ID: <CAHCN7xJLp37dkpTR=ehBntQwD+s5G7M6srmKL-gYEmgDQLv6uw@mail.gmail.com>
References: <20190322133105.5945-1-brgl@bgdev.pl> <20190322133105.5945-4-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190322133105.5945-4-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, David Lechner <david@lechnology.com>, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, arm-soc <linux-arm-kernel@lists.infradead.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 22, 2019 at 8:31 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> Enable cpufreq-dt support for da850-evm. The cvdd is supplied by the
> tps6507 pmic with configurable output voltage, so all operating points
> can be enabled.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  arch/arm/boot/dts/da850-evm.dts | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/arch/arm/boot/dts/da850-evm.dts b/arch/arm/boot/dts/da850-evm.dts
> index f04bc3e15332..a0a1b3dccf37 100644
> --- a/arch/arm/boot/dts/da850-evm.dts
> +++ b/arch/arm/boot/dts/da850-evm.dts
> @@ -191,6 +191,18 @@
>         };
>  };
>
> +&cpu {
> +       cpu-supply = <&vdcdc3_reg>;
> +};
> +
> +&opp_375 {
> +       status = "okay";
> +};
> +
> +&opp_456 {
> +       status = "okay";
> +};

I pulled part number for the processor used in the da850evm that Logic
PD produces, and it shows a imit of 375MHz.  I cross-referenced the
processor part number with the description from a distributor, and the
part number also lists 375MHz, so I think we should leave 456
disabled.

adam
> +
>  &sata {
>         status = "okay";
>  };
> --
> 2.20.1
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
