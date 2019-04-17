From: Adam Ford <aford173@gmail.com>
Subject: Re: [PATCH v5 4/5] ARM: dts: da850-evm: enable cpufreq
Date: Wed, 17 Apr 2019 12:09:17 -0500
Message-ID: <CAHCN7xKVaYqd5LLvRx7i8ik+JnTFdpexZf2WXt0R2N1W1skOJA@mail.gmail.com>
References: <20190417152701.23391-1-brgl@bgdev.pl> <20190417152701.23391-5-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190417152701.23391-5-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, David Lechner <david@lechnology.com>, arm-soc <linux-arm-kernel@lists.infradead.org>, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: devicetree@vger.kernel.org

On Wed, Apr 17, 2019 at 10:27 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> Enable cpufreq-dt support for da850-evm. The cvdd is supplied by the
> tps65070 pmic with configurable output voltage. By default da850-evm
> boards support frequencies up to 375MHz so enable this operating
> point.

Have you done any testing with the LCD on any of the devices you have?

I enabled the ondemand governor, and I got a bunch of splat from the
LCD controller:

tilcdc 1e13000.display: effective pixel clock rate (50000000Hz)
differs from the calculated rate (54000000Hz)
tilcdc 1e13000.display: tilcdc_crtc_irq(0x00000161): FIFO underflow
tilcdc 1e13000.display: tilcdc_crtc_irq(0x00000161): FIFO underflow
... [ snip]
tilcdc 1e13000.display: effective pixel clock rate (50000000Hz)
differs from the calculated rate (54000000Hz)
tilcdc 1e13000.display: effective pixel clock rate (50000000Hz)
differs from the calculated rate (54000000Hz)
tilcdc 1e13000.display: tilcdc_crtc_irq(0x00000161): FIFO underflow

It appears to go on forever.  I don't necessarily want to hold it up,
but I don't know the clocking system well enough to know where to go
investigate it.  I can certainly live without ondemand.  Using
userspace as the default governor is fine for me for now.

adam
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Reviewed-by: Adam Ford <aford173@gmail.com>
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
