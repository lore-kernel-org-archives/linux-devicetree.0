From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [RFC PATCH v2 3/4] arm64:thunder: Add initial dts for Cavium's Thunder SoC in 2 Node topology.
Date: Mon, 24 Nov 2014 12:59:26 +0100
Message-ID: <4080571.JcHDsAZ9EV@wuerfel>
References: <1416605010-10442-1-git-send-email-ganapatrao.kulkarni@caviumnetworks.com> <1416605010-10442-4-git-send-email-ganapatrao.kulkarni@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1416605010-10442-4-git-send-email-ganapatrao.kulkarni-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ganapatrao Kulkarni <ganapatrao.kulkarni-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Will.Deacon-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, roy.franz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, msalter-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, steve.capper-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, jchandra-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, al.stone-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gpkulkarni-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Saturday 22 November 2014 02:53:29 Ganapatrao Kulkarni wrote:
> +/ {
> +	model = "Cavium ThunderX CN88XX board";
> +	compatible = "cavium,thunder-88xx";

No wildcards in compatible strings or model names please. List the
exact chip that you are using.

> +	aliases {
> +		serial0 = &uaa0;
> +		serial1 = &uaa1;
> +	};
> +
> +	memory@00c00000 {
> +		device_type = "memory";
> +		reg = <0x0 0x00000000 0x0 0x80000000>;
> +	};
> +
> +	memory@10000000000 {
> +		device_type = "memory";
> +		reg = <0x100 0x00000000 0x0 0x80000000>;
> +	};
> +
> +	numa-map {
> +		#address-cells = <2>;
> +		#size-cells = <1>;
> +		#node-count = <2>;
> +		mem-map = <0x0 0x00000000 0>,
> +		           <0x100 0x00000000 1>;
> +
> +               cpu-map = <0 47 0>,
> +			<48 95 1>;
> +
> +		node-matrix=    <0 0 10>,
> +				<0 1 20>,
> +				<1 0 20>,
> +				<1 1 10>;

I don't know how much history is behind this binding. Have you looked
at the sPAPR way of doing this? I don't remember exactly how that is
done, but we'd need a good reason to discard that and implement
something else for arm64.

If we create a new binding, I don't think the 'numa-map' node you
have here is the best solution. We already have device nodes for each
memory segment and each CPU in the system. Why not work with those
nodes directly?
> +
> +	timer {
> +		compatible = "arm,armv8-timer";
> +		interrupts = <1 13 0xff01>,
> +		             <1 14 0xff01>,
> +		             <1 11 0xff01>,
> +		             <1 10 0xff01>;
> +	};
> +
> +	soc {
> +		compatible = "simple-bus";
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		refclk50mhz: refclk50mhz {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +			clock-frequency = <50000000>;
> +			clock-output-names = "refclk50mhz";
> +		};

Why is the timer outside of the soc and the refclk is inside?
I would have expected the opposite.

	Arnd 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
