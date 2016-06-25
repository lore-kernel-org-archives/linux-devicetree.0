From: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH 1/2] ubi: mount partitions specified in device tree
Date: Sat, 25 Jun 2016 22:20:45 +0200
Message-ID: <aedd029f-858b-97f8-7fc7-f224999ed24c@hauke-m.de>
References: <1466277476-14853-1-git-send-email-hauke@hauke-m.de>
 <5765A14F.6020201@nod.at> <48242f26-7812-6957-6bf5-c12989b875b4@hauke-m.de>
 <CAAEAJfC8mYnohRxKg0b-onbGadk0vPDty=7Bh8emP92mazB=aA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAAEAJfC8mYnohRxKg0b-onbGadk0vPDty=7Bh8emP92mazB=aA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ezequiel Garcia <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
Cc: Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Artem Bityutskiy <dedekind1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 06/24/2016 08:28 PM, Ezequiel Garcia wrote:
> On 18 June 2016 at 16:35, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org> wrote:
>> On 06/18/2016 09:30 PM, Richard Weinberger wrote:
>>> Am 18.06.2016 um 21:17 schrieb Hauke Mehrtens:
>>>> This makes it possible to open a ubi layer in device tree, this is
>>>> helpful when the rootfs is on a ubi layer. It loops though all mtd
>>>> partitions and mounts the partition which is compatible with
>>>> "ubi,volume". The same was only possible with kernel command line
>>>> arguments before.
>>>>
>>>> Signed-off-by: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
>>>> ---
>>>>  Documentation/devicetree/bindings/mtd/ubi.txt | 33 ++++++++++++++
>>>>  drivers/mtd/ubi/block.c                       | 63 +++++++++++++++++++++++++++
>>>>  2 files changed, 96 insertions(+)
>>>>  create mode 100644 Documentation/devicetree/bindings/mtd/ubi.txt
>>>
>>> Some time ago I thought about an UBI DT binding too, but
>>> I have been told that device tree is only for describing the hardware
>>> and nothing else.
>>> So I fear this will be rejected by DT folks.
>>
>> There are some devices on the market that are storing the root file
>> system in an ubi layer.
>> To make this work there are currently two options.
>> 1. patch the kernel to specify which partitions to open in the code.
> 
> I wouldn't go as far as to claim this an option.

I would also not do this, but when you look into the Linux patches of
"professional" embedded devices you see many strange things.

> 
>> 2. provide some kernel command line parameter which specifies what to open.
>>
> 
> There's another option: use an initramfs, where you can do whatever you want
> to find your UBI and mount it.

An initramfs probably needs some 10 to 100 KBytes of additional memory
on the flash chip and we only have 4 MBytes on some devices for the
bootloader, kernel and rootfs, adding 100 KBytes there is a significant
amount of memory. Instead of adding a initramfs I would like to be able
to define the rootfs somewhere in device tree and not by adding a
bootargs line into device tree. These particular patches are probably
the wrong way, but nobody told me how to do this in a better way.

> Frankly, I don't see a real need for this in the devicetree, other than solving
> someone's particular workflow/use case.


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
