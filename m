From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 06/11] clk: sunxi-ng: Add A80 USB CCU
Date: Fri, 27 Jan 2017 15:15:59 -0600
Message-ID: <20170127211559.ztsauntipyiheopu@rob-hp-laptop>
References: <20170124023230.3990-1-wens@csie.org>
 <20170124023230.3990-7-wens@csie.org>
Reply-To: robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDJIP47K7MERBEHRV3CAKGQEFEBYYZY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20170124023230.3990-7-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jan 24, 2017 at 10:32:25AM +0800, Chen-Yu Tsai wrote:
> Add support for the USB clock controls found on the A80.
> 
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> ---
>  .../devicetree/bindings/clock/sun9i-usb.txt        |  24 ++++
>  drivers/clk/sunxi-ng/Makefile                      |   1 +
>  drivers/clk/sunxi-ng/ccu-sun9i-a80-usb.c           | 144 +++++++++++++++++++++
>  drivers/clk/sunxi-ng/ccu-sun9i-a80-usb.h           |  25 ++++
>  include/dt-bindings/clock/sun9i-a80-usb.h          |  59 +++++++++
>  include/dt-bindings/reset/sun9i-a80-usb.h          |  56 ++++++++
>  6 files changed, 309 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/sun9i-usb.txt
>  create mode 100644 drivers/clk/sunxi-ng/ccu-sun9i-a80-usb.c
>  create mode 100644 drivers/clk/sunxi-ng/ccu-sun9i-a80-usb.h
>  create mode 100644 include/dt-bindings/clock/sun9i-a80-usb.h
>  create mode 100644 include/dt-bindings/reset/sun9i-a80-usb.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/sun9i-usb.txt b/Documentation/devicetree/bindings/clock/sun9i-usb.txt
> new file mode 100644
> index 000000000000..c2d38626eaaa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/sun9i-usb.txt
> @@ -0,0 +1,24 @@
> +Allwinner A80 USB Clock Control Binding
> +------------------------------------
> +
> +Required properties :
> +- compatible: must contain one of the following compatibles:
> +		- "allwinner,sun9i-a80-usb-clocks"
> +
> +- reg: Must contain the registers base address and length
> +- clocks: phandle to the clocks feeding the USB subsystem. Two are needed:
> +  - "bus": the bus clock for the whole USB subsystem
> +  - "hosc": the high frequency oscillator (usually at 24MHz)
> +- clock-names: Must contain the clock names described just above
> +- #clock-cells : must contain 1
> +- #reset-cells : must contain 1
> +
> +Example:
> +usb_clocks: clock@00a08000 {

Drop leading 0s.

With that, for the binding:

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

> +	compatible = "allwinner,sun9i-a80-usb-clks";
> +	reg = <0x00a08000 0x8>;
> +	clocks = <&ccu CLK_BUS_USB>, <&osc24M>;
> +	clock-names = "bus", "hosc";
> +	#clock-cells = <1>;
> +	#reset-cells = <1>;
> +};
