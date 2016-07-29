From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] reset: uniphier: add reset controller drivers for
 UniPhier SoCs
Date: Fri, 29 Jul 2016 15:16:25 -0500
Message-ID: <20160729201625.GA4308@rob-hp-laptop>
References: <1469557209-13089-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1469557209-13089-1-git-send-email-yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jul 27, 2016 at 03:20:08AM +0900, Masahiro Yamada wrote:
> This is the initial commit for UniPhier reset controller drivers.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
> ---
> 
> Changes in v2 (mostly suggested by Philipp Zabel):
>   - Unify multiple module_platform_driver() boilerplates into one
>   - Unify tiny driver code and decrease the number of files
>   - Invert the logic of .deassert_val, changing it into .assert_val
>   - Show error code when failed to get regmap
>   - Add a binding document
>   - Support more reset signals
> 
>  .../devicetree/bindings/reset/uniphier-reset.txt   |  99 ++++++++
>  MAINTAINERS                                        |   1 +
>  drivers/reset/Kconfig                              |   1 +
>  drivers/reset/Makefile                             |   1 +
>  drivers/reset/uniphier/Kconfig                     |   9 +
>  drivers/reset/uniphier/Makefile                    |   5 +
>  drivers/reset/uniphier/reset-uniphier-core.c       | 270 +++++++++++++++++++++
>  drivers/reset/uniphier/reset-uniphier-mio.c        |  55 +++++
>  drivers/reset/uniphier/reset-uniphier-peri.c       |  55 +++++
>  drivers/reset/uniphier/reset-uniphier-sys.c        |  77 ++++++
>  drivers/reset/uniphier/reset-uniphier.h            |  57 +++++
>  11 files changed, 630 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/uniphier-reset.txt
>  create mode 100644 drivers/reset/uniphier/Kconfig
>  create mode 100644 drivers/reset/uniphier/Makefile
>  create mode 100644 drivers/reset/uniphier/reset-uniphier-core.c
>  create mode 100644 drivers/reset/uniphier/reset-uniphier-mio.c
>  create mode 100644 drivers/reset/uniphier/reset-uniphier-peri.c
>  create mode 100644 drivers/reset/uniphier/reset-uniphier-sys.c
>  create mode 100644 drivers/reset/uniphier/reset-uniphier.h
> 
> diff --git a/Documentation/devicetree/bindings/reset/uniphier-reset.txt b/Documentation/devicetree/bindings/reset/uniphier-reset.txt
> new file mode 100644
> index 0000000..c2fb0d0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reset/uniphier-reset.txt
> @@ -0,0 +1,99 @@
> +UniPhier reset controller
> +
> +
> +System reset
> +------------
> +
> +Required properties:
> +- compatible: should be one of the following:
> +    "socionext,uniphier-sld3-reset" - for PH1-sLD3 SoC.
> +    "socionext,uniphier-ld4-reset"  - for PH1-LD4 SoC.
> +    "socionext,uniphier-pro4-reset" - for PH1-Pro4 SoC.
> +    "socionext,uniphier-sld8-reset" - for PH1-sLD8 SoC.
> +    "socionext,uniphier-pro5-reset" - for PH1-Pro5 SoC.
> +    "socionext,uniphier-pxs2-reset" - for ProXstream2/PH1-LD6b SoC.
> +    "socionext,uniphier-ld11-reset" - for PH1-LD11 SoC.
> +    "socionext,uniphier-ld20-reset" - for PH1-LD20 SoC.
> +- #reset-cells: should be 1.
> +
> +Note:
> +The reset node should be a child of a syscon node.
> +
> +Example:
> +
> +	sysctrl@61840000 {
> +		compatible = "simple-mfd", "syscon";

This needs a specific compatible string.

> +		reg = <0x61840000 0x4000>;
> +
> +		reset {
> +			compatible = "socionext,uniphier-ld20-reset";
> +			#reset-cells = <1>;
> +		};
> +
> +		other nodes ...
> +	};
> +
> +
> +Media I/O (MIO) reset
> +---------------------
> +
> +Required properties:
> +- compatible: should be one of the following:
> +    "socionext,uniphier-sld3-mio-reset" - for PH1-sLD3 SoC.
> +    "socionext,uniphier-ld4-mio-reset"  - for PH1-LD4 SoC.
> +    "socionext,uniphier-pro4-mio-reset" - for PH1-Pro4 SoC.
> +    "socionext,uniphier-sld8-mio-reset" - for PH1-sLD8 SoC.
> +    "socionext,uniphier-pro5-mio-reset" - for PH1-Pro5 SoC.
> +    "socionext,uniphier-pxs2-mio-reset" - for ProXstream2/PH1-LD6b SoC.
> +    "socionext,uniphier-ld11-mio-reset" - for PH1-LD11 SoC.
> +    "socionext,uniphier-ld20-mio-reset" - for PH1-LD20 SoC.
> +- #reset-cells: should be 1.
> +
> +Note:
> +The reset node should be a child of a syscon node.
> +
> +Example:
> +
> +	mioctrl@59810000 {
> +		compatible = "simple-mfd", "syscon";
> +		reg = <0x59810000 0x800>;
> +
> +		reset {
> +			compatible = "socionext,uniphier-ld20-mio-reset";
> +			#reset-cells = <1>;
> +		};
> +
> +		other nodes ...
> +	};
> +
> +
> +Peripheral reset
> +----------------
> +
> +Required properties:
> +- compatible: should be one of the following:
> +    "socionext,uniphier-ld4-peri-reset"  - for PH1-LD4 SoC.
> +    "socionext,uniphier-pro4-peri-reset" - for PH1-Pro4 SoC.
> +    "socionext,uniphier-sld8-peri-reset" - for PH1-sLD8 SoC.
> +    "socionext,uniphier-pro5-peri-reset" - for PH1-Pro5 SoC.
> +    "socionext,uniphier-pxs2-peri-reset" - for ProXstream2/PH1-LD6b SoC.
> +    "socionext,uniphier-ld11-peri-reset" - for PH1-LD11 SoC.
> +    "socionext,uniphier-ld20-peri-reset" - for PH1-LD20 SoC.
> +- #reset-cells: should be 1.
> +
> +Note:
> +The reset node should be a child of a syscon node.
> +
> +Example:
> +
> +	perictrl@59820000 {
> +		compatible = "simple-mfd", "syscon";
> +		reg = <0x59820000 0x200>;
> +
> +		reset {
> +			compatible = "socionext,uniphier-ld20-peri-reset";
> +			#reset-cells = <1>;
> +		};
> +
> +		other nodes ...
> +	};
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
