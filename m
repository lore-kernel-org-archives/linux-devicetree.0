From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCHv2 4/5] arm: mvebu: Add device tree for 98DX3236 SoCs
Date: Thu, 5 Jan 2017 13:58:37 +0000
Message-ID: <20170105135837.GC25333@leverpostej>
References: <20170105033641.6212-1-chris.packham@alliedtelesis.co.nz>
 <20170105033641.6212-5-chris.packham@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170105033641.6212-5-chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Packham <chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jan 05, 2017 at 04:36:40PM +1300, Chris Packham wrote:
> +		internal-regs {
> +			coreclk: mvebu-sar@18230 {
> +				compatible = "marvell,mv98dx3236-core-clock";
> +			};
> +
> +			cpuclk: clock-complex@18700 {
> +				compatible = "marvell,mv98dx3236-cpu-clock";
> +			};
> +
> +			corediv-clock@18740 {
> +				compatible = "marvell,mv98dx3236-corediv-clock";
> +				reg = <0xf8268 0xc>;
> +				base = <&dfx>;
> +				#clock-cells = <1>;
> +				clocks = <&mainpll>;
> +				clock-output-names = "nand";
> +			};

[...]

> +		};
> +
> +		dfx-registers {
> +			compatible = "simple-bus";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges = <0 MBUS_ID(0x08, 0x00) 0 0x100000>;
> +
> +			dfx: dfx@0 {
> +				compatible = "simple-bus";
> +				reg = <0 0x100000>;
> +			};
> +		};

What is this dfx-registers, exactly? It has no children, so why is it a
simple-bus?

>From the above, and the patch adding the corediv driver, it looks like
the corediv-clock actually lives in this block, so I don't understand
why the corediv-clock is sitting in internal-regs with a sideband
reference to dfx.

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
