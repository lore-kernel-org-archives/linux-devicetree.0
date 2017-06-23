From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/5] dt-bindings: Update Broadcom STB binding
Date: Fri, 23 Jun 2017 14:54:28 -0500
Message-ID: <20170623195428.x7ckvni5t5gl4ukx@rob-hp-laptop>
References: <20170616213703.21487-1-f.fainelli@gmail.com>
 <20170616213703.21487-2-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170616213703.21487-2-f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE" <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Markus Mayer <mmayer-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Justin Chen <justinpopo6-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Doug Berger <opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 16, 2017 at 02:36:59PM -0700, Florian Fainelli wrote:
> Update the Broadcom STB binding document with new compatible strings for
> the DDR PHY and memory controller found on newer chips.

The subject should be more specific what this patch is doing.

> Signed-off-by: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/arm/bcm/brcm,brcmstb.txt | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/bcm/brcm,brcmstb.txt b/Documentation/devicetree/bindings/arm/bcm/brcm,brcmstb.txt
> index 0d0c1ae81bed..790e6b0b8306 100644
> --- a/Documentation/devicetree/bindings/arm/bcm/brcm,brcmstb.txt
> +++ b/Documentation/devicetree/bindings/arm/bcm/brcm,brcmstb.txt
> @@ -164,6 +164,8 @@ Control registers for this memory controller's DDR PHY.
>  
>  Required properties:
>  - compatible     : should contain one of these
> +	"brcm,brcmstb-ddr-phy-v71.1"
> +	"brcm,brcmstb-ddr-phy-v72.0"
>  	"brcm,brcmstb-ddr-phy-v225.1"
>  	"brcm,brcmstb-ddr-phy-v240.1"
>  	"brcm,brcmstb-ddr-phy-v240.2"
> @@ -184,7 +186,9 @@ Sequencer DRAM parameters and control registers. Used for Self-Refresh
>  Power-Down (SRPD), among other things.
>  
>  Required properties:
> -- compatible     : should contain "brcm,brcmstb-memc-ddr"
> +- compatible     : should contain one of these
> +	"brcm,brcmstb-memc-ddr-rev-b.2.2"
> +	"brcm,brcmstb-memc-ddr"
>  - reg            : the MEMC DDR register range
>  
>  Example:
> -- 
> 2.9.3
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
