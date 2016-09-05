From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 2/4] ARM: dts: rockchip: fix i2c address L3G4200D on PopMetal-RK3288 board
Date: Mon, 05 Sep 2016 11:12:49 +0200
Message-ID: <2908713.CWeP2vUbBj@phil>
References: <1472977937-758-1-git-send-email-andy.yan@rock-chips.com> <1472978067-868-1-git-send-email-andy.yan@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1472978067-868-1-git-send-email-andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Sonntag, 4. September 2016, 16:34:27 CEST schrieb Andy Yan:
> The i2c address of the three-axis digital gyroscope L3G4200D should be
> 0x69 according to hardware design.
> Also add power supply reference for L3G3200D and the 3-axis Electronic
> Compass AK8963.
> 
> Signed-off-by: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

I've split this into two patches:
ARM: dts: rockchip: fix L3G4200D i2c address on PopMetal-RK3288 board
ARM: dts: rockchip: Add sensor-supplies on PopMetal-RK3288 board
and applied them to my dts32 branch for 4.9

Please don't mix multiple changes into one patch in the future :-)


Thanks
Heiko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
