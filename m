From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v2 3/6] arm64: dts: amlogic: g12: add temperature sensor
Date: Sat, 3 Aug 2019 19:52:26 +0200
Message-ID: <CAFBinCBYPiLgmTNk+7Db3EPSPePwbnAshCbomYPXWdse8i0oJw@mail.gmail.com>
References: <20190731153529.30159-1-glaroque@baylibre.com> <20190731153529.30159-4-glaroque@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190731153529.30159-4-glaroque@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Guillaume La Roque <glaroque@baylibre.com>
Cc: daniel.lezcano@linaro.org, khilman@baylibre.com, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Guillaume,

On Wed, Jul 31, 2019 at 5:36 PM Guillaume La Roque
<glaroque@baylibre.com> wrote:
>
> Add cpu and ddr temperature sensors for G12 Socs
>
> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
with the nit-pick below addressed:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

> ---
>  .../boot/dts/amlogic/meson-g12-common.dtsi    | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> index 06e186ca41e3..7f862a3490fb 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> @@ -1353,6 +1353,28 @@
>                                 };
>                         };
>
> +                       cpu_temp: temperature-sensor@34800 {
> +                               compatible = "amlogic,g12-cpu-thermal",
> +                                            "amlogic,g12-thermal";
> +                               reg = <0x0 0x34800 0x0 0x50>;
> +                               interrupts = <GIC_SPI 35 IRQ_TYPE_EDGE_RISING>;
> +                               clocks = <&clkc CLKID_TS>;
> +                               status = "okay";
I believe nodes are enabled automatically if they don't have a status property

> +                               #thermal-sensor-cells = <0>;
> +                               amlogic,ao-secure = <&sec_AO>;
> +                       };
> +
> +                       ddr_temp: temperature-sensor@34c00 {
> +                               compatible = "amlogic,g12-ddr-thermal",
> +                                            "amlogic,g12-thermal";
> +                               reg = <0x0 0x34c00 0x0 0x50>;
> +                               interrupts = <GIC_SPI 36 IRQ_TYPE_EDGE_RISING>;
> +                               clocks = <&clkc CLKID_TS>;
> +                               status = "okay";
same here


Martin
