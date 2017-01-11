From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [PATCH 1/2] clk: vc5: Add bindings for IDT VersaClock 5P49V5923 and 5P49V5933
Date: Wed, 11 Jan 2017 18:33:35 +0200
Message-ID: <3509171.4UDVg95MWF@avalon>
References: <20170111161603.18905-1-marek.vasut@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170111161603.18905-1-marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Laurent Pinchart <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Marek,

Thank you for the patch.

On Wednesday 11 Jan 2017 17:16:02 Marek Vasut wrote:
> Add bindings for IDT VersaClock 5 5P49V5923 and 5P49V5933 chips.
> These are I2C clock generators with optional clock source from
> either XTal or dedicated clock generator and, depending on the
> model, two or more clock outputs.
> 
> Signed-off-by: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> Cc: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> Cc: Laurent Pinchart <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
> Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Reviewed-by: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>

> ---
>  .../devicetree/bindings/clock/idt,versaclock5.txt  | 43 +++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644
> Documentation/devicetree/bindings/clock/idt,versaclock5.txt
> 
> diff --git a/Documentation/devicetree/bindings/clock/idt,versaclock5.txt
> b/Documentation/devicetree/bindings/clock/idt,versaclock5.txt new file mode
> 100644
> index 000000000000..82ebed9a8a15
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/idt,versaclock5.txt
> @@ -0,0 +1,43 @@
> +Binding for IDT VersaClock5 programmable i2c clock generator.
> +
> +The IDT VersaClock5 are programmable i2c clock generators providing
> +from 3 to 12 output clocks.
> +
> +==I2C device node==
> +
> +Required properties:
> +- compatible:	shall be one of "idt,5p49v5923" , "idt,5p49v5933".
> +- reg:		i2c device address, shall be 0x68 or 0x6a.
> +- #clock-cells:	from common clock binding; shall be set to 1.
> +- clocks:	from common clock binding; list of parent clock handles,
> +		- 5p49v5923: (required) either or both of XTAL or CLKIN
> +					reference clock.
> +		- 5p49v5933: (optional) property not present (internal
> +					Xtal used) or CLKIN reference
> +					clock.
> +- clock-names:	from common clock binding; clock input names, can be
> +		- 5p49v5923: (required) either or both of "xin", "clkin".
> +		- 5p49v5933: (optional) property not present or "clkin".
> +
> +==Example==
> +
> +/* 25MHz reference crystal */
> +ref25: ref25m {
> +	compatible = "fixed-clock";
> +	#clock-cells = <0>;
> +	clock-frequency = <25000000>;
> +};
> +
> +i2c-master-node {
> +
> +	/* IDT 5P49V5923 i2c clock generator */
> +	vc5: clock-generator@6a {
> +		compatible = "idt,5p49v5923";
> +		reg = <0x6a>;
> +		#clock-cells = <1>;
> +
> +		/* Connect XIN input to 25MHz reference */
> +		clocks = <&ref25m>;
> +		clock-names = "xin";
> +	};
> +};

-- 
Regards,

Laurent Pinchart

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
