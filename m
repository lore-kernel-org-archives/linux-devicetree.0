From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 3/4] dt-bindings: Document MIPS Broadcom STB power
 management nodes
Date: Mon, 10 Jul 2017 09:13:42 -0500
Message-ID: <20170710141342.fghqil4px5ylj336@rob-hp-laptop>
References: <20170706222225.9758-1-f.fainelli@gmail.com>
 <20170706222225.9758-4-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170706222225.9758-4-f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE" <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Markus Mayer <mmayer-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Justin Chen <justinpopo6-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Doug Berger <opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, open list:BROADCOM BCM47XX MIPS ARCHITECTURE
List-Id: devicetree@vger.kernel.org

On Thu, Jul 06, 2017 at 03:22:24PM -0700, Florian Fainelli wrote:
> Document the different nodes required for supporting S2/S3/S5 suspend
> states on MIPS-based Broadcom STB SoCs.
> 
> Signed-off-by: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  .../devicetree/bindings/mips/brcm/soc.txt          | 153 +++++++++++++++++++++
>  1 file changed, 153 insertions(+)

A couple of nits on the node names, otherwise:

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

> +Example:
> +
> +	memory-controller: memc@0 {

memory-controller@0

> +		compatible = "brcm,brcmstb-memc", "simple-bus";
> +		ranges = <0x0 0x0 0xa000>;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +
> +		memc-arb@1000 {
> +			...
> +		};
> +
> +		memc-ddr@2000 {
> +			...
> +		};
> +
> +		ddr-phy@6000 {
> +			...
> +		};
> +	};


> +Example:
> +
> +	timers: timers@4067c0 {

timer@...

> +		compatible = "brcm,bcm7425-timers", "brcm,brcmstb-timers";
> +		reg = <0x4067c0 0x40>;
> +		interrupts = <&periph_intc 19>;
> +	};
> -- 
> 2.9.3
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
