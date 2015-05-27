From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 5/7] mtd: brcmnand: add bcma driver
Date: Tue, 26 May 2015 17:18:33 -0700
Message-ID: <20150527001833.GB27753@ld-irv-0074>
References: <1431877266-28566-1-git-send-email-hauke@hauke-m.de>
 <1431877266-28566-6-git-send-email-hauke@hauke-m.de>
 <20150520003402.GC11598@ld-irv-0074>
 <CACna6rzBn3yzzER56aAmk+VPNiMh9ikA3B1YZmMesF=3DWdq+A@mail.gmail.com>
 <20150520184028.GF11598@ld-irv-0074>
 <CACna6rwc=Qudqw8e3N9SO7xEGZCx=LgwrBEVqzJHi9KMSjhyVw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACna6rwc=Qudqw8e3N9SO7xEGZCx=LgwrBEVqzJHi9KMSjhyVw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, May 21, 2015 at 09:51:11AM +0200, Rafa=C5=82 Mi=C5=82ecki wrote=
:
> On 20 May 2015 at 20:40, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> w=
rote:
> > On Wed, May 20, 2015 at 08:39:06AM +0200, Rafa=C5=82 Mi=C5=82ecki w=
rote:
> >> On 20 May 2015 at 02:34, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org=
> wrote:
> >> > On Sun, May 17, 2015 at 05:41:04PM +0200, Hauke Mehrtens wrote:
> >> >> This driver registers at the bcma bus and drives the NAND core =
if it
> >> >> was found on this bus. The bcma bus with this NAND core is used=
 on the
> >> >> bcm53xx and bcm47xx Northstar SoC with ARM CPU cores. The memor=
y ranges
> >> >> are automatically detected by bcma and the irq numbers read fro=
m device
> >> >> tree by bcma bus driver.
> >> >
> >> > If you're going to use device tree for part of it (IRQs) why not=
 the
> >> > whole thing?
> >> >
> >> >> This is based on the iproc driver.
> >> >
> >> > This looks like you could probably get by with just using iproc_=
nand.c
> >> > as-is. The main NAND core is apparently MMIO-accessible on your =
chips,
> >> > so aren't the BCMA bits you're touching also?
> >>
> >> That's right, in case of SoCs cores are MMIO-accessible, however I=
 see
> >> few reasons for writing this driver as bcma based:
> >> 1) MMIO access isn't available for bcma bus /hosted/ on PCIe devic=
es.
> >> By using bcma layer we write generic drivers.
> >
> > I strongly doubt that this NAND core is ever put on a PCIe endpoint=
=2E
>=20
> Sure, but I still don't understand why you want to bypass some layer
> that helps with stuff.
[snip irrelevant examples]

My motivation: don't duplicate code unnecessarily. iproc_nand is alread=
y
necessary, and it supports everything you need (see Hauke's patch, whic=
h
apparently supports these chips with no additional code).

So when you say "helps with stuff", I ask "does it really help?", and
"is it worth the duplicated driver?"

> >> 2) bcma detects cores and their MMIO addresses automatically, if w=
e
> >> are a bit lazy, it's easier to use it rather than keep hardcoding =
all
> >> addresses
> >
> > Laziness is a pretty bad excuse. You already have to do 60% of the =
work
> > by putting the IRQs and base NAND register range into the device tr=
ee.
> > Finding those remaining two register addresses is not so hard.
>=20
> Lazy I was not checking dictionary for a better word.
> IRQs are indeed read from DT, because hardware doesn't provide info a=
bout them.

Nor does it provide information about chip selects, ECC requirements or
partitioning.

> However it's a different story for register ranges. We read them from
> device's (bus's) EEPROM, not DT. Why is it important? One Broadcom So=
C
> chipset may have various cores (SoC devices)
> available/enabled/disabled depending on the manufacturer. It means we
> *can't* store list of cores (SoC devices) per chip as it varies. An
> example: some BCM4708 SoCs have 2 PCIe host cores, some have 3 of
> them.

Are those all true BCM4708? Or are they bondout variations of it, with =
a
different name (e.g., BCM47081)?

> Reading info about cores from hardware (EEPROM) gives you an
> answer.

=46or BCMA to help in consolidating the other non-BCMA information into
one place, you need *everything* about the NAND setup to be the same,
except for the presence / absence of the NAND controller. That means al=
l
manufacturers must be using BCH-8 / 512-byte step ECC, and they must
have placed it on the same chip-select.

And are you ever seeing the NAND core completely disabled? In my
experience, it has never been OTP'd out of any chip bondout.

If my previous sentence holds true, then BCMA does indeed provide you
absolutely nothing that you describe above for this case. I don't doubt
it helps you for some other cores, but I don't see that for NAND.

> I can't really imagine storing such info per every possible
> market device nor building such DTs. I would need to ask device owner
> to use bcma to read info about cores and them copy it into DT. I don'=
t
> really see the point. Please note that we are talking about every
> single device model because there isn't anything like a set of few
> generic PCB designs. Every manufacturer applies its own modifications=
=2E

Are you sure it's done on a manufacturer-by-manufacturer basis?
Typically, I see that Broadcom chips will support a superset of feature=
s
on a base SoC, then subsequent boundouts of that SoC will provide a
subset of those features (e.g., 2 PCIe hosts instead of 3). Each of
those bondouts will have a different chip name and product ID, so
technically you would see the same set of hardware for -- hypotheticall=
y
-- all BCMabc, and a child chip of that family -- call it BCMabcd --
might disable a few cores. So depending on the number of SoC bondouts,
this may or may not be cumbersome. And particularly for NAND, I expect
the additional work may be zero.

> I also can't see what's so wrong with this design. I understand you
> put info about CPU in DT, but not all stuff goes there, right?

A *lot* of stuff goes into DT. Enough that yes, you essentially need a
new DT for every new board. So accounting for a few chip OTP options is
not really out of scope of supporting a new board/chip.

> E.g.
> we don't put info about NAND flash connected to the controller. We
> simply use ONFI (or some other semi-standards) to read chip info.
> Should we now get rid of nand_flash_detect_onfi and
> nand_flash_detect_jedec and store flash params in DT of every
> supported device model?

You're going a little bit down the straw man route of argument. That's
nothing like what I'm suggesting.

> >> That said, I'm for using bcma layer, even if there is some small D=
T
> >> involvement already.
> >
> > For any reasons besides the above? Cause I'm still not convinced we=
 need
> > a BCMA driver at all.
>=20
> Could you tell me why we *don't* want to have bcma so much?

It's duplicating code that already exists and supports the cores you
want. If we find that there is enough of a significant difference, then
maybe we can justify a second driver. But IIUC, Hauke is showing that i=
t
is trivial to support your chips with trivial DT additions and zero
additional code.

--

On a slightly different track: if you really think BCMA+DT wins you a
lot over a bare DT (I'm still not convinced), then maybe there's a way
to make that work. What do you think of using BCMA to generate the DT
automatically? Either in a pre-boot shim layer before the kernel, or as
an in-kernel dynamic DT patch?

Brian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
