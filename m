From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: fsl-ls2085a: Add serial aliases
Date: Tue, 15 Sep 2015 08:43:38 +0200
Message-ID: <2766847.5egOSlNQ7I@wuerfel>
References: <20150915004827.GA19862@home.buserror.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150915004827.GA19862-vONcSABrMOVpTrP2zolEsF6hYfS7NtTn@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Monday 14 September 2015 19:48:27 Scott Wood wrote:
> These will allow U-Boot to set linux,stdout-path in /chosen based on
> the active console device, which will allow devicetree-based earlycon.
> 
> Signed-off-by: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
>  arch/arm64/boot/dts/freescale/fsl-ls2085a.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls2085a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls2085a.dtsi
> index e281ceb..eae454e 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls2085a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls2085a.dtsi
> @@ -55,6 +55,11 @@
>         #address-cells = <2>;
>         #size-cells = <2>;
>  
> +       aliases {
> +               serial0 = &serial0;
> +               serial1 = &serial1;
> +       };
> +

I normally ask people to put the aliases into the board specific dts file,
to account for machines that do not have all the uarts, or that number them
differently from the SoC.

I didn't know about U-Boot setting the stdout-path property, but that's
great, as long as U-Boot uses the same numbering of the uarts that the
board uses. Do you know if that is normally the case?

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
