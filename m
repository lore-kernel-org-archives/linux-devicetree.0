From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH linux-next (v3) 1/2] reset: Add brcm,bcm6345-reset device
 tree binding
Date: Fri, 11 Dec 2015 00:36:46 +0300
Message-ID: <5669F06E.3060506@cogentembedded.com>
References: <5669EE86.8030406@simon.arlott.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5669EE86.8030406@simon.arlott.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Simon Arlott <simon@fire.lp0.eu>, Philipp Zabel <p.zabel@pengutronix.de>, Kevin Cernekee <cernekee@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: linux-kernel@vger.kernel.org, MIPS Mailing List <linux-mips@linux-mips.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Jonas Gorski <jogo@openwrt.org>
List-Id: devicetree@vger.kernel.org

Hello.

On 12/11/2015 12:28 AM, Simon Arlott wrote:

> Add device tree binding for the BCM6345 soft reset controller.
>
> The BCM6345 contains a soft-reset controller activated by setting
> a bit (that must previously have been cleared).
>
> Signed-off-by: Simon Arlott <simon@fire.lp0.eu>
> ---
> v3: Resend. Example has changed because usbh now has two compatible
>      strings and uses a power domain instead of a regulator.
>
> v2: Renamed to bcm6345, removed "mask" property.
>      Acked-by: Rob Herring <robh@kernel.org>
>
>   .../bindings/reset/brcm,bcm6345-reset.txt          | 33 ++++++++++++++++++++++
>   1 file changed, 33 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/reset/brcm,bcm6345-reset.txt
>
> diff --git a/Documentation/devicetree/bindings/reset/brcm,bcm6345-reset.txt b/Documentation/devicetree/bindings/reset/brcm,bcm6345-reset.txt
> new file mode 100644
> index 0000000..0313040
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reset/brcm,bcm6345-reset.txt
> @@ -0,0 +1,33 @@
> +Broadcom BCM6345 reset controller
> +
> +The BCM6345 contains a basic soft reset controller in the perf register
> +set which resets components using a bit in a register.
> +
> +Please also refer to reset.txt in this directory for common reset
> +controller binding usage.
> +
> +Required properties:
> +- compatible:	Should be "brcm,bcm<soc>-reset", "brcm,bcm6345-reset"
> +- regmap:	The register map phandle
> +- offset:	Offset in the register map for the reset register (in bytes)
> +- #reset-cells:	Must be set to 1
> +
> +Example:
> +
> +periph_soft_rst: reset-controller {
> +	compatible = "brcm,bcm63168-reset", "brcm,bcm6345-reset";
> +	regmap = <&periph_cntl>;
> +	offset = <0x10>;
> +
> +	#reset-cells = <1>;
> +};
> +
> +usbh: usbphy@10002700 {

    "usb-phy" please to be more in line with ePAPR standardized "ethernet-phy" 
node name.

[...]

MBR, Sergei
