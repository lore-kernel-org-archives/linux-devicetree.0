From: Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH v2 09/17] tegra: usb: fdt: Add additional
 device tree definitions for USB ports
Date: Tue, 6 Dec 2011 13:09:58 -0800
Message-ID: <CAPnjgZ035Cen11ObFXjKUCqypvVKzkewhfY2F=yGH8=RWxVuSA@mail.gmail.com>
References: <1322878300-5551-1-git-send-email-sjg@chromium.org>
	<1322878300-5551-10-git-send-email-sjg@chromium.org>
	<4EDD52D4.7090906@nvidia.com>
	<CAPnjgZ1J_cOS_E+ZiDoZUh79V7LUFzVkx-0nhbPTDwuGCGvDnQ@mail.gmail.com>
	<4EDE7B06.7060401@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <4EDE7B06.7060401@nvidia.com>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: Stephen Warren <swarren@nvidia.com>
Cc: U-Boot Mailing List <u-boot@lists.denx.de>, Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>, Tom Warren <TWarren@nvidia.com>
List-Id: devicetree@vger.kernel.org

Hi Stephen,

On Tue, Dec 6, 2011 at 12:28 PM, Stephen Warren <swarren@nvidia.com> wrote:
> On 12/05/2011 05:55 PM, Simon Glass wrote:
>> On Mon, Dec 5, 2011 at 3:25 PM, Stephen Warren <swarren@nvidia.com> wrot=
e:
>>> On 12/02/2011 07:11 PM, Simon Glass wrote:
>>>> This adds peripheral IDs and timing information to the USB part of the
>>>> device tree for U-Boot.
>>>>
>>>> The peripheral IDs provide easy access to clock registers. We will lik=
ely
>>>> remove this in favor of a full clock tree when it is available in the
>>>> kernel (but probably still retain the peripheral ID, just move it into
>>>> a clock node).
>>>>
>>>> The USB timing information does apparently vary between boards sometim=
es,
>>>> so is include in the fdt for convenience.
>>>
>>> Which parts vary? Most of it is PLL configuration, and it seems
>>> basically impossible for that to vary yet still create the correct
>>> output frequency.
>>
>> See here for T30 differences, for example.
>>
>> https://gerrit.chromium.org/gerrit/#patch,sidebyside,12440,1,board/nvidi=
a/cardhu/tegra30.dtsi
>
> OK, so that varies by SoC not board.

Yes that's why I put it in tegra20.dtsi. But I have removed it now.

