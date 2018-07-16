From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v4 10/14] dt-bindings/interrupt-controller: update
 Marvell ICU bindings
Date: Mon, 16 Jul 2018 21:30:55 +0200
Message-ID: <20180716213055.1f9c428e@windsurf>
References: <20180705124011.7661-1-miquel.raynal@bootlin.com>
 <20180705124011.7661-11-miquel.raynal@bootlin.com>
 <20180716152734.GA4581@rob-hp-laptop>
 <20180716183935.36f48f76@xps13>
 <20180716174402.GA28988@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180716174402.GA28988@rob-hp-laptop>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, devicetree@vger.kernel.org, Marc Zyngier <marc.zyngier@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Gregory Clement <gregory.clement@bootlin.com>, Haim Boot <hayim@marvell.com>, Will Deacon <will.deacon@arm.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Antoine Tenart <antoine.tenart@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Thomas Gleixner <tglx@linutronix.de>, Hanna Hawa <hannah@marvell.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

Hello,

On Mon, 16 Jul 2018 11:44:02 -0600, Rob Herring wrote:

> > > I raised this before and still don't understand. You had 4 types before 
> > > and now you only have 2 types? How do you handle SR and REI with the new 
> > > binding?  
> > 
> > Indeed there are 4 types: NSR, SR, SEI, REI.
> > 
> > Until now only NSR were supported.  
> 
> All 4 were supported by the binding and now only 2 though.

In fact, no, the old binding was not working for anything but NSR. It
pretended to support SEI, REI and SR, but because these had never been
implemented, the binding was not sufficient to over them.

To support SEI or REI, we need to point to a different msi-parent than
the one used for NSR, which wasn't possible with the previous binding.

So there is no regression of functionality by this binding change,
quite the contrary, as it really allows to add SEI support, which was
not possible before. You can consider that the previous binding was
buggy and dysfunctional.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
