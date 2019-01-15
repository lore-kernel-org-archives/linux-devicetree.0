From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 10/15] dt-bindings: PCI: aardvark: Describe the PCIe
 endpoint card reset pins
Date: Tue, 15 Jan 2019 14:13:26 -0600
Message-ID: <20190115201326.GA2362@bogus>
References: <20190108162441.5278-1-miquel.raynal@bootlin.com>
 <20190108162441.5278-11-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190108162441.5278-11-miquel.raynal@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Gregory Clement <gregory.clement@bootlin.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Bjorn Helgaas <bhelgaas@google.com>, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Antoine Tenart <antoine.tenart@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Miquel Raynal <miquel.raynal@bootlin.com>
List-Id: devicetree@vger.kernel.org

On Tue,  8 Jan 2019 17:24:35 +0100, Miquel Raynal wrote:
> A line might be used by the PCIe IP to reset the endpoint card upon:
>   - platform reset,
>   - hot reset,
>   - link failure.
> 
> Describe the properties needed in this case (optional).
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  Documentation/devicetree/bindings/pci/aardvark-pci.txt | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
