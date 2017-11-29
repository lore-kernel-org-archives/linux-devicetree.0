From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH 3/4] RFC: net: dsa: Add bindings for Realtek SMI DSAs
Date: Wed, 29 Nov 2017 15:26:08 -0800
Message-ID: <f9bfa1e1-7f05-1e2b-6663-09d4d3bf6a12@gmail.com>
References: <20171105231909.5599-1-linus.walleij@linaro.org>
 <20171105231909.5599-4-linus.walleij@linaro.org>
 <20171105234831.GA24822@lunn.ch>
 <CACRpkdbzqnbF49yN-SAqLkhufk=R2C=jpdLo-QWmL0zR_+Vj=w@mail.gmail.com>
 <20171129155627.GD24881@lunn.ch>
 <CACRpkdZVXgFMiHpyUqw7ONYDcq6Htn3rTMRaBJkzd6T3WtX36A@mail.gmail.com>
 <20171129215659.GC1706@lunn.ch>
 <CACRpkdbUig-wb9_CnyF7DM4JsHCv4iruKx92wNXDdZtbrr2HoA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <CACRpkdbUig-wb9_CnyF7DM4JsHCv4iruKx92wNXDdZtbrr2HoA@mail.gmail.com>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Andrew Lunn <andrew@lunn.ch>
Cc: Vivien Didelot <vivien.didelot@savoirfairelinux.com>, netdev@vger.kernel.org, =?UTF-8?B?QW50dGkgU2VwcMOkbMOk?= <a.seppala@gmail.com>, Roman Yeryomin <roman@advem.lv>, Colin Leitner <colin.leitner@googlemail.com>, Gabor Juhos <juhosg@openwrt.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 11/29/2017 03:19 PM, Linus Walleij wrote:
> On Wed, Nov 29, 2017 at 10:56 PM, Andrew Lunn <andrew@lunn.ch> wrote:
> 
>> I think the problem might be, you are using the DSA provided MDIO bus.
>> The Marvell switches has a similar setup in terms of interrupts. The
>> PHY interrupts appear within the switch. So i implemented an interrupt
>> controller, just the same as you.
>>
>> The problem is, the DSA provided MDIO bus is not linked to device
>> tree. So you cannot have phy nodes in device tree associated to it.
>>
>> What i did for the Marvell driver is that driver itself implements an
>> MDIO bus (two actually in some chips), and the internal or external
>> PHYs are placed on the switch drivers MDIO bus, rather than the DSA
>> MDIO bus. The switch driver MDIO bus links to an mdio node in device
>> tree. I can then have interrupt properties in the phys on this MDIO
>> bus in device tree.
>>
>> What actually might make sense, is to have the DSA MDIO bus look
>> inside the switches device tree node and see if there is an mdio
>> node. If so allow dsa_switch_setup() to use of_mdiobus_register()
>> instead of mdiobus_register().
> 
> Aha I think I see where my thinking went wrong.
> 
> I have been assuming (thought it was intuitive...) that ports and
> PHYs are mapped 1:1.
> 
> So I assumed the port with reg = <N> is also the PHY with
> reg = <N>
> 
> So naturally I added the PHY interrupt to the port node.
> 
> So you are saying that the PHY and the port are two
> very disparate things in DSA terminology?

Yes, because the port is some sort of simplified Ethernet MAC, whereas
the PHY is the PHY, and it usually exists in the same shape and size
irrespective of whether it's integrated into a switch, being external,
or being internal to a proper Ethernet NIC.

> 
> I guess all ports except the CPU port actually have
> a 1:1 mapped PHY though, am I right?

This is the typical case, but is not universally true.

> 
> Or are there in pracice things such that reg is different
> on the port and the PHY connected to it? Then it makes
> much sense to put an MDIO bus inside the switch DT
> node and populate the PHY interrupts from there as you
> say.

Yes, I have such systems here, Port 0 has its PHY at MDIO address 5 for
instance.

> 
> I can take a stab at fixing that if that is what we want.

While Andrew's suggestion to use of_mdiobus_register() even for the
built-in DSA created slave_mii_bus makes sense, I would rather recommend
you instantiate your own bus (ala mv88e6xxx), such that your DT will
likely look like:

switch@0 {
	compatible = "acme,switch";
	#address-cells = <1>;
	#size-cells = <0>;

	ports {

		port@0 {
			reg = <0>;
			phy-handle = <&phy0>;
		};

		port@1 {
			reg = <1>;
			phy-handle = <&phy1>;
		};

		port@8 {
			reg = <8>;
			ethernet = = <&eth0>;
		};
	};

	mdio {
		compatible = "acme,switch-mdio";

		phy@0 {
			reg = <0>;
		};

		phy@1 {
			reg = <1>;
		};
	};
};

That way it's clear which port maps to which PHY, and that the MDIO
controller is internal within the switch (and so are the PHYs).
-- 
Florian
