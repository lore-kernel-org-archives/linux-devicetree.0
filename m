From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v2 00/14] rtc: sun6i: clock rework and
 pre-H6 SoC support
Date: Thu, 6 Dec 2018 13:49:10 +0800
Message-ID: <CAGb2v65GwzEHZnRJysp=qE4HjrTa+TzCeyQ_j_Q=RrwtnC617g@mail.gmail.com>
References: <20181203145825.20511-1-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBBZPQULQAKGQETX2NRJQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20181203145825.20511-1-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, alexandre.belloni-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>
Cc: linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-rtc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Mon, Dec 3, 2018 at 10:58 PM Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org> wrote:
>
> Hi everyone,
>
> This is v2 of my rtc-sun6i clean-up series.
>
> Changes since v1:
>
>   - Collected tags
>   - Dropped patch "clk: sunxi-ng: r40: Force LOSC parent to RTC LOSC
>     output"; already merged
>   - Removed H6 compatible CLK_OF_DECLARE_DRIVER entry that wasn't
>     overlooked
>   - Only export IOSC clock for A64/H3/H5
>
> Original cover letter, with patch numbers corrected, follows:
>
> This series was started as part of enabling Bluetooth on various
> Allwinner SBCs. The bluetooth controller requires a precise 32.768 kHz
> clock fed to it to correctly detect the frequency of its main oscillator.
> This clock signal is provided by the RTC, either directly from a special
> pin on the SoC, or some clock output function from the clock controllers.
> I found that the clock-related properties of the RTC on later SoCs were
> incorrect or missing.
>
> This series reworks the compatible strings and clock parts of the device
> tree bindings for sun6i-rtc. Currently we assume most Allwinner SoCs use
> the same sun6i-rtc variant, when in fact they do not. The differences
> that matter with regards to clocks are a) the A31 does not have an extra
> external output for the RTC 32K clock, while most of the others do;
> b) the clock frequency of the internal RC oscillator is different on
> some SoCs; c) on the H6 the RTC also handles the 24 MHz DCXO, which
> feeds the system HOSC. The last difference, and by extension the H6, are
> not covered in this series.
>
> Patch 1 cleans up the clock-related section of the RTC device tree
> binding. This would make it easier to read and easier to add additional
> clocks.
>
> Patch 2 adds compatible strings for all identified variants introduced
> prior to the H6.
>
> Patch 3 deprecates the external clock output for the A31. The A31 does
> not have this output, so it's introduction and usage was an error.
>
> Patch 4 adds a clock output for the RTC's internal oscillator to the
> device tree binding. This feeds the PRCM in some SoCs.
>
> Patch 5 adds a default clock name for the LOSC to the RTC driver.
>
> Patch 6 adds support for different hardware variants to the RTC driver.
>
> Patch 7 adds support for all known pre-H6 variants.
>
> Patch 8 exposes the RTC's internal oscillator through the device tree.
>
> Patch 9 through 14 adds an RTC node or fixes up the RTC device node
> address ranges, clock properties, names of existing clocks, and adds
> accuracy properties for the external fixed oscillators.
>
> The clock names require fixing because the sunxi clock driver implicitly
> depends on the HOSC and LOSC being named "osc24M" and "osc32k". The
> "fixes" to the clock hierarchy introduced in this series means the names
> must also be shuffled around or the in kernel representation would be
> incorrect. This has been the case since the sunxi-ng drivers were
> introduced. There are plans to address this, but the code is still in its
> early stages.
>
> Please have a look.
>
> Thanks
> ChenYu
>
> Chen-Yu Tsai (14):
>   dt-bindings: rtc: sun6i-rtc: Rewrite clock outputs as a list
>   dt-bindings: rtc: sun6i-rtc: Add compatible strings for pre-H6
>     variants
>   dt-bindings: rtc: sun6i-rtc: Deprecate external clock output for A31
>   dt-bindings: rtc: sun6i-rtc: Export internal RC oscillator
>   rtc: sun6i: Add default clock name for LOSC
>   rtc: sun6i: Add support for different variants
>   rtc: sun6i: Add support for all known pre-H6 variants
>   rtc: sun6i: Expose internal oscillator through device tree
>   ARM: dts: sun8i: a23/a33: Fix up RTC device node
>   ARM: dts: sunxi: h3/h5: Add clock accuracy for external oscillators
>   ARM: dts: sunxi: h3/h5: Fix up RTC device node and clock references
>   ARM: dts: sun8i: r40: Add clock accuracy for external oscillators
>   ARM: dts: sun8i: r40: Add RTC device node
>   arm64: dts: allwinner: a64: Fix up RTC device node and clock
>     references

I merged patches 10 and 12 for now. These don't depend on any driver changes.

If Alex manages to get the driver bits merged for 4.21, I suppose we could do
a late PR for the dts bits? It would be nice to have both in the same release,
though I don't think anything would break if the dts bits are delayed.

ChenYu
