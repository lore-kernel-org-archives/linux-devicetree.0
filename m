From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 4/5] dt-bindings: Document MIPS Broadcom STB power
 management nodes
Date: Fri, 23 Jun 2017 15:02:29 -0500
Message-ID: <20170623200229.p6pp4g2hvkei4doj@rob-hp-laptop>
References: <20170616213703.21487-1-f.fainelli@gmail.com>
 <20170616213703.21487-5-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170616213703.21487-5-f.fainelli@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-arm-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Brian Norris <computersforpeace@gmail.com>, Gregory Fong <gregory.0xf0@gmail.com>, "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, Hauke Mehrtens <hauke@hauke-m.de>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, Markus Mayer <mmayer@broadcom.com>, Arnd Bergmann <arnd@arndb.de>, Eric Anholt <eric@anholt.net>, Justin Chen <justinpopo6@gmail.com>, Doug Berger <opendmb@gmail.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 16, 2017 at 02:37:02PM -0700, Florian Fainelli wrote:
> Document the different nodes required for supporting S2/S3/S5 suspend
> states on MIPS-based Broadcom STB SoCs.
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
>  .../devicetree/bindings/mips/brcm/soc.txt          | 77 ++++++++++++++++++++++
>  1 file changed, 77 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mips/brcm/soc.txt b/Documentation/devicetree/bindings/mips/brcm/soc.txt
> index e4e1cd91fb1f..f7413168d938 100644
> --- a/Documentation/devicetree/bindings/mips/brcm/soc.txt
> +++ b/Documentation/devicetree/bindings/mips/brcm/soc.txt
> @@ -11,3 +11,80 @@ Required properties:
>  
>  The experimental -viper variants are for running Linux on the 3384's
>  BMIPS4355 cable modem CPU instead of the BMIPS5000 application processor.
> +
> +Power management
> +----------------
> +
> +For power management (particularly, S2/S3/S5 system suspend), the following SoC
> +components are needed:
> +
> += Always-On control block (AON CTRL)
> +
> +This hardware provides control registers for the "always-on" (even in low-power
> +modes) hardware, such as the Power Management State Machine (PMSM).
> +
> +Required properties:
> +- compatible     : should contain "brcm,brcmstb-aon-ctrl"

Exact same block on all SoCs?

> +- reg            : the register start and length for the AON CTRL block
> +
> +Example:
> +
> +aon-ctrl@410000 {

syscon@...

> +	compatible = "brcm,brcmstb-aon-ctrl";
> +	reg = <0x410000 0x400>;
> +};
> +
> += Memory controllers
> +
> +A Broadcom STB SoC typically has a number of independent memory controllers,
> +each of which may have several associated hardware blocks, which are versioned
> +independently (control registers, DDR PHYs, etc.). One might consider
> +describing these controllers as a parent "memory controllers" block, which
> +contains N sub-nodes (one for each controller in the system), each of which is
> +associated with a number of hardware register resources (e.g., its PHY). See
> +the example device tree snippet below.

What example?

> +
> +== MEMC (MEMory Controller)
> +
> +Represents a single memory controller instance.
> +
> +Required properties:
> +- compatible     : should contain "brcm,brcmstb-memc" and "simple-bus"

No registers for the controller?

> +
> +Should contain subnodes for any of the following relevant hardware resources:
> +
> +== DDR PHY control
> +
> +Control registers for this memory controller's DDR PHY.
> +
> +Required properties:
> +- compatible     : should contain one of these
> +	"brcm,brcmstb-ddr-phy-v64.5"
> +	"brcm,brcmstb-ddr-phy"
> +
> +- reg            : the DDR PHY register range
> +
> +== MEMC Arbiter
> +
> +The memory controller arbiter is responsible for memory clients allocation
> +(bandwidth, priorities etc.) and needs to have its contents restored during
> +deep sleep states (S3).
> +
> +Required properties:
> +
> +- compatible	: should contain one of these
> +	"brcm,brcmstb-memc-arb-v10.0.0.0"
> +	"brcm,brcmstb-memc-arb"
> +
> +- reg		: the DDR Arbiter register range
> +
> +== Timers
> +
> +The Broadcom STB chips contain a timer block with several general purpose
> +timers that can be used.
> +
> +Required properties:
> +
> +- compatible	: should contain "brcm,brcmstb-timers"
> +- reg		: the timers register range
> +
> -- 
> 2.9.3
> 
