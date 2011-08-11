From: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Subject: Re: Subject: L2x0 OF properties do not include interrupt #
Date: Thu, 11 Aug 2011 14:09:10 +0100
Message-ID: <20110811130910.GA10189@e102144-lin.cambridge.arm.com>
References: <000201cc575b$c1229010$4367b030$@rutland@arm.com>
	<201108101624.27881.arnd@arndb.de>
	<20110810142808.GL10121@e102144-lin.cambridge.arm.com>
	<201108111505.11887.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201108111505.11887.arnd-r2nGTMty4D4@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "workgroup.linux-kQvG35nSl+M@public.gmane.org" <workgroup.linux-kQvG35nSl+M@public.gmane.org>, "weizeng.he-kQvG35nSl+M@public.gmane.org" <weizeng.he-kQvG35nSl+M@public.gmane.org>, "tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org" <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 11, 2011 at 02:05:11PM +0100, Arnd Bergmann wrote:
> On Wednesday 10 August 2011, Will Deacon wrote:
> > I was hoping that it was possible to have separate properties which describe
> > the interrupt. So you could have something like pmu-interrupt <75> and
> > abort-interrupt <76> rather than interrupts <75, 76>.
> 
> Ok, I see.
> 
> > I've not played with DT bindings before though, so if it's usually done with
> > an ordered list then so be it!
> 
> A lot of the code assumes that the property is called 'interrupts' and that
> it contains a fixed-length array of interrupt numbers, each for one specific
> purpose.

Ok, I wondered if something like that might be the case.

> Given that we have so many different meanings for the interrupts, I'm
> not sure how this would work best in this case. According to
> http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.ddi0246f/CHDFHCFJ.html
> this looks like a nested interrupt controller, i.e. the L2CC has its own mask
> and status register with bits for each one of them. We could model these by
> describing the l2cc interrupt controller with these registers and listing all
> nine of the current inputs. I suspect however that it would be easier to just
> assume that there is only one line for now, and treat the l2cc as a single
> interrupt source with an internal status register.

Given that this binding is only for the l2x0 / pl310 and I don't know of any
implementation where > 1 interrupt line is wired up, I'm happy to assume a
single combined interrupt line for now.

Cheers,

Will
