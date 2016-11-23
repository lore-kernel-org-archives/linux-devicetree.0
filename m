From: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: dts: da850: Add node for pullup/pulldown pinconf
Date: Wed, 23 Nov 2016 16:42:41 +0530
Message-ID: <8c3e6535-4b79-9731-f801-c13f007e48ab@ti.com>
References: <1479871767-20160-1-git-send-email-david@lechnology.com>
 <1479871767-20160-4-git-send-email-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1479871767-20160-4-git-send-email-david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Axel Haslam <ahaslam-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Alexandre Bailon <abailon-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, =?UTF-8?Q?Bartosz_Go=c5=82aszewski?= <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wednesday 23 November 2016 08:59 AM, David Lechner wrote:
> This SoC has a separate pin controller for configuring pullup/pulldown
> bias on groups of pins.
> 
> Signed-off-by: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
> ---
>  arch/arm/boot/dts/da850.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/da850.dtsi b/arch/arm/boot/dts/da850.dtsi
> index 8945815..1c0224c 100644
> --- a/arch/arm/boot/dts/da850.dtsi
> +++ b/arch/arm/boot/dts/da850.dtsi
> @@ -210,6 +210,11 @@
>  			};
>  
>  		};
> +		pinconf: pin-controller@22c00c {
> +			compatible = "ti,da850-pupd";
> +			reg = <0x22c00c 0x8>;
> +			status = "disabled";
> +		};

Can you please place this below the i2c1 node. I am trying to keep the
nodes sorted by unit address. I know thats broken in many places today,
but lets add the new ones where they should eventually end up.

Thanks,
Sekhar
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
