From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: Configurable interrupt sources, and DT bindings
Date: Fri, 2 Dec 2011 14:55:10 +0000
Message-ID: <20111202145510.GV8245@opensource.wolfsonmicro.com>
References: <20111129105538.GC2851@opensource.wolfsonmicro.com>
 <20111130051349.GG5435@truffala.fritz.box>
 <20111130093305.GB2791@opensource.wolfsonmicro.com>
 <20111130133140.GL5435@truffala.fritz.box>
 <20111201110738.GA2915@opensource.wolfsonmicro.com>
 <20111202053814.GH5427@truffala.fritz.box>
 <20111202112722.GG8245@opensource.wolfsonmicro.com>
 <20111202122418.GI5427@truffala.fritz.box>
 <20111202133413.GR8245@opensource.wolfsonmicro.com>
 <20111202143107.GJ5427@truffala.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20111202143107.GJ5427-MK4v0fQdeXQXU02nzanrWNbf9cGiqdzd@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Dec 03, 2011 at 01:31:07AM +1100, David Gibson wrote:

> My apologies.  I was mixing up who said what.  It was Stephen who made
> this proposal, kicking off the thread.

Ah, OK - I think there's been some misreading here.

> SW> One possibility is to describe this directly in the binding for each
> SW> interrupt source. I originally proposed the following for the WM8903:

I think the above (talking as it does about an interrupt source) is
intended to refer to a single interrupt line, the confusion being due
to the fact that the current binding doesn't have any way to add per
interrupt properties.

> > *sigh*  We do care because as I say in the paragraph you quote above
> > people are trying to roll device tree out onto new platforms.  The
> > coverage on PowerPC and SPARC is near 100% but the coverage on ARM is
> > very far away from that so we're going to have to create a large number
> > of new bindings.

> I guess, but irq spec bindings are so trivial, it's just not a big
> deal.  As I say, by all means write a best-current-practice document
> with a suggested binding.  But if people go their own way it really
> doesn't hurt much.  And there are situations where people would
> reasonably want different irq specifiers.  e.g. including polarity
> information wouldn't make much sense for a PIC which only handled
> message signalled interrupts.

It's not that the bindings are complex per se, it's that people working
over many different interrupt controllers (which is fairly common if you
do system integration) are going to be faced with a range of different
magic number sets to learn.  If we can at least keep the range of
different magic number sets as small as possible that improves things a
bit.
