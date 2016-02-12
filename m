From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 0/3] ARM: mvebu: Add driver for the Zyxel NSA3XX hwmon MCU
Date: Fri, 12 Feb 2016 17:35:17 +0100
Message-ID: <87mvr5x4xm.fsf@free-electrons.com>
References: <1455147224-6742-1-git-send-email-linux@baker-net.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1455147224-6742-1-git-send-email-linux-u8Lxuz9p/S1csCcyGdaD/Q@public.gmane.org> (Adam
	Baker's message of "Wed, 10 Feb 2016 23:33:41 +0000")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Adam Baker <linux-u8Lxuz9p/S1csCcyGdaD/Q@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jean Delvare <jdelvare-IBi9RG/b67k@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, lm-sensors-GZX6beZjE8VD60Wz+7aTrA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Adam,
=20
 On jeu., f=C3=A9vr. 11 2016, Adam Baker <linux-u8Lxuz9p/S1csCcyGdaD/Q@public.gmane.org> wrote=
:

> This patch series adds a driver to support the hardware monitoring MC=
U
> that is present in some models of the Zyxel NSA3xx series of NAS unit=
s.
>
> A patch is included to add it to the device tree for the NSA320 model=
,
> patches to the other device trees will be included if testers come
> forward (I already have a possible tester for NSA325).
>
> There are no dependencies between the patches so I guess the first tw=
o
> should go via the hardware monitoring maintainers and the third via
> the ARM mvebu maintainers.

You are right. However the first tow patch are misnamed, they better
should be called:
hwmn: Define binding for the nsa3xx-hwmon driver
hwmn: Create a driver to support the hardware monitoring chip

The last patch seems OK for me, and the binding has been approved. So
when you will get a review from the hwmon maintainer, I will apply the
last patch in the mvebu tree.

Thanks,

Gregory

>
>  [PATCH 1/3] Define a binding for the hardware monitoring chip presen=
t
>  [PATCH 2/3] Create a driver to support the hardware monitoring chip
>  [PATCH 3/3] Add an entry for the hardware monitoring MCU
>
>  Documentation/devicetree/bindings/hwmon/nsa320-mcu.txt |  21 +++++++=
+
>  arch/arm/boot/dts/kirkwood-nsa320.dts                  |  13 ++++-
>  drivers/hwmon/Kconfig                                  |  13 +++++
>  drivers/hwmon/Makefile                                 |   1 +
>  drivers/hwmon/nsa3xx-hwmon.c | 223
> +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++++++++
>  5 files changed, 269 insertions(+), 2 deletions(-)

--=20
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
