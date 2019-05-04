From: Chuanhong Guo <gch981213@gmail.com>
Subject: Re: [PATCH v3 3/3] net: ethernet: add ag71xx driver
Date: Sat, 4 May 2019 23:40:53 +0800
Message-ID: <CAJsYDVJ84RsNVe9Mj9sYYwwLmmMkinRSJW4ziW22Sf04wS5gyw@mail.gmail.com>
References: <20190422064046.2822-1-o.rempel@pengutronix.de>
 <20190422064046.2822-4-o.rempel@pengutronix.de> <20190422132533.GA12718@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190422132533.GA12718@lunn.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, Paul Burton <paul.burton@mips.com>, Ralf Baechle <ralf@linux-mips.org>, James Hogan <jhogan@kernel.org>, Rob Herring <robh+dt@kernel.org>, Jay Cliburn <jcliburn@gmail.com>, Chris Snook <chris.snook@gmail.com>, "David S. Miller" <davem@davemloft.net>, Mark Rutland <mark.rutland@arm.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, linux-mips@vger.kernel.org, open list <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>, netdev@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi!

On Mon, Apr 22, 2019 at 9:28 PM Andrew Lunn <andrew@lunn.ch> wrote:
> [...]
> > +     /*
> > +      * On most (all?) Atheros/QCA SoCs dual eth interfaces are not equal.
> > +      *
> > +      * That is to say eth0 can not work independently. It only works
> > +      * when eth1 is working.
> > +      */
>
> Please could you explain that some more? Is there just one MDIO bus
> shared by two ethernet controllers? If so, it would be better to have
> the MDIO bus controller as a separate driver.

mdio registers exists on both ethernet blocks. And due to how reset
works on this ethernet IP, it's hard to split it into a separated
driver. (Only asserting both eth and mdio resets together will reset
everything including register values.)
The reason why gmac1 should be brought up first is that on some chips,
mdio on gmac0 connects to nothing and phy used by gmac0 is on mdio bus
of gmac1.

> [...]

Regards,
Chuanhong Guo
