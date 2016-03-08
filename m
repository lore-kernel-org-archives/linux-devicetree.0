From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v4 0/3] driver for the hardware monitoring chip in the Zyxel NSA320
Date: Tue, 08 Mar 2016 14:01:06 +0100
Message-ID: <87mvq93yzx.fsf@free-electrons.com>
References: <1457192097-32538-1-git-send-email-linux@baker-net.org.uk>
	<20160308115506.GA25899@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160308115506.GA25899-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org> (Guenter Roeck's message of
	"Tue, 8 Mar 2016 03:55:06 -0800")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Adam Baker <linux-u8Lxuz9p/S1csCcyGdaD/Q@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jean Delvare <jdelvare-IBi9RG/b67k@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, lm-sensors-GZX6beZjE8VD60Wz+7aTrA@public.gmane.org, carl.wolfgang-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Adam and Guenter,
 
 On mar., mars 08 2016, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org> wrote:

> On Sat, Mar 05, 2016 at 03:34:54PM +0000, Adam Baker wrote:
>>  Documentation/devicetree/bindings/hwmon/nsa320-mcu.txt |  21 +++++
>>  Documentation/hwmon/nsa320                             |  53 +++++++++++
>>  arch/arm/boot/dts/kirkwood-nsa320.dts                  |  13 ++-
>>  drivers/hwmon/Kconfig                                  |  15 +++
>>  drivers/hwmon/Makefile                                 |   1 +
>>  drivers/hwmon/nsa320-hwmon.c                           | 216 ++++++++++++++++++++++++++++++++++++++++++++
>>  6 files changed, 317 insertions(+), 2 deletions(-)
>> 
> Patch 1/3 and 2/3 applied to hwmon-next.
>
> I assume that patch 3/3 will go through the arm tree.

Yes but now that the rc7 was released is too late putting it to arm-soc
for the 4.6 kernel.

Gregory

>
> Guenter

-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
