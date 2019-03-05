From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 2/2] watchdog: orion_wdt: use timer1 as a pretimeout
Date: Tue, 5 Mar 2019 03:09:44 +0100
Message-ID: <20190305020944.GN26378@lunn.ch>
References: <20190227230707.GA28635@roeck-us.net>
 <20190304225152.26831-1-chris.packham@alliedtelesis.co.nz>
 <20190304225152.26831-3-chris.packham@alliedtelesis.co.nz>
 <20190305005710.GL26378@lunn.ch>
 <5605e7b7a0f540a7908a1eb5191bbe5e@svr-chch-ex1.atlnz.lc>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <5605e7b7a0f540a7908a1eb5191bbe5e@svr-chch-ex1.atlnz.lc>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, "jason@lakedaemon.net" <jason@lakedaemon.net>, "gregory.clement@bootlin.com" <gregory.clement@bootlin.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "linux@roeck-us.net" <linux@roeck-us.net>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

> > Hi Chris
> > 
> > I had a quick look at other drivers implementing pre-timeout. They
> > seem to call watchdog_notify_pretimeout(). I don't see that here? What
> > happens when timer1 fires?
> > 
> 
> It invokes the regular orion_wdt_irq(). On Armada-385 prior to this 
> change the irq was not specified because the reset always kicked in so 
> there was no point.
> 
> For correctness I could make the devicetree binding specify 2 
> interrupts. One for the regular watchdog interrupt (which would never 
> usually get hit because the reset would kick in) and one for the 
> pretimeout/timer1.

Hi Chris

If the regular watchdog interrupt would never actually fire because
the SoC gets reset, maybe make the IRQ handler call
watchdog_notify_pretimeout()?

	Andrew
