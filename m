From: Marek =?ISO-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>
Subject: Re: [PATCH v2 03/12] PCI: aardvark: Add PHY support
Date: Wed, 19 Dec 2018 16:28:35 +0100
Message-ID: <20181219162835.5ff9c33c@dellmb.labs.office.nic.cz>
References: <20181212102142.16053-1-miquel.raynal@bootlin.com>
        <20181212102142.16053-4-miquel.raynal@bootlin.com>
        <20181214014701.373b220b@nic.cz>
        <20181214015712.31f749ea@nic.cz>
        <20181217170724.58421a29@xps13>
        <20181217223430.182d01d8@nic.cz>
        <20181218091817.4a8a5d42@xps13>
        <20181218092314.725af970@xps13>
        <20181218140920.6935db39@nic.cz>
        <20181218144130.3f1a75de@xps13>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181218144130.3f1a75de@xps13>
Sender: linux-kernel-owner@vger.kernel.org
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Nadav Haklai <nadavh@marvell.com>, Gregory Clement <gregory.clement@bootlin.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Bjorn Helgaas <bhelgaas@google.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Antoine Tenart <antoine.tenart@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>
List-Id: devicetree@vger.kernel.org

Hi,

One thing for which I would like to be able to disable comphy is that
each consumes about 100mW of power. On Turris Mox we configure the
comphys to SGMII1, PCIe and USB3 modes. If there is no USB device
plugged, the USB3 phy can be disabled, and save 100mW of power. If the
PCIe extension module is not present, the PCIe can too be disabled, and
if there is no switch nor SFP module present, so can SGMII1.

The other reason is this: if the SGMII phy is set to 1G mode, and then
powered on second time in 2.5G mode, will it work? I would like to
patch mvneta driver to power on/off the comphy, if the device node is
present in device tree. But then the system can request such a change
(SGMII to 2500BASE-X or back).

Marek

On Tue, 18 Dec 2018 14:41:30 +0100
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Hi Marek,
>=20
> Marek Behun <marek.behun@nic.cz> wrote on Tue, 18 Dec 2018 14:09:20
> +0100:
>=20
> > > [2]
> > > https://github.com/ARM-software/arm-trusted-firmware/blob/master/driv=
ers/marvell/comphy/phy-comphy-3700.c   =20
> >=20
> > Yes, I used mainline atf (it did not work out of the box with 18.09
> > atf-marvell of course). But there is no _power_off function for
> > SGMII, nor a digital_reset function like in cp110 implementation. =20
>=20
> Indeed, but why would you need one? Just use the helpers from the core
> and if there is no implementation, nothing should happen and the
> helper should exit without error. Just call
> phy_set_mode()/phy_power_on() an you should be good.
>=20
>=20
> Thanks,
> Miqu=C3=A8l
