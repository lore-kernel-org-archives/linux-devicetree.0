From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH V3 1/4] dt-binding: irq: imx-irqsteer: use irq number
 instead of group number
Date: Mon, 11 Feb 2019 15:35:40 +0000
Message-ID: <8db40cd7-7695-0267-c626-26ebe086b2b8@arm.com>
References: <1548921464-28917-1-git-send-email-aisheng.dong@nxp.com>
 <1548921464-28917-2-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548921464-28917-2-git-send-email-aisheng.dong@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Aisheng Dong <aisheng.dong@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>
List-Id: devicetree@vger.kernel.org

On 31/01/2019 08:03, Aisheng Dong wrote:
> Not all 64 interrupts may be used in one group. e.g. most irqsteer in
> imx8qxp and imx8qm subsystems supports only 32 interrupts.
> 
> As the IP integration parameters are Channel number and interrupts number,
> let's use fsl,irqs-num to represents how many interrupts supported
> by this irqsteer channel.
> 
> Cc: Marc Zyngier <marc.zyngier@arm.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: devicetree@vger.kernel.org
> Reviewed-by: Lucas Stach <l.stach@pengutronix.de>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---
> ChangeLog:
>  v1->v2:
>   * change property name fsl,irqs-per-chan to fsl,num-irqs.
> ---
>  .../devicetree/bindings/interrupt-controller/fsl,irqsteer.txt       | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/fsl,irqsteer.txt b/Documentation/devicetree/bindings/interrupt-controller/fsl,irqsteer.txt
> index 45790ce..6d0a41b 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/fsl,irqsteer.txt
> +++ b/Documentation/devicetree/bindings/interrupt-controller/fsl,irqsteer.txt
> @@ -16,8 +16,8 @@ Required properties:
>  - #interrupt-cells: Specifies the number of cells needed to encode an
>    interrupt source. The value must be 1.
>  - fsl,channel: The output channel that all input IRQs should be steered into.
> -- fsl,irq-groups: Number of IRQ groups managed by this controller instance.
> -  Each group manages 64 input interrupts.
> +- fsl,num-irqs: Number of input interrupts of this channel.
> +  Should be multiple of 32 input interrupts and up to 512 interrupts.
>  
>  Example:
>  
> @@ -28,7 +28,7 @@ Example:
>  		clocks = <&clk IMX8MQ_CLK_DISP_APB_ROOT>;
>  		clock-names = "ipg";
>  		fsl,channel = <0>;
> -		fsl,irq-groups = <1>;
> +		fsl,num-irqs = <64>;
>  		interrupt-controller;
>  		#interrupt-cells = <1>;
>  	};
> 

This is a change to an existing binding, so I'd need the Ack from a DT
maintainer before I can queue this.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
