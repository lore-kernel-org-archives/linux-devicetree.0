From: Jonas Gorski <jonas.gorski@gmail.com>
Subject: Re: [RFC] MIPS: BCM63XX: add Device Tree glue code for IRQ handling
Date: Wed, 14 Nov 2012 13:09:59 +0100
Message-ID: <CAOiHx==Ufghuf8Oans2VV4eZ1LusdJH4rwq=oos_pM3_y0-omg@mail.gmail.com>
References: <1352638249-29298-1-git-send-email-jonas.gorski@gmail.com>
 <1352638249-29298-5-git-send-email-jonas.gorski@gmail.com> <50A1D3FC.9010207@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <50A1D3FC.9010207@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: linux-mips@linux-mips.org, devicetree-discuss@lists.ozlabs.org, Kevin Cernekee <cernekee@gmail.com>, linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>, Maxime Bizon <mbizon@freebox.fr>, Florian Fainelli <florian@openwrt.org>
List-Id: devicetree@vger.kernel.org

On 13 November 2012 06:00, Stephen Warren <swarren@wwwdotorg.org> wrote:
> On 11/11/2012 05:50 AM, Jonas Gorski wrote:
>> Register IRQ domains through Device Tree for the internal and external
>> interrupt controllers. Register the same IRQ ranges as previously to
>> provide backward compatibility for non-DT drivers.
>
>> diff --git a/Documentation/devicetree/bindings/mips/bcm63xx/epic.txt b/Documentation/devicetree/bindings/mips/bcm63xx/epic.txt
>
> Rather than putting binding docs in an arch-specific directory, perhaps
> put them into a device-type-specific directory, such as
> bindings/interrupt-controller/brcm,bcm63xx-epic.txt?

Almost everyone has their interrupt-controller bindings in
$arch/$platform, but if interrupt-controller is the preferred
location, I can certainly move it there; I have no hard preference for
any location.

>
>> +- #interrupt-cells: <2>
>> +  This controller supports level and edge triggered interrupts. The
>> +  first cell is the interrupt number, the second is a 1:1 mapping to
>> +  the linux interrupt flags.
>
> The DT documentation should be self-contained, and not reference
> anything OS-specific. In this case, you could reference
> Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
> for the interrupt flags.

Good Idea, I'll do that for the next iteration.

>> diff --git a/arch/mips/bcm63xx/dts/bcm6328.dtsi b/arch/mips/bcm63xx/dts/bcm6328.dtsi
>
>>               ranges = <0 0x10000000 0x20000>;
>>               compatible = "simple-bus";
>> +
>> +             interrupt-parent = <&ipic>;
>> +
>> +             perf@0 {
>> +                     epic: interrupt-controller@18 {
>
> Don't you need some reg properties in the perf and interrupt-controller
> nodes so that the register address can be determined?

Since there is no support code for that property yet I did not add it.
I haven't quite finished yet how the final bindings will be (since
there are/were a few things I haven't finished researching yet, e.g.
how this controller works in SMP context, and how interrupt
controllers are supposed to work).

I can add all expected properties now and add support for them later,
but I feel that this might add properties that will then never
supported, and nobody updates the documentation for that, so I'd
rather like to keep the documentation/dts(i) in sync with what the
actual code expects/supports.


Jonas
