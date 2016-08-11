From: Jon Mason <jon.mason@broadcom.com>
Subject: Re: [PATCH V3] clk: bcm: Add driver for Northstar ILP clock
Date: Thu, 11 Aug 2016 10:25:47 -0400
Message-ID: <CAC3K-4poMM=w-aFris55YK1OpMPF7zBrAkbUQO4+ubTgiWbSVQ@mail.gmail.com>
References: <1470830763-29189-1-git-send-email-zajec5@gmail.com>
 <CAC3K-4pvDjziC08fzRjHoi9Tb=smnmNMzfxgG60hqAy1yC13gA@mail.gmail.com>
 <CACna6rw8X_25m2s8in-OEL-Ve4-_K9b7fGSBsv6ccS9sOLa0oA@mail.gmail.com>
 <442a71de-7153-2204-2c05-cae6373fdd23@broadcom.com> <CAC3K-4pWS2SgdzHxJ6rcMmbYHYNwoCx9th0cp+wWeW=CQc+ySA@mail.gmail.com>
 <CACna6rz7ZxCyfg69093wjo1z-Q3UA9HQjx2QCiE=PFDBR5n3OQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <CACna6rz7ZxCyfg69093wjo1z-Q3UA9HQjx2QCiE=PFDBR5n3OQ@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Ray Jui <ray.jui@broadcom.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Eric Anholt <eric@anholt.net>, Florian Fainelli <f.fainelli@gmail.com>, Jon Mason <jonmason@broadcom.com>, Stephen Warren <swarren@wwwdotorg.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 11, 2016 at 4:49 AM, Rafał Miłecki <zajec5@gmail.com> wrote:
