From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v5] powerpc/mpc85xx: Update the clock nodes in device
 tree
Date: Fri, 11 Oct 2013 14:08:12 -0500
Message-ID: <1381518492.7979.537.camel@snotra.buserror.net>
References: <1381300704-4238-1-git-send-email-Yuantian.Tang@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381300704-4238-1-git-send-email-Yuantian.Tang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yuantian.Tang-KZfg59tc24xl57MIdRCFDg@public.gmane.org
Cc: galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 2013-10-09 at 14:38 +0800, Yuantian.Tang-KZfg59tc24xl57MIdRCFDg@public.gmane.org wrote:
> From: Tang Yuantian <yuantian.tang@frovider:
> +/ {
> +	clockgen: global-utilities@e1000 {
> +		compatible = "fsl,p5020-clockgen", "fsl,qoriq-clockgen-1.0";
> +		reg = <0xe1000 0x1000>;
> +		clock-frequency = <0>;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +
> +		sysclk: sysclk {
> +			#clock-cells = <0>;
> +			compatible = "fsl,qoriq-sysclk-1.0", "fixed-clock";
> +			clock-output-names = "sysclk";
> +		}
> +
> +		pll0: pll0@800 {
> +			#clock-cells = <1>;
> +			reg = <0x800 0x4>;
> +			compatible = "fsl,qoriq-core-pll-1.0";
> +			clocks = <&sysclk>;
> +			clock-output-names = "pll0", "pll0-div2";
> +		};

Where is "ranges" in the global-utilities node?

-Scott



--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
