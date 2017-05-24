From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2] phy: rcar-gen3-usb3: add support for R-Car Gen3 USB
 3.0 PHY
Date: Wed, 24 May 2017 14:38:38 +0200
Message-ID: <CAMuHMdUK95J+eJmAgDVnRUWzpLQTpSUv1s7see=TF5bDAgcrgg@mail.gmail.com>
References: <1495628244-28406-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1495628244-28406-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Shimoda-san,

On Wed, May 24, 2017 at 2:17 PM, Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> The USB 3.0 PHY modules of R-Car Gen3 SoCs have:
>  - Spread spectrum clock (ssc).
>  - Using USB 2.0 EXTAL clock instead of USB 3.0 clock.
>  - Enabling VBUS detection for usb3.0 peripheral.
>
> So, this driver supports these features.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  This patch is based on the latest linux-phy.git / next branch and
>  "[PATCH v5 3/3] phy: Group vendor specific phy drivers" patch.
>
>  I discussed with Geert-san about this driver on the ML:
>  https://patchwork.kernel.org/patch/9731759/
>
>  Changes from v1:
>  - Changes from dev_info to dev_vdbg in rcar_gen3_phy_usb3_init().
>
>  .../devicetree/bindings/phy/rcar-gen3-phy-usb3.txt |  47 +++++
>  MAINTAINERS                                        |   4 +-
>  drivers/phy/renesas/Kconfig                        |   7 +
>  drivers/phy/renesas/Makefile                       |   1 +
>  drivers/phy/renesas/phy-rcar-gen3-usb3.c           | 207 +++++++++++++++++++++
>  5 files changed, 264 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb3.txt
>  create mode 100644 drivers/phy/renesas/phy-rcar-gen3-usb3.c
>
> diff --git a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb3.txt b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb3.txt
> new file mode 100644
> index 0000000..e58ba6b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb3.txt
> @@ -0,0 +1,47 @@
> +* Renesas R-Car generation 3 USB 3.0 PHY
> +
> +This file provides information on what the device node for the R-Car generation
> +3 USB 3.0 PHY contains.
> +If you want to enable spread spectrum clock (ssc), you should use USB_EXTAL
> +instead of USB3_CLK. However, if you don't want to these features, you don't
> +need this driver.
> +
> +Required properties:
> +- compatible: "renesas,r8a7795-usb3-phy" if the device is a part of an R8A7795
> +             SoC.
> +             "renesas,r8a7796-usb3-phy" if the device is a part of an R8A7796
> +             SoC.
> +             "renesas,rcar-gen3-usb3-phy" for a generic R-Car Gen3 compatible
> +             device.
> +
> +             When compatible with the generic version, nodes must list the
> +             SoC-specific version corresponding to the platform first
> +             followed by the generic version.
> +
> +- reg: offset and length of the USB 3.0 PHY register block.
> +- clocks: A list of phandles and clock-specifier pairs.
> +- clock-names: Name of the clocks.
> +  - The funcional clock must be "usb3-if".
> +  - The usb3's external clock must be "usb3s_clk". If you want to use the ssc,
> +    the clock-frequency must be 0.

Given you have "renesas,ssc-range" to enable ssc, I think it doesn't matter
if the clock frequency is 0 or not, so the "if you..." part can be removed.

> +  - The usb2's external clock must be "usb_extal". If you want to use the ssc,
> +    the clock-frequenvy must not be 0.

frequency

Here it does matter, as you need this clock for ssc.
BTW, the driver can fallback to the other clock if ssc cannot be used.

> +Optional properties:
> +- renesas,ssc-range: Enable/disable spread spectrum clock (ssc) by using
> +                    the following values as u32:
> +                       - 0 (or the property doesn't exist): disable the ssc
> +                       - 4980: enable the ssc as -4980 ppm
> +                       - 4492: enable the ssc as -4492 ppm
> +                       - 4003: enable the ssc as -4003 ppm

Using ssc or not sounds like software policy, not hardware description?
Can this be decided at runtime?

> --- /dev/null
> +++ b/drivers/phy/renesas/phy-rcar-gen3-usb3.c

> +static const struct of_device_id rcar_gen3_phy_usb3_match_table[] = {
> +       { .compatible = "renesas,r8a7795-usb3-phy" },
> +       { .compatible = "renesas,r8a7796-usb3-phy" },

As the driver matches against the generic compatible property, the above two
lines can be removed.

> +       { .compatible = "renesas,rcar-gen3-usb3-phy" },
> +       { }
> +};
> +MODULE_DEVICE_TABLE(of, rcar_gen3_phy_usb3_match_table);

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
