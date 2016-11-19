From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: Re: specifying order of /dev/mmcblk devices via device-tree?
Date: Fri, 18 Nov 2016 17:23:22 -0800
Message-ID: <f07a7474de83ed8185f898deb70ffab6@agner.ch>
References: <CAJ+vNU1g8nQedd06LeaD10YWUQ_UmdRToUMFKaTNT1aNY56b0g@mail.gmail.com>
 <20161028153755.GL5806@leverpostej>
 <CAPDyKFrpqmvVAKsfQBP1m7vdOjPRx7puVkmmCe3yxe1gVFwgzw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAPDyKFrpqmvVAKsfQBP1m7vdOjPRx7puVkmmCe3yxe1gVFwgzw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tim Harvey <tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2016-11-16 06:45, Ulf Hansson wrote:
> On 28 October 2016 at 17:37, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> wrote:
>> On Fri, Oct 28, 2016 at 08:23:04AM -0700, Tim Harvey wrote:
>>> Greetings,
>>>
>>> I have an IMX6 board that has the following:
>>> sdhc1: mmc0: sdio radio
>>> sdhc2: mmc1: /dev/mmcblk1: microSD connector
>>> sdhc3: mmc2: /dev/mmcblk2: on-board eMMC
>>>
>>> I would like to have sdhc3 registered as /dev/mmcblk0 and sdhc2
>>> registered as /dev/mmcblk1 so that permanent storage is the first
>>> mmcblk device as I think this is more intuitive however currently
>>> these get instanced in the order they appear in the imx6qdl.dtsi
>>> device-tree configuration and are not able to be mapped the way I want
>>> them in my dts file.
>>>
>>> Is there a way, or if not is there a desire for a way, to specify the
>>> order of /dev/mmcblk devices via device-tree?
>>
>> As with many other devices, there is no standard way of controlling the
>> Linux enumeration (and given the ID space is shared with other dynamic
>> devices it's not something that could generally work).
>>
>> These should be refererd to by UUID if possible.
>>
>> If not, we could cosider adding a by-dt-path or something like that.
> 
> So does that mean you think using "DT aliases" would be okay? As
> Javier pointed out, there have been some attempts [1] for that, but
> they didn't make it.
> Perhaps we need to re-consider, and if so please re-review the DT
> bindings patch from that series.

I really would like to see some sort of stable MMC block device
ordering.

by-dt-path solutions requires initramfs, which adds complexity and boot
time. Both not very welcome in simple embedded devices.

PARTUUID is relying on a particular instance of a partition, which is
not the same as to say boot from the second partition of device X.

The main problem I see in my patchset is that it works around the fact
MMC is a bus. Adding the mmc controller number to the block device name
would avoid that issue (mmc0blk0...), not sure if a such a drastic
change would be acceptable.

--
Stefan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
