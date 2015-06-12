From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH 2/3] watchdog: bcm2835: Add poweroff code for the Raspberry
 Pi
Date: Fri, 12 Jun 2015 05:18:15 -0700
Message-ID: <557ACE07.3040104@roeck-us.net>
References: <1433845305-17329-1-git-send-email-noralf@tronnes.org> <1433845305-17329-2-git-send-email-noralf@tronnes.org> <557AC203.6060600@lategoodbye.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <557AC203.6060600-saaNCTdWVBT7BZbvpMY5sg@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Wahren <info-saaNCTdWVBT7BZbvpMY5sg@public.gmane.org>, =?UTF-8?B?Tm9yYWxmIFRyw7hubmVz?= <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 06/12/2015 04:26 AM, Stefan Wahren wrote:
> Hi Noralf,
>
> Am 09.06.2015 um 12:21 schrieb Noralf Tr=C3=B8nnes:
>> This adds a new poweroff function to the watchdog driver for the
>> Raspberry Pi. Currently poweroff/halt results in a reboot.
>>
>> [...]
>>
>> +static void rpi_power_off(void)
>> +{
>> +    struct device_node *np =3D
>> +        of_find_compatible_node(NULL, NULL, "brcm,raspberrypi-pm-wd=
t");
>> +    struct platform_device *pdev =3D of_find_device_by_node(np);
>> +    struct bcm2835_wdt *wdt =3D platform_get_drvdata(pdev);
>> +    u32 val;
>> +
>> +    val =3D readl_relaxed(wdt->base + PM_RSTS);
>
> do you think it's safe here to assume wdt could never be NULL?
>

If the call is made, the driver must be instantiated. We can therefore =
assume
that neither np, pdev, nor wdt is NULL. If one of those is NULL, it wou=
ld be
a bug, which should not be ignored.

Guenter

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdo=
g" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
