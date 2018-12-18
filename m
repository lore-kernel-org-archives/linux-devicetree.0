From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V2] dt-bindings: timer: gpt: update binding doc
Date: Tue, 18 Dec 2018 11:11:50 -0600
Message-ID: <20181218171150.GA21403@bogus>
References: <1544598889-2995-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1544598889-2995-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>
Cc: "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, "tglx@linutronix.de" <tglx@linutronix.de>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On Wed, Dec 12, 2018 at 07:20:44AM +0000, Anson Huang wrote:
> The i.MX GPT timer driver binding doc is out of date,
> update it according to current GPT timer driver.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
>  .../devicetree/bindings/timer/fsl,imxgpt.txt       | 28 +++++++++++++++++-----
>  1 file changed, 22 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/timer/fsl,imxgpt.txt b/Documentation/devicetree/bindings/timer/fsl,imxgpt.txt
> index 9809b11..2ed84ad 100644
> --- a/Documentation/devicetree/bindings/timer/fsl,imxgpt.txt
> +++ b/Documentation/devicetree/bindings/timer/fsl,imxgpt.txt
> @@ -2,17 +2,33 @@ Freescale i.MX General Purpose Timer (GPT)
>  
>  Required properties:
>  
> -- compatible : should be "fsl,<soc>-gpt"
> -- reg : Specifies base physical address and size of the registers.
> -- interrupts : A list of 4 interrupts; one per timer channel.
> -- clocks : The clocks provided by the SoC to drive the timer.
> +- compatible : must be one of following:
> +  - "fsl,imx1-gpt",
> +  - "fsl,imx21-gpt",
> +  - "fsl,imx27-gpt",
> +  - "fsl,imx31-gpt",
> +  - "fsl,imx25-gpt",
> +  - "fsl,imx50-gpt",
> +  - "fsl,imx51-gpt",
> +  - "fsl,imx53-gpt",
> +  - "fsl,imx6q-gpt",
> +  - "fsl,imx6dl-gpt",
> +  - "fsl,imx6sl-gpt",
> +  - "fsl,imx6sx-gpt".

You need to list fall-backs here. IOW, what are the valid combinations?

> +- reg : specifies base physical address and size of the registers.
> +- interrupts : should be the clock event device interrupt.

'clock event' is a Linux thing and shouldn't be part of the binding.

What happened to the 4 interrupts?

> +- clocks : the clocks provided by the SoC to drive the timer, must contain
> +           an entry for each entry in clock-names.
> +- clock-names : must include "ipg" entry first, then "per" entry, "osc_per"
> +                can be a substitute of "per" entry on some SoCs.

per or osc_per should be deprecated so only one is used going forward.

>  
>  Example:
>  
>  gpt1: timer@10003000 {
> -	compatible = "fsl,imx27-gpt", "fsl,imx1-gpt";
> +	compatible = "fsl,imx27-gpt", "fsl,imx21-gpt";
>  	reg = <0x10003000 0x1000>;
>  	interrupts = <26>;
> -	clocks = <&clks 46>, <&clks 61>;
> +	clocks = <&clks IMX27_CLK_GPT1_IPG_GATE>,
> +		 <&clks IMX27_CLK_PER1_GATE>;
>  	clock-names = "ipg", "per";
>  };
> -- 
> 2.7.4
> 
