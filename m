From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: rockchip: set FIFO size for SDMMC, SDIO and EMMC
Date: Mon, 01 Dec 2014 01:05:16 +0100
Message-ID: <3674430.hGHycMC0Vo@diego>
References: <1417170254-13615-1-git-send-email-julien.chauveau@neo-technologies.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1417170254-13615-1-git-send-email-julien.chauveau-MwaZihP3oV2HdZQakrT3ElaPQRlvutdw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Julien CHAUVEAU <julien.chauveau-MwaZihP3oV2HdZQakrT3ElaPQRlvutdw@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "moderated list:ARM/Rockchip SoC..." <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am Freitag, 28. November 2014, 11:24:14 schrieb Julien CHAUVEAU:
> The SDMMC, SDIO and EMMC controllers use an external FIFO whose size is
> 256x32bit. This patch set the corresponding fifo-depth properties for both
> RK3066 and RK3188.
> 
> Signed-off-by: Julien CHAUVEAU <julien.chauveau-MwaZihP3oV2HdZQakrT3ElaPQRlvutdw@public.gmane.org>

applied to my dts branch
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
