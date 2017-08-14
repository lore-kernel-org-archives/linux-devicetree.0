From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RESEND] arm64: dts: ls1088a: Added dcfg node in ls1088a dtsi
Date: Mon, 14 Aug 2017 09:37:50 +0800
Message-ID: <20170814013748.GG31819@dragon>
References: <1502443177-15479-1-git-send-email-Ashish.Kumar@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1502443177-15479-1-git-send-email-Ashish.Kumar-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ashish Kumar <Ashish.Kumar-3arQi8VN3Tc@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, leoyang.li-3arQi8VN3Tc@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Amrita Kumari <amrita.kumari-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 11, 2017 at 02:49:36PM +0530, Ashish Kumar wrote:
> Add debug configuration node(DCFG) in dtsi, helps guts driver to
> print the following information in kernel boot log
> 
> [    0.526649] Machine: LS1088A RDB Board
> [    0.530430] SoC family: QorIQ LS1088A
> [    0.534115] SoC ID: svr:0x87030010, Revision: 1.0
> 
> Signed-off-by: Amrita Kumari <amrita.kumari-3arQi8VN3Tc@public.gmane.org>
> Signed-off-by: Ashish Kumar <Ashish.Kumar-3arQi8VN3Tc@public.gmane.org>

Why resend?

> ---
>  arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi |    6 ++++++
>  drivers/soc/fsl/guts.c                         |    1 +

Do not mix driver code with dts changes.  Instead, they should be
separate patches going through different subsystem tree and maintainers.

Send me dts patch only after driver counterpart lands on mainline.

Shawn

>  2 files changed, 7 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
> index c144d06..b5f2372 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
> @@ -156,6 +156,12 @@
>  			clocks = <&sysclk>;
>  		};
>  
> +		dcfg: dcfg@1e00000 {
> +			compatible = "fsl,ls1088a-dcfg", "syscon";
> +			reg = <0x0 0x1e00000 0x0 0x10000>;
> +			little-endian;
> +		};
> +
>  		tmu: tmu@1f80000 {
>  			compatible = "fsl,qoriq-tmu";
>  			reg = <0x0 0x1f80000 0x0 0x10000>;
> diff --git a/drivers/soc/fsl/guts.c b/drivers/soc/fsl/guts.c
> index 6af7a11..d89a6a8 100644
> --- a/drivers/soc/fsl/guts.c
> +++ b/drivers/soc/fsl/guts.c
> @@ -213,6 +213,7 @@ static int fsl_guts_remove(struct platform_device *dev)
>  	{ .compatible = "fsl,ls1021a-dcfg", },
>  	{ .compatible = "fsl,ls1043a-dcfg", },
>  	{ .compatible = "fsl,ls2080a-dcfg", },
> +	{ .compatible = "fsl,ls1088a-dcfg", },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, fsl_guts_of_match);
> -- 
> 1.7.6.GIT
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
