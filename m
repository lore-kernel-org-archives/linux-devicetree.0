From: Abhishek Sahu <absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH 06/15] ARM: dts: ipq4019: Add ipq4019-ap.dk04.dtsi
Date: Sat, 03 Feb 2018 16:47:39 +0530
Message-ID: <a32d3a776c7a3f5c88a9a26200bff915@codeaurora.org>
References: <1517202689-14212-1-git-send-email-sricharan@codeaurora.org>
 <1517202689-14212-7-git-send-email-sricharan@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1517202689-14212-7-git-send-email-sricharan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sricharan R <sricharan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2018-01-29 10:41, Sricharan R wrote:
> Add the common parts for the dk04 boards.
> 
> Signed-off-by: Sricharan R <sricharan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> ---
>  arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1.dtsi | 147

  <snip>
> +
> +			nand_pins: nand_pins {
> +				pullups {
> +					pins = "gpio52", "gpio53",
> "gpio58",
> +						"gpio59";
> +					function = "qpic";
> +					bias-pull-up;
> +				};
> +
> +				pulldowns {
> +					pins = "gpio54", "gpio55",
> "gpio56",
> +						"gpio57", "gpio60",
> "gpio61",
> +						"gpio62", "gpio63",
> "gpio64",
> +						"gpio65", "gpio66",
> "gpio67",
> +						"gpio68", "gpio69";
> +					function = "qpic";
> +					bias-pull-down;
> +				};
> +			};

  Can you please check once why do we need pull-up and
  pull-down for NAND pins. The NAND chip will be mounted
  over board itself so board design should take care of
  required pull up and pull downs.

  Also, some of the above pins like gpio52 will be only used
  for LCD so we can remove those pins. Later on, when LCD
  support will be added, we can add those pins.

  Thanks,
  Abhishek
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
