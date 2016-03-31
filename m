From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 6/8] drm/fsl-dcu: add TCON driver
Date: Thu, 31 Mar 2016 09:35:16 -0500
Message-ID: <20160331143515.GA26784@rob-hp-laptop>
References: <1459216802-32094-1-git-send-email-stefan@agner.ch>
 <1459216802-32094-7-git-send-email-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1459216802-32094-7-git-send-email-stefan-XLVq0VzYD2Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, daniel.vetter-/w4YWyX8dFk@public.gmane.org, jianwei.wang.chn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alison.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org, meng.yi-3arQi8VN3Tc@public.gmane.org, alexander.stein-93q1YBGzJSMe9JSWTWOYM3xStJ4P+DSV@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Mar 28, 2016 at 07:00:00PM -0700, Stefan Agner wrote:
> Add driver for the TCON (timing controller) module. The TCON module
> is a separate module attached after the DCU (display controller
> unit). Each DCU instance has its own, directly connected TCON
> instance. The DCU's RGB and timing signals are passing through
> the TCON module. TCON can provide timing signals for raw TFT panels
> or operate in a bypass mode which leaves all signals unaltered.
> 
> The driver currently only supports the bypass mode.
> 
> Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
> ---
>  .../devicetree/bindings/display/fsl,dcu.txt        |   2 +
>  .../devicetree/bindings/display/fsl,tcon.txt       |  18 ++++
>  drivers/gpu/drm/fsl-dcu/Makefile                   |   3 +-
>  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c          |   3 +
>  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.h          |   1 +
>  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c          |  11 +++
>  drivers/gpu/drm/fsl-dcu/fsl_tcon.c                 | 108 +++++++++++++++++++++
>  drivers/gpu/drm/fsl-dcu/fsl_tcon.h                 |  33 +++++++
>  8 files changed, 178 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/display/fsl,tcon.txt
>  create mode 100644 drivers/gpu/drm/fsl-dcu/fsl_tcon.c
>  create mode 100644 drivers/gpu/drm/fsl-dcu/fsl_tcon.h
> 
> diff --git a/Documentation/devicetree/bindings/display/fsl,dcu.txt b/Documentation/devicetree/bindings/display/fsl,dcu.txt
> index f299e1e..b19bf12 100644
> --- a/Documentation/devicetree/bindings/display/fsl,dcu.txt
> +++ b/Documentation/devicetree/bindings/display/fsl,dcu.txt
> @@ -14,6 +14,7 @@ Required properties:
>  Optional properties:
>  - clocks:		Second handle for pixel clock.
>  - clock-names:		Second name "pix" for pixel clock.
> +- fsl,tcon:		The phandle to the timing controller node.
>  
>  Examples:
>  dcu: dcu@2ce0000 {
> @@ -23,4 +24,5 @@ dcu: dcu@2ce0000 {
>  	clock-names = "dcu";
>  	big-endian;
>  	fsl,panel = <&panel>;
> +	fsl,tcon = <&tcon>;
>  };
> diff --git a/Documentation/devicetree/bindings/display/fsl,tcon.txt b/Documentation/devicetree/bindings/display/fsl,tcon.txt
> new file mode 100644
> index 0000000..2e1015e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/fsl,tcon.txt
> @@ -0,0 +1,18 @@
> +Device Tree bindings for Freescale TCON Driver
> +
> +Required properties:
> +- compatible:		Should be one of
> +	* "fsl,vf610-tcon".
> +
> +- reg:			Address and length of the register set for dcu.

s/dcu/tcon/

With that,

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>


> +- clocks:		From common clock binding: handle to tcon ipg clock.
> +- clock-names:		From common clock binding: Shall be "ipg".
> +
> +Examples:
> +timing-controller@4003d000 {
> +	compatible = "fsl,vf610-tcon";
> +	reg = <0x4003d000 0x1000>;
> +	clocks = <&clks VF610_CLK_TCON0>;
> +	clock-names = "ipg";
> +	status = "okay";
> +};
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
