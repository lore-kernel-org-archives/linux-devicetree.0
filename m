From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] coresight: Add support for Juno platform
Date: Thu, 23 Apr 2015 10:20:33 +0100
Message-ID: <20150423092032.GA16238@leverpostej>
References: <1429742802-13089-1-git-send-email-mathieu.poirier@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1429742802-13089-1-git-send-email-mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mathieu Poirier <mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Matthieu,

> +	main_funnel@20040000 {
> +		compatible = "arm,coresight-funnel", "arm,primecell";
> +		reg = <0 0x20040000 0 0x1000>;
> +
> +		clocks = <&soc_smc50mhz>;
> +		clock-names = "apb_pclk";
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +				main_funnel_out_port: endpoint {
> +					remote-endpoint =
> +						<&etf_in_port>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <0>;
> +				main_funnel_in_port0: endpoint {
> +					slave-mode;
> +					remote-endpoint =
> +							<&A57_funnel_out_port>;
> +				};
> +			};
> +
> +			port@2 {
> +				reg = <1>;
> +				main_funnel_in_port1: endpoint {
> +					slave-mode;
> +					remote-endpoint = <&A53_etm0_out_port>;
> +				};
> +			};

What's going on with these reg properties? They aren't matched with
their nodes' unit-addresses, and the same reg is reused by multiple
nodes. That doesn't make sense to me.

Is the mismatch deliberate (against DT conventions), or is this
mistaken?

Likewise for the other funnels.

Mark
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
