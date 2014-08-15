From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v2 3/5] ARM: BCM63XX: add BCM63138 minimal Device Tree
Date: Fri, 15 Aug 2014 09:11:47 +0200
Message-ID: <2248656.tvg1indprx@wuerfel>
References: <1408061487-20984-1-git-send-email-f.fainelli@gmail.com> <1408061487-20984-4-git-send-email-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1408061487-20984-4-git-send-email-f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mbizon-MmRyKUhfbQ9GWvitb5QawA@public.gmane.org, jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org, cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jpeshkin-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, elder-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thursday 14 August 2014 17:11:25 Florian Fainelli wrote:
> Add a very minimalistic BCM63138 Device Tree include file which
> describes the BCM63138 SoC with only the basic set of required
> peripherals:
> 
> - Cortex A9 CPUs
> - ARM GIC
> - ARM SCU
> - PL310 Level-2 cache controller
> - ARM TWD & Global timers
> - ARM TWD watchdog
> - legacy MIPS bus (UBUS)
> - BCM6345-style UARTs (disabled by default)
> 
> Since the PL310 L2 cache controller does not come out of reset with
> correct default values, we need to override the 'cache-sets' and
> 'cache-size' properties to get its geometry right.
> 
> Signed-off-by: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>

Looks all good to me except one tiny detail:

> +	/* Legacy UBUS base */
> +	ubus@fffe8000 {
> +		compatible = "simple-bus";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges = <0 0xfffe8000 0x8100>;
> +
> +		serial0: uart@600 {
> +			compatible = "brcm,bcm6345-uart";
> +			reg = <0x600 0x1b>;
> +			interrupts = <GIC_SPI 32 0>;
> +			clocks = <&periph_clk>;
> +			clock-names = "periph";
> +			status = "disabled";
> +		};

The recommended name for a uart is serial@600, not uart@600.
We are highly inconsistent with the existing dts files, so I'm
not blaming you, I'm just trying to make new files do it the
right way.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
