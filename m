From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v3 4/6] phy: rockchip-typec: force to USB2 if DP at 4 lanes mode
Date: Sat, 17 Feb 2018 01:09:52 +0100
Message-ID: <4816286.2JUx8CKC3E@phil>
References: <20180216120956.19034-1-enric.balletbo@collabora.com> <20180216120956.19034-4-enric.balletbo@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180216120956.19034-4-enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, William wu <wulf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, hl-TNX95d0MmH7DzftRWevZcw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Freitag, 16. Februar 2018, 13:09:54 CET schrieb Enric Balletbo i Serra:
> From: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> 
> The usb3tousb2_en BIT will be clear to 0 in probe(), it make USB
> controller work at USB3 mode, and if the USB phy is turned on with DP
> only mode(4 lanes DP), the rockchip_usb3_phy_power_on() will return
> directly, so usb3_host_disable and usb3_host_port these 2 BIT will keep
> a same value as coreboot. In coreboot, these 3 BITs are set as USB2
> mode, but now one of the bits is changed to USB3, it make USB controller
> work at a unknown status.
> 
> These 3 BITs should be changed to USB2, if the Type-C works at 4 lanes
> mode, and then switch it back to USB3 mode, when USB disconnect.
> 
> Signed-off-by: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>

Reviewed-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
