From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] ARM: vexpress: Add unified-cache Device Tree property
Date: Wed, 18 Mar 2015 09:21:02 +0000
Message-ID: <5509437E.6060806@arm.com>
References: <1426617084-1583-1-git-send-email-r.schwebel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1426617084-1583-1-git-send-email-r.schwebel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robert Schwebel <r.schwebel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>, Lorenzo Pieralisi <Lorenzo.Pieralisi-5wv7dgnIgG8@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 17/03/15 18:31, Robert Schwebel wrote:
> Without this propergy, we get this boot warning:
>
              ^^property
> "L2C: device tree omits to specify unified cache"
>
> Signed-off-by: Robert Schwebel <r.schwebel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>

Acked-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>

> ---
>   arch/arm/boot/dts/vexpress-v2p-ca9.dts | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/boot/dts/vexpress-v2p-ca9.dts b/arch/arm/boot/dts/vexpress-v2p-ca9.dts
> index 23662b5..a411274 100644
> --- a/arch/arm/boot/dts/vexpress-v2p-ca9.dts
> +++ b/arch/arm/boot/dts/vexpress-v2p-ca9.dts
> @@ -170,6 +170,7 @@
>   		compatible = "arm,pl310-cache";
>   		reg = <0x1e00a000 0x1000>;
>   		interrupts = <0 43 4>;
> +		cache-unified;
>   		cache-level = <2>;
>   		arm,data-latency = <1 1 1>;
>   		arm,tag-latency = <1 1 1>;
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
