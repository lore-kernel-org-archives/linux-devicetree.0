From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: rockchip: add ap_pwroff and ddrio_pwroff pins for rk3399
Date: Mon, 27 Jun 2016 01:09:08 +0200
Message-ID: <3506480.G5PcqxtUXs@phil>
References: <1465935671-13890-1-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1465935671-13890-1-git-send-email-dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dbasehore-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Dienstag, 14. Juni 2016, 13:21:11 schrieb Douglas Anderson:
> There are two sleep related pins on rk3399: ap_pwroff and ddrio_pwroff.
> Let's add the definition of these two pins to rk3399's main dtsi file so
> that boards can use them.
> 
> These two pins are similar to the global_pwroff and ddrio_pwroff pins in
> rk3288 and are expected to be used in the same way: boards will likely
> want to configure these pinctrl settings in their global pinctrl hog
> list.
> 
> Note that on rk3288 there were two additional pins in the "sleep"
> section: "ddr0_retention" and "ddr1_retention".  On rk3288 designs these
> pins appeared to actually route from rk3288 back to rk3288.  Presumably
> on rk3399 this is simply not needed since the pins don't appear to exist
> there.
> 
> Signed-off-by: Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

applied to my dts64 branch for 4.8


Thanks
Heiko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
