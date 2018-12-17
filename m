From: Marek Behun <marek.behun@nic.cz>
Subject: Re: [PATCH v2 03/12] PCI: aardvark: Add PHY support
Date: Mon, 17 Dec 2018 22:34:30 +0100
Message-ID: <20181217223430.182d01d8@nic.cz>
References: <20181212102142.16053-1-miquel.raynal@bootlin.com>
        <20181212102142.16053-4-miquel.raynal@bootlin.com>
        <20181214014701.373b220b@nic.cz>
        <20181214015712.31f749ea@nic.cz>
        <20181217170724.58421a29@xps13>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181217170724.58421a29@xps13>
Sender: linux-kernel-owner@vger.kernel.org
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Nadav Haklai <nadavh@marvell.com>, Gregory Clement <gregory.clement@bootlin.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Bjorn Helgaas <bhelgaas@google.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Antoine Tenart <antoine.tenart@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>
List-Id: devicetree@vger.kernel.org

Miquel,

I tried the patches and they are working, with the exception of Compex
WLE900X card, but we know that this card is problematic.
I am interesting if there is a known way to turn of the comphy on
A3720, or at least change the SGMII mode from 1Gbps to 2.5Gbps and
back. Marvell documentation does not provide this information and the
code in ATF providing the SMC calls does not do this either.
Do you know how this can be achieved?
Thanks,

Marek

On Mon, 17 Dec 2018 17:07:24 +0100
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Hi Marek,
>=20
> Marek Behun <marek.behun@nic.cz> wrote on Fri, 14 Dec 2018 01:57:12
> +0100:
>=20
> > On Fri, 14 Dec 2018 01:47:01 +0100
> > Marek Behun <marek.behun@nic.cz> wrote:
> >  =20
> > > Hi Miquel,
> > > are there already patches for the A37xx comphy driver?   =20
>=20
> Please try the latest patches on top of phy -next (with PHY interface
> mode), available there [1]. You can pick only the COMPHY patches, but
> keep them over the phy -next branch.
>=20
> Please note that for the SMC calls to succeed you must use a recent
> ATF. Personally I used to work with the 'atf-v1.5-devel' branch of
> Marvell's misl-atf repository but it is not available anymore. If you
> already have a clone, then you are good to go, otherwise it might be
> great if someone from Marvell could share a public Github link?
>=20
> > Never mind, I found them. I shall test this on Turris Mox.
> > Is the comphy driver supposed to be able to change eth mode from
> > 1000BASE-X to 2500BASE-X and back without reboot? =20
>=20
> In theory yes, unfortunately I am working on an EspressoBin which uses
> the SATA, PCIe and SATA configurations of the COMPHY, but not the
> Ethernet ones (SGMII/1000BASE-X and HS_SGMII/2500BASE-X). So the
> support is ready to be tested!
>=20
> >=20
> > This would be cool for our SFP cage module of Turris Mox, just to
> > add support for comphy into mvneta.
> >=20
> > Marek =20
>=20
> [1] https://github.com/miquelraynal/linux.git branch
> marvell/phy-next/pm
>=20
>=20
> Thanks,
> Miqu=C3=A8l
