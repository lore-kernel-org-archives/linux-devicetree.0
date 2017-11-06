From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V3 02/11] dt-bindings: Add Spreadtrum clock binding
 documentation
Date: Mon, 6 Nov 2017 11:15:19 -0600
Message-ID: <20171106171519.xomnca72adqtzm2n@rob-hp-laptop>
References: <20171102065626.21835-1-chunyan.zhang@spreadtrum.com>
 <20171102065626.21835-3-chunyan.zhang@spreadtrum.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171102065626.21835-3-chunyan.zhang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chunyan Zhang <chunyan.zhang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
Cc: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Xiaolong Zhang <xiaolong.zhang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>, Ben Li <ben.li-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Orson Zhai <orson.zhai-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>, Chunyan Zhang <zhang.lyra-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 02, 2017 at 02:56:17PM +0800, Chunyan Zhang wrote:
> Introduce a new binding with its documentation for Spreadtrum clock
> sub-framework.
> 
> Signed-off-by: Chunyan Zhang <chunyan.zhang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/clock/sprd.txt | 55 ++++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/sprd.txt
> 
> diff --git a/Documentation/devicetree/bindings/clock/sprd.txt b/Documentation/devicetree/bindings/clock/sprd.txt
> new file mode 100644
> index 0000000..5c09529
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/sprd.txt
> @@ -0,0 +1,55 @@
> +Spreadtrum Clock Binding
> +------------------------
> +
> +Required properties:
> +- compatible: should contain the following compatible strings:
> +	- "sprd,sc9860-pmu-gate"
> +	- "sprd,sc9860-pll"
> +	- "sprd,sc9860-ap-clk"
> +	- "sprd,sc9860-aon-prediv"
> +	- "sprd,sc9860-apahb-gate"
> +	- "sprd,sc9860-aon-gate"
> +	- "sprd,sc9860-aonsecure-clk"
> +	- "sprd,sc9860-agcp-gate"
> +	- "sprd,sc9860-gpu-clk"
> +	- "sprd,sc9860-vsp-clk"
> +	- "sprd,sc9860-vsp-gate"
> +	- "sprd,sc9860-cam-clk"
> +	- "sprd,sc9860-cam-gate"
> +	- "sprd,sc9860-disp-clk"
> +	- "sprd,sc9860-disp-gate"
> +	- "sprd,sc9860-apapb-gate"
> +
> +- #clock-cells: must be 1
> +
> +- clocks : shall be the input parent clock(s) phandle for the clock.

You need to document how many clocks for each block.

> +
> +Optional properties:
> +
> +- reg:	Contain the registers base address and length. It must be configured only if no 'sprd,syscon' under the node.
> +
> +- sprd,syscon: phandle to the syscon which is in the same address area with the clock.
> +
> +Example:
> +
> +	pmu_gate: pmu-gate {
> +		compatible = "sprd,sc9860-pmu-gate";
> +		sprd,syscon = <&pmu_apb>;

Ideally, the pmu-gate node would be a child of pmu_apb and use the reg 
property if clock registers are a contiguous range. Then you don't need 
this phandle.

> +		clocks = <&ext_26m>;
> +		#clock-cells = <1>;
> +	};
> +
> +	pll: pll {
> +		compatible = "sprd,sc9860-pll";
> +		sprd,syscon = <&ana_apb>;

Same here.

> +		clocks = <&pmu_gate 0>;
> +		#clock-cells = <1>;
> +	};
> +
> +	ap_clk: clock-controller@20000000 {
> +		compatible = "sprd,sc9860-ap-clk";
> +		reg = <0 0x20000000 0 0x400>;
> +		clocks = <&ext_26m>, <&pll 0>,
> +			 <&pmu_gate 0>;
> +		#clock-cells = <1>;
> +	};
> -- 
> 2.7.4
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
