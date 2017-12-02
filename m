From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/4] RFC: net: dsa: Add bindings for Realtek SMI DSAs
Date: Sat, 2 Dec 2017 13:56:10 +0100
Message-ID: <CACRpkdYoMVNh8eaTnaDQ59bsh4bC88biLaYSXyhnc4W83PMWzA@mail.gmail.com>
References: <20171105231909.5599-1-linus.walleij@linaro.org>
 <20171105231909.5599-4-linus.walleij@linaro.org> <20171105234831.GA24822@lunn.ch>
 <CACRpkdbzqnbF49yN-SAqLkhufk=R2C=jpdLo-QWmL0zR_+Vj=w@mail.gmail.com>
 <20171129155627.GD24881@lunn.ch> <CACRpkdZVXgFMiHpyUqw7ONYDcq6Htn3rTMRaBJkzd6T3WtX36A@mail.gmail.com>
 <20171129215659.GC1706@lunn.ch> <CACRpkdbUig-wb9_CnyF7DM4JsHCv4iruKx92wNXDdZtbrr2HoA@mail.gmail.com>
 <f9bfa1e1-7f05-1e2b-6663-09d4d3bf6a12@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <f9bfa1e1-7f05-1e2b-6663-09d4d3bf6a12@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@savoirfairelinux.com>, netdev@vger.kernel.org, =?UTF-8?B?QW50dGkgU2VwcMOkbMOk?= <a.seppala@gmail.com>, Roman Yeryomin <roman@advem.lv>, Colin Leitner <colin.leitner@googlemail.com>, Gabor Juhos <juhosg@openwrt.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 30, 2017 at 12:26 AM, Florian Fainelli <f.fainelli@gmail.com> wrote:
> On 11/29/2017 03:19 PM, Linus Walleij wrote:

>> Or are there in pracice things such that reg is different
>> on the port and the PHY connected to it? Then it makes
>> much sense to put an MDIO bus inside the switch DT
>> node and populate the PHY interrupts from there as you
>> say.
>
> Yes, I have such systems here, Port 0 has its PHY at MDIO address 5 for
> instance.

That explains it.

> switch@0 {
>         compatible = "acme,switch";
>         #address-cells = <1>;
>         #size-cells = <0>;
>
>         ports {
>
>                 port@0 {
>                         reg = <0>;
>                         phy-handle = <&phy0>;
>                 };
>
>                 port@1 {
>                         reg = <1>;
>                         phy-handle = <&phy1>;
>                 };
>
>                 port@8 {
>                         reg = <8>;
>                         ethernet = = <&eth0>;
>                 };
>         };
>
>         mdio {
>                 compatible = "acme,switch-mdio";
>
>                 phy@0 {
>                         reg = <0>;
>                 };
>
>                 phy@1 {
>                         reg = <1>;
>                 };
>         };
> };
>
> That way it's clear which port maps to which PHY, and that the MDIO
> controller is internal within the switch (and so are the PHYs).

So why not:

switch@0 {
        compatible = "acme,switch";
        #address-cells = <1>;
        #size-cells = <0>;

        ports {

                port@0 {
                        reg = <0>;
                        phy@0 {
                             reg = <0>;
                        };
                };

                port@1 {
                        reg = <1>;
                        phy@1 {
                             reg = <1>;
                        };
                };

                port@8 {
                        reg = <8>;
                        ethernet = = <&eth0>;
                };
        };

This avoids the cross-referencing of phandles.

Yours,
Linus Walleii
