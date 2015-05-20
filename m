From: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH 5/7] mtd: brcmnand: add bcma driver
Date: Thu, 21 May 2015 00:10:52 +0200
Message-ID: <555D066C.6080200@hauke-m.de>
References: <1431877266-28566-1-git-send-email-hauke@hauke-m.de> <1431877266-28566-6-git-send-email-hauke@hauke-m.de> <20150520003402.GC11598@ld-irv-0074> <CACna6rzBn3yzzER56aAmk+VPNiMh9ikA3B1YZmMesF=3DWdq+A@mail.gmail.com> <20150520184028.GF11598@ld-irv-0074>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150520184028.GF11598@ld-irv-0074>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?B?UmFmYcWCIE1pxYJl?= =?UTF-8?B?Y2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 05/20/2015 08:40 PM, Brian Norris wrote:
> On Wed, May 20, 2015 at 08:39:06AM +0200, Rafa=C5=82 Mi=C5=82ecki wro=
te:
>> On 20 May 2015 at 02:34, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> =
wrote:
>>> On Sun, May 17, 2015 at 05:41:04PM +0200, Hauke Mehrtens wrote:
>>>> This driver registers at the bcma bus and drives the NAND core if =
it
>>>> was found on this bus. The bcma bus with this NAND core is used on=
 the
>>>> bcm53xx and bcm47xx Northstar SoC with ARM CPU cores. The memory r=
anges
>>>> are automatically detected by bcma and the irq numbers read from d=
evice
>>>> tree by bcma bus driver.
>>>
>>> If you're going to use device tree for part of it (IRQs) why not th=
e
>>> whole thing?
>>>
>>>> This is based on the iproc driver.
>>>
>>> This looks like you could probably get by with just using iproc_nan=
d.c
>>> as-is. The main NAND core is apparently MMIO-accessible on your chi=
ps,
>>> so aren't the BCMA bits you're touching also?

I will try this, I do not know if I have to reset or active the core
before using it, at least the vendor driver does so and I added it also=
=2E

>> That's right, in case of SoCs cores are MMIO-accessible, however I s=
ee
>> few reasons for writing this driver as bcma based:
>> 1) MMIO access isn't available for bcma bus /hosted/ on PCIe devices=
=2E
>> By using bcma layer we write generic drivers.
>=20
> I strongly doubt that this NAND core is ever put on a PCIe endpoint.

Me too and then my driver would not work, because I am forwarding the
memory directly to the driver and nothing would change the active core.

>> 2) bcma detects cores and their MMIO addresses automatically, if we
>> are a bit lazy, it's easier to use it rather than keep hardcoding al=
l
>> addresses
>=20
> Laziness is a pretty bad excuse. You already have to do 60% of the wo=
rk
> by putting the IRQs and base NAND register range into the device tree=
=2E
> Finding those remaining two register addresses is not so hard.
>=20
>> 3) There are some dependencies in cores initialization, e.g.
>> ChipCommon core usually has to be initialized first
>=20
> Are you aware of any important dependencies? Isn't it safe to assume
> that the ChipCommon core would have to be initialized way before any
> peripherals?

I think ChipCommon is less important on ARM, I do not came up with an
dependencies.

>=20
>> 4) bcma provides some helpers like bcma_core_enable so we don't have
>> to duplicate it in driver code
>=20
> I don't see why we need to reset/re-enable the NAND core in the kerne=
l
> at all, but if we do, this is touching the exact same registers as
> iproc_nand.c is already. So it makes sense to *share* that code, and =
do
> the same thing on both Cygnus and Northstar, etc. (And no, Cygnus can=
't
> convert to BCMA, so we can't do 100% sharing either way.)

Will this Broadcom plugin to the AXI bus which bcma uses be removed fro=
m
all newer SoCs or just from some SoC lines? If it will not be there in
any more recent SoC then we should also go for the older arm SoCs to a
more device tree only approach. Is Cygnus related to Northstar Plus or
Northstar 2?

>> That said, I'm for using bcma layer, even if there is some small DT
>> involvement already.
>=20
> For any reasons besides the above? Cause I'm still not convinced we n=
eed
> a BCMA driver at all.
>=20
> Brian
>=20

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
