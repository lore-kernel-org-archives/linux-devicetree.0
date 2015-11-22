From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] mtd: brcmnand: Add brcm,nand-bcm63268 device tree
 binding
Date: Sun, 22 Nov 2015 15:59:45 -0600
Message-ID: <20151122215945.GA5930@rob-hp-laptop>
References: <56506D55.3000907@simon.arlott.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <56506D55.3000907@simon.arlott.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Simon Arlott <simon@fire.lp0.eu>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Brian Norris <computersforpeace@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Florian Fainelli <f.fainelli@gmail.com>
List-Id: devicetree@vger.kernel.org

On Sat, Nov 21, 2015 at 01:10:45PM +0000, Simon Arlott wrote:
> Add device tree binding for NAND on the BCM63268.
> 
> The BCM63268 has a NAND interrupt register with combined status and enable
> registers.
> 
> Signed-off-by: Simon Arlott <simon@fire.lp0.eu>
> ---
>  .../devicetree/bindings/mtd/brcm,brcmnand.txt      | 33 ++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
> index 4ff7128..45c6e0c 100644
> --- a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
> +++ b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
> @@ -72,6 +72,13 @@ we define additional 'compatible' properties and associated register resources w
>         and enable registers
>       - reg-names: (required) "nand-int-base"
>  
> +   * "brcm,nand-bcm63268"
> +     - compatible: should contain "brcm,nand-bcm<soc>", "brcm,nand-bcm63268"

vendor,<soc>-device is preferred.
