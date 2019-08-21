From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 14/19] dt-bindings: pci: add PHY properties to Armada
 7K/8K controller bindings
Date: Wed, 21 Aug 2019 13:28:57 -0500
Message-ID: <20190821182857.GA9660@bogus>
References: <20190731122126.3049-1-miquel.raynal@bootlin.com>
 <20190731122126.3049-15-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190731122126.3049-15-miquel.raynal@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, devicetree@vger.kernel.org, Antoine Tenart <antoine.tenart@bootlin.com>, Grzegorz Jaszczyk <jaz@semihalf.com>, Gregory Clement <gregory.clement@bootlin.com>, Russell King <linux@armlinux.org.uk>, Kishon Vijay Abraham I <kishon@ti.com>, Nadav Haklai <nadavh@marvell.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 31, 2019 at 02:21:21PM +0200, Miquel Raynal wrote:
> Armada CP110 PCIe controller can have from one to four PHYs for
> configuring SERDES lanes (PCIe x1, PCIe x2 or PCIe x4). Describe the
> phys and phy-names properties in the bindings.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  Documentation/devicetree/bindings/pci/pci-armada8k.txt | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pci/pci-armada8k.txt b/Documentation/devicetree/bindings/pci/pci-armada8k.txt
> index 9e3fc15e1af8..7cf12162aa4e 100644
> --- a/Documentation/devicetree/bindings/pci/pci-armada8k.txt
> +++ b/Documentation/devicetree/bindings/pci/pci-armada8k.txt
> @@ -17,6 +17,12 @@ Required properties:
>     name must be "core" for the first clock and "reg" for the second
>     one
>  
> +Optional properties:
> +- phys: phandle(s) to PHY node(s) following the generic PHY bindings.
> +	Either 1, 2 or 4 PHYs might be needed depending on the number of
> +	PCIe lanes.
> +- phy-names: names of the PHYs.

You need to enumerate what the names are. Based on your example in v2, I 
don't think the names are really valuable unless you can skip lanes.

Rob
