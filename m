From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: imx: enable cpufreq for i.mx6dl
Date: Thu, 19 Dec 2013 11:13:05 +0800
Message-ID: <20131219031304.GR6691@S2101-09.ap.freescale.net>
References: <1387465330-15667-1-git-send-email-b20788@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1387465330-15667-1-git-send-email-b20788-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Anson Huang <b20788-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Dec 19, 2013 at 10:02:10AM -0500, Anson Huang wrote:
> This patch adds cpufreq dts for i.mx6dl to support cpufreq driver.
> 
> Signed-off-by: Anson Huang <b20788-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

Applied, with patch subject changed to 'ARM: dts: imx6dl: enable cpufreq
support'.

Shawn

> ---
>  arch/arm/boot/dts/imx6dl.dtsi |   20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/imx6dl.dtsi b/arch/arm/boot/dts/imx6dl.dtsi
> index b2f2699..e2ec0fb 100644
> --- a/arch/arm/boot/dts/imx6dl.dtsi
> +++ b/arch/arm/boot/dts/imx6dl.dtsi
> @@ -23,6 +23,26 @@
>  			device_type = "cpu";
>  			reg = <0>;
>  			next-level-cache = <&L2>;
> +			operating-points = <
> +				/* kHz    uV */
> +				996000  1275000
> +				792000  1175000
> +				396000  1075000
> +			>;
> +			fsl,soc-operating-points = <
> +				/* ARM kHz  SOC-PU uV */
> +				996000	1175000
> +				792000	1175000
> +				396000	1175000
> +			>;
> +			clock-latency = <61036>; /* two CLK32 periods */
> +			clocks = <&clks 104>, <&clks 6>, <&clks 16>,
> +				 <&clks 17>, <&clks 170>;
> +			clock-names = "arm", "pll2_pfd2_396m", "step",
> +				      "pll1_sw", "pll1_sys";
> +			arm-supply = <&reg_arm>;
> +			pu-supply = <&reg_pu>;
> +			soc-supply = <&reg_soc>;
>  		};
>  
>  		cpu@1 {
> -- 
> 1.7.9.5
> 
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
