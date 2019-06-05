From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: interrupt-controller: Amazon's
 Annapurna Labs FIC
Date: Thu, 06 Jun 2019 08:04:06 +1000
Message-ID: <3f29edea9d7989152cec218df1c99db4830267b0.camel@kernel.crashing.org>
References: <1559746758-20208-1-git-send-email-talel@amazon.com>
         <1559746758-20208-2-git-send-email-talel@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1559746758-20208-2-git-send-email-talel@amazon.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Talel Shenhar <talel@amazon.com>, nicolas.ferre@microchip.com, jason@lakedaemon.net, marc.zyngier@arm.com, mark.rutland@arm.com, mchehab+samsung@kernel.org, robh+dt@kernel.org, davem@davemloft.net, shawn.lin@rock-chips.com, tglx@linutronix.de, devicetree@vger.kernel.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org
Cc: dwmw@amazon.co.uk, jonnyc@amazon.com, hhhawa@amazon.com, ronenk@amazon.com, hanochu@amazon.com, barakw@amazon.com
List-Id: devicetree@vger.kernel.org

On Wed, 2019-06-05 at 17:59 +0300, Talel Shenhar wrote:
> 

 ../..

> +- compatible: should be "amazon,al-fic"
> +- reg: physical base address and size of the registers
> +- interrupt-controller: identifies the node as an interrupt controller
> +- #interrupt-cells: must be 2.
> +- interrupt-parent: specifies the parent interrupt controller.
> +- interrupts: describes which input line in the interrupt parent, this
> +  fic's output is connected to.
> +
> +Example:
> +
> +amazon_fic: interrupt-controller@0xfd8a8500 {
> +	compatible = "amazon,al-fic";
> +	interrupt-controller;
> +	#interrupt-cells = <1>;
                            ^ should be 2

> +	reg = <0x0 0xfd8a8500 0x0 0x1000>;
> +	interrupt-parent = <&gic>;
> +	interrupts = <GIC_SPI 0x0 IRQ_TYPE_LEVEL_HIGH>;
> +};
