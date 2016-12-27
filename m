From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [RESEND PATCH v2] arm64: dts: rockchip: add u2phy clock for ehci and ohci of rk3399
Date: Tue, 27 Dec 2016 18:04:26 +0100
Message-ID: <1731551.Q6cHK6n5ZM@phil>
References: <1482316182-2305-1-git-send-email-zhengxing@rock-chips.com> <1482316865-2769-1-git-send-email-zhengxing@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1482316865-2769-1-git-send-email-zhengxing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Xing Zheng <zhengxing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org, shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org, briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org, zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org, david.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org, wulf-TNX95d0MmH7DzftRWevZcw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dianders-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Mittwoch, 21. Dezember 2016, 18:41:05 CET schrieb Xing Zheng:
> From: William wu <wulf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> 
> We found that the suspend process was blocked when it run into
> ehci/ohci module due to clk-480m of usb2-phy was disabled.
> 
> The root cause is that usb2-phy suspended earlier than ehci/ohci
> (usb2-phy will be auto suspended if no devices plug-in). and the
> clk-480m provided by it was disabled if no module used. However,
> some suspend process related ehci/ohci are base on this clock,
> so we should refer it into ehci/ohci driver to prevent this case.
> 
> The u2phy clock flow like this:
> ===
>       u2phy ________________
> 
>            |                |    |-----> UTMI_CLK ---------> | EHCI |
> 
> OSC_24M ---|---> PHY_PLL----|----|
> 
>            |________^_______|    |-----> 480M_CLK ---|G|---> |
>            |USBPHY_480M_SRC| ----> USBPHY_480M for SoC
>                    GRF
> ===
> 
> Signed-off-by: William wu <wulf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> Signed-off-by: Xing Zheng <zhengxing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

applied for 4.11 with Doug's Review-tag


Thanks
Heiko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
