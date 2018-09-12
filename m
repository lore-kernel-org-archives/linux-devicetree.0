Return-Path: <SRS0=t87N=L2=gmail.com=jonas.gorski@kernel.org>
MIME-Version: 1.0
In-Reply-To: <CANCKTBumoy6mw2n+V7hN_T1SYxhq3JQMxgQUUSmOLuMX-Kv=zw@mail.gmail.com>
References: <1536266581-7308-1-git-send-email-jim2101024@gmail.com>
 <1536266581-7308-9-git-send-email-jim2101024@gmail.com> <20180906214955.2yzyj6tkmflnnvdx@pburton-laptop>
 <CANCKTBumoy6mw2n+V7hN_T1SYxhq3JQMxgQUUSmOLuMX-Kv=zw@mail.gmail.com>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Wed, 12 Sep 2018 16:36:54 +0200
Message-ID: <CAOiHx=khXs6x-EByPXRF=xEpL4eSiBfwxgJFV=3X8J5rXWNEMw@mail.gmail.com>
Subject: Re: [PATCH v5 08/12] MIPS: BMIPS: add PCI bindings for 7425, 7435
Content-Type: text/plain; charset="UTF-8"
To: Jim Quinlan <jim2101024@gmail.com>
Cc: paul.burton@mips.com, linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Brian Norris <computersforpeace@gmail.com>, Gregory Fong <gregory.0xf0@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, Russell King <linux@armlinux.org.uk>, Ray Jui <ray.jui@broadcom.com>, Scott Branden <scott.branden@broadcom.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Ralf Baechle <ralf@linux-mips.org>, James Hogan <jhogan@kernel.org>, Kevin Cernekee <cernekee@gmail.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Arnd Bergmann <arnd@arndb.de>, nicolas.pitre@linaro.org, keescook@chromium.org, jinb.park7@gmail.com, vladimir.murzin@arm.com, alexandre.belloni@bootlin.com, palmer@sifive.com, stefan@agner.ch, eric@anholt.net, Simon Horman <horms+renesas@verge.net.au>, tony@atomide.com, stefan.wahren@i2se.com, Marek Szyprowski <m.szyprowski@samsung.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Olof Johansson <olof@lixom.net>, thellstrom@vmware.com, alexander.deucher@amd.com, dirk@hohndel.org, Thomas Gleixner <tglx@linutronix.de>, pombredanne@nexb.com, kstewart@linuxfoundation.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Robin Murphy <robin.murphy@arm.com>, justinpopo6@gmail.com, markus.mayer@broadcom.com, gpowell@broadcom.com, opendmb@gmail.com, linux-pci <linux-pci@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Linux-MIPS <linux-mips@linux-mips.org>, Christoph Hellwig <hch@lst.de>
List-ID: <devicetree@vger.kernel.org>

On 10 September 2018 at 16:37, Jim Quinlan <jim2101024@gmail.com> wrote:
> On Thu, Sep 6, 2018 at 5:50 PM Paul Burton <paul.burton@mips.com> wrote:
>>
>> Hi Jim,
>>
>> On Thu, Sep 06, 2018 at 04:42:57PM -0400, Jim Quinlan wrote:
>> > Adds the PCIe nodes for the Broadcom STB PCIe root complex.
>> >
>> > Signed-off-by: Jim Quinlan <jim2101024@gmail.com>
>> > ---
>> >  arch/mips/boot/dts/brcm/bcm7425.dtsi     | 28 ++++++++++++++++++++++++++++
>> >  arch/mips/boot/dts/brcm/bcm7435.dtsi     | 28 ++++++++++++++++++++++++++++
>> >  arch/mips/boot/dts/brcm/bcm97425svmb.dts |  4 ++++
>> >  arch/mips/boot/dts/brcm/bcm97435svmb.dts |  4 ++++
>> >  4 files changed, 64 insertions(+)
>>
>> Do you have a preference for how this gets merged? If it goes via the
>> PCI tree then for patches 8 & 9:
>>
>>     Acked-by: Paul Burton <paul.burton@mips.com>
>>
> Hi Paul,
>
> I hope that the 12 commits  go together and will go through the PCI
> tree.  I'm inclined to think I will have to do a V6, and in the cover
> leter I will mention this request.

Somehow nothing of the v5 patch series seem to have made it to any
mailing lists, at least I can't find them in my inbox (or spam) in any
of the mailing lists, nor through the public archives of e.g. LKML.
Patchwork (ozlabs and kernel) doesn't know of them either.


Regards
Jonas
