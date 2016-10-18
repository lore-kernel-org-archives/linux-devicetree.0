From: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/3] arm64: dts: uniphier: add CPU clock and OPP table
 for LD11 SoC
Date: Tue, 18 Oct 2016 16:55:48 +0530
Message-ID: <20161018112548.GA11471@vireshk-i7>
References: <1476629958-25368-1-git-send-email-yamada.masahiro@socionext.com>
 <1476629958-25368-3-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1476629958-25368-3-git-send-email-yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 16-10-16, 23:59, Masahiro Yamada wrote:
> +	cluster0_opp: opp_table {
> +		compatible = "operating-points-v2";
> +		opp-shared;
> +
> +		opp@245000000 {
> +			opp-hz = /bits/ 64 <245000000>;
> +			clock-latency-ns = <300>;
> +		};
> +		opp@250000000 {
> +			opp-hz = /bits/ 64 <250000000>;
> +			clock-latency-ns = <300>;
> +		};
> +		opp@490000000 {
> +			opp-hz = /bits/ 64 <490000000>;
> +			clock-latency-ns = <300>;
> +		};
> +		opp@500000000 {
> +			opp-hz = /bits/ 64 <500000000>;
> +			clock-latency-ns = <300>;
> +		};
> +		opp@653333333 {

Why isn't ^^ matching with below values ? Same in next patch as well.

> +			opp-hz = /bits/ 64 <653334000>;
> +			clock-latency-ns = <300>;
> +		};
> +		opp@666666666 {
> +			opp-hz = /bits/ 64 <666667000>;
> +			clock-latency-ns = <300>;
> +		};
> +		opp@980000000 {
> +			opp-hz = /bits/ 64 <980000000>;
> +			clock-latency-ns = <300>;
> +		};
> +	};
> +
>  	clocks {
>  		refclk: ref {
>  			compatible = "fixed-clock";
> -- 
> 1.9.1

-- 
viresh
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
