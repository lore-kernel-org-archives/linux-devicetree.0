From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: Subject: L2x0 OF properties do not include interrupt #
Date: Wed, 10 Aug 2011 16:24:27 +0200
Message-ID: <201108101624.27881.arnd@arndb.de>
References: <000201cc575b$c1229010$4367b030$@rutland@arm.com>
	<4E428EB0.1080204@gmail.com>
	<20110810141048.GK10121@e102144-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110810141048.GK10121-SGELLbQ0bobZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Cc: Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "workgroup.linux-kQvG35nSl+M@public.gmane.org" <workgroup.linux-kQvG35nSl+M@public.gmane.org>, "weizeng.he-kQvG35nSl+M@public.gmane.org" <weizeng.he-kQvG35nSl+M@public.gmane.org>, "tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org" <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wednesday 10 August 2011, Will Deacon wrote:
> On Wed, Aug 10, 2011 at 02:59:12PM +0100, Rob Herring wrote:
> > I think you should allow for either the single irq or individual irqs.
> > You can specify that the event counter interrupt must be first, then the
> > pmu driver could work either way ignoring the rest. The driver probably
> > needs to mark the handler as shared if there is only the combined
> > interrupt unless you expect all interrupts to be handled by 1 driver.
> 
> I much prefer having seperate, individual IRQs with no requirement on
> ordering.
> 

What do you mean with 'no requirement on ordering'? If we have multiple
interrupt sources, we definitely want to identify which one calls which
handler, and the only information we have is the position in the array
of interrupt numbers.

	Arnd
