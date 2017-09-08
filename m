From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] arm64: dts: stratix10: add ethernet/sdmmc support to
 the S10 devkit
Date: Fri, 8 Sep 2017 15:30:32 -0700
Message-ID: <4e289c38-bf04-6d07-5e72-f543b0f4cb0f@gmail.com>
References: <1504885734-9618-1-git-send-email-dinguyen@kernel.org>
 <1504885734-9618-2-git-send-email-dinguyen@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1504885734-9618-2-git-send-email-dinguyen-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dinh Nguyen <dinguyen-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 09/08/2017 08:48 AM, Dinh Nguyen wrote:
> Enable ethernet and sdmmc support on the Stratix10 devkit.
> 
> Signed-off-by: Dinh Nguyen <dinguyen-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
>  .../boot/dts/altera/socfpga_stratix10_socdk.dts    | 36 ++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dts b/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dts
> index 41ea2db..ae0e8f3 100644
> --- a/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dts
> +++ b/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dts
> @@ -34,6 +34,42 @@
>  	};
>  };
>  
> +&gmac0 {
> +	phy-mode = "rgmii";
> +	phy-addr = <0xffffffff>; /* probe for phy addr */

This is a deprecated property for stmmac, just use the correct PHY
address and use a phy-handle property to connect to it, along with a
proper mdio subnode to indicate it is connecting to the stmmac MDIO bus.

> +
> +	/*
> +	 * These skews assume the user's FPGA design is adding 600ps of delay
> +	 * for TX_CLK on Arria 10.
> +	 *
> +	 * All skews are offset since hardware skew values for the ksz9031
> +	 * range from a negative skew to a positive skew.
> +	 * See the micrel-ksz90x1.txt Documentation file for details.
> +	*/
> +	txd0-skew-ps = <0>; /* -420ps */
> +	txd1-skew-ps = <0>; /* -420ps */
> +	txd2-skew-ps = <0>; /* -420ps */
> +	txd3-skew-ps = <0>; /* -420ps */
> +	rxd0-skew-ps = <420>; /* 0ps */
> +	rxd1-skew-ps = <420>; /* 0ps */
> +	rxd2-skew-ps = <420>; /* 0ps */
> +	rxd3-skew-ps = <420>; /* 0ps */
> +	txen-skew-ps = <0>; /* -420ps */
> +	txc-skew-ps = <1860>; /* 960ps */
> +	rxdv-skew-ps = <420>; /* 0ps */
> +	rxc-skew-ps = <1680>; /* 780ps */

These are all PHY properties, and the driver and binding now recommend
using them as such, can you move that to the PHY node instead?

> +	max-frame-size = <3800>;
> +	status = "okay";
> +};
> +
> +&mmc {
> +	status = "okay";
> +	num-slots = <1>;
> +	cap-sd-highspeed;
> +	broken-cd;
> +	bus-width = <4>;
> +};
> +
>  &uart0 {
>  	status = "okay";
>  };
> 


-- 
Florian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