> On 10 August 2016 at 20:21, Jon Mason <jon.mason@broadcom.com> wrote:
>> On Wed, Aug 10, 2016 at 1:44 PM, Ray Jui <ray.jui@broadcom.com> wrote:
>>> On 8/10/2016 10:28 AM, Rafał Miłecki wrote:
>>>>
>>>> On 10 August 2016 at 19:22, Jon Mason <jon.mason@broadcom.com> wrote:
>>>>>
>>>>> On Wed, Aug 10, 2016 at 8:05 AM, Rafał Miłecki <zajec5@gmail.com> wrote:
>>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/clock/brcm,ns-ilp.txt
>>>>>> b/Documentation/devicetree/bindings/clock/brcm,ns-ilp.txt
>>>>>> new file mode 100644
>>>>>> index 0000000..a18c73f
>>>>>> --- /dev/null
>>>>>> +++ b/Documentation/devicetree/bindings/clock/brcm,ns-ilp.txt
>>>>>> @@ -0,0 +1,40 @@
>>>>>> +Broadcom Northstar ILP clock
>>>>>> +============================
>>>>>> +
>>>>>> +This binding uses the common clock binding:
>>>>>> +    Documentation/devicetree/bindings/clock/clock-bindings.txt
>>>>>> +
>>>>>> +This binding is used for ILP clock (sometimes referred as "slow clock")
>>>>>> +on Broadcom Northstar devices using Corex-A7 CPU.
>>>>>> +
>>>>>> +This clock is part of PMU (Power Management Unit), a Broadcom's device
>>>>>> +handing power-related aspects. Please note PMU contains more
>>>>>> subdevices,
>>>>>> +ILP is only one of them.
>>>>>> +
>>>>>> +ILP's rate has to be calculated on runtime and it depends on ALP clock
>>>>>> +which has to be referenced.
>>>>>> +
>>>>>> +Required properties:
>>>>>> +- compatible: "brcm,ns-ilp"
>>>>>> +- reg: iomem address range of PMU (Power Management Unit)
>>>>>> +- reg-names: "pmu", the only needed & supported reg right now
>>>>>> +- clocks: has to reference an ALP clock
>>>>>> +- #clock-cells: should be <0>
>>>>>> +
>>>>>> +Example:
>>>>>> +
>>>>>> +pmu@18012000 {
>>>>>> +       compatible = "simple-bus";
>>>>>> +       ranges = <0x00000000 0x18012000 0x00001000>;
>>>>>
>>>>>
>>>>> I don't see a corresponding DT entry in this patch, but 18012000 is
>>>>> the PCI block.  So, I am concerned this will collide if used there.
>>>>>
>>>>> I looked at the NS register reference guide, and I cannot find the
>>>>> registers you are trying to reference.  Is this supposed to be
>>>>> referencing the LCPLL clock registers in DMU?  If so, there is already
>>>>> a driver in there for this (see drivers/clk/bcm/clk-nsp.c).
>>>>
>>>>
>>>> This patch is for BCM53573 family, not BCM4708 family you are looking at.
>>>>
>>>> Found chip with id 53573, rev 0x02 and package 0x01
>>>> Core 0 found: ChipCommon (manuf 0x4BF, id 0x800, rev 0x36, class 0x0)
>>>> Core 1 found: IEEE 802.11 (manuf 0x4BF, id 0x812, rev 0x38, class 0x0)
>>>> Core 2 found: PCIe Gen 2 (manuf 0x4BF, id 0x501, rev 0x05, class 0x0)
>>>> Core 3 found: ARM CA7 (manuf 0x4BF, id 0x847, rev 0x00, class 0x0)
>>>> Core 4 found: USB 2.0 Host (manuf 0x4BF, id 0x819, rev 0x05, class 0x0)
>>>> Core 5 found: GBit MAC (manuf 0x4BF, id 0x82D, rev 0x08, class 0x0)
>>>> Core 6 found: I2S (manuf 0x4BF, id 0x834, rev 0x06, class 0x0)
>>>> Core 7 found: CNDS DDR2/3 memory controller (manuf 0x4BF, id 0x846,
>>>> rev 0x00, class 0x0)
>>>> Core 8 found: NAND flash controller (manuf 0x4BF, id 0x509, rev 0x01,
>>>> class 0x0)
>>>> Core 9 found: IEEE 802.11 (manuf 0x4BF, id 0x812, rev 0x38, class 0x0)
>>>> Core 10 found: GBit MAC (manuf 0x4BF, id 0x82D, rev 0x08, class 0x0)
>>>> Core 11 found: I2S (manuf 0x4BF, id 0x834, rev 0x06, class 0x0)
>>>> Core 12 found: GCI (manuf 0x4BF, id 0x840, rev 0x08, class 0x0)
>>>> Core 13 found: PMU (manuf 0x4BF, id 0x827, rev 0x1C, class 0x0)
>>>>
>>>
>>> Out of curiosity, I searched the datasheet and found this is a wireless
>>> router SoC done by the WLAN team. It happens to share some peripherals with
>>> other iProc based SoCs.
>>>
>>> I cannot find a code name for this SoC from our internal documents. I guess
>>> that name "Northstar" used here has confused both Jon and me.
>>
>> Ray is right.  I just spoke to one of the people here with knowledge
>> of the HW, and this is not related at all to the 4708/9/5301X.  It MAY
>> have some of the same peripherals, but the core is different (Cortex
>> A7 instead of A9).
>>
>> I think we are best off to change the name and turn this into a
>> separate device tree, driver base, etc.  I wasn't able to get a code
>> name, so perhaps simply call it "BCM53573".
>
> Yes, I said clearly it uses Corex-A7 in the commit message and
> Documentation entry.
>
> Florian already shared his doubts about BCM53573 belonging to the
> Northstar, but I found out [1] that your (Broadcom's) SDK treats it as
> Northstar device:
>
> Asus RT-AC1200G+
>
> # cat /proc/cpuinfo
> Processor : ARMv7 Processor rev 5 (v7l)
> BogoMIPS : 1795.68
> Features : swp half thumb fastmult edsp
> CPU implementer : 0x41
> CPU architecture: 7
> CPU variant : 0x0
> CPU part : 0xc07
> CPU revision : 5
>
> Hardware : Northstar Prototype
> Revision : 0000
> Serial : 0000000000000000
>
>
> It seems Broadcom's WLAN team claims it's a Northstar and you claim
> it's not. Could you discuss this internally and let us know, please?

I discussed it with a member of the WLAN team prior to my previous
email, which is why I made the previous statement.  It is a completely
different SoC than the 5301x family.  It appears that someone in
Marketing decided to reuse the name without discussing it with anyone
in WLAN SW.  It is a completely different family of products than the
iProc Northstar.  If we want to use the Northstar name, then perhaps
we could call it something like "WLAN Northstar".  Either way, it
needs to have a different mach-bcm entry.

BTW, neither Ray, nor I, (and not even Florian) are in the WLAN
Business unit.  So, the best that we can do is to ask around
internally and try to provide as much help as possible.

Thanks,
Jon

>
> [1] https://lkml.org/lkml/2016/7/29/345
>
> --
> Rafał
