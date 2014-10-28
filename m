From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH 2/3] dt/bindings: qoriq-clock: Add binding for the
 platform PLL
Date: Tue, 28 Oct 2014 18:23:47 -0500
Message-ID: <1414538627.23458.127.camel@snotra.buserror.net>
References: <1413988937-27885-1-git-send-email-Emilian.Medve@Freescale.com>
	 <1413988937-27885-2-git-send-email-Emilian.Medve@Freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1413988937-27885-2-git-send-email-Emilian.Medve-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Emil Medve <Emilian.Medve-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>
Cc: yuantian.tang-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 2014-10-22 at 09:42 -0500, Emil Medve wrote:
> Signed-off-by: Emil Medve <Emilian.Medve-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>
> Change-Id: I7950afa9650d15ec7ce2cca89bb2a1e38586d4a5
> ---
>  Documentation/devicetree/bindings/clock/qoriq-clock.txt | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qoriq-clock.txt b/Documentation/devicetree/bindings/clock/qoriq-clock.txt
> index 5666812..407fb01 100644
> --- a/Documentation/devicetree/bindings/clock/qoriq-clock.txt
> +++ b/Documentation/devicetree/bindings/clock/qoriq-clock.txt
> @@ -62,6 +62,8 @@ Required properties:
>  		It takes parent's clock-frequency as its clock.
>  	* "fsl,qoriq-sysclk-2.0": for input system clock (v2.0).
>  		It takes parent's clock-frequency as its clock.
> +	* "fsl,qoriq-platform-pll-1.0" for the platform PLL clock (v1.0)
> +	* "fsl,qoriq-platform-pll-2.0" for the platform PLL clock (v2.0)
>  - #clock-cells: From common clock binding. The number of cells in a
>  	clock-specifier. Should be <0> for "fsl,qoriq-sysclk-[1,2].0"
>  	clocks, or <1> for "fsl,qoriq-core-pll-[1,2].0" clocks.
> @@ -94,7 +96,6 @@ Example for clock block and clock provider:
>  			compatible = "fsl,qoriq-sysclk-1.0";
>  			clock-output-names = "sysclk";
>  		};
> -
>  		pll0: pll0@800 {
>  			#clock-cells = <1>;
>  			reg = <0x800 0x4>;
> @@ -102,7 +103,6 @@ Example for clock block and clock provider:
>  			clocks = <&sysclk>;
>  			clock-output-names = "pll0", "pll0-div2";
>  		};
> -
>  		pll1: pll1@820 {
>  			#clock-cells = <1>;
>  			reg = <0x820 0x4>;
> @@ -110,7 +110,6 @@ Example for clock block and clock provider:
>  			clocks = <&sysclk>;
>  			clock-output-names = "pll1", "pll1-div2";
>  		};
> -
>  		mux0: mux0@0 {
>  			#clock-cells = <0>;
>  			reg = <0x0 0x4>;

Please don't make unrelated whitespace changes, especially when they're
changing something that's not obviously broken.

-Scott


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
