From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 2/2] dts/ls2080a: Update DTSI to add support of SP805 WDT
Date: Mon, 16 Nov 2015 14:40:34 +0000
Message-ID: <20151116144034.GL20696@leverpostej>
References: <1447683883-6600-1-git-send-email-bhupesh.sharma@freescale.com>
 <1447683883-6600-3-git-send-email-bhupesh.sharma@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1447683883-6600-3-git-send-email-bhupesh.sharma-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bhupesh Sharma <bhupesh.sharma-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: arnd-r2nGTMty4D4@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bhupesh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Catalin.Marinas-5wv7dgnIgG8@public.gmane.org, LeoLi-KZfg59tc24xl57MIdRCFDg@public.gmane.org, scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org, stuart.yoder-KZfg59tc24xl57MIdRCFDg@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Nov 16, 2015 at 07:54:43PM +0530, Bhupesh Sharma wrote:
> This patch updates the LS2080a DTSI (DTS Include) file to add
> support for eight SP805 Watchdog units which can be used to
> reset the eight Cortex-A57 cores available on LS2080A.
> 
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
>  arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi |   64 ++++++++++++++++++++++++
>  1 file changed, 64 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
> index e81cd48..15637ab 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
> @@ -193,6 +193,70 @@
>  			interrupts = <0 32 0x4>; /* Level high type */
>  		};
>  
> +		cluster1_core0_watchdog: wdt@c000000 {
> +			compatible = "arm,sp805-wdt", "arm,primecell";
> +			reg = <0x0 0xc000000 0x0 0x1000>;
> +			interrupts = <1 12 0x8>; /* PPI, Level low type */
> +			clocks = <&clockgen 4 3>;
> +			clock-names = "apb_pclk";
> +		};
> +
> +		cluster1_core1_watchdog: wdt@c010000 {
> +			compatible = "arm,sp805-wdt", "arm,primecell";
> +			reg = <0x0 0xc010000 0x0 0x1000>;
> +			interrupts = <1 12 0x8>; /* PPI, Level low type */
> +			clocks = <&clockgen 4 3>;
> +			clock-names = "apb_pclk";
> +		};

How does this pseudo-banking work?

For one thing as far as I can see, the SP805 driver can't handle PPIs in
mainline.

Additionally, the kernel has no idea which CPU each of these is
associated with, and we effectively need to deal with shared PPIs in
order to use this appropriately in the kernel (if each WDT's interrupt
is wired to a particular core).

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
