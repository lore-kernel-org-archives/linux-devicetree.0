Return-Path: <shawnguo@kernel.org>
Date: Tue, 26 Mar 2019 16:25:15 +0800
From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 4/5] ARM: dts: imx7s-warp: add csi and mipi_csi node
Message-ID: <20190326082514.GG12513@dragon>
References: <20190319170003.21261-1-rui.silva@linaro.org>
 <20190319170003.21261-5-rui.silva@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190319170003.21261-5-rui.silva@linaro.org>
To: Rui Miguel Silva <rui.silva@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Tue, Mar 19, 2019 at 05:00:02PM +0000, Rui Miguel Silva wrote:
> Add and enable csi and mipi_csi nodes.
> 
> Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
> ---
>  arch/arm/boot/dts/imx7s-warp.dts | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/imx7s-warp.dts b/arch/arm/boot/dts/imx7s-warp.dts
> index 23431faecaf4..5158c2d958a7 100644
> --- a/arch/arm/boot/dts/imx7s-warp.dts
> +++ b/arch/arm/boot/dts/imx7s-warp.dts
> @@ -277,6 +277,16 @@
>  	status = "okay";
>  };
>  
> +&csi {

Please keep the labeled nodes sort alphabetically.

> +	status = "okay";
> +};
> +
> +&mipi_csi {
> +	clock-frequency = <166000000>;
> +	status = "okay";

We usually end property list with 'status'.

Shawn

> +	fsl,csis-hs-settle = <3>;
> +};
> +
>  &wdog1 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_wdog>;
> -- 
> 2.21.0
> 
