From: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH v3 0/3] add the reset controller to the Meson8b clkc
Date: Mon, 31 Jul 2017 10:27:47 +0200
Message-ID: <1501489667.6834.1.camel@baylibre.com>
References: <20170728211313.10603-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20170728211313.10603-1-martin.blumenstingl@googlemail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, khilman@baylibre.com, carlo@caione.org, narmstrong@baylibre.com, linux-clk@vger.kernel.org, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux@armlinux.org.uk, mark.rutland@arm.com, mturquette@baylibre.com, sboyd@codeaurora.org
List-Id: devicetree@vger.kernel.org

On Fri, 2017-07-28 at 23:13 +0200, Martin Blumenstingl wrote:
> This registers the known (soft) reset lines provided by the clock
> controller's registers.
> 
> This is the first preparation step for SMP and CPU hotplug support on
> Meson8/Meson8b/Meson8m2. Booting the secondary cores on these SoCs
> requires asserting and de-asserting a reset line (one for each CPU
> core). These reset lines are provided by the clock controller.
> 
> The reset controller part of the meson8b clock controller has to be
> registered early (which I did through CLK_OF_DECLARE_DRIVER), because
> the secondary cores are started *very* early in the boot process (and
> meson8b_clkc_probe is invoked long after we need the reset controller
> to be available for booting the secondary CPU cores).
> 
> The user of the reset-controller (= the patches which enable SMP and
> CPU hotplug support) will follow in the next days. I decided to split
> this because the SMP series will probably consist of 6 patches alone
> (and may need to go through two separate trees).
> 
> Changes since v2 at [3]:
> - move the reset line preprocessor defines into a separate file
>   (affects patch #1 as this header file is part of the dt-binding)
> - rename the reset line preprocessor macros from RESETID_ to
>   CLKC_RESET_ to clearly indicate that these are provided by the
>   clock controller (unlike the preprocessor macros for the reset
>   lines in the standlone reset controller, which start with RESET_)
> - updated patch #2 due to the changes mentioned above
> - added Neil's Reviewed-by to all patches
> 
> Changes since v1 at [0]:
> - updated cover letter description as we are now registering more than
>   four reset lines
> - split patch #1 into a dt-binding and clk driver patch
> - slightly reworded the dt-binding documentation so it's now clear that
>   the reset identifiers are preprocessor macros in
>   dt-bindings/clock/meson8b-clkc.h (v1 of this series didn't have these
>   macros at all)
> - patch #2 (previously part of patch #1) now registers all known reset
>   lines (see [1] and [2] for the results of my detective work)
> - patch #3 is untouched
> 
> 
> [0] http://lists.infradead.org/pipermail/linux-amlogic/2017-July/004283.html
> [1] http://lists.infradead.org/pipermail/linux-amlogic/2017-July/004330.html
> [2] http://lists.infradead.org/pipermail/linux-amlogic/2017-July/004347.html
> [3] http://lists.infradead.org/pipermail/linux-amlogic/2017-July/004352.html
> 
> 
> Martin Blumenstingl (3):
>   dt-bindings: clock: meson8b: describe the embedded reset controller
>   clk: meson: meson8b: register the built-in reset controller
>   ARM: dts: meson: mark the clock controller also as reset controller
> 
>  .../bindings/clock/amlogic,meson8b-clkc.txt        |   9 +-
>  arch/arm/boot/dts/meson8.dtsi                      |   1 +
>  arch/arm/boot/dts/meson8b.dtsi                     |   1 +
>  drivers/clk/meson/Kconfig                          |   1 +
>  drivers/clk/meson/meson8b.c                        | 159 +++++++++++++++++++-
> -
>  drivers/clk/meson/meson8b.h                        |   9 +-
>  .../dt-bindings/reset/amlogic,meson8b-clkc-reset.h |  27 ++++
>  7 files changed, 193 insertions(+), 14 deletions(-)
>  create mode 100644 include/dt-bindings/reset/amlogic,meson8b-clkc-reset.h
> 

Series looks good to me overall.

Acked-by: Jerome Brunet <jbrunet@baylibre.com>

Just one thing, which is not an issue really, I wonder if the dt-bindings
documentation and the bindings them-self should be in separate patches ? 

