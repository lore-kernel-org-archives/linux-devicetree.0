From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: reset: Add document for Broadcom STB
 reset controller
Date: Thu, 3 Jan 2019 11:41:17 -0600
Message-ID: <20190103174117.GA6613@bogus>
References: <20181221013409.14324-1-f.fainelli@gmail.com>
 <20181221013409.14324-2-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181221013409.14324-2-f.fainelli@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: p.zabel@pengutronix.de, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Brian Norris <computersforpeace@gmail.com>, Gregory Fong <gregory.0xf0@gmail.com>, "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, Dec 20, 2018 at 05:34:08PM -0800, Florian Fainelli wrote:
> Add a binding document for the Broadcom STB reset controller, also known
> as SW_INIT-style reset controller.
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
>  .../devicetree/bindings/reset/brcm,reset.txt  | 27 +++++++++++++++++++
>  1 file changed, 27 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/brcm,reset.txt
> 
> diff --git a/Documentation/devicetree/bindings/reset/brcm,reset.txt b/Documentation/devicetree/bindings/reset/brcm,reset.txt
> new file mode 100644
> index 000000000000..6e5341b4f891
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reset/brcm,reset.txt
> @@ -0,0 +1,27 @@
> +Broadcom STB SW_INIT-style reset controller
> +===========================================
> +
> +Broadcom STB SoCs have a SW_INIT-style reset controller with separate
> +SET/CLEAR/STATUS registers and possibly multiple banks, each of 32 bit
> +reset lines.
> +
> +Please also refer to reset.txt in this directory for common reset
> +controller binding usage.
> +
> +Required properties:
> +- compatible: should be brcm,brcmstb-reset
> +- reg: register base and length
> +- #reset-cells: must be set to 1
> +
> +Example:
> +
> +	reset: reset-controller@8404318 {
> +		compatible = "brcm,brcmstb-reset";
> +		reg = <0x8404318 0x30>;

Based on this address, should this be a sub-node of something else? Or 
not even a sub-node and just make the parent be a reset provider?

Rob
