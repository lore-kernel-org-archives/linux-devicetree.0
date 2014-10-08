From: Dinh Nguyen <dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 3/5] ARM: dts: sun9i: Add A80 Optimus Board support
Date: Wed, 08 Oct 2014 08:32:21 -0500
Message-ID: <54353CE5.5070808@gmail.com>
References: <1412773376-25212-1-git-send-email-wens@csie.org> <1412773376-25212-4-git-send-email-wens@csie.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1412773376-25212-4-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Shuge <shuge-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org>, Meng Zhang <kevin-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org>, Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 10/8/14, 8:02 AM, Chen-Yu Tsai wrote:
> The A80 Optimus Board is was launched with the Allwinner A80 SoC.
> It was jointly developed by Allwinner and Merrii.
> 
> This board has a UART port, a JTAG connector, USB host ports, a USB
> 3.0 OTG connector, an HDMI output, a micro SD slot, 8G NAND flash,
> 4G DRAM, a camera sensor interface, a WiFi/BT combo chip, a headphone
> jack, IR receiver, and additional GPIO headers.
> 
> This patch adds only basic support.
> 
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> ---
>  arch/arm/boot/dts/Makefile              |  2 +
>  arch/arm/boot/dts/sun9i-a80-optimus.dts | 66 +++++++++++++++++++++++++++++++++
>  2 files changed, 68 insertions(+)
>  create mode 100644 arch/arm/boot/dts/sun9i-a80-optimus.dts
> 
[...]
> +
> +/dts-v1/;
> +/include/ "sun9i-a80.dtsi"
> +
> +/ {
> +	model = "Merrii A80 Optimus Board";
> +	compatible = "merrii,a80-optimus", "allwinner,sun9i-a80";

"merrii" should be added to vendor-prefixes.txt

Dinh
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
