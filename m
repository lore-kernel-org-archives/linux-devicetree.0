From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 0/5] some devicetree changes for rk3288 boards
Date: Sat, 01 Jul 2017 21:26:18 +0200
Message-ID: <10271838.b6AgH4ZSYx@phil>
References: <1498874567-11219-1-git-send-email-jacob-chen@iotwrt.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1498874567-11219-1-git-send-email-jacob-chen-fyOeoxGR3m/QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jacob Chen <jacob-chen-fyOeoxGR3m/QT0dZR+AlfA@public.gmane.org>
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Samstag, 1. Juli 2017, 10:02:42 CEST schrieb Jacob Chen:
> Since Guillaume have send patches for mali gpu node, let's enable it in more boards.
> 
> Jacob Chen (5):
>   ARM: dts: rockchip: enable ARM Mali GPU on rk3288-tinker
>   ARM: dts: rockchip: enable ARM Mali GPU on rk3288-evb
>   ARM: dts: rockchip: enable ARM Mali GPU on rk3288-fennec
>   ARM: dts: rockchip: enable saradc for rk3288-evb
>   ARM: dts: rockchip: enable adc key for rk3288-evb

applied for 4.14, with the saradc patch replaced with your v2


Heiko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
