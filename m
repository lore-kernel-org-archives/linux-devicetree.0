From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v3 3/6] phy: rockchip-typec: enable usb3 host during usb3 phy power on
Date: Sat, 17 Feb 2018 01:08:07 +0100
Message-ID: <3430653.U8tW0J7X0D@phil>
References: <20180216120956.19034-1-enric.balletbo@collabora.com> <20180216120956.19034-3-enric.balletbo@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180216120956.19034-3-enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, William wu <wulf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, hl-TNX95d0MmH7DzftRWevZcw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Freitag, 16. Februar 2018, 13:09:53 CET schrieb Enric Balletbo i Serra:
> From: William wu <wulf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> 
> We have forced usb3 to work in usb2 only mode in firmware by setting
> usb3tousb2_en (bit3 of GRF_USB3PHY0/1_CON0) to 1, and setting
> host_u3_port_disable (bit0 of GRF_USB3OTG0/1_CON1) to 1 and host_u3_port
> (bit15~12 of GRF_USB3OTG0/1_CON1) to 0. So we need to re-enable usb3
> host.
> 
> Note that the RK3399 TRM suggests that we should keep the whole usb3
> controller in reset for the duration of the Type-C PHY initialization.
> However, it's hard to assert the reset in the current framework of
> reset. And according to the TRM, it doesn't require that we should
> clear the usb3tousb2 bit before pipe ready. So let's enable the usb3
> host after pipe ready to avoid the Type-C PHY initialization failure.
> 
> Signed-off-by: William wu <wulf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>

Reviewed-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
