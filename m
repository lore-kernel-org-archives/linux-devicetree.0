From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 01/11] dt-bindings: add binding for the
 Allwinner DE2 CCU
Date: Mon, 3 Apr 2017 10:33:23 -0500
Message-ID: <20170403153323.kmq3ku7h3sj7fp4g@rob-hp-laptop>
References: <20170329194613.55548-1-icenowy@aosc.io>
 <20170329194613.55548-2-icenowy@aosc.io>
Reply-To: robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDJIP47K7MERBROWRHDQKGQE6K6NAAY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20170329194613.55548-2-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 30, 2017 at 03:46:03AM +0800, Icenowy Zheng wrote:
> From: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
> 
> Allwinner "Display Engine 2.0" contains some clock controls in it.
> 
> In order to add them as clock drivers, we need a device tree binding.
> Add the binding here.
> 
> Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
> ---
> Changes in v3:
> - Fill the address space length of DE2 CCU to 0x100000, just reach the start of mixer0.

Why? You waste virtual memory space making this bigger than it needs to 
be. Not an issue so much for 64-bit.

> 
>  .../devicetree/bindings/clock/sun8i-de2.txt        | 31 ++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/sun8i-de2.txt
> 
> diff --git a/Documentation/devicetree/bindings/clock/sun8i-de2.txt b/Documentation/devicetree/bindings/clock/sun8i-de2.txt
> new file mode 100644
> index 000000000000..34cf79c05f13
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/sun8i-de2.txt
> @@ -0,0 +1,31 @@
> +Allwinner Display Engine 2.0 Clock Control Binding
> +--------------------------------------------------
> +
> +Required properties :
> +- compatible: must contain one of the following compatibles:
> +		- "allwinner,sun8i-a83t-de2-clk"
> +		- "allwinner,sun50i-a64-de2-clk"
> +		- "allwinner,sun50i-h5-de2-clk"
> +
> +- reg: Must contain the registers base address and length
> +- clocks: phandle to the clocks feeding the display engine subsystem.
> +	  Three are needed:
> +  - "mod": the display engine module clock
> +  - "bus": the bus clock for the whole display engine subsystem
> +- clock-names: Must contain the clock names described just above
> +- resets: phandle to the reset control for the display engine subsystem.
> +- #clock-cells : must contain 1
> +- #reset-cells : must contain 1
> +
> +Example:
> +de2_clocks: clock@01000000 {

Drop the leading 0s. dtc in linux-next will now warn on this with W=1 
compile. Looks like sunxi has a lot of them. Please fix so we don't keep 
repeating this same copy-n-paste.

> +	compatible = "allwinner,sun50i-a64-de2-clk";
> +	reg = <0x01000000 0x100000>;
> +	clocks = <&ccu CLK_DE>,
> +		 <&ccu CLK_BUS_DE>;
> +	clock-names = "mod",
> +		      "bus";
> +	resets = <&ccu RST_BUS_DE>;
> +	#clock-cells = <1>;
> +	#reset-cells = <1>;
> +};
> -- 
> 2.12.0
> 
