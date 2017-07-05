From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] clk: renesas: rcar-usb2-clock-sel: Add R-Car USB 2.0
 clock selector PHY
Date: Wed, 5 Jul 2017 09:15:32 -0500
Message-ID: <20170705141532.slvvbxh33sgwotje@rob-hp-laptop>
References: <1498631315-15730-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1498631315-15730-1-git-send-email-yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Cc: mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jun 28, 2017 at 03:28:35PM +0900, Yoshihiro Shimoda wrote:
> R-Car USB 2.0 controller can change the clock source from an oscillator
> to an external clock via a register. So, this patch adds support
> the clock source selector as a clock driver.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
> ---
>  This patch is based on the renesas-drivers.git /
> renesas-drivers-2017-06-27-v4.12-rc7 tag.
> 
>  Changes from v1:
>   - Change this driver as a clock driver from a generic phy driver.
>     https://patchwork.kernel.org/patch/9788697/
>   - Remove "RFC" tag.
> 
>  .../bindings/clock/renesas,rcar-usb2-clock-sel.txt |  54 ++++++
>  drivers/clk/renesas/Kconfig                        |   5 +
>  drivers/clk/renesas/Makefile                       |   1 +
>  drivers/clk/renesas/rcar-usb2-clock-sel.c          | 205 +++++++++++++++++++++
>  4 files changed, 265 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.txt
>  create mode 100644 drivers/clk/renesas/rcar-usb2-clock-sel.c
> 
> diff --git a/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.txt b/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.txt
> new file mode 100644
> index 0000000..75ccafc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.txt
> @@ -0,0 +1,54 @@
> +* Renesas R-Car USB 2.0 clock selector
> +
> +This file provides information on what the device node for the R-Car USB 2.0
> +clock selector.
> +
> +If you connect an external clock to the USB_EXTAL pin only, you should set
> +the clock rate to "usb_extal" node only.
> +If you connect an oscillator to both the USB_XTAL and USB_EXTAL, this module
> +is not needed because this is default setting. (Of course, you can set the
> +clock rates to both "usb_extal" and "usb_xtal" nodes.
> +
> +Case 1: An external clock connects to R-Car SoC
> +        +----------+   +--- R-Car ---------------------+
> +        |External  |---|USB_EXTAL ---> all usb channels|
> +        |clock     |   |USB_XTAL                       |
> +        +----------+   +-------------------------------+
> +In this case, we need this driver with "usb_extal" clock.
> +
> +Case 2: An oscillator connects to R-Car SoC
> +        +----------+   +--- R-Car ---------------------+
> +        |Oscillator|---|USB_EXTAL -+-> all usb channels|
> +        |          |---|USB_XTAL --+                   |
> +        +----------+   +-------------------------------+
> +In this case, we don't need this selector.
> +
> +Required properties:
> +- compatible: "renesas,r8a7795-rcar-usb2-clock-sel" if the device is a part of
> +	      an R8A7795 SoC.
> +              "renesas,r8a7796-rcar-usb2-clock-sel" if the device if a part of
> +	      an R8A7796 SoC.
> +              "renesas,rcar-gen3-usb2-clock-sel" for a generic R-Car Gen3
> +              compatible device.
> +
> +              When compatible with the generic version, nodes must list the
> +              SoC-specific version corresponding to the platform first
> +              followed by the generic version.
> +
> +- reg: offset and length of the USB 2.0 clock selector register block.
> +- clocks: A list of phandles and specifier pairs.
> +- clock-names: Name of the clocks.
> + - The functional clock must be "ehci_ohci"
> + - The USB_EXTAL clock pin must be "usb_extal"
> + - The USB_XTAL clock pin must be "usb_xtal"
> +- #clock-cells: Must be 0
> +
> +Exxample (R-Car H3):
> +
> +        usb2_clksel: clock-controller@e6590630 {
> +                compatible = "renesas,r8a77950-rcar-usb2-clock-sel",
> +                             "renesas,rcar-gen3-usb2-clock-sel";
> +                reg = <0 0xe6590630 0 0x02>;
> +                clocks = <&cpg CPG_MOD 703>, <&usb_extal>, <&usb_xtal>;
> +                clock-names = "ehci_ohci", "usb_extal", "usb_xtal";

Missing #clock-cells

With that, for the binding:

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
