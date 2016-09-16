From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 4/7] phy: meson: add USB2 PHY support for Meson8b and GXBB
Date: Fri, 16 Sep 2016 15:47:43 +0200
Message-ID: <2190413.jSIVEWUDcp@wuerfel>
References: <20160904213152.25837-1-martin.blumenstingl@googlemail.com> <CAFBinCCDDwydB+RP0CZKoAW5Suxotn224ZFVWvt2OGW3gNJR1g@mail.gmail.com> <57DBAB2F.3040905@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <57DBAB2F.3040905@ti.com>
Sender: linux-clk-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>, Ben Dooks <ben.dooks@codethink.co.uk>, mark.rutland@arm.com, devicetree@vger.kernel.org, gregkh@linuxfoundation.org, johnyoun@synopsys.com, will.deacon@arm.com, mturquette@baylibre.com, linux-usb@vger.kernel.org, sboyd@codeaurora.org, robh+dt@kernel.org, catalin.marinas@arm.com, carlo@caione.org, linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
List-Id: devicetree@vger.kernel.org

On Friday, September 16, 2016 1:49:59 PM CEST Kishon Vijay Abraham I wrote:
> 
> I think the offset information can come from the devicetree too. The phy can be
> modeled something like below.
> 
>                 usb-phys@c0000000 {
>                         compatible = "amlogic,meson-gxbb-usb2-phy";
>                         reg = <0x0 0xc0000000 0x0 0x40>;
>                         #address-cells = <2>;
>                         #size-cells = <2>;
>                         ranges = <0x0 0x0 0x0 0xc0000000 0x0 0x40>;
>                         resets = <&reset 34>;
> 
>                         usb0_phy: usb_phy@0 {
>                                 #phy-cells = <0>;
>                                 reg = <0x0 0x0 0x0 0x20>;
>                                 clocks = <&clkc CLKID_USB &clkc CLKID_USB0>;
>                                 clock-names = "usb_general", "usb";
>                                 status = "disabled";
>                         };
> 
>                         usb1_phy: usb_phy@20 {
>                                 #phy-cells = <0>;
>                                 reg = <0x0 0x20 0x0 0x20>;
>                                 clocks = <&clkc CLKID_USB &clkc CLKID_USB1>;
>                                 clock-names = "usb_general", "usb";
>                                 status = "disabled";
>                         };
>                 };
> 
> This way the driver will be probed only once (the reset can be done during
> probe). The phy driver should scan the dt node and for every sub-node it
> invokes phy_create?

Why not just use #phy-cells=<1> and pass the phy number as an argument
in the reference?

	Arnd
