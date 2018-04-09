Return-Path: <SRS0=2q4m=G6=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <0f28c74d-f35a-5ccb-eeba-f21ae39c3857@cogentembedded.com>
References: <0f28c74d-f35a-5ccb-eeba-f21ae39c3857@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 9 Apr 2018 11:46:10 +0200
Message-ID: <CAMuHMdXNg32ECS+xNH46qK58JoU=VC_kbqhaVXD4xGZC16wY3A@mail.gmail.com>
Subject: Re: [PATCH] phy: Renesas R-Car gen3 PCIe PHY driver
Content-Type: text/plain; charset="UTF-8"
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Rob Herring <robh+dt@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Sergei,

Thanks for your patch!

On Wed, Apr 4, 2018 at 9:31 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> This PHY is still mostly undocumented -- the only documented registers
> exist on R-Car V3H (R8A77980) SoC  where this PHY stays in a powered-down
> state after a reset and thus  we must power it on for PCIe to work...

Bogus spaces slipping in again?

> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

> --- /dev/null
> +++ linux-phy/Documentation/devicetree/bindings/phy/rcar-gen3-phy-pcie.txt
> @@ -0,0 +1,32 @@
> +* Renesas R-Car generation 3 PCIe PHY
> +
> +This file provides information on what the device node for the R-Car
> +generation 3 PCIe PHY contains.
> +
> +Required properties:
> +- compatible: "renesas,r8a77980-pcie-phy" if the device is a part of R8A77980
> +             SoC.
> +             "renesas,rcar-gen3-pcie-phy" for a generic R-Car Gen3 compatible
> +             device.
> +
> +             When compatible with the generic version, nodes must list the
> +             SoC-specific version corresponding to the platform first
> +             followed by the generic version.
> +
> +- reg: offset and length of the register block.
> +- clocks: clock phandle and specifier pair.
> +- power-domains: power domain phandle and specifier pair.
> +- resets: reset phandle and specifier pair.
> +- #phy-cells: see phy-bindings.txt in the same directory, must be <0>.
> +
> +Example (R-Car V3H):
> +
> +       pcie-phy@e65d0000 {
> +               compatible = "renesas,r8a77980-pcie-phy",
> +                            "renesas,rcar-gen3-pcie-phy";

Is the R8A77980 PCIe PHY compatible with the generic version, given it needs
to be powered up explicitly?

The only documented register is the lane reversal register, do we need bindings
to configure it?

> --- /dev/null
> +++ linux-phy/drivers/phy/renesas/phy-rcar-gen3-pcie.c
> @@ -0,0 +1,158 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Renesas R-Car Gen2 PHY driver

Gen3 PCIe PHY

> +static int rcar_gen3_phy_pcie_probe(struct platform_device *pdev)
> +{
> +       struct device *dev = &pdev->dev;
> +       struct phy_provider *provider;
> +       struct rcar_gen3_phy *phy;
> +       struct resource *res;
> +       void __iomem *base;
> +       int error;
> +
> +       if (!dev->of_node) {
> +               dev_err(dev,
> +                       "This driver must only be instantiated from the device tree\n");
> +               return -EINVAL;
> +       }

Do we need this check? Just go bang, like most other DT-only drivers do?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
