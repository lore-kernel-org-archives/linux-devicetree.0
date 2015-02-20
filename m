From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH] genirq: fix virtual irq demuxer related comments
Date: Fri, 20 Feb 2015 17:17:49 +0100
Message-ID: <20150220161749.GR5029@twins.programming.kicks-ass.net>
References: <20150210150013.GD7119@twins.programming.kicks-ass.net>
 <1423582992-8154-1-git-send-email-boris.brezillon@free-electrons.com>
 <20150210161425.GZ21418@twins.programming.kicks-ass.net>
 <20150220161259.GL13659@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150220161259.GL13659@leverpostej>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Nicolas Ferre <nicolas.ferre@atmel.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Feb 20, 2015 at 04:12:59PM +0000, Mark Rutland wrote:
> Hi Peter,
> 
> On Tue, Feb 10, 2015 at 04:14:25PM +0000, Peter Zijlstra wrote:
> > On Tue, Feb 10, 2015 at 04:43:12PM +0100, Boris Brezillon wrote:
> > > Replace remaining 'Dumb' occurrences by 'Virtual'.
> > > Remove inappropriate notes in kerneldoc headers.
> > > 
> > > Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> > 
> > Thanks, squished into the other one.
> 
> Would you be able to drop the virtual demuxer patch(es) for now?

Yeah, its commented out. With a comment saying I should track this
thread ;-)
