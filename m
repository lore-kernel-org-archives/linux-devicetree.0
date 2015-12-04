From: Jonas Gorski <jogo@openwrt.org>
Subject: Re: [PATCH 1/3] mtd: brcmnand: Add brcm,bcm6368-nand device tree binding
Date: Fri, 4 Dec 2015 17:04:06 +0100
Message-ID: <CAOiHx=kLrJPfvQUjNiEmvAMVj8v37RMFqaMp=tqzAVe22q+9fQ@mail.gmail.com>
References: <565F81A6.6060307@simon.arlott.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <565F81A6.6060307@simon.arlott.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Simon Arlott <simon@fire.lp0.eu>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Brian Norris <computersforpeace@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Woodhouse <dwmw2@infradead.org>, MTD Maling List <linux-mtd@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Florian Fainelli <f.fainelli@gmail.com>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, Kamal Dasu <kdasu.kdev@gmail.com>
List-Id: devicetree@vger.kernel.org

On Thu, Dec 3, 2015 at 12:41 AM, Simon Arlott <simon@fire.lp0.eu> wrote:
> Add device tree binding for NAND on the BCM6368.
>
> The BCM6368 has a NAND interrupt register with combined status and enable
> registers. It also requires a clock, so add an optional clock to the
> common brcmnand binding.
>
> Signed-off-by: Simon Arlott <simon@fire.lp0.eu>
> ---
> Renamed from BCM63268, made clock a generic property.
>
>  .../devicetree/bindings/mtd/brcm,brcmnand.txt      | 32 ++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
> index 4ff7128..16d7835 100644
> --- a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
> +++ b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
> @@ -45,6 +45,8 @@ Required properties:
>  - #size-cells      : <0>
>
>  Optional properties:
> +- clock                     : reference to the clock for the NAND controller
> +- clock-names               : "nand" (required for the above clock)
>  - brcm,nand-has-wp          : Some versions of this IP include a write-protect
>                                (WP) control bit. It is always available on >=
>                                v7.0. Use this property to describe the rare
> @@ -72,6 +74,12 @@ we define additional 'compatible' properties and associated register resources w
>         and enable registers
>       - reg-names: (required) "nand-int-base"
>
> +   * "brcm,nand-bcm6368"
> +     - compatible: should contain "brcm,nand-bcm<soc>", "brcm,nand-bcm6368"
> +     - reg: (required) the 'NAND_INTR_BASE' register range, with combined status
> +       and enable registers, and boot address registers
> +     - reg-names: (required) "nand-intr-base"

Can't we use the same name as bcm63138, i.e. nand-int-base?

> +
>     * "brcm,nand-iproc"
>       - reg: (required) the "IDM" register range, for interrupt enable and APB
>         bus access endianness configuration, and the "EXT" register range,
> @@ -148,3 +156,27 @@ nand@f0442800 {
>                 };
>         };
>  };
> +
> +nand@10000200 {
> +       compatible = "brcm,nand-bcm63168", "brcm,nand-bcm6368",
> +               "brcm,brcmnand-v4.0", "brcm,brcmnand";

I know it's now much too late, but this is IMHO a very odd way of
defining that this is a v4 nand, but uses bcm6368 compatible
interrupts, as bcm6368 is a much older, unsupported nand revision.


Jonas
