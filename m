From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH] bcma: use device from DT (brcm,bus-gpio) for SoC GPIO chip
Date: Sat, 27 Sep 2014 00:03:18 +0200
Message-ID: <2539898.4te2VKk57a@wuerfel>
References: <1411741733-13888-1-git-send-email-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1411741733-13888-1-git-send-email-zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "John W. Linville" <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Friday 26 September 2014 16:28:53 Rafa=C5=82 Mi=C5=82ecki wrote:
> +The top-level axi bus may contain following children:
> +
> +- gpio: GPIO chip on the SoC
> +
> +  Required properties:
> +  - compatible: "brcm,bus-gpio"
> +  - gpio-controller : makes the node a GPIO controller
> +  - #gpio-cells : size of the GPIO specifier, must be 2
> +
>=20

I wonder if it would be better to avoid the subnode here and just
make the parent itself the gpio controller.

Is the gpio controller part of the bus itself in reality, or is it
a device that gets probed on the bus?

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe linux-wireles=
s" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
