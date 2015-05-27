From: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH 5/7] mtd: brcmnand: add bcma driver
Date: Thu, 28 May 2015 00:18:30 +0200
Message-ID: <556642B6.70608@hauke-m.de>
References: <1431877266-28566-1-git-send-email-hauke@hauke-m.de> <1431877266-28566-6-git-send-email-hauke@hauke-m.de> <20150520003402.GC11598@ld-irv-0074> <CACna6rzBn3yzzER56aAmk+VPNiMh9ikA3B1YZmMesF=3DWdq+A@mail.gmail.com> <20150520184028.GF11598@ld-irv-0074> <CACna6rwc=Qudqw8e3N9SO7xEGZCx=LgwrBEVqzJHi9KMSjhyVw@mail.gmail.com> <20150527001833.GB27753@ld-irv-0074>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150527001833.GB27753@ld-irv-0074>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?B?UmFmYcWCIE1pxYJl?= =?UTF-8?B?Y2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 05/27/2015 02:18 AM, Brian Norris wrote:
> On Thu, May 21, 2015 at 09:51:11AM +0200, Rafa=C5=82 Mi=C5=82ecki wro=
te:
>> On 20 May 2015 at 20:40, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> =
wrote:
>>> On Wed, May 20, 2015 at 08:39:06AM +0200, Rafa=C5=82 Mi=C5=82ecki w=
rote:
>>>> On 20 May 2015 at 02:34, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org=
> wrote:
>>>>> On Sun, May 17, 2015 at 05:41:04PM +0200, Hauke Mehrtens wrote:
>>>>>> This driver registers at the bcma bus and drives the NAND core i=
f it
>>>>>> was found on this bus. The bcma bus with this NAND core is used =
on the
>>>>>> bcm53xx and bcm47xx Northstar SoC with ARM CPU cores. The memory=
 ranges
>>>>>> are automatically detected by bcma and the irq numbers read from=
 device
>>>>>> tree by bcma bus driver.
>>>>>
>>>>> If you're going to use device tree for part of it (IRQs) why not =
the
>>>>> whole thing?
>>>>>
>>>>>> This is based on the iproc driver.
>>>>>
>>>>> This looks like you could probably get by with just using iproc_n=
and.c
>>>>> as-is. The main NAND core is apparently MMIO-accessible on your c=
hips,
>>>>> so aren't the BCMA bits you're touching also?
>>>>
>>>> That's right, in case of SoCs cores are MMIO-accessible, however I=
 see
>>>> few reasons for writing this driver as bcma based:
>>>> 1) MMIO access isn't available for bcma bus /hosted/ on PCIe devic=
es.
>>>> By using bcma layer we write generic drivers.
>>>
>>> I strongly doubt that this NAND core is ever put on a PCIe endpoint=
=2E
>>
>> Sure, but I still don't understand why you want to bypass some layer
>> that helps with stuff.
> [snip irrelevant examples]
>=20
> My motivation: don't duplicate code unnecessarily. iproc_nand is alre=
ady
> necessary, and it supports everything you need (see Hauke's patch, wh=
ich
> apparently supports these chips with no additional code).
>=20
> So when you say "helps with stuff", I ask "does it really help?", and
> "is it worth the duplicated driver?"
>=20
>>>> 2) bcma detects cores and their MMIO addresses automatically, if w=
e
>>>> are a bit lazy, it's easier to use it rather than keep hardcoding =
all
>>>> addresses
>>>
>>> Laziness is a pretty bad excuse. You already have to do 60% of the =
work
>>> by putting the IRQs and base NAND register range into the device tr=
ee.
>>> Finding those remaining two register addresses is not so hard.
>>
>> Lazy I was not checking dictionary for a better word.
>> IRQs are indeed read from DT, because hardware doesn't provide info =
about them.
>=20
> Nor does it provide information about chip selects, ECC requirements =
or
> partitioning.
>=20
>> However it's a different story for register ranges. We read them fro=
m
>> device's (bus's) EEPROM, not DT. Why is it important? One Broadcom S=
oC
>> chipset may have various cores (SoC devices)
>> available/enabled/disabled depending on the manufacturer. It means w=
e
>> *can't* store list of cores (SoC devices) per chip as it varies. An
>> example: some BCM4708 SoCs have 2 PCIe host cores, some have 3 of
>> them.
>=20
> Are those all true BCM4708? Or are they bondout variations of it, wit=
h a
> different name (e.g., BCM47081)?

