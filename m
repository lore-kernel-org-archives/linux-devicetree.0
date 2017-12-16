From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v3 5/5] arm64: dts: rockchip: add reset property for dwc3 controllers on rk3399.
Date: Sat, 16 Dec 2017 18:01:08 +0100
Message-ID: <2260405.eszS2niqFZ@phil>
References: <20171215110005.7564-1-enric.balletbo@collabora.com> <20171215110005.7564-5-enric.balletbo@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171215110005.7564-5-enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, dianders-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, groeck-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, briannorris-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Freitag, 15. Dezember 2017, 12:00:05 CET schrieb Enric Balletbo i Serra:
> After commit '06c47e6286d usb: dwc3: of-simple: Add support to get resets
> for the device' you can add the reset property to the dwc3 node, the reset
> is required for the controller to work properly, otherwise bind / unbind
> stress testing of the USB controller on rk3399 we'd often end up with lots
> of failures that looked like this:
> 
>   phy phy-ff800000.phy.9: phy poweron failed --> -110
>   dwc3 fe900000.dwc3: failed to initialize core
>   dwc3: probe of fe900000.dwc3 failed with error -110
> 
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>

applied for 4.16

Thanks
Heiko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
