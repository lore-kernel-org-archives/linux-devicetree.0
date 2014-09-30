From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH V4] bcma: use chipcommon node from DT for SoC GPIO chip
Date: Tue, 30 Sep 2014 13:08:07 +0200
Message-ID: <2792546.1ci4Y7Hkk3@wuerfel>
References: <1412072546-3529-1-git-send-email-zajec5@gmail.com> <1412074548-14614-1-git-send-email-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1412074548-14614-1-git-send-email-zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "John W. Linville" <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tuesday 30 September 2014 12:55:48 Rafa=C5=82 Mi=C5=82ecki wrote:
> This will allow us to define GPIO-attached devices (LEDs, buttons) in
> the the device tree.
>=20
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> This is based on top of
> [PATCH v6] bcma: register bcma as device tree driver
> that I hope will reach wireless-next git tree.
>=20
> V2: Describe axi chilren and make gpio a child of chipcommon core.
> V3: Make chipcommon a GPIO controller (avoid extra sub-child)
>     Speed up finding OF node in driver_gpio.c
> V4: Simplify setting of_node in driver_gpio.c
>=20

Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-wireles=
s" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
