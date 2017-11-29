From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/4] RFC: net: dsa: Add bindings for Realtek SMI DSAs
Date: Thu, 30 Nov 2017 00:19:42 +0100
Message-ID: <CACRpkdbUig-wb9_CnyF7DM4JsHCv4iruKx92wNXDdZtbrr2HoA@mail.gmail.com>
References: <20171105231909.5599-1-linus.walleij@linaro.org>
 <20171105231909.5599-4-linus.walleij@linaro.org> <20171105234831.GA24822@lunn.ch>
 <CACRpkdbzqnbF49yN-SAqLkhufk=R2C=jpdLo-QWmL0zR_+Vj=w@mail.gmail.com>
 <20171129155627.GD24881@lunn.ch> <CACRpkdZVXgFMiHpyUqw7ONYDcq6Htn3rTMRaBJkzd6T3WtX36A@mail.gmail.com>
 <20171129215659.GC1706@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171129215659.GC1706-g2DYL2Zd6BY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Vivien Didelot <vivien.didelot-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?B?QW50dGkgU2VwcMOkbMOk?= <a.seppala-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Roman Yeryomin <roman-9zmcapQ0v8Q@public.gmane.org>, Colin Leitner <colin.leitner-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Gabor Juhos <juhosg-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 29, 2017 at 10:56 PM, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org> wrote:

> I think the problem might be, you are using the DSA provided MDIO bus.
> The Marvell switches has a similar setup in terms of interrupts. The
> PHY interrupts appear within the switch. So i implemented an interrupt
> controller, just the same as you.
>
> The problem is, the DSA provided MDIO bus is not linked to device
> tree. So you cannot have phy nodes in device tree associated to it.
>
> What i did for the Marvell driver is that driver itself implements an
> MDIO bus (two actually in some chips), and the internal or external
> PHYs are placed on the switch drivers MDIO bus, rather than the DSA
> MDIO bus. The switch driver MDIO bus links to an mdio node in device
> tree. I can then have interrupt properties in the phys on this MDIO
> bus in device tree.
>
> What actually might make sense, is to have the DSA MDIO bus look
> inside the switches device tree node and see if there is an mdio
> node. If so allow dsa_switch_setup() to use of_mdiobus_register()
> instead of mdiobus_register().

Aha I think I see where my thinking went wrong.

I have been assuming (thought it was intuitive...) that ports and
PHYs are mapped 1:1.

So I assumed the port with reg = <N> is also the PHY with
reg = <N>

So naturally I added the PHY interrupt to the port node.

So you are saying that the PHY and the port are two
very disparate things in DSA terminology?

I guess all ports except the CPU port actually have
a 1:1 mapped PHY though, am I right?

Or are there in pracice things such that reg is different
on the port and the PHY connected to it? Then it makes
much sense to put an MDIO bus inside the switch DT
node and populate the PHY interrupts from there as you
say.

I can take a stab at fixing that if that is what we want.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
