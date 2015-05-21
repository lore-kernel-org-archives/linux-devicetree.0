From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 5/7] mtd: brcmnand: add bcma driver
Date: Thu, 21 May 2015 09:51:11 +0200
Message-ID: <CACna6rwc=Qudqw8e3N9SO7xEGZCx=LgwrBEVqzJHi9KMSjhyVw@mail.gmail.com>
References: <1431877266-28566-1-git-send-email-hauke@hauke-m.de>
	<1431877266-28566-6-git-send-email-hauke@hauke-m.de>
	<20150520003402.GC11598@ld-irv-0074>
	<CACna6rzBn3yzzER56aAmk+VPNiMh9ikA3B1YZmMesF=3DWdq+A@mail.gmail.com>
	<20150520184028.GF11598@ld-irv-0074>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150520184028.GF11598@ld-irv-0074>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 20 May 2015 at 20:40, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wro=
te:
> On Wed, May 20, 2015 at 08:39:06AM +0200, Rafa=C5=82 Mi=C5=82ecki wro=
te:
>> On 20 May 2015 at 02:34, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> =
wrote:
>> > On Sun, May 17, 2015 at 05:41:04PM +0200, Hauke Mehrtens wrote:
>> >> This driver registers at the bcma bus and drives the NAND core if=
 it
>> >> was found on this bus. The bcma bus with this NAND core is used o=
n the
>> >> bcm53xx and bcm47xx Northstar SoC with ARM CPU cores. The memory =
ranges
>> >> are automatically detected by bcma and the irq numbers read from =
device
>> >> tree by bcma bus driver.
>> >
>> > If you're going to use device tree for part of it (IRQs) why not t=
he
>> > whole thing?
>> >
>> >> This is based on the iproc driver.
>> >
>> > This looks like you could probably get by with just using iproc_na=
nd.c
>> > as-is. The main NAND core is apparently MMIO-accessible on your ch=
ips,
>> > so aren't the BCMA bits you're touching also?
>>
>> That's right, in case of SoCs cores are MMIO-accessible, however I s=
ee
>> few reasons for writing this driver as bcma based:
>> 1) MMIO access isn't available for bcma bus /hosted/ on PCIe devices=
=2E
>> By using bcma layer we write generic drivers.
>
> I strongly doubt that this NAND core is ever put on a PCIe endpoint.

Sure, but I still don't understand why you want to bypass some layer
that helps with stuff. When I tried to implement whole SPI stuff in
bcm53xxspiflash, I was told to work on separated SPI host driver
instead. I did. When someone recently tried to workaround some SPI
host data limit, he was told to fix SPI host driver.
I don't see a reason why we're trying to skip the bcma layer for brcmna=
nd.


>> 2) bcma detects cores and their MMIO addresses automatically, if we
>> are a bit lazy, it's easier to use it rather than keep hardcoding al=
l
>> addresses
>
> Laziness is a pretty bad excuse. You already have to do 60% of the wo=
rk
> by putting the IRQs and base NAND register range into the device tree=
=2E
> Finding those remaining two register addresses is not so hard.

Lazy I was not checking dictionary for a better word.
IRQs are indeed read from DT, because hardware doesn't provide info abo=
ut them.

However it's a different story for register ranges. We read them from
device's (bus's) EEPROM, not DT. Why is it important? One Broadcom SoC
chipset may have various cores (SoC devices)
available/enabled/disabled depending on the manufacturer. It means we
*can't* store list of cores (SoC devices) per chip as it varies. An
example: some BCM4708 SoCs have 2 PCIe host cores, some have 3 of
them. Reading info about cores from hardware (EEPROM) gives you an
answer. I can't really imagine storing such info per every possible
market device nor building such DTs. I would need to ask device owner
to use bcma to read info about cores and them copy it into DT. I don't
really see the point. Please note that we are talking about every
single device model because there isn't anything like a set of few
generic PCB designs. Every manufacturer applies its own modifications.
I also can't see what's so wrong with this design. I understand you
put info about CPU in DT, but not all stuff goes there, right? E.g.
we don't put info about NAND flash connected to the controller. We
simply use ONFI (or some other semi-standards) to read chip info.
Should we now get rid of nand_flash_detect_onfi and
nand_flash_detect_jedec and store flash params in DT of every
supported device model?


>> 3) There are some dependencies in cores initialization, e.g.
>> ChipCommon core usually has to be initialized first
>
> Are you aware of any important dependencies? Isn't it safe to assume
> that the ChipCommon core would have to be initialized way before any
> peripherals?

On ARM we are left with ChipCommon only I believe. On MIPS we need to
also initialize MIPS core and on PCIe devices we have to initialize
PCIe core.


>> 4) bcma provides some helpers like bcma_core_enable so we don't have
>> to duplicate it in driver code
>
> I don't see why we need to reset/re-enable the NAND core in the kerne=
l
> at all, but if we do, this is touching the exact same registers as
> iproc_nand.c is already. So it makes sense to *share* that code, and =
do
> the same thing on both Cygnus and Northstar, etc. (And no, Cygnus can=
't
> convert to BCMA, so we can't do 100% sharing either way.)

I believe Cygnus differs from Northstar and handles
initialization/IRQs differently. I guess it doesn't need the same core
reset routing as bcma/Northstar performs? Don't worry, converting it
to bcma is the last thing I plan to do.


>> That said, I'm for using bcma layer, even if there is some small DT
>> involvement already.
>
> For any reasons besides the above? Cause I'm still not convinced we n=
eed
> a BCMA driver at all.

Could you tell me why we *don't* want to have bcma so much?

--=20
Rafa=C5=82
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
