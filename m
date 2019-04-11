Return-Path: <SRS0=bLyw=SN=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:60640 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725782AbfDKCFm (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 10 Apr 2019 22:05:42 -0400
Date: Thu, 11 Apr 2019 10:05:30 +0800
From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 1/2] arm64: dts: add fsl-dpaa2-console node for DPAA2
 platforms
Message-ID: <20190411020528.GH26817@dragon>
References: <1553628194-25119-1-git-send-email-ioana.ciornei@nxp.com>
 <1553628194-25119-2-git-send-email-ioana.ciornei@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1553628194-25119-2-git-send-email-ioana.ciornei@nxp.com>
Sender: devicetree-owner@vger.kernel.org
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: Leo Li <leoyang.li@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Tue, Mar 26, 2019 at 07:23:29PM +0000, Ioana Ciornei wrote:
> Add the fsl-dpaa2-console device tree node for the following
> DPAA2 based platforms: LS1088A, LS2080A, LS2088A and LX2160A.
> 
> Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi | 5 +++++
>  arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi | 5 +++++
>  arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi | 5 +++++
>  3 files changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
> index de93b42b1f51..5eee5db3ed6c 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
> @@ -571,6 +571,11 @@
>  			clock-names = "apb_pclk", "wdog_clk";
>  		};
>  
> +		fsl-dpaa2-console@0x08340020 {

The node name should be generic, 'console' maybe?  Also, the
unit-address shouldn't have 0x and leading zeros.

Shawn

> +			compatible = "fsl,dpaa2-console";
> +			reg = <0x00000000 0x08340020 0 0x2>;
> +		};
> +
>  		fsl_mc: fsl-mc@80c000000 {
>  			compatible = "fsl,qoriq-mc";
>  			reg = <0x00000008 0x0c000000 0 0x40>,	 /* MC portal base */
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
> index 6d6ca166f86b..f1521e6d8da0 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
> @@ -321,6 +321,11 @@
>  			};
>  		};
>  
> +		fsl-dpaa2-console@0x08340020 {
> +			compatible = "fsl,dpaa2-console";
> +			reg = <0x00000000 0x08340020 0 0x2>;
> +		};
> +
>  		fsl_mc: fsl-mc@80c000000 {
>  			compatible = "fsl,qoriq-mc";
>  			reg = <0x00000008 0x0c000000 0 0x40>,	 /* MC portal base */
> diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
> index 660e78e46268..8febaa517913 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
> @@ -777,6 +777,11 @@
>  			dma-coherent;
>  		};
>  
> +		fsl-dpaa2-console@0x08340020 {
> +			compatible = "fsl,dpaa2-console";
> +			reg = <0x00000000 0x08340020 0 0x2>;
> +		};
> +
>  		fsl_mc: fsl-mc@80c000000 {
>  			compatible = "fsl,qoriq-mc";
>  			reg = <0x00000008 0x0c000000 0 0x40>,
> -- 
> 1.9.1
> 
