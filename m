From: Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCH 1/2] MIPS: BMIPS: add BCM7435 dtsi
Date: Tue, 5 May 2015 23:25:27 +0200
Message-ID: <CAOiHx==xksGPppXh5SU5e7bfEf1foSb9x8RjyhtDGOQq-=oumw@mail.gmail.com>
References: <1430788257-10244-1-git-send-email-f.fainelli@gmail.com> <1430788257-10244-2-git-send-email-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1430788257-10244-2-git-send-email-f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: MIPS Mailing List <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, cernekee-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, "Steven J. Hill" <Steven.Hill-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

please CC devicetree on dts(i) submissions.

On Tue, May 5, 2015 at 3:10 AM, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Add the bare minimum required to boot a BCM7435-based system:
>
> - BMIPS5200 CPU nodes
> - Level 1 and 2 interrupt controllers
> - UARTs
> - EHCI/OHCI controllers
>
> Signed-off-by: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/mips/boot/dts/brcm/bcm7435.dtsi | 239 +++++++++++++++++++++++++++++++++++
>  1 file changed, 239 insertions(+)
>  create mode 100644 arch/mips/boot/dts/brcm/bcm7435.dtsi
>
> diff --git a/arch/mips/boot/dts/brcm/bcm7435.dtsi b/arch/mips/boot/dts/brcm/bcm7435.dtsi
> new file mode 100644
> index 000000000000..8b9432cc062b
> --- /dev/null
> +++ b/arch/mips/boot/dts/brcm/bcm7435.dtsi
> @@ -0,0 +1,239 @@
> +/ {
> +       #address-cells = <1>;
> +       #size-cells = <1>;
> +       compatible = "brcm,bcm7435";
> +
> +       cpus {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               mips-hpt-frequency = <163125000>;
> +
> +               cpu@0 {
> +                       compatible = "brcm,bmips5200";
> +                       device_type = "cpu";
> +                       reg = <0>;
> +               };
> +
> +               cpu@1 {
> +                       compatible = "brcm,bmips5200";
> +                       device_type = "cpu";
> +                       reg = <1>;
> +               };
> +
> +               cpu@2 {
> +                       compatible = "brcm,bmips5200";
> +                       device_type = "cpu";
> +                       reg = <2>;
> +               };
> +
> +               cpu@3 {
> +                       compatible = "brcm,bmips5200";
> +                       device_type = "cpu";
> +                       reg = <3>;
> +               };
> +       };
> +
> +       aliases {
> +               uart0 = &uart0;
> +       };
> +
> +       cpu_intc: cpu_intc {
> +               #address-cells = <0>;
> +               compatible = "mti,cpu-interrupt-controller";
> +
> +               interrupt-controller;
> +               #interrupt-cells = <1>;
> +       };
> +
> +       clocks {
> +               uart_clk: uart_clk {
> +                       compatible = "fixed-clock";
> +                       #clock-cells = <0>;
> +                       clock-frequency = <81000000>;

While optional, I think it might be a good idea to provide a
clock-output-names property.

> +               };
> +       };
> +
> +       rdb {
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +
> +               compatible = "simple-bus";
> +               ranges = <0 0x10000000 0x01000000>;
> +
> +               periph_intc: periph_intc@41b500 {

This should be periph_intc: interrupt-controller@...

> +                       compatible = "brcm,bcm7038-l1-intc";
> +                       reg = <0x41b500 0x40>, <0x41b600 0x40>;
> +
> +                       interrupt-controller;
> +                       #interrupt-cells = <1>;
> +
> +                       interrupt-parent = <&cpu_intc>;
> +                       interrupts = <2>, <3>;
> +               };
> +
> +               sun_l2_intc: sun_l2_intc@403000 {

similar here

> +                       compatible = "brcm,l2-intc";

This sounds overly generic, I think you missed a chip id there.

> +                       reg = <0x403000 0x30>;
> +                       interrupt-controller;
> +                       #interrupt-cells = <1>;
> +                       interrupt-parent = <&periph_intc>;
> +                       interrupts = <52>;
> +               };
> +
> +               gisb-arb@400000 {
> +                       compatible = "brcm,bcm7400-gisb-arb";
> +                       reg = <0x400000 0xdc>;
> +                       native-endian;
> +                       interrupt-parent = <&sun_l2_intc>;
> +                       interrupts = <0>, <2>;
> +                       brcm,gisb-arb-master-mask = <0xf77f>;
> +                       brcm,gisb-arb-master-names = "ssp_0", "cpu_0", "webcpu_0",
> +                                                    "pcie_0", "bsp_0",
> +                                                    "rdc_0", "raaga_0",
> +                                                    "avd_1", "jtag_0",
> +                                                    "svd_0", "vice_0",
> +                                                    "vice_1", "raaga_1",
> +                                                    "scpu";
> +               };
> +
> +               upg_irq0_intc: upg_irq0_intc@406780 {
> +                       compatible = "brcm,bcm7120-l2-intc";
> +                       reg = <0x406780 0x8>;
> +
> +                       brcm,int-map-mask = <0x44>;
> +                       brcm,int-fwd-mask = <0x70000>;
> +
> +                       interrupt-controller;
> +                       #interrupt-cells = <1>;
> +
> +                       interrupt-parent = <&periph_intc>;
> +                       interrupts = <60>;
> +               };
> +
> +               sun_top_ctrl: syscon@404000 {
> +                       compatible = "brcm,bcm7425-sun-top-ctrl", "syscon";
> +                       reg = <0x404000 0x51c>;
> +                       little-endian;

So this one doesn't follow system endianness?

> +               };
> +
> +               reboot {
> +                       compatible = "brcm,brcmstb-reboot";
> +                       syscon = <&sun_top_ctrl 0x304 0x308>;
> +               };
> +
> +               uart0: serial@406b00 {
> +                       compatible = "ns16550a";
> +                       reg = <0x406b00 0x20>;
> +                       reg-io-width = <0x4>;
> +                       reg-shift = <0x2>;

Do we really need a hex notation for these?

> +                       interrupt-parent = <&periph_intc>;
> +                       interrupts = <66>;
> +                       clocks = <&uart_clk>;
> +                       status = "disabled";
> +               };
> +
> +               enet0: ethernet@b80000 {
> +                       phy-mode = "internal";
> +                       phy-handle = <&phy1>;
> +                       mac-address = [ 00 10 18 36 23 1a ];

I hope this isn't the mac of your reference board ;-)

> +                       compatible = "brcm,genet-v3";

Usually the compatible property is the first one, a bit surprising to
see it in the middle.

> +                       #address-cells = <0x1>;
> +                       #size-cells = <0x1>;

Do we really need a hex notation for these?

> +                       reg = <0xb80000 0x11c88>;
> +                       interrupts = <17>, <18>;
> +                       interrupt-parent = <&periph_intc>;
> +                       status = "disabled";
> +
> +                       mdio@e14 {
> +                               compatible = "brcm,genet-mdio-v3";
> +                               #address-cells = <0x1>;
> +                               #size-cells = <0x0>;

Do we really need a hex notation for these?

> +                               reg = <0xe14 0x8>;
> +
> +                               phy1: ethernet-phy@1 {
> +                                       max-speed = <100>;
> +                                       reg = <0x1>;

Do we really need a hex notation for this?

Regards
Jonas (keeping the rest of the patch intact so devicetree can see it)


> +                                       compatible = "brcm,40nm-ephy",
> +                                               "ethernet-phy-ieee802.3-c22";
> +                               };
> +                       };
> +               };
> +
> +               ehci0: usb@480300 {
> +                       compatible = "brcm,bcm7435-ehci", "generic-ehci";
> +                       reg = <0x480300 0x100>;
> +                       native-endian;
> +                       interrupt-parent = <&periph_intc>;
> +                       interrupts = <70>;
> +                       status = "disabled";
> +               };
> +
> +               ohci0: usb@480400 {
> +                       compatible = "brcm,bcm7435-ohci", "generic-ohci";
> +                       reg = <0x480400 0x100>;
> +                       native-endian;
> +                       no-big-frame-no;
> +                       interrupt-parent = <&periph_intc>;
> +                       interrupts = <72>;
> +                       status = "disabled";
> +               };
> +
> +               ehci1: usb@480500 {
> +                       compatible = "brcm,bcm7435-ehci", "generic-ehci";
> +                       reg = <0x480500 0x100>;
> +                       native-endian;
> +                       interrupt-parent = <&periph_intc>;
> +                       interrupts = <71>;
> +                       status = "disabled";
> +               };
> +
> +               ohci1: usb@480600 {
> +                       compatible = "brcm,bcm7435-ohci", "generic-ohci";
> +                       reg = <0x480600 0x100>;
> +                       native-endian;
> +                       no-big-frame-no;
> +                       interrupt-parent = <&periph_intc>;
> +                       interrupts = <73>;
> +                       status = "disabled";
> +               };
> +
> +               ehci2: usb@490300 {
> +                       compatible = "brcm,bcm7435-ehci", "generic-ehci";
> +                       reg = <0x490300 0x100>;
> +                       native-endian;
> +                       interrupt-parent = <&periph_intc>;
> +                       interrupts = <75>;
> +                       status = "disabled";
> +               };
> +
> +               ohci2: usb@490400 {
> +                       compatible = "brcm,bcm7435-ohci", "generic-ohci";
> +                       reg = <0x490400 0x100>;
> +                       native-endian;
> +                       no-big-frame-no;
> +                       interrupt-parent = <&periph_intc>;
> +                       interrupts = <77>;
> +                       status = "disabled";
> +               };
> +
> +               ehci3: usb@490500 {
> +                       compatible = "brcm,bcm7435-ehci", "generic-ehci";
> +                       reg = <0x490500 0x100>;
> +                       native-endian;
> +                       interrupt-parent = <&periph_intc>;
> +                       interrupts = <76>;
> +                       status = "disabled";
> +               };
> +
> +               ohci3: usb@490600 {
> +                       compatible = "brcm,bcm7435-ohci", "generic-ohci";
> +                       reg = <0x490600 0x100>;
> +                       native-endian;
> +                       no-big-frame-no;
> +                       interrupt-parent = <&periph_intc>;
> +                       interrupts = <78>;
> +                       status = "disabled";
> +               };
> +       };
> +};
> --
> 2.1.0
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
