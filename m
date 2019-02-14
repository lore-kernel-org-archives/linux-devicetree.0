From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 1/4] arm64: dts: allwinner: h6: orangepi: Add CPU supply
 regulator
Date: Thu, 14 Feb 2019 14:46:17 +0100
Message-ID: <20190214134617.b44pa7onf3brmhhj@flea>
References: <20190214130910.9201-1-tiny.windzz@gmail.com>
 <20190214130910.9201-2-tiny.windzz@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190214130910.9201-2-tiny.windzz@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yangtao Li <tiny.windzz@gmail.com>
Cc: wens@csie.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi!

Thanks for your patches

On Thu, Feb 14, 2019 at 08:09:07AM -0500, Yangtao Li wrote:
> The original orangepi use the dcdca to supply the CPU cores. According
> to the axp805 spec, the range of dcdca is 0.6 to 1.1v, 1.12 to 1.52v.
> In order to support more CPU frequency, slightly increase the voltage
> maximum and minimum.
> 
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
> index b2526dac2fcf..e7aebaf91ede 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
> @@ -159,8 +159,8 @@
>  
>  			reg_dcdca: dcdca {
>  				regulator-always-on;
> -				regulator-min-microvolt = <810000>;
> -				regulator-max-microvolt = <1080000>;
> +				regulator-min-microvolt = <800000>;
> +				regulator-max-microvolt = <1160000>;

This violates the minimum and maximum recommended voltages in the H6
datasheet. Could you clarify why you are doing so (ideally in the
commit log)?

Thanks!
Maxime

-- 
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
