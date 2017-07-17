From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 1/2] clk: meson: meson8b: register the built-in reset controller
Date: Tue, 18 Jul 2017 00:22:57 +0200
Message-ID: <CAFBinCC5+5wwOckWsrTdNeio+t31TrfRAsaMbrOEP-qZgtEOmg@mail.gmail.com>
References: <20170711224939.26267-1-martin.blumenstingl@googlemail.com>
 <20170711224939.26267-2-martin.blumenstingl@googlemail.com> <20170717171329.nddlcslge6u33noc@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20170717171329.nddlcslge6u33noc@rob-hp-laptop>
Sender: linux-clk-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: linux-amlogic@lists.infradead.org, khilman@baylibre.com, carlo@caione.org, narmstrong@baylibre.com, jbrunet@baylibre.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux@armlinux.org.uk, mark.rutland@arm.com, mturquette@baylibre.com, sboyd@codeaurora.org, arnd@arndb.de
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Mon, Jul 17, 2017 at 7:13 PM, Rob Herring <robh@kernel.org> wrote:
> On Wed, Jul 12, 2017 at 12:49:38AM +0200, Martin Blumenstingl wrote:
>> The clock controller has a reset controller embedded. A large part of
>> the HHI_SYS_CPU_CLK_CNTL0 register contains reset bits. However, most of
>> them are only used by u-boot (as these are probably dangerous to use
>> when Linux is running).
>
> u-boot reads DT's. The DT should be defined for the h/w, not what you
> want for Linux today.
OK, that matches with your comment regarding splitting the patch below

>> Bits 27:24 are interesting though: these are the CPUx core soft reset
>> bits (bit 24 = CPU0 soft reset, bit 25 = CPU1 ...).
>>
>> This patch implements a reset controller for these bits. The reset
>> controller itself is registered early (through CLK_OF_DECLARE_DRIVER)
>> because it is neede very early in the boot process (to start the
>> secondary CPU cores).
>>
>> Other reset bits in the HHI_SYS_CPU_CLK_CNTL0 register, which are not
>> implemented by this patch (as these may never be used from within the
>> Linux kernel - and I don't want to add dead code):
>> - bit 30: L2 cache soft reset
>> - bit 29: AXI64to128 bridge (A5-to-MMC) soft reset (A5 interface)
>> - bit 28: SCU soft reset
>> - bit 18: A5 Global Reset
>> - bit 17: A5 AXI Soft Reset
>> - bit 16: A5 APB Soft Reset
>> - bit 15: GEN_DIV_SOFT_RESET
>> - bit 14: SOFT_RESET
>>
>> All information was taken from the public S805 Datasheet and Amlogic's
>> vendor GPL kernel sources. This patch is based on an earlier version
>> submitted by Carlo Caione.
>>
>> Suggested-by: Carlo Caione <carlo@endlessm.com>
>> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>> ---
>>  .../bindings/clock/amlogic,meson8b-clkc.txt        |   7 +-
>
> It's preferred to split bindings to a separate patch. Given all the
> commentary about Linux, I'd suggest you do that here (so the Linux
> details are gone from the binding patch).
you are right - I'll split this into a dt-bindings and a clk driver
patch and keep the commit messages appropriate for each patch

>>  drivers/clk/meson/Kconfig                          |   1 +
>>  drivers/clk/meson/meson8b.c                        | 109 ++++++++++++++++++---
>>  drivers/clk/meson/meson8b.h                        |   1 +
>>  4 files changed, 105 insertions(+), 13 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/amlogic,meson8b-clkc.txt b/Documentation/devicetree/bindings/clock/amlogic,meson8b-clkc.txt
>> index 606da38c0959..6f444e3867a0 100644
>> --- a/Documentation/devicetree/bindings/clock/amlogic,meson8b-clkc.txt
>> +++ b/Documentation/devicetree/bindings/clock/amlogic,meson8b-clkc.txt
>> @@ -16,18 +16,23 @@ Required Properties:
>>          mapped region.
>>
>>  - #clock-cells: should be 1.
>> +- #reset-cells: should be 1.
>>
>>  Each clock is assigned an identifier and client nodes can use this identifier
>>  to specify the clock which they consume. All available clocks are defined as
>>  preprocessor macros in the dt-bindings/clock/meson8b-clkc.h header and can be
>>  used in device tree sources.
>>
>> +The clock controller provides a (soft) reset line for each CPU core. Valid
>> +reset lines are 0, 1, 2 and 3 (one for each CPU core).
>
> I suspect you would have different numbering if you enumerate all the
> possible resets. Is it just this one register that has reset bits? If
> so, I'd suggest using the bit position as the cell values. If not, well,
> just enumerate them all.
there are more resets in this register area:
- "AXI64to128 bridge (A5-to-MMC) soft reset (MMC interface)": bit 30
in HHI_SYS_CPU_CLK_CNTL1
- SOFT_RESET: bit 15 in HHI_VID_CLK_CNTL
- some more bits with "reset" in their name (CLK_DIV_RESET = bit 17 in
HHI_VID_CLK_DIV, and four more in HHI_VID_DIVIDER_CNTL:
SOFT_RESET_POST, SOFT_RESET_PRE, RESET_N_POST, RESET_N_PRE)

Carlo's original patch added #defines (RST_CORE0...RST_CORE3) for each
CPU reset bit.
Arnd (I CC'ed him in this mail) suggested to skip the defines, see [0]
- which is what I did with this patch.

by looking at Amlogic's u-boot sources I can see that the following
reset bits are used:
- bits 30:28 and 18:16 from HHI_SYS_CPU_CLK_CNTL0 and bit 30 from
HHI_SYS_CPU_CLK_CNTL1 are used during Meson8b system suspend/wakeup
from suspend
- the four resets from HHI_VID_DIVIDER_CNTL are used to setup the "vid PLL div"

that leaves the following reset bits unused (hidden somewhere deep in the code):
- HHI_VID_CLK_CNTL bit 15 is used in Meson6's u-boot code - but only
in some #if 0'ed blocks
- SOFT_RESET: bit 15 in HHI_VID_CLK_CNTL
- bit 15:14 in HHI_SYS_CPU_CLK_CNTL0

so if you want I can add more reset bits I found to the driver and
introduce a #define for each reset.
I guess this would be find for Arnd as well (please speak up if it isn't).
however, I would only do this for the reset bits for which I could
find a consumer in Amlogic's vendor GPL kernel/u-boot code (as there's
not a lot documentation available, and I don't like guessing register
bit purposes based on a 12-character description from a stripped down
version of the SoC datasheet).

>> +
>>  Example: Clock controller node:
>>
>>       clkc: clock-controller@c1104000 {
>> -             #clock-cells = <1>;
>>               compatible = "amlogic,meson8b-clkc";
>>               reg = <0xc1108000 0x4>, <0xc1104000 0x460>;
>> +             #clock-cells = <1>;
>> +             #reset-cells = <1>;
>>       };
>>
>>

Regards,
Martin

[0] http://lists.infradead.org/pipermail/linux-arm-kernel/2015-December/390397.html
