From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg-Bxea+6Xhats@public.gmane.org>
Subject: Re: [PATCH v2 10/19] ARM: dts: aspeed: Add LPC Snoop device
Date: Mon, 18 Dec 2017 10:16:19 +0100
Message-ID: <c5ef27de-34c1-f5e9-e4ae-e2709b004677@kaod.org>
References: <20171215062443.23059-1-joel@jms.id.au>
 <20171215062443.23059-11-joel@jms.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171215062443.23059-11-joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>, Patrick Venture <venture-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Xo Wang <xow-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Lei YU <mine260309-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-aspeed-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 12/15/2017 07:24 AM, Joel Stanley wrote:
> LPC snoop hardware on the ASPEED BMC, used for monitoring
> host I/O port activity.
> 
> Signed-off-by: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
> ---
>  arch/arm/boot/dts/aspeed-g4.dtsi | 7 +++++++
>  arch/arm/boot/dts/aspeed-g5.dtsi | 6 ++++++
>  2 files changed, 13 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
> index f6fee40c04c0..b3580f37f507 100644
> --- a/arch/arm/boot/dts/aspeed-g4.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g4.dtsi
> @@ -236,6 +236,13 @@
>  						status = "disabled";
>  					};
>  
> +					lpc_snoop: lpc-snoop@0 {
> +						compatible = "aspeed,ast2500-lpc-snoop";

it should be :

	aspeed,ast2400-lpc-snoop

a part from that :

Reviewed-by: Cédric Le Goater <clg-Bxea+6Xhats@public.gmane.org>

> +						reg = <0x0 0x80>;
> +						interrupts = <8>;
> +						status = "disabled";
> +					};
> +
>  					lhc: lhc@20 {
>  						compatible = "aspeed,ast2500-lhc";
>  						reg = <0x20 0x24 0x48 0x8>;
> diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
> index 96a9d2fe3f0d..50766f0629f8 100644
> --- a/arch/arm/boot/dts/aspeed-g5.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
> @@ -287,6 +287,12 @@
>  						status = "disabled";
>  					};
>  
> +					lpc_snoop: lpc-snoop@0 {
> +						compatible = "aspeed,ast2500-lpc-snoop";
> +						reg = <0x0 0x80>;
> +						interrupts = <8>;
> +						status = "disabled";
> +					};
>  
>  					lhc: lhc@20 {
>  						compatible = "aspeed,ast2500-lhc";
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
