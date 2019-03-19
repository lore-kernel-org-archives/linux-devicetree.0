From: Samuel Holland <samuel@sholland.org>
Subject: Re: [linux-sunxi] [PATCH 6/6] ARM: dts: sunxi: h3/h5: Add device node
 for SID
Date: Mon, 18 Mar 2019 20:55:04 -0500
Message-ID: <8e9ef57f-1d24-b151-f8a4-812b7bb65388@sholland.org>
References: <20190318073354.12151-1-wens@kernel.org>
 <20190318073354.12151-7-wens@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190318073354.12151-7-wens@kernel.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: wens@kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Maxime Ripard <maxime.ripard@bootlin.com>
Cc: devicetree@vger.kernel.org, linux-sunxi@googlegroups.com, Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 03/18/19 02:33, Chen-Yu Tsai wrote:
> From: Chen-Yu Tsai <wens@csie.org>
> 
> The device tree binding already lists compatible strings for these two
> SoCs. Add a device node for them.
> 
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
>  arch/arm/boot/dts/sun8i-h3.dtsi              | 4 ++++
>  arch/arm/boot/dts/sunxi-h3-h5.dtsi           | 5 +++++
>  arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi | 4 ++++
>  3 files changed, 13 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/sun8i-h3.dtsi b/arch/arm/boot/dts/sun8i-h3.dtsi
> index 959d265e7254..e37c30e811d3 100644
> --- a/arch/arm/boot/dts/sun8i-h3.dtsi
> +++ b/arch/arm/boot/dts/sun8i-h3.dtsi
> @@ -231,3 +231,7 @@
>  &rtc {
>  	compatible = "allwinner,sun8i-h3-rtc";
>  };
> +
> +&sid {
> +	compatible = "allwinner,sun8i-h3-sid";
> +};
> diff --git a/arch/arm/boot/dts/sunxi-h3-h5.dtsi b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
> index d74a6cbbfdf4..e2100b673a51 100644
> --- a/arch/arm/boot/dts/sunxi-h3-h5.dtsi
> +++ b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
> @@ -227,6 +227,11 @@
>  			#size-cells = <0>;
>  		};
>  
> +		sid: eeprom@1c14000 {
> +			/* compatible and clocks are in per SoC .dtsi file */

There are no clocks for this node, just a compatible string.

> +			reg = <0x1c14000 0x400>;
> +		};
> +
>  		usb_otg: usb@1c19000 {
>  			compatible = "allwinner,sun8i-h3-musb";
>  			reg = <0x01c19000 0x400>;
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi
> index 96acafd3a852..f002a496d7cb 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi
> @@ -209,3 +209,7 @@
>  &rtc {
>  	compatible = "allwinner,sun50i-h5-rtc";
>  };
> +
> +&sid {
> +	compatible = "allwinner,sun50i-h5-sid";
> +};
> 
