From: Sharma Bhupesh <bhupesh.sharma-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: RE: [linuxppc-release] [PATCH] arm64: dts: fsl-ls2085a: Add serial
	aliases
Date: Tue, 15 Sep 2015 05:57:02 +0000
Message-ID: <BN3PR0301MB1298D188667AF2F48ED54933825C0@BN3PR0301MB1298.namprd03.prod.outlook.com>
References: <20150915004827.GA19862@home.buserror.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150915004827.GA19862-vONcSABrMOVpTrP2zolEsF6hYfS7NtTn@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> From: linuxppc-release-bounces-50dRxjG7WBCY5r8RbUyfqNHuzzzSOjJt@public.gmane.org [mailto:linuxppc-
> release-bounces-50dRxjG7WBCY5r8RbUyfqNHuzzzSOjJt@public.gmane.org] On Behalf Of Scott Wood
> Sent: Tuesday, September 15, 2015 6:18 AM
> 
> These will allow U-Boot to set linux,stdout-path in /chosen based on the
> active console device, which will allow devicetree-based earlycon.
> 
> Signed-off-by: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
>  arch/arm64/boot/dts/freescale/fsl-ls2085a.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls2085a.dtsi
> b/arch/arm64/boot/dts/freescale/fsl-ls2085a.dtsi
> index e281ceb..eae454e 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls2085a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls2085a.dtsi
> @@ -55,6 +55,11 @@
>  	#address-cells = <2>;
>  	#size-cells = <2>;
> 
> +	aliases {
> +		serial0 = &serial0;
> +		serial1 = &serial1;
> +	};
> +
>  	cpus {
>  		#address-cells = <2>;
>  		#size-cells = <0>;
> --

Rebase this to my LS2080A v2 DTS sent some time ago, as LS2085A is now renamed to LS2080A.

Regards,
Bhupesh
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
