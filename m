From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 4/8] dt-bindings: usb: dwc3: Add Amlogic G12A DWC3 Glue Bindings
Date: Sun, 24 Feb 2019 20:52:40 +0100
Message-ID: <CAFBinCC87H+Do3dGooYMpFjozBTCv2agmS_p5cJRbFQ7QCiuiA@mail.gmail.com>
References: <20190212151413.24632-1-narmstrong@baylibre.com> <20190212151413.24632-5-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190212151413.24632-5-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: gregkh@linuxfoundation.org, hminas@synopsys.com, balbi@kernel.org, kishon@ti.com, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Neil,

On Tue, Feb 12, 2019 at 4:15 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
[...]
> +
> +Example device nodes:
> +       usb: usb@ffe09000 {
> +                       compatible = "amlogic,meson-g12a-usb-ctrl";
> +                       reg = <0x0 0xffe09000 0x0 0xa0>;
> +                       interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
> +                       #address-cells = <2>;
> +                       #size-cells = <2>;
> +                       ranges;
> +
> +                       clocks = <&clkc CLKID_USB>;
> +                       clock-names = "usb";
> +                       resets = <&reset RESET_USB>;
> +                       reset-names = "usb";
> +
> +                       ports {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               /* USB2 Port 0 */
> +                               usb20: port@0 {
> +                                       reg = <0>;
> +                                       phys = <&usb2_phy0>;
> +                               };
> +
> +                               /* USB2 Port 1 */
> +                               usb21: port@1 {
> +                                       reg = <1>;
> +                                       phys = <&usb2_phy1>;
> +                               };
> +
> +                               /* USB3 Port 0 */
> +                               usb3: port@4 {
> +                                       reg = <4>;
> +                                       phys = <&usb3_pcie_phy PHY_TYPE_USB3>;
> +                               };
> +                       };
> +
> +                       dwc2: usb@ff400000 {
> +                               compatible = "amlogic,meson-g12a-usb", "snps,dwc2";
> +                               reg = <0x0 0xff400000 0x0 0x40000>;
> +                               interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
> +                               clocks = <&clkc CLKID_USB1_DDR_BRIDGE>;
> +                               clock-names = "ddr";
> +                               dr_mode = "peripheral";
> +                               g-rx-fifo-size = <192>;
> +                               g-np-tx-fifo-size = <128>;
> +                               g-tx-fifo-size = <128 128 16 16 16>;
> +                       };
you suggested (off-list) that the OTG capable PHY should be passed to
the dwc2 instance
I'm aware that this is an example - could you please still add it for
consistency?

> +
> +                       dwc3: dwc3@ff500000 {
> +                               compatible = "snps,dwc3";
> +                               reg = <0x0 0xff500000 0x0 0x100000>;
> +                               interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
> +                               dr_mode = "host";
> +                               snps,dis_u2_susphy_quirk;
> +                               snps,quirk-frame-length-adjustment;
> +                       };
maybe the phys should also be passed to the dwc3 instance?


Regards
Martin
