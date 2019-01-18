From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: meson: g12a: add clk measure support
Date: Fri, 18 Jan 2019 22:59:31 +0100
Message-ID: <CAFBinCB=SEGQzLaqbUMFGoc_LpnJtMd-V4ao9a9JhcFKzmYT6Q@mail.gmail.com>
References: <20190118103423.15075-1-jbrunet@baylibre.com> <20190118103423.15075-5-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190118103423.15075-5-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, patchwork-bot+notify@kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Jan 18, 2019 at 11:34 AM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
> Add the clock measure device to the g12a SoC family
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
> index bd24de947a5b..59900ddb7b43 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
> @@ -193,6 +193,11 @@
>                         #interrupt-cells = <3>;
>                         #address-cells = <0>;
>                 };
> +
> +               clk_msr: clock-measure@ffd18000 {
> +                       compatible = "amlogic,meson-g12a-clk-measure";
> +                       reg = <0x0 0xffd18000 0x0 0x10>;
> +               };
I'll wait with my Reviewed-by until we have a result in the G12A bus
discussion in "arm64: dts: meson: g12a: add clk measure support" from
[0]


[0] https://patchwork.kernel.org/patch/10766427/
