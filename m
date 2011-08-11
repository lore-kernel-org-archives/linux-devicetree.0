From: Will Deacon <will.deacon@arm.com>
Subject: Re: Subject: L2x0 OF properties do not include interrupt #
Date: Thu, 11 Aug 2011 16:38:00 +0100
Message-ID: <20110811153800.GC5154@e102144-lin.cambridge.arm.com>
References: <000201cc575b$c1229010$4367b030$@rutland@arm.com>
	<201108101624.27881.arnd@arndb.de>
	<20110810142808.GL10121@e102144-lin.cambridge.arm.com>
	<201108111505.11887.arnd@arndb.de>
	<20110811130910.GA10189@e102144-lin.cambridge.arm.com>
	<4E43F5F8.4060704@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <4E43F5F8.4060704@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robherring2@gmail.com>
Cc: Mark Rutland <Mark.Rutland@arm.com>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, 'Barry Song' <21cnbao@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "workgroup.linux@csr.com" <workgroup.linux@csr.com>, 'Grant Likely' <grant.likely@secretlab.ca>, "weizeng.he@csr.com" <weizeng.he@csr.com>, 'Olof Johansson' <olof@lixom.net>, "tglx@linutronix.de" <tglx@linutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 11, 2011 at 04:32:08PM +0100, Rob Herring wrote:
> On 08/11/2011 08:09 AM, Will Deacon wrote:
> > On Thu, Aug 11, 2011 at 02:05:11PM +0100, Arnd Bergmann wrote:
> >> On Wednesday 10 August 2011, Will Deacon wrote:
> >>> I was hoping that it was possible to have separate properties which describe
> >>> the interrupt. So you could have something like pmu-interrupt <75> and
> >>> abort-interrupt <76> rather than interrupts <75, 76>.
> >>
> >> Ok, I see.
> >>
> >>> I've not played with DT bindings before though, so if it's usually done with
> >>> an ordered list then so be it!
> >>
> >> A lot of the code assumes that the property is called 'interrupts' and that
> >> it contains a fixed-length array of interrupt numbers, each for one specific
> >> purpose.
> > 
> > Ok, I wondered if something like that might be the case.
> > 
> >> Given that we have so many different meanings for the interrupts, I'm
> >> not sure how this would work best in this case. According to
> >> http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.ddi0246f/CHDFHCFJ.html
> >> this looks like a nested interrupt controller, i.e. the L2CC has its own mask
> >> and status register with bits for each one of them. We could model these by
> >> describing the l2cc interrupt controller with these registers and listing all
> >> nine of the current inputs. I suspect however that it would be easier to just
> >> assume that there is only one line for now, and treat the l2cc as a single
> >> interrupt source with an internal status register.
> > 
> > Given that this binding is only for the l2x0 / pl310 and I don't know of any
> > implementation where > 1 interrupt line is wired up, I'm happy to assume a
> > single combined interrupt line for now.
> > 
> 
> I know of one. Although, we have the combined interrupt as well. The
> binding should allow either way and specify the order. If the event
> counter interrupt is 1st, then it should be the same to s/w.

You mean putting the combined interrupt first? If so, we may as well just
specify that until somebody builds a platform that doesn't have it.

Will
