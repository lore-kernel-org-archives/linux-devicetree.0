From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: display: imx: fix native-mode setting
Date: Tue, 01 Oct 2019 17:09:04 -0500
Message-ID: <5d93ce82.1c69fb81.fe9a0.e3e6@mx.google.com>
References: <20190918193853.25689-1-martin@kaiser.cx>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190918193853.25689-1-martin@kaiser.cx>
Sender: linux-kernel-owner@vger.kernel.org
To: Martin Kaiser <martin@kaiser.cx>
Cc: Shawn Guo <shawnguo@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Sep 18, 2019 at 09:38:53PM +0200, Martin Kaiser wrote:
> According to
> Documentation/devicetree/bindings/display/panel/display-timing.txt,
> native-mode is a property of the display-timings node.
> 
> If it's located outside of display-timings, the native-mode setting is
> ignored and the first display timing is used.
> 
> We've already fixed the board definitions which got this wrong. Fix the
> example in the imx framebuffer bindings as well.
> 
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
>  Documentation/devicetree/bindings/display/imx/fsl,imx-fb.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Please also fix 
Documentation/devicetree/bindings/display/cirrus,clps711x-fb.txt

> 
> diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx-fb.txt b/Documentation/devicetree/bindings/display/imx/fsl,imx-fb.txt
> index e5a8b363d829..f4df9e83bcd2 100644
> --- a/Documentation/devicetree/bindings/display/imx/fsl,imx-fb.txt
> +++ b/Documentation/devicetree/bindings/display/imx/fsl,imx-fb.txt
> @@ -38,10 +38,10 @@ Example:
>  
>  	display0: display0 {
>  		model = "Primeview-PD050VL1";
> -		native-mode = <&timing_disp0>;
>  		bits-per-pixel = <16>;
>  		fsl,pcr = <0xf0c88080>;	/* non-standard but required */
>  		display-timings {
> +			native-mode = <&timing_disp0>;
>  			timing_disp0: 640x480 {
>  				hactive = <640>;
>  				vactive = <480>;
> -- 
> 2.11.0
> 
