From: Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Subject: Re: [PATCH v3 2/2] ARM: dts: keystone-k2g-evm: Add gpio nodes
Date: Wed, 26 Jul 2017 14:33:42 +0100
Message-ID: <20170726133342.GO31807@n2100.armlinux.org.uk>
References: <1501051524-5990-1-git-send-email-j-keerthy@ti.com>
 <1501051524-5990-2-git-send-email-j-keerthy@ti.com>
 <1fb21a17-c38e-539f-7cd3-b72bd819a531@ti.com>
 <ecb45045-057a-98c1-9c22-bc6c0df6f5bd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <ecb45045-057a-98c1-9c22-bc6c0df6f5bd-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Keerthy <j-keerthy-l0cyMroinI0@public.gmane.org>
Cc: Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>, ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, nsekhar-l0cyMroinI0@public.gmane.org, t-kristo-l0cyMroinI0@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, fcooper-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jul 26, 2017 at 06:59:58PM +0530, Keerthy wrote:
> >> +
> >> +		gpio0: gpio@2603000 {
> >> +			compatible = "ti,keystone-k2g-gpio", "ti,keystone-gpio";
> >> +			reg = <0x02603000 0x100>;
> >> +			gpio-controller;
> >> +			#gpio-cells = <2>;
> >> +
> >> +			interrupts = <GIC_SPI 432 IRQ_TYPE_EDGE_RISING>,
> >> +					<GIC_SPI 433 IRQ_TYPE_EDGE_RISING>,
> >> +					<GIC_SPI 434 IRQ_TYPE_EDGE_RISING>,
> >> +					<GIC_SPI 435 IRQ_TYPE_EDGE_RISING>,
> >> +					<GIC_SPI 436 IRQ_TYPE_EDGE_RISING>,
> >> +					<GIC_SPI 437 IRQ_TYPE_EDGE_RISING>,
> >> +					<GIC_SPI 438 IRQ_TYPE_EDGE_RISING>,
> >> +					<GIC_SPI 439 IRQ_TYPE_EDGE_RISING>,
> >> +					<GIC_SPI 440 IRQ_TYPE_EDGE_RISING>;
> >> +			interrupt-controller;
> >> +			#interrupt-cells = <2>;
> >> +			ti,ngpio = <144>;
> >> +			ti,davinci-gpio-unbanked = <0>;
> >> +			clocks = <&k2g_clks 0x001b 0x0>;
> >> +			clock-names = "gpio";
> >> +		};
> >> +
> >> +		gpio1: gpio@260a000 {
> >> +			compatible = "ti,keystone-k2g-gpio", "ti,keystone-gpio";
> >> +			reg = <0x0260a000 0x100>;
> >> +			gpio-controller;
> >> +			#gpio-cells = <2>;
> >> +			interrupts = <GIC_SPI 442 IRQ_TYPE_EDGE_RISING>,
> >> +					<GIC_SPI 443 IRQ_TYPE_EDGE_RISING>,
> >> +					<GIC_SPI 444 IRQ_TYPE_EDGE_RISING>,
> >> +					<GIC_SPI 445 IRQ_TYPE_EDGE_RISING>,
> >> +					<GIC_SPI 446 IRQ_TYPE_EDGE_RISING>;
> >> +			interrupt-controller;
> >> +			#interrupt-cells = <2>;
> >> +			ti,ngpio = <68>;
> >> +			ti,davinci-gpio-unbanked = <0>;
> >> +			clocks = <&k2g_clks 0x001c 0x0>;
> >> +			clock-names = "gpio";
> >> +		};

With the addition of GPIO support, does that mean there is a chance to
control the noisy fan via the kernel's thermal management?  Do we have
temperature sensor support for Keystone 2 ?

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
