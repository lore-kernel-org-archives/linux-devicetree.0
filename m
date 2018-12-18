From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2 03/12] PCI: aardvark: Add PHY support
Date: Tue, 18 Dec 2018 09:23:14 +0100
Message-ID: <20181218092314.725af970@xps13>
References: <20181212102142.16053-1-miquel.raynal@bootlin.com>
        <20181212102142.16053-4-miquel.raynal@bootlin.com>
        <20181214014701.373b220b@nic.cz>
        <20181214015712.31f749ea@nic.cz>
        <20181217170724.58421a29@xps13>
        <20181217223430.182d01d8@nic.cz>
        <20181218091817.4a8a5d42@xps13>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181218091817.4a8a5d42@xps13>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Behun <marek.behun@nic.cz>
Cc: Nadav Haklai <nadavh@marvell.com>, Gregory Clement <gregory.clement@bootlin.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Bjorn Helgaas <bhelgaas@google.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Antoine Tenart <antoine.tenart@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>
List-Id: devicetree@vger.kernel.org

Hello,

Miquel Raynal <miquel.raynal@bootlin.com> wrote on Tue, 18 Dec 2018
09:18:17 +0100:

> Hi Marek,
> 
> Marek Behun <marek.behun@nic.cz> wrote on Mon, 17 Dec 2018 22:34:30
> +0100:
> 
> > Miquel,
> > 
> > I tried the patches and they are working, with the exception of Compex
> > WLE900X card, but we know that this card is problematic.  
> 
> How did you test them? I am surprised that COMPHY calls worked for you
> out of the box. I am not sure you have A3700 COMPHY support in your ATF
> but it probably work because U-Boot is doing the initial configuration.

Let me correct myself: actually the feature is already mainline! See
[2]. It will be added to Marvell's BSP by the end of the year. So if
you are running a recent mainline ATF you are good to go!

> 
> > I am interesting if there is a known way to turn of the comphy on
> > A3720, or at least change the SGMII mode from 1Gbps to 2.5Gbps and
> > back. Marvell documentation does not provide this information and the
> > code in ATF providing the SMC calls does not do this either.
> > Do you know how this can be achieved?  
> 
> The driver already handles these calls (see [1]), making use of
> them is just a matter of hacking into drivers (in your case, I
> suppose it is mvneta) and add phy_set_mode()/phy_power_on() calls.
> 
> [1] https://github.com/miquelraynal/linux/blob/marvell/phy-next/pm/drivers/phy/marvell/phy-mvebu-a3700-comphy.c#L189
> 
> 
> Thanks,
> Miquèl

[2] https://github.com/ARM-software/arm-trusted-firmware/blob/master/drivers/marvell/comphy/phy-comphy-3700.c


Thanks,
Miquèl
