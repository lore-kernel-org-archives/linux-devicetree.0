From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/4] RFC: net: dsa: Add bindings for Realtek SMI DSAs
Date: Wed, 29 Nov 2017 13:24:01 +0100
Message-ID: <CACRpkdbzqnbF49yN-SAqLkhufk=R2C=jpdLo-QWmL0zR_+Vj=w@mail.gmail.com>
References: <20171105231909.5599-1-linus.walleij@linaro.org>
 <20171105231909.5599-4-linus.walleij@linaro.org> <20171105234831.GA24822@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171105234831.GA24822-g2DYL2Zd6BY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Vivien Didelot <vivien.didelot-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?B?QW50dGkgU2VwcMOkbMOk?= <a.seppala-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Roman Yeryomin <roman-9zmcapQ0v8Q@public.gmane.org>, Colin Leitner <colin.leitner-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Gabor Juhos <juhosg-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Nov 6, 2017 at 12:48 AM, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org> wrote:
>> This interrupt construction is similar to how we handle
>> interrupt controllers inside PCI bridges etc.
>
> Hi Linus
>
> Your interrupt handling is going in the right direction, but needs
> further work. The PHY interrupt is a phy property, so should be in the
> PHY node in device tree.
>
> The Marvell driver gives an example of this, and
> vf610-zii-dev-rev-c.dts is an example DT blob you can look at.
>
>> +     ports {
>> +             #address-cells = <1>;
>> +             #size-cells = <0>;
>> +             reg = <0>;
>> +             port@0 {
>> +                     reg = <0>;
>> +                     label = "lan0";
>
> So here, you should have a
>
>                         phy-handle = <&phy0>;
>
> linking this MAC to the PHY connected to it.

I have the phy-handle in the ethernet controller. This RTL8366RB
thing is just one big PHY as far as I know. So to give the complete picture
this is what I have in my tree right now with the RTL8366RB as PHY
and Gemini ethernet (yeah I'm upstreaming that too...) as the ethernet
controller:

/* This is a RealTek RTL8366RB switch and PHY using SMI over GPIO */
switch {
    compatible = "realtek,rtl8366rb";
    reg = <0>;
    /* 22 = MDIO (has input reads), 21 = MDC (clock, output only) */
    mdc-gpios = <&gpio0 21 GPIO_ACTIVE_HIGH>;
    mdio-gpios = <&gpio0 22 GPIO_ACTIVE_HIGH>;
    reset-gpios = <&gpio0 14 GPIO_ACTIVE_LOW>;
    realtek,disable-leds;

    switch_intc: interrupt-controller {
        /* GPIO 15 provides the interrupt */
        interrupt-parent = <&gpio0>;
        interrupts = <15 IRQ_TYPE_LEVEL_LOW>;
        interrupt-controller;
        #address-cells = <0>;
        #interrupt-cells = <1>;
    };

    ports {
        #address-cells = <1>;
        #size-cells = <0>;

        port@0 {
            reg = <0>;
            label = "lan0";
            interrupt-parent = <&switch_intc>;
            interrupts = <0>;
        };
        port@1 {
            reg = <1>;
            label = "lan1";
            interrupt-parent = <&switch_intc>;
            interrupts = <1>;
        };
        port@2 {
            reg = <2>;
            label = "lan2";
            interrupt-parent = <&switch_intc>;
            interrupts = <2>;
        };
        port@3 {
            reg = <3>;
            label = "lan3";
            interrupt-parent = <&switch_intc>;
            interrupts = <3>;
        };
        port@4 {
            reg = <4>;
            label = "wan";
            interrupt-parent = <&switch_intc>;
            interrupts = <12>;
        };
        phy0: port@5 {
            reg = <5>;
            label = "cpu";
            ethernet = <&gmac0>;
            phy-mode = "rgmii";
            fixed-link {
                speed = <1000>;
                full-duplex;
            };
    };
};


ethernet@60000000 {
    compatible = "cortina,gemini-ethernet";
    reg = <0x60000000 0x4000>;
    #address-cells = <1>;
    #size-cells = <1>;
    ranges;

    gmac0: port0 {
        compatible = "cortina,gemini-ethernet-port";
        reg = <0x60008000 0x2000>, /* Port 0 DMA/TOE */
        <0x6000a000 0x2000>; /* Port 0 GMAC */
        interrupt-parent = <&intcon>;
        interrupts = <1 IRQ_TYPE_LEVEL_HIGH>;
        resets = <&syscon GEMINI_RESET_GMAC0>;
        clocks = <&syscon GEMINI_CLK_GATE_GMAC0>;
        clock-names = "PCLK";
        phy-mode = "rgmii";
        phy-handle = <&phy0>;
    };
};


> And then an MDIO bus, listing the PHYs
>
>                mdio {
>                         #address-cells = <1>;
>                         #size-cells = <0>;
>
>                         phy0: phy@0 {
>                                 reg = <0>;
>                                 interrupt-parent = <&switch_intc>;
>                                 interrupts = <0>;
>                         };
>
> It is here you list the interrupts. And the PHY subsystem will link
> the interrupt to the PHY when it enumerate the MDIO bus.

I do get that to work with a lot of standard PHY drivers
in drivers/net/phy, that assume they have an IRQ line from
device tree or board files.

However when PHY slave children are spawn from the
internal DSA MDIO bus interrupts are not assigned from the
device tree, so that is why I have a separate patch for that.

> You have most of the code already for implementing the MDIO bus. The
> rest you can probably borrow from the mv88e6xxx driver.

I have a working MDIO bus coming out directly from the SDA core,
so that part is fine. I also patched in the corresponding PHY driver
(a Realtek derivative for this DSA only, so just a few lines add
in the Realtek PHY driver) and it works fine.

I will repost the series as a non-RFC when I have all parts working
and illustrate with a few examples so you see how I set it up.
I hope I didn't turn the entire subsystem on its head or something...

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
