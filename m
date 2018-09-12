Return-Path: <SRS0=2w4e=L2=gmail.com=f.fainelli@kernel.org>
Subject: Re: [PATCH v5 08/12] MIPS: BMIPS: add PCI bindings for 7425, 7435
References: <1536266581-7308-1-git-send-email-jim2101024@gmail.com>
 <1536266581-7308-9-git-send-email-jim2101024@gmail.com>
 <20180906214955.2yzyj6tkmflnnvdx@pburton-laptop>
 <CANCKTBumoy6mw2n+V7hN_T1SYxhq3JQMxgQUUSmOLuMX-Kv=zw@mail.gmail.com>
 <CAOiHx=khXs6x-EByPXRF=xEpL4eSiBfwxgJFV=3X8J5rXWNEMw@mail.gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <28c70637-c727-db23-d1ef-6f86c8b8dc45@gmail.com>
Date: Wed, 12 Sep 2018 10:20:23 -0700
MIME-Version: 1.0
In-Reply-To: <CAOiHx=khXs6x-EByPXRF=xEpL4eSiBfwxgJFV=3X8J5rXWNEMw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Jonas Gorski <jonas.gorski@gmail.com>, Jim Quinlan <jim2101024@gmail.com>
Cc: paul.burton@mips.com, linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Brian Norris <computersforpeace@gmail.com>, Gregory Fong <gregory.0xf0@gmail.com>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, Russell King <linux@armlinux.org.uk>, Ray Jui <ray.jui@broadcom.com>, Scott Branden <scott.branden@broadcom.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Ralf Baechle <ralf@linux-mips.org>, James Hogan <jhogan@kernel.org>, Kevin Cernekee <cernekee@gmail.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Arnd Bergmann <arnd@arndb.de>, nicolas.pitre@linaro.org, keescook@chromium.org, jinb.park7@gmail.com, vladimir.murzin@arm.com, alexandre.belloni@bootlin.com, palmer@sifive.com, stefan@agner.ch, eric@anholt.net, Simon Horman <horms+renesas@verge.net.au>, tony@atomide.com, stefan.wahren@i2se.com, Marek Szyprowski <m.szyprowski@samsung.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Olof Johansson <olof@lixom.net>, thellstrom@vmware.com, alexander.deucher@amd.com, dirk@hohndel.org, Thomas Gleixner <tglx@linutronix.de>, pombredanne@nexb.com, kstewart@linuxfoundation.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Robin Murphy <robin.murphy@arm.com>, justinpopo6@gmail.com, markus.mayer@broadcom.com, gpowell@broadcom.com, opendmb@gmail.com, linux-pci <linux-pci@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Linux-MIPS <linux-mips@linux-mips.org>, Christoph Hellwig <hch@lst.de>
List-ID: <devicetree@vger.kernel.org>



On 9/12/2018 7:36 AM, Jonas Gorski wrote:
> On 10 September 2018 at 16:37, Jim Quinlan <jim2101024@gmail.com> wrote:
>> On Thu, Sep 6, 2018 at 5:50 PM Paul Burton <paul.burton@mips.com> wrote:
>>>
>>> Hi Jim,
>>>
>>> On Thu, Sep 06, 2018 at 04:42:57PM -0400, Jim Quinlan wrote:
>>>> Adds the PCIe nodes for the Broadcom STB PCIe root complex.
>>>>
>>>> Signed-off-by: Jim Quinlan <jim2101024@gmail.com>
>>>> ---
>>>>   arch/mips/boot/dts/brcm/bcm7425.dtsi     | 28 ++++++++++++++++++++++++++++
>>>>   arch/mips/boot/dts/brcm/bcm7435.dtsi     | 28 ++++++++++++++++++++++++++++
>>>>   arch/mips/boot/dts/brcm/bcm97425svmb.dts |  4 ++++
>>>>   arch/mips/boot/dts/brcm/bcm97435svmb.dts |  4 ++++
>>>>   4 files changed, 64 insertions(+)
>>>
>>> Do you have a preference for how this gets merged? If it goes via the
>>> PCI tree then for patches 8 & 9:
>>>
>>>      Acked-by: Paul Burton <paul.burton@mips.com>
>>>
>> Hi Paul,
>>
>> I hope that the 12 commits  go together and will go through the PCI
>> tree.  I'm inclined to think I will have to do a V6, and in the cover
>> leter I will mention this request.
> 
> Somehow nothing of the v5 patch series seem to have made it to any
> mailing lists, at least I can't find them in my inbox (or spam) in any
> of the mailing lists, nor through the public archives of e.g. LKML.
> Patchwork (ozlabs and kernel) doesn't know of them either.

Indeed, that would explain why there has been little discussion on this....
-- 
Florian
