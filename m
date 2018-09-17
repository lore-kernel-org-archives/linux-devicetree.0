From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V5 2/3] dt-bindings: interrupt-controller: C-SKY APB intc
Date: Mon, 17 Sep 2018 02:23:36 -0400
Message-ID: <20180917062336.GA20555@bogus>
References: <a70337117db84f6e1091d0b3fc28acb691ac9b35.1537087118.git.ren_guo@c-sky.com>
 <162f7f98697cd9d806a1a843c6177bb943ea2b33.1537087118.git.ren_guo@c-sky.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <162f7f98697cd9d806a1a843c6177bb943ea2b33.1537087118.git.ren_guo@c-sky.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Guo Ren <ren_guo@c-sky.com>
Cc: tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, mark.rutland@arm.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sun, Sep 16, 2018 at 04:50:03PM +0800, Guo Ren wrote:
> Signed-off-by: Guo Ren <ren_guo@c-sky.com>

Needs a commit description.

> ---
>  .../interrupt-controller/csky,apb-intc.txt         | 70 ++++++++++++++++++++++
>  1 file changed, 70 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/csky,apb-intc.txt
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/csky,apb-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/csky,apb-intc.txt
> new file mode 100644
> index 0000000..be7c3d1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/csky,apb-intc.txt
> @@ -0,0 +1,70 @@
> +==============================
> +C-SKY APB Interrupt Controller
> +==============================
> +
> +C-SKY APB Interrupt Controller is a simple soc interrupt controller
> +on the apb bus and we only use it as root irq controller.
> +
> + - csky,apb-intc is used in a lot of csky fpgas and socs, it support 64 irq nums.
> + - csky,dual-apb-intc consists of 2 apb-intc and 128 irq nums supported.
> + - csky,gx6605s-intc is gx6605s soc internal irq interrupt controller, 64 irq nums.

Is there a relationship between csky,gx6605s-intc and csky,apb-intc?

> +
> +=============================
> +intc node bindings definition
> +=============================
> +
> +        Description: Describes APB interrupt controller
> +
> +        PROPERTIES
> +
> +        - compatible
> +                Usage: required
> +                Value type: <string>
> +                Definition: must be "csky,apb-intc"
> +				    "csky,dual-apb-intc"
> +				    "csky,gx6605s-intc"
> +        - #interrupt-cells
> +                Usage: required
> +                Value type: <u32>
> +                Definition: must be <1>
> +	- reg
> +		Usage: required
> +		Value type: <u32 u32>
> +                Definition: <phyaddr size> in soc from cpu view
> +        - interrupt-controller:
> +                Usage: required
> +        - support-pulse-signal:
> +                Usage: select
> +		Description: to support pulse signal flag

What is this for?

> +
> +Examples:
> +---------
> +
> +	intc: interrupt-controller@500000 {
> +		compatible = "csky,apb-intc";
> +		#interrupt-cells = <1>;
> +		reg = <0x00500000 0x400>;
> +		interrupt-controller;
> +	};
> +
> +	intc: interrupt-controller@500000 {
> +		compatible = "csky,apb-intc";
> +		#interrupt-cells = <1>;
> +		reg = <0x00500000 0x400>;
> +		interrupt-controller;
> +		support-pulse-signal;
> +	};

Not really worth 2 examples for just 1 property difference.

> +
> +	intc: interrupt-controller@500000 {
> +		compatible = "csky,dual-apb-intc";
> +		#interrupt-cells = <1>;
> +		reg = <0x00500000 0x400>;
> +		interrupt-controller;
> +	};
> +
> +	intc: interrupt-controller@500000 {
> +		compatible = "csky,gx6605s-intc";
> +		#interrupt-cells = <1>;
> +		reg = <0x00500000 0x400>;
> +		interrupt-controller;
> +	};
> -- 
> 2.7.4
> 
