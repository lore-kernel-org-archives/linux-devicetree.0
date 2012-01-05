From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCHv5 1/4] of: document common interrupt controller details
Date: Thu, 05 Jan 2012 08:06:49 -0600
Message-ID: <4F05AE79.6050108@gmail.com>
References: <1325726619-31796-1-git-send-email-jamie@jamieiles.com> <1325726619-31796-2-git-send-email-jamie@jamieiles.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1325726619-31796-2-git-send-email-jamie@jamieiles.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jamie Iles <jamie@jamieiles.com>
Cc: linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, grant.likely@secretlab.ca, linus.walleij@stericsson.com, broonie@opensource.wolfsonmicro.com, Rob Herring <rob.herring@calxeda.com>
List-Id: devicetree@vger.kernel.org

On 01/04/2012 07:23 PM, Jamie Iles wrote:
> It's common for interrupt controllers to need to encode interrupt
> trigger types and the Linux specific types seem common.  Document these
> in a centralized place so that they don't get reinvented each time a new
> controller is added.
> 
> Suggested-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
> Cc: Grant Likely <grant.likely@secretlab.ca>
> Cc: Rob Herring <rob.herring@calxeda.com>
> Signed-off-by: Jamie Iles <jamie@jamieiles.com>

I can take this if you want. Doesn't really matter as it is all going to
Grant anyway.

Acked-by: Rob Herring <rob.herring@calxeda.com>

Rob

> ---
>  Documentation/devicetree/bindings/arm/gic.txt    |    8 ++------
>  Documentation/devicetree/bindings/interrupts.txt |   17 +++++++++++++++++
>  2 files changed, 19 insertions(+), 6 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/interrupts.txt
> 
> diff --git a/Documentation/devicetree/bindings/arm/gic.txt b/Documentation/devicetree/bindings/arm/gic.txt
> index 52916b4..50f991f 100644
> --- a/Documentation/devicetree/bindings/arm/gic.txt
> +++ b/Documentation/devicetree/bindings/arm/gic.txt
> @@ -24,12 +24,8 @@ Main node required properties:
>    SPI interrupts are in the range [0-987].  PPI interrupts are in the
>    range [0-15].
>  
> -  The 3rd cell is the flags, encoded as follows:
> -	bits[3:0] trigger type and level flags.
> -		1 = low-to-high edge triggered
> -		2 = high-to-low edge triggered
> -		4 = active high level-sensitive
> -		8 = active low level-sensitive
> +  The 3rd cell is the flags, encoded as the trigger masks from
> +  Documentation/devicetree/bindings/interrupts.txt and:
>  	bits[15:8] PPI interrupt cpu mask.  Each bit corresponds to each of
>  	the 8 possible cpus attached to the GIC.  A bit set to '1' indicated
>  	the interrupt is wired to that CPU.  Only valid for PPI interrupts.
> diff --git a/Documentation/devicetree/bindings/interrupts.txt b/Documentation/devicetree/bindings/interrupts.txt
> new file mode 100644
> index 0000000..1545941
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupts.txt
> @@ -0,0 +1,17 @@
> +Common Interrupt Binding Details
> +
> +For controllers that need to encode trigger types and senses, where possible
> +it is encouraged to use the following encoding (a direct mapping of the
> +IRQF_TRIGGER_* constants in include/linux/interrupt.h):
> +
> +	bits[3:0] trigger type and level flags.
> +		1 = low-to-high edge triggered
> +		2 = high-to-low edge triggered
> +		4 = active high level-sensitive
> +		8 = active low level-sensitive
> +
> +For example, an interrupt may be encoded as (with #interrupt-cells = <2>):
> +
> +	interrupts = <4 0x3>;
> +
> +to have interrupt 4 raise an interrupt on both edges of the input.
