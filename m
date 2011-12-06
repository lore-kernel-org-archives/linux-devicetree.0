From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 09/17] tegra: usb: fdt: Add additional device tree
 definitions for USB ports
Date: Tue, 06 Dec 2011 13:28:54 -0700
Message-ID: <4EDE7B06.7060401@nvidia.com>
References: <1322878300-5551-1-git-send-email-sjg@chromium.org>	<1322878300-5551-10-git-send-email-sjg@chromium.org>	<4EDD52D4.7090906@nvidia.com>
 <CAPnjgZ1J_cOS_E+ZiDoZUh79V7LUFzVkx-0nhbPTDwuGCGvDnQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAPnjgZ1J_cOS_E+ZiDoZUh79V7LUFzVkx-0nhbPTDwuGCGvDnQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Remy Bohmer <linux-SYUVB/VFmdasTnJN9+BGXg@public.gmane.org>, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Tom Warren <TWarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Albert ARIBAUD <albert.u.boot-LhW3hqR2+23R7s880joybQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 12/05/2011 05:55 PM, Simon Glass wrote:
> On Mon, Dec 5, 2011 at 3:25 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>> On 12/02/2011 07:11 PM, Simon Glass wrote:
>>> This adds peripheral IDs and timing information to the USB part of the
>>> device tree for U-Boot.
>>>
>>> The peripheral IDs provide easy access to clock registers. We will likely
>>> remove this in favor of a full clock tree when it is available in the
>>> kernel (but probably still retain the peripheral ID, just move it into
>>> a clock node).
>>>
>>> The USB timing information does apparently vary between boards sometimes,
>>> so is include in the fdt for convenience.
>>
>> Which parts vary? Most of it is PLL configuration, and it seems
>> basically impossible for that to vary yet still create the correct
>> output frequency.
> 
> See here for T30 differences, for example.
> 
> https://gerrit.chromium.org/gerrit/#patch,sidebyside,12440,1,board/nvidia/cardhu/tegra30.dtsi

OK, so that varies by SoC not board.

