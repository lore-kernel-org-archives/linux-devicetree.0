From: Antoine =?iso-8859-1?Q?T=E9nart?=
	<antoine.tenart@free-electrons.com>
Subject: Re: [PATCH v3 08/12] Documentation: bindings: add doc for the USB2
 ChipIdea USB driver
Date: Wed, 16 Jul 2014 10:59:24 +0200
Message-ID: <20140716085924.GA28151@kwain>
References: <1405499166-6726-1-git-send-email-antoine.tenart@free-electrons.com>
 <1405499166-6726-9-git-send-email-antoine.tenart@free-electrons.com>
 <23972141.94aiK9jz66@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <23972141.94aiK9jz66@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart@free-electrons.com>, sebastian.hesselbarth@gmail.com, Peter.Chen@freescale.com, balbi@ti.com, p.zabel@pengutronix.de, thomas.petazzoni@free-electrons.com, zmxu@marvell.com, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, alexandre.belloni@free-electrons.com, jszhang@marvell.com
List-Id: devicetree@vger.kernel.org

Hi Arnd,

On Wed, Jul 16, 2014 at 10:39:36AM +0200, Arnd Bergmann wrote:
> On Wednesday 16 July 2014 10:26:02 Antoine T=E9nart wrote:
> > +
> > +Required properties:
> > +- compatible: should be "chipidea,usb2"
> > +- reg: base address and length of the registers
> > +- interrupts: interrupt for the USB controller
> > +
> > +Optional properties:
> > +- clocks: reference to the USB clock
> > +- usb-phy: reference to the USB PHY
>=20
> I think the phy reference should use the standard phy binding, using
> "phys" property to refer to a node that has a "#phy-cells" property.
>=20
> It seems the code gets this right, but just the documentation is wron=
g.

I moved this PHY driver from usb/phy/ to phy/ and forgot to update this
property. I'll fix it.

>=20
> > +- vbus-supply: reference to the VBUS regulator
> > +- dma-mask: DMA bit mask
>=20
> No. Do not use "dma-mask" as a property, that is a pure Linux specifi=
c
> concept. The DT way to express this is to use the 'dma-ranges' proper=
ty
> in the device's parent to describe any bus-related restrictions, and
> for the driver to ask for a mask that matches what the hardware is
> capable of (which may be smaller or larger than what the bus supports=
).

Ok. I'll answer in the CI driver's thread.

Thanks!

Antoine

--=20
Antoine T=E9nart, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
