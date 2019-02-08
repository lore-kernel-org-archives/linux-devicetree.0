From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH net-next v2 0/6] Add comphy support for Armada 38x
Date: Fri, 8 Feb 2019 08:58:21 +0100
Message-ID: <20190208085821.7556a18d@windsurf>
References: <20190207161825.ueinmyf6ygjiqzzy@shell.armlinux.org.uk>
 <20190207.181049.1229639710283404215.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190207.181049.1229639710283404215.davem@davemloft.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: David Miller <davem@davemloft.net>
Cc: mark.rutland@arm.com, andrew@lunn.ch, jason@lakedaemon.net, devicetree@vger.kernel.org, netdev@vger.kernel.org, gregory.clement@bootlin.com, linux@armlinux.org.uk, kishon@ti.com, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, sebastian.hesselbarth@gmail.com
List-Id: devicetree@vger.kernel.org

Hello David,

On Thu, 07 Feb 2019 18:10:49 -0800 (PST)
David Miller <davem@davemloft.net> wrote:

> From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
> Date: Thu, 7 Feb 2019 16:18:25 +0000
> 
> > This series adds support for the comphy for Armada 38x, which allows
> > these SoCs to use 2500BASE-X mode with appropriate SFP modules.
> > 
> > Tested on SolidRun Clearfog after updating for the 5.0 merge window
> > changes.  
> 
> Series applied, thanks Russell.

This series contained:

 - Device Tree bindings that had not been ACKed by the DT bindings
   maintainers, one of which should have been merged through the
   drivers/phy maintainer tree.

 - A brand new drivers/phy driver that had not been ACKed by the
   drivers/phy maintainer.

 - Changes to platform Device Tree that should have been merged through
   the platform tree.

Only patches 4/6 and 5/6 should go through the net-next tree, all the
other patches should have gone through other trees.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
