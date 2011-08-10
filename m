From: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Subject: Re: Subject: L2x0 OF properties do not include interrupt #
Date: Wed, 10 Aug 2011 15:39:19 +0100
Message-ID: <20110810143919.GM10121@e102144-lin.cambridge.arm.com>
References: <000201cc575b$c1229010$4367b030$@rutland@arm.com>
	<4E428EB0.1080204@gmail.com>
	<20110810141048.GK10121@e102144-lin.cambridge.arm.com>
	<4E4297A6.6050101@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4E4297A6.6050101-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "workgroup.linux-kQvG35nSl+M@public.gmane.org" <workgroup.linux-kQvG35nSl+M@public.gmane.org>, "weizeng.he-kQvG35nSl+M@public.gmane.org" <weizeng.he-kQvG35nSl+M@public.gmane.org>, "tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org" <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 10, 2011 at 03:37:26PM +0100, Rob Herring wrote:
> On 08/10/2011 09:10 AM, Will Deacon wrote:
> > Hi Rob,
> > 
> > On Wed, Aug 10, 2011 at 02:59:12PM +0100, Rob Herring wrote:
> >> I think you should allow for either the single irq or individual irqs.
> >> You can specify that the event counter interrupt must be first, then the
> >> pmu driver could work either way ignoring the rest. The driver probably
> >> needs to mark the handler as shared if there is only the combined
> >> interrupt unless you expect all interrupts to be handled by 1 driver.
> > 
> > I much prefer having seperate, individual IRQs with no requirement on
> > ordering.
> > 
> > Now, the L2 binding also doesn't fit too well for the L2CC on Cortex-A15,
> > which is an inner cache like the one on Cortex-A8. Because of this, it
> > doesn't have a base address but it *does* have an IRQ which is how external
> > aborts are raised.
> 
> This is not a general L2 binding, but an L2x0/PL310 binding. A8/A15 L2
> is a completely different binding and driver though. You would do
> something like the current cpu pmu binding that is just interrupts.

Ok, I think that's a lot more sense to have a separate binding for inner and
outer L2 cache implementstions. I was just a bit concerned by the
documentation using the term 'l2cc' as it sounds like it's fairly catch-all.

Will
