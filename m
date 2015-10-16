From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/4] mtd: nand: Allow MTD_NAND_BRCMNAND to be selected
 for ARM64
Date: Fri, 16 Oct 2015 12:28:03 -0700
Message-ID: <56214FC3.2060002@gmail.com>
References: <1444986537-28387-1-git-send-email-anup.patel@broadcom.com> <5673177.0QYFhMPCBq@wuerfel> <20151016165445.GG108923@google.com> <7901695.AWo8cP6Hz1@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <7901695.AWo8cP6Hz1@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vikram Prakash <vikramp-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sandeep Tripathy <tripathy-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Pramod KUMAR <pramodku-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 16/10/15 12:25, Arnd Bergmann wrote:
> On Friday 16 October 2015 09:54:45 Brian Norris wrote:
>>> MTD_NAND_BRCMNAND uses the generic nand functions, but is currently allowed
>>> to be built without CONFIG_MTD_NAND, which results in a link error:
>>>
>>> drivers/built-in.o: In function `brcmnand_remove':
>>> coresight-replicator.c:(.text+0x17ae6c): undefined reference to `nand_release'
>>> drivers/built-in.o: In function `brcmnand_probe':
>>> coresight-replicator.c:(.text+0x17d4b4): undefined reference to `nand_scan_ident'
>>> coresight-replicator.c:(.text+0x17d948): undefined reference to `nand_scan_tail'
>>
>> How did you get this? MTD_NAND_BRCMNAND is surrounded in the
>> 'if MTD_NAND' block, which implicitly generates a MTD_NAND dependency.
>> And I can confirm that in menuconfig, I see this when I disable MTD_NAND
>> and search for BRCMNAND:
>>
>>    Symbol: MTD_NAND_BRCMNAND [=n]
>>    Type  : tristate
>>    Prompt: Broadcom STB NAND controller
>>      Location:
>>        -> Device Drivers
>>          -> Memory Technology Device (MTD) support (MTD [=y])
>>    (1)     -> NAND Device Support (MTD_NAND [=n])
>>      Defined at drivers/mtd/nand/Kconfig:394
>>      Depends on: MTD [=y] && MTD_NAND [=n] && (ARM [=y] || ARM64 || MIPS)
> 
> Sorry, can't reproduce it any more. My patch is dated June 4, so it was
> probably broken then but got fixed since. I normally try to verify that
> the patches are still needed before I send them, but this time I only
> saw the current discussion and remembered something vague about it
> and sent what I had in my backlog of the randconfig-fixes series.

It may have been a problem before this patch:

d80d942bcc8e1555a76774d20be9800cfef2d415 ("ARM: BCM: Do not select
CONFIG_MTD_NAND_BRCMNAND")
-- 
Florian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
