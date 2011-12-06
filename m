From: Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH v2 09/17] tegra: usb: fdt: Add additional
 device tree definitions for USB ports
Date: Mon, 5 Dec 2011 16:55:59 -0800
Message-ID: <CAPnjgZ1J_cOS_E+ZiDoZUh79V7LUFzVkx-0nhbPTDwuGCGvDnQ@mail.gmail.com>
References: <1322878300-5551-1-git-send-email-sjg@chromium.org>
	<1322878300-5551-10-git-send-email-sjg@chromium.org>
	<4EDD52D4.7090906@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <4EDD52D4.7090906@nvidia.com>
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

On Mon, Dec 5, 2011 at 3:25 PM, Stephen Warren <swarren@nvidia.com> wrote:
> On 12/02/2011 07:11 PM, Simon Glass wrote:
>> This adds peripheral IDs and timing information to the USB part of the
>> device tree for U-Boot.
>>
>> The peripheral IDs provide easy access to clock registers. We will likely
>> remove this in favor of a full clock tree when it is available in the
>> kernel (but probably still retain the peripheral ID, just move it into
>> a clock node).
>>
>> The USB timing information does apparently vary between boards sometimes,
>> so is include in the fdt for convenience.
>
> Which parts vary? Most of it is PLL configuration, and it seems
> basically impossible for that to vary yet still create the correct
> output frequency.

See here for T30 differences, for example.

https://gerrit.chromium.org/gerrit/#patch,sidebyside,12440,1,board/nvidia/c=
ardhu/tegra30.dtsi

>
>> +/* This table has USB timing parameters for each Oscillator frequency we
>
> This comment block should be indented to match the nodes.
>
>> + * support. There are four sets of values:
>> + *
>> + * 1. PLLU configuration information (reference clock is osc/clk_m and
>> + * PLLU-FOs are fixed at 12MHz/60MHz/480MHz).
>> + *
>> + * =A0Reference frequency =A0 =A0 13.0MHz =A0 =A0 =A019.2MHz =A0 =A0 =
=A012.0MHz =A0 =A0 =A026.0MHz
>> + * =A0-----------------------------------------------------------------=
-----
>> + * =A0 =A0 =A0DIVN =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0960 (0x3c0) =A0200 (0=
c8) =A0 =A0960 (3c0h) =A0 960 (3c0)
>> + * =A0 =A0 =A0DIVM =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A013 (0d) =A0 =A0 =A04 =
(04) =A0 =A0 =A0 12 (0c) =A0 =A0 =A026 (1a)
>> + * Filter frequency (MHz) =A0 1 =A0 =A0 =A0 =A0 =A0 =A04.8 =A0 =A0 =A0 =
=A0 =A06 =A0 =A0 =A0 =A0 =A0 =A02
>> + * CPCON =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A01100b =A0 =A0 =A0 =A000=
11b =A0 =A0 =A0 =A01100b =A0 =A0 =A0 =A01100b
>> + * LFCON0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0 =A0 =A0 =A0 =A0 =A0 =A0=
0 =A0 =A0 =A0 =A0 =A0 =A00 =A0 =A0 =A0 =A0 =A0 =A00
>> + *
>> + * 2. PLL CONFIGURATION & PARAMETERS for different clock generators:
>> + *
>> + * Reference frequency =A0 =A0 13.0MHz =A0 =A0 =A0 =A0 19.2MHz =A0 =A0 =
=A0 =A0 12.0MHz =A0 =A0 26.0MHz
>> + * --------------------------------------------------------------------=
-------
>> + * PLLU_ENABLE_DLY_COUNT =A0 02 (0x02) =A0 =A0 =A0 03 (03) =A0 =A0 =A0 =
=A0 02 (02) =A0 =A0 04 (04)
>> + * PLLU_STABLE_COUNT =A0 =A0 =A0 51 (33) =A0 =A0 =A0 =A0 75 (4B) =A0 =
=A0 =A0 =A0 47 (2F) =A0 =A0102 (66)
>> + * PLL_ACTIVE_DLY_COUNT =A0 =A005 (05) =A0 =A0 =A0 =A0 06 (06) =A0 =A0 =
=A0 =A0 04 (04) =A0 =A0 09 (09)
>> + * XTAL_FREQ_COUNT =A0 =A0 =A0 =A0127 (7F) =A0 =A0 =A0 =A0187 (BB) =A0 =
=A0 =A0 =A0118 (76) =A0 =A0254 (FE)
>
> Those two sets of data seem like they should simply be part of the clock
> driver. Some part of the system boot or USB init process needs to say
> "enable the USB clocks", and that code needs to write those hard-coded
> values into the relevant clock registers (or calculate them at run-time;
> whatever). This stuff can't vary by board.

We don't have a USB clock driver. This driver is in CPU code, so I am
not suggesting that it varies by board, only by SOC. This stuff is in
the SOC dts.
>
>> + * 3. Debounce values IdDig, Avalid, Bvalid, VbusValid, VbusWakeUp, and
>> + * SessEnd. Each of these signals have their own debouncer and for each=
 of
>> + * those one out of two debouncing times can be chosen (BIAS_DEBOUNCE_A=
 or
>> + * BIAS_DEBOUNCE_B).
>> + *
>> + * The values of DEBOUNCE_A and DEBOUNCE_B are calculated as follows:
>> + * =A0 =A00xffff -> No debouncing at all
>> + * =A0 =A0<n> ms =3D <n> *1000 / (1/19.2MHz) / 4
>> + *
>> + * So to program a 1 ms debounce for BIAS_DEBOUNCE_A, we have:
>> + * BIAS_DEBOUNCE_A[15:0] =3D 1000 * 19.2 / 4 =A0=3D 4800 =3D 0x12c0
>> + *
>> + * We need to use only DebounceA for BOOTROM. We don't need the Debounc=
eB
>> + * values, so we can keep those to default.
>> + *
>> + * a4. The 20 microsecond delay after bias cell operation.
>
> =A0 =A0 =A0^ typo
>
>> + * =A0Reference frequency =A0 =A0 13.0MHz =A0 =A0 =A019.2MHz =A0 =A0 =
=A012.0MHz =A0 =A0 =A026.0MHz
>
> If this data varies at all, then those two sets of data seem
> port-specific to me, and hence should be moved into a per-port property.
> Having a single global set of parameters that gets applied to all ports
> at once doesn't make sense to me, if the data varies.

The hardware doesn't support this does it?

>
> I imagine the values are board specific too, and hence shouldn't be in
> tegra20.dtsi but rather in tegra-seaboard.dts.

I believe they vary by SOC, not board.

>
> The values in these fields should be specific in a way that's agnostic
> to the reference clock, e.g. as a number of mS/nS. That way, you'd just
> specify the single set of values to use, and the driver would do the
> calculations to map the time domain into the reference-clock-specific
> values to put into the registers.

Yes I agree. I don't have time to write this. Shall we go forward with
what we have, and Nvidia can tidy up later?

>
>> + */
>> +
>> + =A0 =A0 usbtiming@0 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "nvidia,tegra20-usbtiming";
>> + =A0 =A0 =A0 =A0 =A0 =A0 osc-frequency =3D <13000000>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 /* DivN, DivM, DivP, CPCON, LFCON, Delays =A0 =
=A0 Debounce, Bias */
>> + =A0 =A0 =A0 =A0 =A0 =A0 timing =3D <0x3c0 0x0d 0x00 0xc 0 =A00x02 0x33=
 0x05 0x7f 0x7ef4 5>;
