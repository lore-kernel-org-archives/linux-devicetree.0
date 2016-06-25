From: Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>
Subject: Re: [PATCH 1/2] ubi: mount partitions specified in device tree
Date: Sat, 25 Jun 2016 22:33:51 +0200
Message-ID: <576EEAAF.3090709@nod.at>
References: <1466277476-14853-1-git-send-email-hauke@hauke-m.de>
 <5765A14F.6020201@nod.at> <48242f26-7812-6957-6bf5-c12989b875b4@hauke-m.de>
 <CAAEAJfC8mYnohRxKg0b-onbGadk0vPDty=7Bh8emP92mazB=aA@mail.gmail.com>
 <aedd029f-858b-97f8-7fc7-f224999ed24c@hauke-m.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <aedd029f-858b-97f8-7fc7-f224999ed24c-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, Ezequiel Garcia <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Artem Bityutskiy <dedekind1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am 25.06.2016 um 22:20 schrieb Hauke Mehrtens:
>> There's another option: use an initramfs, where you can do whatever you want
>> to find your UBI and mount it.
> 
> An initramfs probably needs some 10 to 100 KBytes of additional memory
> on the flash chip and we only have 4 MBytes on some devices for the
> bootloader, kernel and rootfs, adding 100 KBytes there is a significant
> amount of memory. Instead of adding a initramfs I would like to be able
> to define the rootfs somewhere in device tree and not by adding a
> bootargs line into device tree. These particular patches are probably
> the wrong way, but nobody told me how to do this in a better way.

I think it is time to bring this discussion to a end.
It has been stated multiple times why DT is not the right thing for the
job and how all you need can be solved without an UBI DT binding.

Consider both patches as rejected.

Thanks,
//richard
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
