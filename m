From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: timer: gpt: update binding doc
Date: Tue, 11 Dec 2018 15:35:04 -0600
Message-ID: <20181211213504.GA29643@bogus>
References: <1542963884-20823-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1542963884-20823-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>
Cc: "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, "tglx@linutronix.de" <tglx@linutronix.de>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 23, 2018 at 09:10:09AM +0000, Anson Huang wrote:
> The i.MX GPT timer driver binding doc is out of date,
> the "interrupts", "clocks" and "clock-names" do NOT match
> current GPT driver implementation, update it and use i.MX6SX
> as example.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
>  .../devicetree/bindings/timer/fsl,imxgpt.txt       | 22 +++++++++++++---------
>  1 file changed, 13 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/timer/fsl,imxgpt.txt b/Documentation/devicetree/bindings/timer/fsl,imxgpt.txt
> index 9809b11..4e9fa16 100644
> --- a/Documentation/devicetree/bindings/timer/fsl,imxgpt.txt
> +++ b/Documentation/devicetree/bindings/timer/fsl,imxgpt.txt
> @@ -2,17 +2,21 @@ Freescale i.MX General Purpose Timer (GPT)
>  
>  Required properties:
>  
> -- compatible : should be "fsl,<soc>-gpt"
> -- reg : Specifies base physical address and size of the registers.
> -- interrupts : A list of 4 interrupts; one per timer channel.
> -- clocks : The clocks provided by the SoC to drive the timer.
> +- compatible : should be "fsl,<soc>-gpt".

This should enumerate valid <soc> values.

> +- reg : specifies base physical address and size of the registers.
> +- interrupts : should be the clock event device interrupt.
> +- clocks : the clocks provided by the SoC to drive the timer, must contain
> +           an entry for each entry in clock-names.
> +- clock-names : must include an "per" or "osc_per" entry, and "ipg" entry
> +                is optional according to SoC design.

Need to define the order. Ideally the optional clock should be last, but 
that's not what the example has.

>  
>  Example:
>  
> -gpt1: timer@10003000 {
> -	compatible = "fsl,imx27-gpt", "fsl,imx1-gpt";
> -	reg = <0x10003000 0x1000>;
> -	interrupts = <26>;
> -	clocks = <&clks 46>, <&clks 61>;
> +gpt: gpt@2098000 {

timer@...

> +	compatible = "fsl,imx6sx-gpt", "fsl,imx31-gpt";

You haven't documented "fsl,imx31-gpt" is a valid fallback. Is the old 
example not still valid for imx27?

> +	reg = <0x02098000 0x4000>;

Using a size > 4KB just wastes virtual space which is valuable on 32-bit 
systems with >= 1GB RAM.

> +	interrupts = <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>;
> +	clocks = <&clks IMX6SX_CLK_GPT_BUS>,
> +		 <&clks IMX6SX_CLK_GPT_3M>;
>  	clock-names = "ipg", "per";
>  };
> -- 
> 2.7.4
> 
