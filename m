From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [RFT PATCH] ARM64: dts: meson-gxbb: Add reserved memory zone and
 usable memory range
Date: Mon, 16 Jan 2017 15:02:26 +0100
Message-ID: <a023733b-b5de-7591-1122-09beb56824ba@suse.de>
References: <20161212101801.28491-1-narmstrong@baylibre.com>
 <09bb78ed-c8ec-d21f-d464-16e55c481d4e@gmx.de>
 <56869b90-6bee-f6ae-a7b1-884b4c0d72c0@baylibre.com>
 <2ac01237-a7f8-5b3b-0f97-dd49ce6623fb@gmx.de>
 <90d5b5a3-6dd8-aab2-8701-112a10e3364c@gmx.de>
 <612bc7bc-4ee4-51c0-d7ac-06151854ac03@suse.de>
 <9a1dbb0b-ad3d-7898-3b43-fd8f85892985@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <9a1dbb0b-ad3d-7898-3b43-fd8f85892985-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org
Cc: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am 16.01.2017 um 11:26 schrieb Neil Armstrong:
> On 01/15/2017 04:44 PM, Andreas Färber wrote:
>> Am 23.12.2016 um 10:42 schrieb Heinrich Schuchardt:
>>> it really makes a difference if we write
>>>
>>>  	memory@0 {
>>>  		device_type = "memory";
>>>  		linux,usable-memory = <0x0 0x1000000 0x0 0x7f000000>;
>>>  	};
>>>
>>> or
>>>
>>>  	memory@0 {
>>>  		device_type = "memory";
>>>  		reg = <0x0 0x1000000 0x0 0x7f000000>;
>>>  	};
>>>
>>> The second version leads to failure of the Odroid C2.
>>>
>>> When I looked at /sys/firmware/fdt I saw this difference:
>>>
>>> --- fails
>>> +++ works
>>>
>>>         memory@0 {
>>> -               device_type = "memory";
>>>                 reg = <0x0 0x0 0x0 0x78000000>;
>>> +               device_type = "memory";
>>> +               linux,usable-memory = <0x0 0x1000000 0x0 0x7f000000>;
>>>         };
>>>
>>> I found the following sentence in the NXP forum:
>>> In case you want to overwrite the memory usage passed from u-boot, you
>>> can use "linux,usable-memory".
>>> https://community.nxp.com/thread/382284
>>
>> The Odroid-C2 is in mainline U-Boot. Please submit a patch to U-Boot
>> instead of forcing the creation of unnecessary new .dts files onto
>> everyone due to hardcoded linux,usable-memory properties. In fact, it
>> already reserves 0x1000000, so it seems you are merely using an older
>> U-Boot.
>>
>> http://git.denx.de/?p=u-boot.git;a=blob;f=arch/arm/mach-meson/board.c;h=f159cbf849f75ab046e6f3a025bbc97c0bcfd59d;hb=HEAD#l39
>>
>> I would bet that the upper limit is unrelated here.
>>
>> Regards,
>> Andreas
>>
> 
> Hi Andreas,
> 
> I really disagree about relying on any work or properties added by any bootloader here, Amlogic SoCs has
> a lot of u-boot version in the field, and the Odroid-C2 is part of this.
> 
> Even if Odroid-c2 is in mainline U-Boot or not, the mainline Linux kernel should work using
> any U-boot version even with the one provided by Amlogic on their openlinux distribution channel.

That is not the position of the kernel maintainers though. They
deliberately rely on timers being enabled before entering Linux, which
broke my afboot-stm32 (which I could fix) as well as s5pv210 and vf610
based platforms by F+S (which remain broken to date).

And I documented how to chainload mainline U-Boot from downstream
Amlogic U-Boot, so it is easily fixable on Meson. The only thing missing
is Carlo resubmitting his MMC patches.

A bug somewhere does not justify breaking the whole Meson-gx* .dts
design for everyone, especially not without CC'ing me as the original
creator!

Regards,
Andreas

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
