From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/2] gpio: xilinx: dt-binding: Add clock node
Date: Tue, 8 Nov 2016 06:48:46 -0800
Message-ID: <20161108144846.GQ14444@xsjsorenbubuntu>
References: <1478581990-28276-1-git-send-email-shubhrajyoti.datta@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1478581990-28276-1-git-send-email-shubhrajyoti.datta-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shubhrajyoti Datta <shubhrajyoti.datta-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 2016-11-08 at 10:43:09 +0530, Shubhrajyoti Datta wrote:
> Add the clock node to the dt binding.
> 
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> ---
>  .../devicetree/bindings/gpio/gpio-xilinx.txt       |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-xilinx.txt b/Documentation/devicetree/bindings/gpio/gpio-xilinx.txt
> index 63bf4be..0821b9d 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio-xilinx.txt
> +++ b/Documentation/devicetree/bindings/gpio/gpio-xilinx.txt
> @@ -11,6 +11,7 @@ Required properties:
>  - #gpio-cells : Should be two. The first cell is the pin number and the
>    second cell is used to specify optional parameters (currently unused).
>  - gpio-controller : Marks the device node as a GPIO controller.
> +- clocks: Input clock specifier. Refer to common clock bindings.
>  
>  Optional properties:
>  - interrupts : Interrupt mapping for GPIO IRQ.
> @@ -25,12 +26,14 @@ Optional properties:
>  - xlnx,dout-default-2 : as above but the second channel
>  - xlnx,gpio2-width : as above but for the second channel
>  - xlnx,tri-default-2 : as above but for the second channel
> +- clock-names: Input clock name

Clock names are driver specific and must be documented here.

>  
>  
>  Example:
>  gpio: gpio@40000000 {
>  	#gpio-cells = <2>;
>  	compatible = "xlnx,xps-gpio-1.00.a";
> +	clocks = <&clkc 15>;

Where are the clock-names?

	Sören
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
