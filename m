From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: imx23-olinuxino: Fix dr_mode of usb0
Date: Tue, 14 Apr 2015 17:43:44 -0300
Message-ID: <CAOMZO5DeD_pXVBnCm223HQ7aw-Ph_Bfxf5VaHYn7AEz4bVupsQ@mail.gmail.com>
References: <1429043846-28731-1-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1429043846-28731-1-git-send-email-stefan.wahren-eS4NqCHxEME@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Cc: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, =?UTF-8?B?TWFyZWsgVmHFoXV0?= <marex-ynQEQJNshbs@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Harald Geyer <harald-95f8Dae0BrPYtjvyW6yDsg@public.gmane.org>, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 14, 2015 at 5:37 PM, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org> wrote:
> The dr_mode of usb0 on imx233-olinuxino is left to default "otg".
> Since the green LED (GPIO2_1) on imx233-olinuxino is connected to the
> same pin as USB_OTG_ID it's possible to disable USB host by LED toggling:
>
> echo 0 > /sys/class/leds/green/brightness
> [ 1068.890000] ci_hdrc ci_hdrc.0: remove, state 1
> [ 1068.890000] usb usb1: USB disconnect, device number 1
> [ 1068.920000] usb 1-1: USB disconnect, device number 2
> [ 1068.920000] usb 1-1.1: USB disconnect, device number 3
> [ 1069.070000] usb 1-1.2: USB disconnect, device number 4
> [ 1069.450000] ci_hdrc ci_hdrc.0: USB bus 1 deregistered
> [ 1074.460000] ci_hdrc ci_hdrc.0: timeout waiting for 00000800 in 11
>
> This patch fixes the issue by setting dr_mode to "host" in the dts file.
>
> Reported-by: Harald Geyer <harald-95f8Dae0BrPYtjvyW6yDsg@public.gmane.org>
> Signed-off-by: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>

Reviewed-by: Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

Thanks
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
