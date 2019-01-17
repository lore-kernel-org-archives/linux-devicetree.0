From: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH 4/4] arm64: dts: meson: g12a: add clk measure support
Date: Thu, 17 Jan 2019 19:14:05 +0100
Message-ID: <284838d9e1672f2d733e687cedbda1239eab5279.camel@baylibre.com>
References: <20190117164838.8008-1-jbrunet@baylibre.com>
         <20190117164838.8008-5-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190117164838.8008-5-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patchwork-bot+notify@kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 2019-01-17 at 17:48 +0100, Jerome Brunet wrote:
> Add the clock measure device to the g12a SoC family
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
> b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
> index bd24de947a5b..0d3d3af8ea6f 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
> @@ -181,6 +181,11 @@
>  			status = "disabled";
>  		};
>  
> +		clk_msr: clock-sensor@ffd18000 {
> +			compatible = "amlogic,meson-g12a-clk-measure";
> +			reg = <0x0 0xffd18000 0x0 0x10>;
> +		};
> +

Hi Kevin,
I just noticed that I hace misplaced this node if, like for the axg, we are
ordering them by address

It should be under the GIC node.
Can you fix this on the fly or do you want me to resend ?

Cheers
Jerome

>  		gic: interrupt-controller@ffc01000 {
>  			compatible = "arm,gic-400";
>  			reg = <0x0 0xffc01000 0 0x1000>,
