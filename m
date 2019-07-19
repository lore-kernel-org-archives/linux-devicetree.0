From: Liviu Dudau <liviu.dudau@arm.com>
Subject: Re: [v2 3/3] dts: arm64: ls1028a: Add optional property node for
 Mali DP500
Date: Fri, 19 Jul 2019 12:47:38 +0100
Message-ID: <20190719114738.GD16673@e110455-lin.cambridge.arm.com>
References: <20190719095956.11774-1-wen.he_1@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190719095956.11774-1-wen.he_1@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Wen He <wen.he_1@nxp.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, robh+dt@kernel.org, leoyang.li@nxp.com
List-Id: devicetree@vger.kernel.org

On Fri, Jul 19, 2019 at 05:59:56PM +0800, Wen He wrote:
> This patch use the optional property node "arm,malidp-arqos-value" to
> can be dynamic configure QoS signaling.
> 
> Signed-off-by: Wen He <wen.he_1@nxp.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
>  arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> index 7975519b4f56..aef5b06a98d5 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> @@ -554,6 +554,7 @@
>  		clocks = <&dpclk>, <&aclk>, <&aclk>, <&pclk>;
>  		clock-names = "pxlclk", "mclk", "aclk", "pclk";
>  		arm,malidp-output-port-lines = /bits/ 8 <8 8 8>;
> +		arm,malidp-arqos-value = <0xd000d000>;
>  
>  		port {
>  			dp0_out: endpoint {
> -- 
> 2.17.1
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
