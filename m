From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] openrisc: Add DTS and defconfig for DE0-Nano
Date: Wed, 20 Nov 2013 14:45:26 -0600
Message-ID: <CAL_JsqLuaOqw2X7dcwnJbnTvO30pbV4=5TLfEygEeB6gBw3G_A@mail.gmail.com>
References: <1384029451-16555-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1384029451-16555-1-git-send-email-geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Jonas Bonn <jonas-A9uVI2HLR7kOP4wsBPIw7w@public.gmane.org>, linux-ZwoEplunGu2h2975yA52AaxOck334EZe@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kevin Mehall <contact-U/VwWUtD1TkEIRV9q1A9vg@public.gmane.org>, Marek Czerski <ma.czerski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Nov 9, 2013 at 2:37 PM, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org> wrote:
> Add a DTS and defconfig for the Terasic DE0-Nano Development and Education
> Board running ORPSoC.  This board contains an Altera Cyclone IV FPGA with
> support chips and I/O.
>
> The DTS was derived from published versions by Kevin Mehall and Marek
> Czerski.
>
> Signed-off-by: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
> Cc: Kevin Mehall <contact-U/VwWUtD1TkEIRV9q1A9vg@public.gmane.org>
> Cc: Marek Czerski <ma.czerski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> Notable changes:
>   - Change flash0 to spansion,s25sl064p, due to kernel message
>     m25p80 spi32766.0: found s25sl064p, expected m25p10
>   - Use reg-shift instead of regstep for i2c0, due to kernel message
>     ocores-i2c a0000000.ocores: regstep property deprecated, use reg-shift
>
>  arch/openrisc/boot/dts/de0_nano.dts      |  158 ++++++++++++++++++++++++++++++
>  arch/openrisc/configs/de0_nano_defconfig |   86 ++++++++++++++++
>  2 files changed, 244 insertions(+)
>  create mode 100644 arch/openrisc/boot/dts/de0_nano.dts
>  create mode 100644 arch/openrisc/configs/de0_nano_defconfig
>
> diff --git a/arch/openrisc/boot/dts/de0_nano.dts b/arch/openrisc/boot/dts/de0_nano.dts
> new file mode 100644
> index 000000000000..42f91b5184d9
> --- /dev/null
> +++ b/arch/openrisc/boot/dts/de0_nano.dts
> @@ -0,0 +1,158 @@
> +/dts-v1/;
> +/ {
> +       compatible = "opencores,de0_nano";

This string needs to be documented.

> +       #address-cells = <1>;
> +       #size-cells = <1>;
> +       interrupt-parent = <&pic>;
> +
> +       chosen {
> +               bootargs = "console=uart,mmio,0x90000000,115200";
> +       };
> +
> +       memory@0 {
> +               device_type = "memory";
> +               reg = <0x00000000 0x02000000>;
> +       };
> +
> +       cpus {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               cpu@0 {
> +                       compatible = "opencores,or1200-rtlsvn481";
> +                       reg = <0>;
> +                       clock-frequency = <50000000>;
> +               };
> +       };
> +
> +       /*
> +        * OR1K PIC is built into CPU and accessed via special purpose
> +        * registers.  It is not addressable and, hence, has no 'reg'
> +        * property.
> +        */
> +       pic: pic {
> +               compatible = "opencores,or1k-pic";
> +               #interrupt-cells = <1>;
> +               interrupt-controller;
> +       };
> +
> +       serial0: serial@90000000 {

These memory mapped devices should be under a bus node of some sort.
Typically a "simple-bus" node.

> +               compatible = "opencores,uart16550-rtlsvn105", "ns16550a";

This needs to be documented. Same comment applies to all compatible strings.

> +               reg = <0x90000000 0x100>;
> +               interrupts = <2>;
> +               clock-frequency = <50000000>;
> +       };
> +
> +       i2c0: ocores@a0000000 {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               compatible = "opencores,i2c-ocores";
> +               reg = <0xa0000000 0x8>;
> +               interrupts = <10>;
> +               clock-frequency = <50000000>;
> +
> +               reg-shift = <0>;        /* 8 bit registers */
> +               reg-io-width = <1>;     /* 8 bit read/write */
> +
> +               adxl34x@1d {
> +                       compatible = "adxl34x";
> +                       reg = <0x1d>;
> +                       interrupts = <26>;
> +               };
> +               eeprom@50 {
> +                       compatible = "at24,24c02";
> +                       reg = <0x50>;
> +                       pagesize = <8>;
> +               };
> +       };
> +
> +       spi0: spi0@b0000000 {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               compatible = "opencores,spi-simple";

Is this different than "opencores,tiny-spi-rtlsvn2"? Is "simple"
something I can correlate to a specific version of h/w?

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
