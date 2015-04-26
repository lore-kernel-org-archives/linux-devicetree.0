From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v1 2/2] ARM: dts: rockchip: set dr_mode property for rk3288-firefly board
Date: Sun, 26 Apr 2015 12:16:05 +0200
Message-ID: <8829961.lJFBlrS3Ia@diego>
References: <1430041299-24874-1-git-send-email-lyz@rock-chips.com> <1430041299-24874-2-git-send-email-lyz@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1430041299-24874-2-git-send-email-lyz-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yunzhi Li <lyz-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org, hl-TNX95d0MmH7DzftRWevZcw@public.gmane.org, yk-TNX95d0MmH7DzftRWevZcw@public.gmane.org, gauravsh-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, alberto-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, wulf-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

Am Sonntag, 26. April 2015, 17:41:39 schrieb Yunzhi Li:
> rk3288-firefly board use the dwc2 usb otg controller as a host
> controller and the device mode not used, so the dr_mode should be
> "host" then the dwc2 usb otg controller will work at host only
> mode
> 
> Signed-off-by: Yunzhi Li <lyz-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

Not sure I understand. Is this some sort of hardware limitation? Because when 
for example flashing a kernel via upgrade_tool it is working just fine as 
gadget.

If it is a software choice, this should not be made in the devicetree, as the 
dt describes the hardware alone.


Heiko


> 
> ---
> 
>  arch/arm/boot/dts/rk3288-firefly.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/boot/dts/rk3288-firefly.dtsi
> b/arch/arm/boot/dts/rk3288-firefly.dtsi index e6f873a..a861776 100644
> --- a/arch/arm/boot/dts/rk3288-firefly.dtsi
> +++ b/arch/arm/boot/dts/rk3288-firefly.dtsi
> @@ -466,6 +466,7 @@
>  };
> 
>  &usb_otg {
> +	dr_modr = "host";
>  	status = "okay";
>  };

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
