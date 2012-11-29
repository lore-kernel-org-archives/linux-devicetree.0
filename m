From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] clk: imx: Remove 'clock-output-names' from the examples
Date: Thu, 29 Nov 2012 12:46:42 -0600
Message-ID: <50B7AD92.2000805@gmail.com>
References: <1354116856-25024-1-git-send-email-festevam@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1354116856-25024-1-git-send-email-festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11/28/2012 09:34 AM, Fabio Estevam wrote:
> From: Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> 
> 'clock-output-names' is not used in any of the dts/dtsi files for i.mx.
> 
> Remove it from the examples, so that the example and the real usage in the
> dtsi files can match.
> 
> Signed-off-by: Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---

This doesn't apply to my tree, so I guess it is dependent on something
else. So merge it with whatever it is dependent on.

Acked-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>

Rob

>  .../devicetree/bindings/clock/imx23-clock.txt      |    5 -----
>  .../devicetree/bindings/clock/imx25-clock.txt      |    4 ----
>  .../devicetree/bindings/clock/imx28-clock.txt      |    5 -----
>  .../devicetree/bindings/clock/imx6q-clock.txt      |    4 ----
>  4 files changed, 18 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/imx23-clock.txt b/Documentation/devicetree/bindings/clock/imx23-clock.txt
> index baadbb1..5083c0b 100644
> --- a/Documentation/devicetree/bindings/clock/imx23-clock.txt
> +++ b/Documentation/devicetree/bindings/clock/imx23-clock.txt
> @@ -60,11 +60,6 @@ clks: clkctrl@80040000 {
>  	compatible = "fsl,imx23-clkctrl";
>  	reg = <0x80040000 0x2000>;
>  	#clock-cells = <1>;
> -	clock-output-names =
> -		...
> -		"uart",		/* 32 */
> -		...
> -		"end_of_list";
>  };
>  
>  auart0: serial@8006c000 {
> diff --git a/Documentation/devicetree/bindings/clock/imx25-clock.txt b/Documentation/devicetree/bindings/clock/imx25-clock.txt
> index c2a3525..db4f2f0 100644
> --- a/Documentation/devicetree/bindings/clock/imx25-clock.txt
> +++ b/Documentation/devicetree/bindings/clock/imx25-clock.txt
> @@ -146,10 +146,6 @@ clks: ccm@53f80000 {
>  	compatible = "fsl,imx25-ccm";
>  	reg = <0x53f80000 0x4000>;
>  	interrupts = <31>;
> -	clock-output-names = ...
> -			"uart_ipg",
> -			"uart_serial",
> -			...;
>  };
>  
>  uart1: serial@43f90000 {
> diff --git a/Documentation/devicetree/bindings/clock/imx28-clock.txt b/Documentation/devicetree/bindings/clock/imx28-clock.txt
> index 52a49a4..e6587af 100644
> --- a/Documentation/devicetree/bindings/clock/imx28-clock.txt
> +++ b/Documentation/devicetree/bindings/clock/imx28-clock.txt
> @@ -83,11 +83,6 @@ clks: clkctrl@80040000 {
>  	compatible = "fsl,imx28-clkctrl";
>  	reg = <0x80040000 0x2000>;
>  	#clock-cells = <1>;
> -	clock-output-names =
> -		...
> -		"uart",		/* 45 */
> -		...
> -		"end_of_list";
>  };
>  
>  auart0: serial@8006a000 {
> diff --git a/Documentation/devicetree/bindings/clock/imx6q-clock.txt b/Documentation/devicetree/bindings/clock/imx6q-clock.txt
> index 492bd99..d786519 100644
> --- a/Documentation/devicetree/bindings/clock/imx6q-clock.txt
> +++ b/Documentation/devicetree/bindings/clock/imx6q-clock.txt
> @@ -206,10 +206,6 @@ clks: ccm@020c4000 {
>  	reg = <0x020c4000 0x4000>;
>  	interrupts = <0 87 0x04 0 88 0x04>;
>  	#clock-cells = <1>;
> -	clock-output-names = ...
> -			     "uart_ipg",
> -			     "uart_serial",
> -			     ...;
>  };
>  
>  uart1: serial@02020000 {
> 
