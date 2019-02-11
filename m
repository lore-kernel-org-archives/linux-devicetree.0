From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH V3 2/4] dt-bindings: irq: imx-irqsteer: add multi output
 interrupts support
Date: Mon, 11 Feb 2019 15:34:23 +0000
Message-ID: <23f5f2f0-79b8-b9f7-9f46-972966563596@arm.com>
References: <1548921464-28917-1-git-send-email-aisheng.dong@nxp.com>
 <1548921464-28917-3-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548921464-28917-3-git-send-email-aisheng.dong@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Aisheng Dong <aisheng.dong@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>
List-Id: devicetree@vger.kernel.org

On 31/01/2019 08:03, Aisheng Dong wrote:
> One irqsteer channel can support up to 8 output interrupts.
> 
> Cc: Marc Zyngier <marc.zyngier@arm.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---
> ChangeLog:
> v2->v3:
>  * fix a typo
> v1->v2:
>  * remove one unnecessary note.
> ---
>  .../devicetree/bindings/interrupt-controller/fsl,irqsteer.txt        | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/fsl,irqsteer.txt b/Documentation/devicetree/bindings/interrupt-controller/fsl,irqsteer.txt
> index 6d0a41b..582991c 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/fsl,irqsteer.txt
> +++ b/Documentation/devicetree/bindings/interrupt-controller/fsl,irqsteer.txt
> @@ -6,8 +6,9 @@ Required properties:
>  	- "fsl,imx8m-irqsteer"
>  	- "fsl,imx-irqsteer"
>  - reg: Physical base address and size of registers.
> -- interrupts: Should contain the parent interrupt line used to multiplex the
> -  input interrupts.
> +- interrupts: Should contain the up to 8 parent interrupt lines used to
> +  multiplex the input interrupts. They should be specified sequentially
> +  from output 0 to 7.
>  - clocks: Should contain one clock for entry in clock-names
>    see Documentation/devicetree/bindings/clock/clock-bindings.txt
>  - clock-names:
> 

I'd like an Ack from a DT person, as this is a change to an existing
binding.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
