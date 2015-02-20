From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH] genirq: fix virtual irq demuxer related comments
Date: Fri, 20 Feb 2015 16:12:59 +0000
Message-ID: <20150220161259.GL13659@leverpostej>
References: <20150210150013.GD7119@twins.programming.kicks-ass.net>
 <1423582992-8154-1-git-send-email-boris.brezillon@free-electrons.com>
 <20150210161425.GZ21418@twins.programming.kicks-ass.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150210161425.GZ21418@twins.programming.kicks-ass.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Zijlstra <peterz@infradead.org>, Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Nicolas Ferre <nicolas.ferre@atmel.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Peter,

On Tue, Feb 10, 2015 at 04:14:25PM +0000, Peter Zijlstra wrote:
> On Tue, Feb 10, 2015 at 04:43:12PM +0100, Boris Brezillon wrote:
> > Replace remaining 'Dumb' occurrences by 'Virtual'.
> > Remove inappropriate notes in kerneldoc headers.
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> 
> Thanks, squished into the other one.

Would you be able to drop the virtual demuxer patch(es) for now?

The fundamental problem here is that a physical IRQ is shared by wakeup
and IRQF_NO_SUSPEND handlers. Neither the virtual demuxer nor the flag
approach solve that problem.

Boris and I have spoken on IRC and have some ideas as to what we could
do, but no code just yet.

Thanks,
Mark.
