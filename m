From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v3 06/10] dt-bindings: phy: mvebu-utmi: add UTMI PHY
 bindings
Date: Wed, 23 Jan 2019 14:51:01 +0100
Message-ID: <20190123145101.1fabcad3@windsurf>
References: <20190121112336.23489-1-miquel.raynal@bootlin.com>
 <20190121112336.23489-7-miquel.raynal@bootlin.com>
 <20190122183833.40077d7a@windsurf> <20190122201635.4a6c28d0@xps13>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190122201635.4a6c28d0@xps13>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, Mathias Nyman <mathias.nyman@intel.com>, devicetree@vger.kernel.org, Antoine Tenart <antoine.tenart@bootlin.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Gregory Clement <gregory.clement@bootlin.com>, linux-usb@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>, Nadav Haklai <nadavh@marvell.com>, Rob Herring <robh+dt@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, Maxime Chevallier <maxime.chevallier@bootlin.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

Hello Miquel,

On Tue, 22 Jan 2019 20:16:35 +0100, Miquel Raynal wrote:

> > Do we really need different compatible strings for those ? I assume the
> > IP block is exactly the same for the two PHYs, right ? If so, we should
> > use the same compatible string.  
> 
> For what I understand, the PHYs are different. At least this is how
> they are described in the specification. I can list at least two
> differences visible in the register set:
> * one has OTG registers, the other does not.
> * one has charger detection capabilities (and registers), the other
>   does not.

OK, then indeed it makes sense to have two different compatible strings.

> > Those registers are contiguous to the register range of the PHY itself.
> > What was the criteria used to decide that we need two separate DT nodes
> > for these ?  
> 
> Because this area contains a bunch of registers, most of them are
> there to manage the PHY, but others are related to the USB controller
> (ie. a software reset). I know the current USB controller driver does
> not access this area but what if one day we decide to do it?

OK, if indeed this register area contains register used both for the
PHY and for something else, your DT representation makes sense.

Thanks for those clarifications!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
