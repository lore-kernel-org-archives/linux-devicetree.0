From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] clk: add device tree binding for artpec-6 pll1 clock
Date: Fri, 12 Feb 2016 10:39:16 -0600
Message-ID: <20160212163916.GA7677@rob-hp-laptop>
References: <cover.1455206007.git.larper@axis.com>
 <2686b3bbb9ec1c86828b365645bd7f997a9780b4.1455206007.git.larper@axis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <2686b3bbb9ec1c86828b365645bd7f997a9780b4.1455206007.git.larper-VrBV9hrLPhE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lars Persson <lars.persson-VrBV9hrLPhE@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lars Persson <larper-VrBV9hrLPhE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 11, 2016 at 05:01:03PM +0100, Lars Persson wrote:
> Add device tree documentation for the main PLL in the Artpec-6 SoC.

Roughly how many clocks does this SoC have?

> 
> Signed-off-by: Lars Persson <larper-VrBV9hrLPhE@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/clock/artpec6.txt | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/artpec6.txt
> 
> diff --git a/Documentation/devicetree/bindings/clock/artpec6.txt b/Documentation/devicetree/bindings/clock/artpec6.txt
> new file mode 100644
> index 0000000..521fec8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/artpec6.txt
> @@ -0,0 +1,16 @@
> +* Clock bindings for Axis ARTPEC-6 chip
> +
> +Required properties:
> +- #clock-cells: Should be <0>
> +- compatible: Should be "axis,artpec6-pll1-clock"
> +- reg: Address and length of the DEVSTAT register.
> +- clocks: The PLL's input clock.
> +
> +Examples:
> +
> +pll1_clk: pll1_clk {
> +	#clock-cells = <0>;
> +	compatible = "axis,artpec6-pll1-clock";
> +	reg = <0xf8000000 4>;
> +	clocks = <&ext_clk>;
> +};
> -- 
> 2.1.4
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
