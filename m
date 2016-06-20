From: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH 1/2] ubi: mount partitions specified in device tree
Date: Mon, 20 Jun 2016 23:18:45 +0200
Message-ID: <f7f47b9d-b37c-712d-3319-585474277b41@hauke-m.de>
References: <20160619130514.GB820@makrotopia.org> <6411961.soYuJ4Ixfs@wuerfel>
 <5767A8A3.4030004@nod.at> <4012191.NTCe8d2REM@wuerfel>
 <57684AB9.5040607@nod.at>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <57684AB9.5040607-/L3Ra7n9ekc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Daniel Golle <daniel-g5gK2j5usbvCyp4qypjU+w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dedekind1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 06/20/2016 09:57 PM, Richard Weinberger wrote:
> Am 20.06.2016 um 17:08 schrieb Arnd Bergmann:
>>> Since blocks on a MTD can render bad you'd lose the table sooner or later.
>>> That's why we cannot store it on the MTD directly.
>>> Defining the table in DT is at least less ugly than using the mtdparts=
>>> kernel parameter.
>>
>> Right, there would be no benefit in using the kernel command line,
>> it just moves the information to another place inside of the same DT
>> (the /chosen property).
>>
>> I think you can normally rely on the first block being readable
>> on flash, in particular if you write it very rarely (when updating
>> the partition information), so it would be technically possible to
>> have a partition table in there, but in practice that's not how
>> things are done, so the argument is useless.
> 
> Speaking of NAND, only SLC (and also here not all) chips guarantee that the first
> block is better than the other ones.

Being able to define a rootfs the kernel should load with a /chosen
property would also be nice.

https://www.kernel.org/doc/Documentation/devicetree/bindings/chosen.txt

These UBI patches were just one step to make it possible to define the
root partition in device tree. It would probably be better to first look
on how to do that with normal mtd partitions and then see how to extend
that to UBI.

Currently I have to extend the boot args with these parameters to boot a
unmodified mainline kernel: "ubi.mtd=ubi ubi.block=0,rootfsA
root=/dev/ubiblock0_1"
This is a SquashFS in a UBI layer on a mtd partition. I know that I can
put this into the bootargs in a device tree file.

Hauke
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
