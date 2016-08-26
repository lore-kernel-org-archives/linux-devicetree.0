From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH 24/26] dt-bindings: Document img,boston-clock binding
Date: Fri, 26 Aug 2016 10:44:46 -0700
Message-ID: <20160826174446.GX19826@codeaurora.org>
References: <20160826153725.11629-1-paul.burton@imgtec.com>
 <20160826153725.11629-25-paul.burton@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160826153725.11629-25-paul.burton@imgtec.com>
Sender: linux-clk-owner@vger.kernel.org
To: Paul Burton <paul.burton@imgtec.com>
Cc: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>, devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 08/26, Paul Burton wrote:
> diff --git a/Documentation/devicetree/bindings/clock/img,boston-clock.txt b/Documentation/devicetree/bindings/clock/img,boston-clock.txt
> new file mode 100644
> index 0000000..c01ea60
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/img,boston-clock.txt
> @@ -0,0 +1,27 @@
> +Binding for Imagination Technologies MIPS Boston clock sources.
> +
> +This binding uses the common clock binding[1].
> +
> +[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
> +
> +Required properties:
> +- compatible : Should be "img,boston-clock".
> +- #clock-cells : Should be set to 1.
> +  Values available for clock consumers can be found in the header file:
> +    <dt-bindings/clock/boston-clock.h>
> +- regmap : Phandle to the Boston platform register system controller.
> +  This should contain a phandle to the system controller node covering the
> +  platform registers provided by the Boston board.
> +
> +Example:
> +
> +	clk_boston: clock {
> +		compatible = "img,boston-clock";
> +		#clock-cells = <1>;
> +		regmap = <&plat_regs>;

Isn't syscon more standard than regmap as the property name? Is
there a binding for the plat_regs device? Is there any reason the
clks can't be populated in that syscon driver?

> +	};
> +
> +	uart0: uart@17ffe000 {
> +		/* ... */
> +		clocks = <&clk_boston BOSTON_CLK_SYS>;
> +	};

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
