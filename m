From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: soc: al-pos: Amazon's Annapurna Labs
 POS
Date: Wed, 18 Sep 2019 08:32:48 -0500
Message-ID: <20190918133248.GA16653@bogus>
References: <1568142310-17622-1-git-send-email-talel@amazon.com>
 <1568142310-17622-2-git-send-email-talel@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1568142310-17622-2-git-send-email-talel@amazon.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Talel Shenhar <talel@amazon.com>
Cc: marc.zyngier@arm.com, tglx@linutronix.de, jason@lakedaemon.net, mark.rutland@arm.com, nicolas.ferre@microchip.com, mchehab+samsung@kernel.org, shawn.lin@rock-chips.com, gregkh@linuxfoundation.org, dwmw@amazon.co.uk, benh@kernel.crashing.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Sep 10, 2019 at 10:05:08PM +0300, Talel Shenhar wrote:
> Document Amazon's Annapurna Labs POS SoC binding.
> 
> Signed-off-by: Talel Shenhar <talel@amazon.com>
> ---
>  .../devicetree/bindings/soc/amazon/amazon,al-pos.txt   | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/amazon/amazon,al-pos.txt

Please convert to DT schema.

> 
> diff --git a/Documentation/devicetree/bindings/soc/amazon/amazon,al-pos.txt b/Documentation/devicetree/bindings/soc/amazon/amazon,al-pos.txt
> new file mode 100644
> index 00000000..035cc571
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/amazon/amazon,al-pos.txt
> @@ -0,0 +1,18 @@
> +Amazon's Annapurna Labs POS
> +
> +POS node is defined to describe the Point Of Serialization (POS) logger
> +unit.
> +
> +Required properties:
> +- compatible:	Shall be "amazon,al-pos".
> +- reg:		POS logger resources.
> +- interrupts:	should contain the interrupt for pos error event.
> +
> +Example:
> +
> +al_pos {

Needs a unit-address.

> +	compatible = "amazon,al-pos";
> +	reg = <0x0 0xf0070084 0x0 0x00000008>;
> +	interrupt-parent = <&amazon_system_fabric>;
> +	interrupts = <24 IRQ_TYPE_LEVEL_HIGH>;
> +};
> -- 
> 2.7.4
> 
