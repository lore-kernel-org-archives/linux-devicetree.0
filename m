From: Jason Cooper <jason@lakedaemon.net>
Subject: Re: [PATCH v3 0/2] irqchip: Support Aspeed IRQ controller
Date: Wed, 22 Jun 2016 18:53:57 +0000
Message-ID: <20160622185357.GE9922@io.lakedaemon.net>
References: <1462802317-27086-1-git-send-email-joel@jms.id.au>
 <1463064193-2178-1-git-send-email-joel@jms.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1463064193-2178-1-git-send-email-joel@jms.id.au>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Joel Stanley <joel@jms.id.au>
Cc: baruch@tkos.co.il, arnd@arndb.de, devicetree@vger.kernel.org, marc.zyngier@arm.com, benh@kernel.crashing.org, andrew@aj.id.au, jk@ozlabs.org, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hey Joel, Ben,

On Fri, May 13, 2016 at 12:13:11AM +0930, Joel Stanley wrote:
> Hello All,
> 
> This adds support for the IRQ controller found in the Aspeed ast2400 and
> ast2500 BMC SoCs.
> 
> It's been tested on the ast2400 in an OpenPower Palmetto system, and on the
> ast2500-edk developer kit.
> 
> V2 has a fix for the compatible string in the device tree bindings.
> 
> V3 drops the valid-sources bitmasks and adds a unit address to the example in
> the bindings
> 
> Cheers,
> 
> Joel
> 
> Benjamin Herrenschmidt (1):
>   irqchip: Add irq controller for Aspeed
> 
> Joel Stanley (1):
>   doc/devicetree: Add Aspeed VIC bindings
> 
>  .../interrupt-controller/aspeed,ast2400-vic.txt    |  22 ++
>  drivers/irqchip/Makefile                           |   1 +
>  drivers/irqchip/irq-aspeed-vic.c                   | 230 +++++++++++++++++++++
>  3 files changed, 253 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2400-vic.txt
>  create mode 100644 drivers/irqchip/irq-aspeed-vic.c

Series applied to irqchip/aspeed.  I'll only rebase it if you tell me
to. :-)

Should be in -next the next time it gets built.

thx,

Jason.