>> + =A0 =A0 };
>> +
>> + =A0 =A0 usbtiming@1 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "nvidia,tegra20-usbtiming";
>> + =A0 =A0 =A0 =A0 =A0 =A0 osc-frequency =3D <19200000>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 timing =3D <0x0c8 0x04 0x00 0x3 0 =A00x03 0x4b=
 0x06 0xbb 0xbb80 7>;
>> + =A0 =A0 };
>> +
>> + =A0 =A0 usbtiming@2 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "nvidia,tegra20-usbtiming";
>> + =A0 =A0 =A0 =A0 =A0 =A0 osc-frequency =3D <12000000>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 timing =3D <0x3c0 0x0c 0x00 0xc 0 =A00x02 0x2f=
 0x04 0x76 0x7530 5>;
>> + =A0 =A0 };
>> +
>> + =A0 =A0 usbtiming@3 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "nvidia,tegra20-usbtiming";
>> + =A0 =A0 =A0 =A0 =A0 =A0 osc-frequency =3D <26000000>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 timing =3D <0x3c0 0x1a 0x00 0xc 0 =A00x04 0x66=
 0x09 0xfe 0xfde8 9>;
>> + =A0 =A0 };
>
> You can't include those timing nodes right there, because the unit
> addresses (@0, ... @3) aren't physical addresses in the same scheme as
> all the other nodes.

Shall I put them inside some other 'timing' node? Bear in mind we
don't have clock stuff yet.

>
>> +
>> =A0 =A0 =A0 usb@c5000000 {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "nvidia,tegra20-ehci", "usb-e=
hci";
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0xc5000000 0x4000>;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D < 52 >;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 phy_type =3D "utmi";
>> + =A0 =A0 =A0 =A0 =A0 =A0 periph-id =3D <22>; =A0 =A0 =A0 // PERIPH_ID_U=
SBD
>
> Given this is a temporary U-Boot-specific solution, can the property be
> named u-boot,periph-id so it's obvious that when writing a .dts for the
> kernel only, you don't care about this value.

ok. I suggest the kernel does something similar.

>
> Personally, I'd suggest not having this property at all, but rather have
> the driver maintain a base_address -> periph_id mapping table
> internally. That table can be removed once the clock/reset bindings are
> all set up, and the information can be obtained there instead.

I really want to avoid pushing SOC things into the drivers! The SOC
code provides clock/reset functions. It seems useful to have a way of
identifying all the peripherals in the SOC by number.

Regards,
Simon

>
> --
> nvpublic
