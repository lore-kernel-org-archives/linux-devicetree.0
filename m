From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 09/17] tegra: usb: fdt: Add additional device tree
 definitions for USB ports
Date: Mon, 05 Dec 2011 16:25:08 -0700
Message-ID: <4EDD52D4.7090906@nvidia.com>
References: <1322878300-5551-1-git-send-email-sjg@chromium.org>
 <1322878300-5551-10-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1322878300-5551-10-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
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

On 12/02/2011 07:11 PM, Simon Glass wrote:
> This adds peripheral IDs and timing information to the USB part of the
> device tree for U-Boot.
> 
> The peripheral IDs provide easy access to clock registers. We will likely
> remove this in favor of a full clock tree when it is available in the
> kernel (but probably still retain the peripheral ID, just move it into
> a clock node).
> 
> The USB timing information does apparently vary between boards sometimes,
> so is include in the fdt for convenience.

Which parts vary? Most of it is PLL configuration, and it seems
basically impossible for that to vary yet still create the correct
output frequency.

> +/* This table has USB timing parameters for each Oscillator frequency we

This comment block should be indented to match the nodes.

> + * support. There are four sets of values:
> + *
> + * 1. PLLU configuration information (reference clock is osc/clk_m and
> + * PLLU-FOs are fixed at 12MHz/60MHz/480MHz).
> + *
> + *  Reference frequency     13.0MHz      19.2MHz      12.0MHz      26.0MHz
> + *  ----------------------------------------------------------------------
> + *      DIVN                960 (0x3c0)  200 (0c8)    960 (3c0h)   960 (3c0)
> + *      DIVM                13 (0d)      4 (04)       12 (0c)      26 (1a)
> + * Filter frequency (MHz)   1            4.8          6            2
> + * CPCON                    1100b        0011b        1100b        1100b
> + * LFCON0                   0            0            0            0
> + *
> + * 2. PLL CONFIGURATION & PARAMETERS for different clock generators:
> + *
> + * Reference frequency     13.0MHz         19.2MHz         12.0MHz     26.0MHz
> + * ---------------------------------------------------------------------------
> + * PLLU_ENABLE_DLY_COUNT   02 (0x02)       03 (03)         02 (02)     04 (04)
> + * PLLU_STABLE_COUNT       51 (33)         75 (4B)         47 (2F)    102 (66)
> + * PLL_ACTIVE_DLY_COUNT    05 (05)         06 (06)         04 (04)     09 (09)
> + * XTAL_FREQ_COUNT        127 (7F)        187 (BB)        118 (76)    254 (FE)

Those two sets of data seem like they should simply be part of the clock
driver. Some part of the system boot or USB init process needs to say
"enable the USB clocks", and that code needs to write those hard-coded
values into the relevant clock registers (or calculate them at run-time;
whatever). This stuff can't vary by board.

> + * 3. Debounce values IdDig, Avalid, Bvalid, VbusValid, VbusWakeUp, and
> + * SessEnd. Each of these signals have their own debouncer and for each of
> + * those one out of two debouncing times can be chosen (BIAS_DEBOUNCE_A or
> + * BIAS_DEBOUNCE_B).
> + *
> + * The values of DEBOUNCE_A and DEBOUNCE_B are calculated as follows:
> + *    0xffff -> No debouncing at all
> + *    <n> ms = <n> *1000 / (1/19.2MHz) / 4
> + *
> + * So to program a 1 ms debounce for BIAS_DEBOUNCE_A, we have:
> + * BIAS_DEBOUNCE_A[15:0] = 1000 * 19.2 / 4  = 4800 = 0x12c0
> + *
> + * We need to use only DebounceA for BOOTROM. We don't need the DebounceB
> + * values, so we can keep those to default.
> + *
> + * a4. The 20 microsecond delay after bias cell operation.

      ^ typo

> + *  Reference frequency     13.0MHz      19.2MHz      12.0MHz      26.0MHz

If this data varies at all, then those two sets of data seem
port-specific to me, and hence should be moved into a per-port property.
Having a single global set of parameters that gets applied to all ports
at once doesn't make sense to me, if the data varies.

I imagine the values are board specific too, and hence shouldn't be in
tegra20.dtsi but rather in tegra-seaboard.dts.

The values in these fields should be specific in a way that's agnostic
to the reference clock, e.g. as a number of mS/nS. That way, you'd just
specify the single set of values to use, and the driver would do the
calculations to map the time domain into the reference-clock-specific
values to put into the registers.

> + */
> +
> +	usbtiming@0 {
> +		compatible = "nvidia,tegra20-usbtiming";
> +		osc-frequency = <13000000>;
> +		/* DivN, DivM, DivP, CPCON, LFCON, Delays     Debounce, Bias */
> +		timing = <0x3c0 0x0d 0x00 0xc 0  0x02 0x33 0x05 0x7f 0x7ef4 5>;
> +	};
> +
> +	usbtiming@1 {
> +		compatible = "nvidia,tegra20-usbtiming";
> +		osc-frequency = <19200000>;
> +		timing = <0x0c8 0x04 0x00 0x3 0  0x03 0x4b 0x06 0xbb 0xbb80 7>;
> +	};
> +
> +	usbtiming@2 {
> +		compatible = "nvidia,tegra20-usbtiming";
> +		osc-frequency = <12000000>;
> +		timing = <0x3c0 0x0c 0x00 0xc 0  0x02 0x2f 0x04 0x76 0x7530 5>;
> +	};
> +
> +	usbtiming@3 {
> +		compatible = "nvidia,tegra20-usbtiming";
> +		osc-frequency = <26000000>;
> +		timing = <0x3c0 0x1a 0x00 0xc 0  0x04 0x66 0x09 0xfe 0xfde8 9>;
> +	};

You can't include those timing nodes right there, because the unit
addresses (@0, ... @3) aren't physical addresses in the same scheme as
all the other nodes.

> +
>  	usb@c5000000 {
>  		compatible = "nvidia,tegra20-ehci", "usb-ehci";
>  		reg = <0xc5000000 0x4000>;
>  		interrupts = < 52 >;
>  		phy_type = "utmi";
> +		periph-id = <22>;	// PERIPH_ID_USBD

Given this is a temporary U-Boot-specific solution, can the property be
named u-boot,periph-id so it's obvious that when writing a .dts for the
kernel only, you don't care about this value.

Personally, I'd suggest not having this property at all, but rather have
the driver maintain a base_address -> periph_id mapping table
internally. That table can be removed once the clock/reset bindings are
all set up, and the information can be obtained there instead.

-- 
nvpublic
