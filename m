From: Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
Subject: Re: [PATCH 6/9] sunxi-cedrus: Add device tree binding document
Date: Fri, 9 Mar 2018 15:38:57 +0200
Message-ID: <20180309133857.GA20392@solar>
References: <20180309100933.15922-3-paul.kocialkowski@bootlin.com>
 <20180309101445.16190-4-paul.kocialkowski@bootlin.com>
Reply-To: plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDB4J47M7YERB5M4RLKQKGQEQPBEGEA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20180309101445.16190-4-paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Paul Kocialkowski <paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>, Florent Revest <revestflo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <acourbot-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Thomas van Kleef <thomas-XCRq7eEM0/pmR6Xm/wNWPw@public.gmane.org>, "Signed-off-by : Bob Ham" <rah-2mWpNWY8JZLk1uMJSBkQmQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 09, 2018 at 11:14:42AM +0100, Paul Kocialkowski wrote:
> From: Florent Revest <florent.revest-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> 
> Device Tree bindings for the Allwinner's video engine
> 
> Signed-off-by: Florent Revest <florent.revest-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  .../devicetree/bindings/media/sunxi-cedrus.txt     | 44 ++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/sunxi-cedrus.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/sunxi-cedrus.txt b/Documentation/devicetree/bindings/media/sunxi-cedrus.txt
> new file mode 100644
> index 000000000000..138581113c49
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/sunxi-cedrus.txt
> @@ -0,0 +1,44 @@
> +Device-Tree bindings for SUNXI video engine found in sunXi SoC family
> +
> +Required properties:
> +- compatible	    : "allwinner,sun4i-a10-video-engine";
> +- memory-region     : DMA pool for buffers allocation;
> +- clocks	    : list of clock specifiers, corresponding to
> +		      entries in clock-names property;
> +- clock-names	    : should contain "ahb", "mod" and "ram" entries;
> +- resets	    : phandle for reset;
> +- interrupts	    : should contain VE interrupt number;
> +- reg		    : should contain register base and length of VE.
> +
> +Example:
> +
> +reserved-memory {
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +	ranges;
> +
> +	ve_reserved: cma {
> +		compatible = "shared-dma-pool";
> +		reg = <0x43d00000 0x9000000>;
> +		no-map;
> +		linux,cma-default;
> +	};
> +};
> +
> +video-engine {
> +	compatible = "allwinner,sun4i-a10-video-engine";
> +	memory-region = <&ve_reserved>;
> +
> +	clocks = <&ahb_gates 32>, <&ccu CLK_VE>,
> +		 <&dram_gates 0>;

This should be updated to sunxi-ng clocks:

clocks = <&ccu CLK_BUS_VE>, <&ccu CLK_VE>, <&ccu CLK_DRAM_VE>;

> +	clock-names = "ahb", "mod", "ram";
> +
> +	assigned-clocks = <&ccu CLK_VE>;
> +	assigned-clock-rates = <320000000>;
> +
> +	resets = <&ccu RST_VE>;
> +
> +	interrupts = <53>;
> +
> +	reg = <0x01c0e000 4096>;
> +};
> -- 
> 2.16.2
> 
> -- 
> You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
> For more options, visit https://groups.google.com/d/optout.