They have a different marketing name and a different package number on
the technical side.
>=20
>> Reading info about cores from hardware (EEPROM) gives you an
>> answer.
>=20
> For BCMA to help in consolidating the other non-BCMA information into
> one place, you need *everything* about the NAND setup to be the same,
> except for the presence / absence of the NAND controller. That means =
all
> manufacturers must be using BCH-8 / 512-byte step ECC, and they must
> have placed it on the same chip-select.
>=20
> And are you ever seeing the NAND core completely disabled? In my
> experience, it has never been OTP'd out of any chip bondout.

I haven't seen it disabled on the ARM SoCs

> If my previous sentence holds true, then BCMA does indeed provide you
> absolutely nothing that you describe above for this case. I don't dou=
bt
> it helps you for some other cores, but I don't see that for NAND.
>=20
>> I can't really imagine storing such info per every possible
>> market device nor building such DTs. I would need to ask device owne=
r
>> to use bcma to read info about cores and them copy it into DT. I don=
't
>> really see the point. Please note that we are talking about every
>> single device model because there isn't anything like a set of few
>> generic PCB designs. Every manufacturer applies its own modification=
s.
>=20
> Are you sure it's done on a manufacturer-by-manufacturer basis?
> Typically, I see that Broadcom chips will support a superset of featu=
res
> on a base SoC, then subsequent boundouts of that SoC will provide a
> subset of those features (e.g., 2 PCIe hosts instead of 3). Each of
> those bondouts will have a different chip name and product ID, so
> technically you would see the same set of hardware for -- hypothetica=
lly
> -- all BCMabc, and a child chip of that family -- call it BCMabcd --
> might disable a few cores. So depending on the number of SoC bondouts=
,
> this may or may not be cumbersome. And particularly for NAND, I expec=
t
> the additional work may be zero.
>=20
>> I also can't see what's so wrong with this design. I understand you
>> put info about CPU in DT, but not all stuff goes there, right?
>=20
> A *lot* of stuff goes into DT. Enough that yes, you essentially need =
a
> new DT for every new board. So accounting for a few chip OTP options =
is
> not really out of scope of supporting a new board/chip.
>=20
>> E.g.
>> we don't put info about NAND flash connected to the controller. We
>> simply use ONFI (or some other semi-standards) to read chip info.
>> Should we now get rid of nand_flash_detect_onfi and
>> nand_flash_detect_jedec and store flash params in DT of every
>> supported device model?
>=20
> You're going a little bit down the straw man route of argument. That'=
s
> nothing like what I'm suggesting.
>=20
>>>> That said, I'm for using bcma layer, even if there is some small D=
T
>>>> involvement already.
>>>
>>> For any reasons besides the above? Cause I'm still not convinced we=
 need
>>> a BCMA driver at all.
>>
>> Could you tell me why we *don't* want to have bcma so much?
>=20
> It's duplicating code that already exists and supports the cores you
> want. If we find that there is enough of a significant difference, th=
en
> maybe we can justify a second driver. But IIUC, Hauke is showing that=
 it
> is trivial to support your chips with trivial DT additions and zero
> additional code.
>=20
> --
>=20
> On a slightly different track: if you really think BCMA+DT wins you a
> lot over a bare DT (I'm still not convinced), then maybe there's a wa=
y
> to make that work. What do you think of using BCMA to generate the DT
> automatically? Either in a pre-boot shim layer before the kernel, or =
as
> an in-kernel dynamic DT patch?

I do not think that would work, because bcma still has to support the
Broadcom PCIe wifi card with soft MAC wifi and the MIPS SoCs which are
not using device tree and havning both interfaces does not make sense t=
o me.

Hauke

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
