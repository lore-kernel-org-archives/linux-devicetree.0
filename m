From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH v2] Documentation: dt: Reduce fragmentation of <..> placeholders
Date: Sat, 8 Mar 2014 15:09:07 -0600
Message-ID: <CAL_Jsq+4SztwyrmMtN31Vof3Tb8U9VVpLs1uON5W=VVOpX=nUQ@mail.gmail.com>
References: <CAMuHMdUmcnzafPhWrp4qYBB3UniFbVtqzNNg-7ed_Q6hZKMeDw@mail.gmail.com>
	<1394234910-8547-1-git-send-email-florian.vaussard@epfl.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1394234910-8547-1-git-send-email-florian.vaussard@epfl.ch>
Sender: linux-doc-owner@vger.kernel.org
To: Florian Vaussard <florian.vaussard@epfl.ch>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Rob Landley <rob@landley.net>, Geert Uytterhoeven <geert@linux-m68k.org>, Joe Perches <joe@perches.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 7, 2014 at 5:28 PM, Florian Vaussard
<florian.vaussard@epfl.ch> wrote:
> Placeholders <..> are sometimes used in the devicetree documentation
> to define family-wide compatible strings (like fsl,<chip>-ipu where
> chip can be any Freescale SoC).
>
> These placeholders are loosly defined. This lead to some
> fragmentation. Looking at the current placeholders, we have:
>
>       3 <board>
>      32 <chip>
>       1 <chip name>
>       1 <mcu-chip>
>       1 <processor>
>      30 <soc>
>       1 <SOC>
>       1 <soc-family>
>
> This patch consolidates this to:
>
>       3 <board>
>      33 <chip>
>       1 <mcu-chip>
>       1 <processor>
>      32 <soc>
>

I would prefer to consolidate these into just board and chip. If we
have any oddballs, they can just document the exact strings.

Rob

> Reported-by: Joe Perches <joe@perches.com>
> Signed-off-by: Florian Vaussard <florian.vaussard@epfl.ch>
> ---
>  Documentation/devicetree/bindings/arm/samsung/sysreg.txt | 2 +-
>  Documentation/devicetree/bindings/pinctrl/pinctrl-st.txt | 2 +-
>  Documentation/devicetree/bindings/watchdog/sunxi-wdt.txt | 4 ++--
>  3 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/arm/samsung/sysreg.txt b/Documentation/devicetree/bindings/arm/samsung/sysreg.txt
> index 0ab3251..b945b23 100644
> --- a/Documentation/devicetree/bindings/arm/samsung/sysreg.txt
> +++ b/Documentation/devicetree/bindings/arm/samsung/sysreg.txt
> @@ -1,7 +1,7 @@
>  SAMSUNG S5P/Exynos SoC series System Registers (SYSREG)
>
>  Properties:
> - - compatible : should contain "samsung,<chip name>-sysreg", "syscon";
> + - compatible : should contain "samsung,<chip>-sysreg", "syscon";
>     For Exynos4 SoC series it should be "samsung,exynos4-sysreg", "syscon";
>   - reg : offset and length of the register set.
>
> diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-st.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-st.txt
> index 05bf82a..393a53a 100644
> --- a/Documentation/devicetree/bindings/pinctrl/pinctrl-st.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-st.txt
> @@ -12,7 +12,7 @@ ST pinctrl driver controls PIO multiplexing block and also interacts with
>  gpio driver to configure a pin.
>
>  Required properties: (PIO multiplexing block)
> -- compatible   : should be "st,<SOC>-<pio-block>-pinctrl"
> +- compatible   : should be "st,<soc>-<pio-block>-pinctrl"
>         like st,stih415-sbc-pinctrl, st,stih415-front-pinctrl and so on.
>  - gpio-controller : Indicates this device is a GPIO controller
>  - #gpio-cells    : Should be one. The first cell is the pin number.
> diff --git a/Documentation/devicetree/bindings/watchdog/sunxi-wdt.txt b/Documentation/devicetree/bindings/watchdog/sunxi-wdt.txt
> index e39cb26..b488ffa 100644
> --- a/Documentation/devicetree/bindings/watchdog/sunxi-wdt.txt
> +++ b/Documentation/devicetree/bindings/watchdog/sunxi-wdt.txt
> @@ -2,8 +2,8 @@ Allwinner SoCs Watchdog timer
>
>  Required properties:
>
> -- compatible : should be "allwinner,<soc-family>-wdt", the currently supported
> -  SoC families being sun4i and sun6i
> +- compatible : should be "allwinner,<soc>-wdt", the currently supported
> +  SoC being sun4i and sun6i
>  - reg : Specifies base physical address and size of the registers.
>
>  Example:
> --
> 1.8.5.3
>
