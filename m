From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 3/4] arm64: dts: meson: axg: add clk measure support
Date: Thu, 17 Jan 2019 20:57:50 +0100
Message-ID: <CAFBinCChyyWaiju6ghaCHBFktTXV6DbtuCgZFjEENrf3t3eOxg@mail.gmail.com>
References: <20190117164838.8008-1-jbrunet@baylibre.com> <20190117164838.8008-4-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190117164838.8008-4-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, patchwork-bot+notify@kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Jerome,

On Thu, Jan 17, 2019 at 5:48 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
> Add the clock measure device to the axg SoC family
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> index 0e0abb1a03e2..94ea36a2417a 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> @@ -1611,6 +1611,11 @@
>                                 status = "disabled";
>                         };
>
> +                       clk_msr: clock-sensor@18000 {
in the dt-bindings specify "clock-measure@..."
this also applies to patch 4/4 from this series


[0] https://elixir.bootlin.com/linux/v5.0-rc1/source/Documentation/devicetree/bindings/soc/amlogic/clk-measure.txt
