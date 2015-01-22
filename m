From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [RFC PATCH v4 3/4] arm64:thunder: Add initial dts for Cavium's Thunder SoC in 2 Node topology.
Date: Thu, 22 Jan 2015 17:47:13 +0100
Message-ID: <2882934.brFyhkGPyE@wuerfel>
References: <1421924755-26029-1-git-send-email-gkulkarni@caviumnetworks.com> <1421924755-26029-4-git-send-email-gkulkarni@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1421924755-26029-4-git-send-email-gkulkarni-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ganapatrao Kulkarni <gkulkarni-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Will.Deacon-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, roy.franz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, msalter-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, steve.capper-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, jchandra-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, al.stone-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, ddutile-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, gpkulkarni-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thursday 22 January 2015 16:35:54 Ganapatrao Kulkarni wrote:
> +
> +		cpu@000 {
> +			device_type = "cpu";
> +			compatible = "cavium,thunder", "arm,armv8";
> +			reg = <0x0 0x000>;
> +			enable-method = "psci";
> +			/* socket 0, cluster 0, core 0*/
> +			arm,associativity = <0 0 0>;
> +		};
...
> +             cpu@20f {
> +                     device_type = "cpu";
> +                     compatible = "cavium,thunder", "arm,armv8";
> +                     reg = <0x0 0x20f>;
> +                     enable-method = "psci";
> +                     arm,associativity = <0 2 15>;
> +		};
> +		cpu@10000 {
> +			device_type = "cpu";
> +			compatible = "cavium,thunder", "arm,armv8";
> +			reg = <0x0 0x10000>;
> +			enable-method = "psci";
> +			/* socket 1, cluster 0, core 0*/
> +			arm,associativity = <1 0 0>;
> +		};

This seems wrong still: The clusters and cores do not have unique
numbers. I believe the code will not work correctly, and it won't
be compliant with the binding from patch 2.

I think the right way here would be to use 

	arm,associativity = <0 2 47>;

for cpu@20f, and

	arm,associativity = <1 3 48>;

for cpu@10000. Your previous version used the numbers from 
the reg property, which should be fine as well if that helps:


	arm,associativity = <0x0 0x200 0x20f>;

	arm,associativity = <0x10000 0x10000 0x10000>;

which should have the same effect as above, as long as the code
can handle the numbers not being consecutive.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
