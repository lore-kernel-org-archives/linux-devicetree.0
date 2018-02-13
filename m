From: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Subject: Re: [PATCH v9 2/3] arm: dts: add Nuvoton NPCM750 device tree
Date: Tue, 13 Feb 2018 16:52:56 +1030
Message-ID: <CACPK8XdXOaPZ5i=qKns3=V87nhfY62PNr4kwH9xwVYxY0djo0g@mail.gmail.com>
References: <20180205235757.246758-1-brendanhiggins@google.com> <20180205235757.246758-3-brendanhiggins@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180205235757.246758-3-brendanhiggins-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brendan Higgins <brendanhiggins-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Tomer Maimon <tmaimon77-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Avi Fishman <avifishman70-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, julien.thierry-5wv7dgnIgG8@public.gmane.org, pombredanne-od1rfyK75/E@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, OpenBMC Maillist <openbmc-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Brendan,

On Tue, Feb 6, 2018 at 10:27 AM, Brendan Higgins
<brendanhiggins-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org> wrote:
> Add a common device tree for all Nuvoton NPCM750 BMCs and a board
> specific device tree for the NPCM750 (Poleg) evaluation board.
>
> Signed-off-by: Brendan Higgins <brendanhiggins-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
> Reviewed-by: Tomer Maimon <tmaimon77-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Reviewed-by: Avi Fishman <avifishman70-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Reviewed-by: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
> Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Tested-by: Tomer Maimon <tmaimon77-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Tested-by: Avi Fishman <avifishman70-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

This looks well acked, reviewed and tested. How do you plan to have
the ARM SoC maintainers merge your patches?

> ---
>  .../arm/cpu-enable-method/nuvoton,npcm7xx-smp      |  42 ++++++
>  .../devicetree/bindings/arm/npcm/npcm.txt          |   6 +
>  arch/arm/boot/dts/nuvoton-npcm750-evb.dts          |  35 +++++
>  arch/arm/boot/dts/nuvoton-npcm750.dtsi             | 162 +++++++++++++++++++++
>  include/dt-bindings/clock/nuvoton,npcm7xx-clks.h   |  35 +++++
>  5 files changed, 280 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/cpu-enable-method/nuvoton,npcm7xx-smp
>  create mode 100644 Documentation/devicetree/bindings/arm/npcm/npcm.txt
>  create mode 100644 arch/arm/boot/dts/nuvoton-npcm750-evb.dts
>  create mode 100644 arch/arm/boot/dts/nuvoton-npcm750.dtsi
>  create mode 100644 include/dt-bindings/clock/nuvoton,npcm7xx-clks.h

You need to add nuvoton-npcm750-evb.dts to arch/arm/boot/dts/Makefile

Once you've done that you can add

Tested-by: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>

as I tested this on an EVB.

> diff --git a/arch/arm/boot/dts/nuvoton-npcm750.dtsi b/arch/arm/boot/dts/nuvoton-npcm750.dtsi
> new file mode 100644
> index 000000000000..08e906f88c49
> --- /dev/null
> +++ b/arch/arm/boot/dts/nuvoton-npcm750.dtsi
> @@ -0,0 +1,162 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2018 Nuvoton Technology corporation.
> +// Copyright 2018 Google, Inc.
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/clock/nuvoton,npcm7xx-clks.h>
> +
> +/ {
> +       #address-cells = <1>;
> +       #size-cells = <1>;
> +       interrupt-parent = <&gic>;
> +
> +       cpus {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               enable-method = "nuvoton,npcm7xx-smp";
> +
> +               cpu@0 {
> +                       device_type = "cpu";
> +                       compatible = "arm,cortex-a9";
> +                       clocks = <&clk NPCM7XX_CLK_CPU>;
> +                       clock-names = "clk_cpu";
> +                       reg = <0>;
> +                       next-level-cache = <&l2>;
> +               };
> +
> +               cpu@1 {
> +                       device_type = "cpu";
> +                       compatible = "arm,cortex-a9";
> +                       clocks = <&clk NPCM7XX_CLK_CPU>;
> +                       clock-names = "clk_cpu";
> +                       reg = <1>;
> +                       next-level-cache = <&l2>;
> +               };
> +       };
> +
> +/* external clock signal rg1refck, supplied by the phy */
> +clk-rg1refck {
> +       compatible = "fixed-clock";
> +       #clock-cells = <0>;
> +       clock-frequency = <125000000>;
> +};
> +
> +/* external clock signal rg2refck, supplied by the phy */
> +clk-rg2refck {
> +       compatible = "fixed-clock";
> +       #clock-cells = <0>;
> +       clock-frequency = <125000000>;
> +};
> +
> +clk-xin {
> +       compatible = "fixed-clock";
> +       #clock-cells = <0>;
> +       clock-frequency = <50000000>;
> +};

The whitespace here needs to be fixed.

Cheers,

Joel

> +
> +       soc {
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               compatible = "simple-bus";
> +               interrupt-parent = <&gic>;
> +               ranges = <0x0 0xf0000000 0x00900000>;
> +
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
