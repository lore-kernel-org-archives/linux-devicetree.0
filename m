From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [RESEND][PATCH] arm64: dts: lx2160a: Enable usb3-lpm-capable for
 usb3 node
Date: Thu, 23 May 2019 15:43:01 +0800
Message-ID: <20190523074300.GH9261@dragon>
References: <20190515060434.33581-1-ran.wang_1@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190515060434.33581-1-ran.wang_1@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ran Wang <ran.wang_1@nxp.com>
Cc: Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, May 15, 2019 at 02:04:34PM +0800, Ran Wang wrote:
> Enable USB3 HW LPM feature for lx2160a and active patch for
> snps erratum A-010131. It will disable U1/U2 temperary when
> initiate U3 request.
> 
> Signed-off-by: Ran Wang <ran.wang_1@nxp.com>
> ---
> Depend on: https://lore.kernel.org/patchwork/patch/870134/

Is the dependency accepted?

Shawn

> 
>  arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi |    4 ++++
>  1 files changed, 4 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
> index 125a8cc..0073df3 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
> @@ -696,6 +696,8 @@
>  			interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
>  			dr_mode = "host";
>  			snps,quirk-frame-length-adjustment = <0x20>;
> +			usb3-lpm-capable;
> +			snps,dis-u1u2-when-u3-quirk;
>  			snps,dis_rxdet_inp3_quirk;
>  			snps,incr-burst-type-adjustment = <1>, <4>, <8>, <16>;
>  			status = "disabled";
> @@ -707,6 +709,8 @@
>  			interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
>  			dr_mode = "host";
>  			snps,quirk-frame-length-adjustment = <0x20>;
> +			usb3-lpm-capable;
> +			snps,dis-u1u2-when-u3-quirk;
>  			snps,dis_rxdet_inp3_quirk;
>  			snps,incr-burst-type-adjustment = <1>, <4>, <8>, <16>;
>  			status = "disabled";
> -- 
> 1.7.1
> 