>
>>>> +/* This table has USB timing parameters for each Oscillator frequency=
 we
>>>> + * support. There are four sets of values:
>>>> + *
>>>> + * 1. PLLU configuration information (reference clock is osc/clk_m and
>>>> + * PLLU-FOs are fixed at 12MHz/60MHz/480MHz).
>>>> + *
>>>> + * =A0Reference frequency =A0 =A0 13.0MHz =A0 =A0 =A019.2MHz =A0 =A0 =
=A012.0MHz =A0 =A0 =A026.0MHz
>>>> + * =A0---------------------------------------------------------------=
-------
>>>> + * =A0 =A0 =A0DIVN =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0960 (0x3c0) =A0200 =
(0c8) =A0 =A0960 (3c0h) =A0 960 (3c0)
>>>> + * =A0 =A0 =A0DIVM =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A013 (0d) =A0 =A0 =A0=
4 (04) =A0 =A0 =A0 12 (0c) =A0 =A0 =A026 (1a)
>>>> + * Filter frequency (MHz) =A0 1 =A0 =A0 =A0 =A0 =A0 =A04.8 =A0 =A0 =
=A0 =A0 =A06 =A0 =A0 =A0 =A0 =A0 =A02
>>>> + * CPCON =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A01100b =A0 =A0 =A0 =A0=
0011b =A0 =A0 =A0 =A01100b =A0 =A0 =A0 =A01100b
>>>> + * LFCON0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0 =A0 =A0 =A0 =A0 =A0 =
=A00 =A0 =A0 =A0 =A0 =A0 =A00 =A0 =A0 =A0 =A0 =A0 =A00
>>>> + *
>>>> + * 2. PLL CONFIGURATION & PARAMETERS for different clock generators:
>>>> + *
>>>> + * Reference frequency =A0 =A0 13.0MHz =A0 =A0 =A0 =A0 19.2MHz =A0 =
=A0 =A0 =A0 12.0MHz =A0 =A0 26.0MHz
>>>> + * ------------------------------------------------------------------=
---------
>>>> + * PLLU_ENABLE_DLY_COUNT =A0 02 (0x02) =A0 =A0 =A0 03 (03) =A0 =A0 =
=A0 =A0 02 (02) =A0 =A0 04 (04)
>>>> + * PLLU_STABLE_COUNT =A0 =A0 =A0 51 (33) =A0 =A0 =A0 =A0 75 (4B) =A0 =
=A0 =A0 =A0 47 (2F) =A0 =A0102 (66)
>>>> + * PLL_ACTIVE_DLY_COUNT =A0 =A005 (05) =A0 =A0 =A0 =A0 06 (06) =A0 =
=A0 =A0 =A0 04 (04) =A0 =A0 09 (09)
>>>> + * XTAL_FREQ_COUNT =A0 =A0 =A0 =A0127 (7F) =A0 =A0 =A0 =A0187 (BB) =
=A0 =A0 =A0 =A0118 (76) =A0 =A0254 (FE)
>>>
>>> Those two sets of data seem like they should simply be part of the clock
>>> driver. Some part of the system boot or USB init process needs to say
>>> "enable the USB clocks", and that code needs to write those hard-coded
>>> values into the relevant clock registers (or calculate them at run-time;
>>> whatever). This stuff can't vary by board.
>>
>> We don't have a USB clock driver. This driver is in CPU code, so I am
>> not suggesting that it varies by board, only by SOC. This stuff is in
>> the SOC dts.
>>>
>>>> + * 3. Debounce values IdDig, Avalid, Bvalid, VbusValid, VbusWakeUp, a=
nd
>>>> + * SessEnd. Each of these signals have their own debouncer and for ea=
ch of
>>>> + * those one out of two debouncing times can be chosen (BIAS_DEBOUNCE=
_A or
>>>> + * BIAS_DEBOUNCE_B).
>>>> + *
>>>> + * The values of DEBOUNCE_A and DEBOUNCE_B are calculated as follows:
>>>> + * =A0 =A00xffff -> No debouncing at all
>>>> + * =A0 =A0<n> ms =3D <n> *1000 / (1/19.2MHz) / 4
>>>> + *
>>>> + * So to program a 1 ms debounce for BIAS_DEBOUNCE_A, we have:
>>>> + * BIAS_DEBOUNCE_A[15:0] =3D 1000 * 19.2 / 4 =A0=3D 4800 =3D 0x12c0
>>>> + *
>>>> + * We need to use only DebounceA for BOOTROM. We don't need the Debou=
nceB
>>>> + * values, so we can keep those to default.
>>>> + *
>>>> + * a4. The 20 microsecond delay after bias cell operation.
>>>
>>> =A0 =A0 =A0^ typo
>>>
>>>> + * =A0Reference frequency =A0 =A0 13.0MHz =A0 =A0 =A019.2MHz =A0 =A0 =
=A012.0MHz =A0 =A0 =A026.0MHz
>>>
>>> If this data varies at all, then those two sets of data seem
>>> port-specific to me, and hence should be moved into a per-port property.
>>> Having a single global set of parameters that gets applied to all ports
>>> at once doesn't make sense to me, if the data varies.
>>
>> The hardware doesn't support this does it?
>
> It looks like it doesn't; there are two debounce count registers and
> each port (or something) can select which of those two debounce values
> is used.
>
>>> I imagine the values are board specific too, and hence shouldn't be in
>>> tegra20.dtsi but rather in tegra-seaboard.dts.
>>
>> I believe they vary by SOC, not board.
>
>>> The values in these fields should be specific in a way that's agnostic
>>> to the reference clock, e.g. as a number of mS/nS. That way, you'd just
>>> specify the single set of values to use, and the driver would do the
>>> calculations to map the time domain into the reference-clock-specific
>>> values to put into the registers.
>>
>> Yes I agree. I don't have time to write this. Shall we go forward with
>> what we have, and Nvidia can tidy up later?
>
> I definitely oppose that; the current bindings are simply not
> conceptually correct. I'm opposed to merging something that's known to
> be broken even if there's a clear intent/timeframe to fix it; it'd be
> better to just defer merging it. (Well, even better to fix it to be
> right an merge it!)
>
> As a blanket statement, the USB driver shouldn't programming PLLs. This
> applies whether the PLL configuration is hard-coded in the driver, is
> parsed from DT, or whatever. We should definitely remove all the PLL
> related stuff from the DT bindings, and have some core or board specific
> code set up the PLLs. That code can be replaced by DT clock parsing when
> its ready. The USB driver shouldn't be impacted by that change at all.
>
> Re: the debounce values: The kernel doesn't touch those registers as far
> as I can tell and everything works. I'd suggest completely removing that
> from the DT bindings for now. It's quite possible it only works because
> the HW register defaults are correct (or at least work OK) for a 12MHz
> reference crystal, and all boards supported by the kernel just happen to
> use that reference frequency, but I think the same is probably true for
> (Tegra boards in) U-Boot right now too.
>
> Taking that approach, you can completely remove the contentious parts of
> the DT binding and defer the problem until more infra-structure is in
> place to support those features.

Sorry - I think this was on another thread - but I am removing the fdt
bindings for USB timings from this series. We can deal with it later
as needed.

>
>>>> +
>>>> =A0 =A0 =A0 usb@c5000000 {
>>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "nvidia,tegra20-ehci", "usb=
-ehci";
>>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0xc5000000 0x4000>;
>>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D < 52 >;
>>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 phy_type =3D "utmi";
>>>> + =A0 =A0 =A0 =A0 =A0 =A0 periph-id =3D <22>; =A0 =A0 =A0 // PERIPH_ID=
_USBD
>>>
>>> Given this is a temporary U-Boot-specific solution, can the property be
>>> named u-boot,periph-id so it's obvious that when writing a .dts for the
>>> kernel only, you don't care about this value.
>>
>> ok. I suggest the kernel does something similar.
>
> The kernel will use the standardized clock bindings once they're ready
> and we convert Tegra over to use them. The kernel is extremely unlikely
> to ever use "periph-id" or "u-boot,periph-id".

What is the time frame on this working be completed and merged?\

>
> Right now, the kernel's clock driver contains a mapping table from
> device name (e.g. tegra-ehci.2) to clock name (e.g. usb3). This allows
> the kernel USB driver to work without any explicit periph-id or similar
> DT property.

Where does tegra-ehci.2 come from? I don't see that in the fdt.

U-Boot itself does not have a device name or a clock name, or even the
concept of a clock. FDT control has only just arrived in U-Boot and it
needs to fit with what exists in the code base. There needs to be a
multiple sub-arch refactoring effort which I am sure will be taken up
once the kernel completes its work. But this is not just an FDT thing.

>
> I'd strongly suggest that's the cleanest transition plan for U-Boot
> until the clock bindings are complete, and they are added to
> tegra20.dtsi, and U-Boot can parse them, since it avoids temporarily
> defining DT properties to WAR the issue, and then yanking them out
> later. This mapping would be a part of the core Tegra SoC code,
> completely isolated from the USB driver.

Tegra U-Boot already uses peripheral IDs internally - it's
considerably more efficient to be able to refer to a peripheral by a
number than a string. Putting these in the fdt makes it easy for fdt
code to use internal clocks, etc. One way or another the driver code
needs to figure out the peripheral ID. Please have a look at
arch/arm/cpu/armv7/tegra2/clock.c.

I hope that our efforts can continue while we wait for the kernel to
implement clocks. We can then look at writing the required plumbing
code which presumably will be common across ARM architectures, not
tegra-specific. That is going to need review within U-Boot also, and
it is not going to happen overnight. Efficiency is much more of a
concern and no BSS is available when initial fdt decoding starts.

We will want to incorporate these changes with the pinmux stuff also,
since that is already required to do all of this properly.

The one-line addition per peripheral and can easier be converted to
use some other approach later. I've added a u-boot prefix on the
property to clearly show that this is a U-Boot property. I think this
is a reasonable solution.

Regards,
Simon

>
> --
> nvpublic
