From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [RFC PATCH v3 3/4] arm64:thunder: Add initial dts for Cavium's Thunder SoC in 2 Node topology.
Date: Fri, 02 Jan 2015 11:49:21 +0100
Message-ID: <1712587.E7JYUIXV1W@wuerfel>
References: <1420011208-7051-1-git-send-email-ganapatrao.kulkarni@caviumnetworks.com> <1420011208-7051-4-git-send-email-ganapatrao.kulkarni@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1420011208-7051-4-git-send-email-ganapatrao.kulkarni-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ganapatrao Kulkarni <ganapatrao.kulkarni-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Cc: inux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Will.Deacon-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, roy.franz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, msalter-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, steve.capper-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, jchandra-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, al.stone-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gpkulkarni-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wednesday 31 December 2014 13:03:27 Ganapatrao Kulkarni wrote:
> +
> +	memory@00000000 {
> +		device_type = "memory";
> +		reg = <0x0 0x00000000 0x0 0x80000000>;
> +		/* board 0, socket 0, no specific core */
> +		arm,associativity = <0 0 0xffff>;
> +	};
> +
> +	memory@10000000000 {
> +		device_type = "memory";
> +		reg = <0x100 0x00000000 0x0 0x80000000>;
> +		/* board 1, socket 0, no specific core */
> +		arm,associativity = <1 0 0xffff>;
> +	};
> +};

So no memory in any other socket?

> +		cpu@00f {
> +			device_type = "cpu";
> +			compatible = "cavium,thunder", "arm,armv8";
> +			reg = <0x0 0x00f>;
> +			enable-method = "psci";
> +			arm,associativity = <0 0 0x00f>;
> +		};
> +		cpu@100 {
> +			device_type = "cpu";
> +			compatible = "cavium,thunder", "arm,armv8";
> +			reg = <0x0 0x100>;
> +			enable-method = "psci";
> +			arm,associativity = <0 0 0x100>;
> +		};

What is the 0x100 offset in the last-level topology field? Does this have
no significance to topology at all? I would expect that to be something
like cluster number that is relevant to caching and should be represented
as a separate level.

In contrast, the level-two topology information seems to always be
zero for all CPUs, so you could probably leave that one out.

> +	soc {
> +		compatible = "simple-bus";
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;

The soc node is missing a topology information, please add one.

	Arnd

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
