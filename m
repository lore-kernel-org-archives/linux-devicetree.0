From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/4] watchdog: Add brcm,bcm6345-wdt device tree binding
Date: Sun, 22 Nov 2015 16:13:52 -0600
Message-ID: <20151122221352.GA13686@rob-hp-laptop>
References: <5650BFD6.5030700@simon.arlott.org.uk>
 <5650C047.6040303@simon.arlott.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5650C047.6040303-qdVf85lJwsCyrPCCpiK2c/XRex20P6io@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Arlott <simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Miguel Gaio <miguel.gaio-HH44TBFINEIAvxtiuMwx3w@public.gmane.org>, Maxime Bizon <mbizon-MmRyKUhfbQ9GWvitb5QawA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Nov 21, 2015 at 07:04:39PM +0000, Simon Arlott wrote:
> Add device tree binding for the BCM6345 watchdog.
> 
> This uses the BCM6345 timer for its warning interrupt.
> 
> Signed-off-by: Simon Arlott <simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org>

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

> ---
>  .../bindings/watchdog/brcm,bcm6345-wdt.txt         | 35 ++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/brcm,bcm6345-wdt.txt
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/brcm,bcm6345-wdt.txt b/Documentation/devicetree/bindings/watchdog/brcm,bcm6345-wdt.txt
> new file mode 100644
> index 0000000..9d852d4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/brcm,bcm6345-wdt.txt
> @@ -0,0 +1,35 @@
> +BCM6345 Watchdog timer
> +
> +Required properties:
> +
> +- compatible: should be "brcm,bcm63<soc>-wdt", "brcm,bcm6345-wdt"
> +- reg: Specifies base physical address and size of the registers.
> +- clocks: Specify the clock used for timing
> +
> +Optional properties:
> +
> +- interrupt-parent: phandle to the interrupt controller
> +- interrupts: Specify the interrupt used for the watchdog timout warning
> +- timeout-sec: Contains the default watchdog timeout in seconds
> +
> +Example:
> +
> +watchdog {
> +	compatible = "brcm,bcm63168-wdt", "brcm,bcm6345-wdt";
> +	reg = <0x1000009c 0x0c>;
> +	clocks = <&periph_clk>;
> +
> +	interrupt-parent = <&timer>;
> +	interrupts = <3>;
> +	timeout-sec = <30>;
> +};
> +
> +watchdog {
> +	compatible = "brcm,bcm6318-wdt", "brcm,bcm6345-wdt";
> +	reg = <0x10000068 0x0c>;
> +	clocks = <&periph_clk>;
> +
> +	interrupt-parent = <&timer>;
> +	interrupts = <3>;
> +	timeout-sec = <30>;
> +};
> -- 
> 2.1.4
> 
> -- 
> Simon Arlott
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
