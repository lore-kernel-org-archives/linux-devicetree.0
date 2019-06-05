From: Eduardo Valentin <eduval@amazon.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: interrupt-controller: Amazon's
 Annapurna Labs FIC
Date: Wed, 5 Jun 2019 08:49:55 -0700
Message-ID: <20190605154955.GD1534@u40b0340c692b58f6553c.ant.amazon.com>
References: <1559731921-14023-1-git-send-email-talel@amazon.com>
 <1559731921-14023-2-git-send-email-talel@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1559731921-14023-2-git-send-email-talel@amazon.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Talel Shenhar <talel@amazon.com>
Cc: nicolas.ferre@microchip.com, jason@lakedaemon.net, marc.zyngier@arm.com, mark.rutland@arm.com, mchehab+samsung@kernel.org, robh+dt@kernel.org, davem@davemloft.net, shawn.lin@rock-chips.com, tglx@linutronix.de, devicetree@vger.kernel.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, dwmw@amazon.co.uk, benh@kernel.crashing.org, jonnyc@amazon.com, hhhawa@amazon.com, ronenk@amazon.com, hanochu@amazon.com, barakw@amazon.com
List-Id: devicetree@vger.kernel.org

On Wed, Jun 05, 2019 at 01:52:00PM +0300, Talel Shenhar wrote:
> Document Amazon's Annapurna Labs Fabric Interrupt Controller SoC binding.
> 
> Signed-off-by: Talel Shenhar <talel@amazon.com>
> ---
>  .../interrupt-controller/amazon,al-fic.txt         | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/amazon,al-fic.txt
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/amazon,al-fic.txt b/Documentation/devicetree/bindings/interrupt-controller/amazon,al-fic.txt
> new file mode 100644
> index 0000000..a2f31a6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/amazon,al-fic.txt
> @@ -0,0 +1,22 @@
> +Amazon's Annapurna Labs Fabric Interrupt Controller
> +
> +Required properties:
> +
> +- compatible: should be "amazon,al-fic"
> +- reg: physical base address and size of the registers
> +- interrupt-controller: identifies the node as an interrupt controller
> +- #interrupt-cells: must be 2.

It would be great if you describe what the 2 numbers must represent here..

> +- interrupt-parent: specifies the parent interrupt controller.
> +- interrupts: describes which input line in the interrupt parent, this
> +  fic's output is connected to.
> +
> +Example:
> +
> +amazon_fic: amazon_fic {
> +	compatible = "amazon,al-fic";
> +	interrupt-controller;
> +	#interrupt-cells = <1>;
> +	reg = <0x0 0xfd8a8500 0x0 0x1000>;
> +	interrupt-parent = <&gic>;
> +	interrupts = <GIC_SPI 0x0 IRQ_TYPE_LEVEL_HIGH>;
> +};
> -- 
> 2.7.4
> 

-- 
All the best,
Eduardo Valentin