>>> +/* This table has USB timing parameters for each Oscillator frequency we
>>> + * support. There are four sets of values:
>>> + *
>>> + * 1. PLLU configuration information (reference clock is osc/clk_m and
>>> + * PLLU-FOs are fixed at 12MHz/60MHz/480MHz).
>>> + *
>>> + *  Reference frequency     13.0MHz      19.2MHz      12.0MHz      26.0MHz
>>> + *  ----------------------------------------------------------------------
>>> + *      DIVN                960 (0x3c0)  200 (0c8)    960 (3c0h)   960 (3c0)
>>> + *      DIVM                13 (0d)      4 (04)       12 (0c)      26 (1a)
>>> + * Filter frequency (MHz)   1            4.8          6            2
>>> + * CPCON                    1100b        0011b        1100b        1100b
>>> + * LFCON0                   0            0            0            0
>>> + *
>>> + * 2. PLL CONFIGURATION & PARAMETERS for different clock generators:
>>> + *
>>> + * Reference frequency     13.0MHz         19.2MHz         12.0MHz     26.0MHz
>>> + * ---------------------------------------------------------------------------
>>> + * PLLU_ENABLE_DLY_COUNT   02 (0x02)       03 (03)         02 (02)     04 (04)
>>> + * PLLU_STABLE_COUNT       51 (33)         75 (4B)         47 (2F)    102 (66)
>>> + * PLL_ACTIVE_DLY_COUNT    05 (05)         06 (06)         04 (04)     09 (09)
>>> + * XTAL_FREQ_COUNT        127 (7F)        187 (BB)        118 (76)    254 (FE)
>>
>> Those two sets of data seem like they should simply be part of the clock
>> driver. Some part of the system boot or USB init process needs to say
>> "enable the USB clocks", and that code needs to write those hard-coded
>> values into the relevant clock registers (or calculate them at run-time;
>> whatever). This stuff can't vary by board.
> 
> We don't have a USB clock driver. This driver is in CPU code, so I am
> not suggesting that it varies by board, only by SOC. This stuff is in
> the SOC dts.
>>
>>> + * 3. Debounce values IdDig, Avalid, Bvalid, VbusValid, VbusWakeUp, and
>>> + * SessEnd. Each of these signals have their own debouncer and for each of
>>> + * those one out of two debouncing times can be chosen (BIAS_DEBOUNCE_A or
>>> + * BIAS_DEBOUNCE_B).
>>> + *
>>> + * The values of DEBOUNCE_A and DEBOUNCE_B are calculated as follows:
>>> + *    0xffff -> No debouncing at all
>>> + *    <n> ms = <n> *1000 / (1/19.2MHz) / 4
>>> + *
>>> + * So to program a 1 ms debounce for BIAS_DEBOUNCE_A, we have:
>>> + * BIAS_DEBOUNCE_A[15:0] = 1000 * 19.2 / 4  = 4800 = 0x12c0
>>> + *
>>> + * We need to use only DebounceA for BOOTROM. We don't need the DebounceB
>>> + * values, so we can keep those to default.
>>> + *
>>> + * a4. The 20 microsecond delay after bias cell operation.
>>
>>      ^ typo
>>
>>> + *  Reference frequency     13.0MHz      19.2MHz      12.0MHz      26.0MHz
>>
>> If this data varies at all, then those two sets of data seem
>> port-specific to me, and hence should be moved into a per-port property.
>> Having a single global set of parameters that gets applied to all ports
>> at once doesn't make sense to me, if the data varies.
> 
> The hardware doesn't support this does it?

It looks like it doesn't; there are two debounce count registers and
each port (or something) can select which of those two debounce values
is used.

>> I imagine the values are board specific too, and hence shouldn't be in
>> tegra20.dtsi but rather in tegra-seaboard.dts.
> 
> I believe they vary by SOC, not board.

>> The values in these fields should be specific in a way that's agnostic
>> to the reference clock, e.g. as a number of mS/nS. That way, you'd just
>> specify the single set of values to use, and the driver would do the
>> calculations to map the time domain into the reference-clock-specific
>> values to put into the registers.
> 
> Yes I agree. I don't have time to write this. Shall we go forward with
> what we have, and Nvidia can tidy up later?

I definitely oppose that; the current bindings are simply not
conceptually correct. I'm opposed to merging something that's known to
be broken even if there's a clear intent/timeframe to fix it; it'd be
better to just defer merging it. (Well, even better to fix it to be
right an merge it!)

As a blanket statement, the USB driver shouldn't programming PLLs. This
applies whether the PLL configuration is hard-coded in the driver, is
parsed from DT, or whatever. We should definitely remove all the PLL
related stuff from the DT bindings, and have some core or board specific
code set up the PLLs. That code can be replaced by DT clock parsing when
its ready. The USB driver shouldn't be impacted by that change at all.

Re: the debounce values: The kernel doesn't touch those registers as far
as I can tell and everything works. I'd suggest completely removing that
from the DT bindings for now. It's quite possible it only works because
the HW register defaults are correct (or at least work OK) for a 12MHz
reference crystal, and all boards supported by the kernel just happen to
use that reference frequency, but I think the same is probably true for
(Tegra boards in) U-Boot right now too.

Taking that approach, you can completely remove the contentious parts of
the DT binding and defer the problem until more infra-structure is in
place to support those features.

>>> +
>>>       usb@c5000000 {
>>>               compatible = "nvidia,tegra20-ehci", "usb-ehci";
>>>               reg = <0xc5000000 0x4000>;
>>>               interrupts = < 52 >;
>>>               phy_type = "utmi";
>>> +             periph-id = <22>;       // PERIPH_ID_USBD
>>
>> Given this is a temporary U-Boot-specific solution, can the property be
>> named u-boot,periph-id so it's obvious that when writing a .dts for the
>> kernel only, you don't care about this value.
> 
> ok. I suggest the kernel does something similar.

The kernel will use the standardized clock bindings once they're ready
and we convert Tegra over to use them. The kernel is extremely unlikely
to ever use "periph-id" or "u-boot,periph-id".

Right now, the kernel's clock driver contains a mapping table from
device name (e.g. tegra-ehci.2) to clock name (e.g. usb3). This allows
the kernel USB driver to work without any explicit periph-id or similar
DT property.

I'd strongly suggest that's the cleanest transition plan for U-Boot
until the clock bindings are complete, and they are added to
tegra20.dtsi, and U-Boot can parse them, since it avoids temporarily
defining DT properties to WAR the issue, and then yanking them out
later. This mapping would be a part of the core Tegra SoC code,
completely isolated from the USB driver.

-- 
nvpublic
