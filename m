From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2 03/12] PCI: aardvark: Add PHY support
Date: Mon, 17 Dec 2018 17:07:24 +0100
Message-ID: <20181217170724.58421a29@xps13>
References: <20181212102142.16053-1-miquel.raynal@bootlin.com>
 <20181212102142.16053-4-miquel.raynal@bootlin.com>
 <20181214014701.373b220b@nic.cz>
 <20181214015712.31f749ea@nic.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181214015712.31f749ea@nic.cz>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Behun <marek.behun@nic.cz>, Nadav Haklai <nadavh@marvell.com>
Cc: Gregory Clement <gregory.clement@bootlin.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Bjorn Helgaas <bhelgaas@google.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Antoine Tenart <antoine.tenart@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>
List-Id: devicetree@vger.kernel.org

Hi Marek,

Marek Behun <marek.behun@nic.cz> wrote on Fri, 14 Dec 2018 01:57:12
+0100:

> On Fri, 14 Dec 2018 01:47:01 +0100
> Marek Behun <marek.behun@nic.cz> wrote:
> 
> > Hi Miquel,
> > are there already patches for the A37xx comphy driver?  

Please try the latest patches on top of phy -next (with PHY interface
mode), available there [1]. You can pick only the COMPHY patches, but
keep them over the phy -next branch.

Please note that for the SMC calls to succeed you must use a recent
ATF. Personally I used to work with the 'atf-v1.5-devel' branch of
Marvell's misl-atf repository but it is not available anymore. If you
already have a clone, then you are good to go, otherwise it might be
great if someone from Marvell could share a public Github link?

> Never mind, I found them. I shall test this on Turris Mox.
> Is the comphy driver supposed to be able to change eth mode from
> 1000BASE-X to 2500BASE-X and back without reboot?

In theory yes, unfortunately I am working on an EspressoBin which uses
the SATA, PCIe and SATA configurations of the COMPHY, but not the
Ethernet ones (SGMII/1000BASE-X and HS_SGMII/2500BASE-X). So the
support is ready to be tested!

> 
> This would be cool for our SFP cage module of Turris Mox, just to add
> support for comphy into mvneta.
> 
> Marek

[1] https://github.com/miquelraynal/linux.git branch marvell/phy-next/pm


Thanks,
Miquèl
