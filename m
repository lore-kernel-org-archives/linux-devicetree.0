From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2 10/12] ARM64: dts: marvell: armada-3720-espressobin:
 declare PCIe reset GPIO
Date: Mon, 17 Dec 2018 15:31:40 +0100
Message-ID: <20181217153140.6d51b9f3@xps13>
References: <20181212102142.16053-1-miquel.raynal@bootlin.com>
        <20181212102142.16053-11-miquel.raynal@bootlin.com>
        <20181213153306.4fc3b511@xps13>
        <20181213153619.499aab66@windsurf>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181213153619.499aab66@windsurf>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Gregory Clement <gregory.clement@bootlin.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Antoine Tenart <antoine.tenart@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>
List-Id: devicetree@vger.kernel.org

Hi Thomas,

Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote on Thu, 13 Dec
2018 15:36:19 +0100:

> Hello,
> 
> On Thu, 13 Dec 2018 15:33:06 +0100, Miquel Raynal wrote:
> 
> > I will re-send a series without this patch. I think it does not hurt to
> > keep the previous patch adding the pinmux setting in the
> > Armada-37xx.dtsi file even without using it, so I will drop only this
> > patch.  
> 
> I tend to disagree here (but perhaps you'll have other arguments to
> convince me otherwise): the GPIO used for PCIe reset is a completely
> board-specific thing. You can chose whatever GPIO you want, and each
> board can be different. Therefore, there is no reason to have such a
> pinmux configuration at the SoC level (.dtsi), it should be within the
> particular board that uses that pinmux configuration.
> 
> This is a rule that we have applied to mvebu platforms in general, and
> which I believe is fairly common in many DTs.

Actually this is a pin that may be driven directly by the PCI IP and is
not board-specific (note that the patch is wrong as the functions
should be "pcie" instead of "gpio"). What is board specific is if this
pin is actually wired to the endpoint PCIe card or not.

Anyway, as seen by Gregory, the pinctrl driver must be fixed as when
selecting the "pcie1" group, the driver was poking another area making
the EspressoBin switch unstable. With a quick fix on my side I realized
the reset was not behaving at all as expected. As it is not actually
needed for suspend/resume operation (at least on my setup) I will drop
the 'reset pin' related patches in the next iteration of the series.


Thanks,
Miquèl
