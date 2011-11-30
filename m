From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: Configurable interrupt sources, and DT bindings
Date: Wed, 30 Nov 2011 09:33:06 +0000
Message-ID: <20111130093305.GB2791@opensource.wolfsonmicro.com>
References: <4ED40B5F.6030603@nvidia.com>
 <20111129013055.GH3508@truffala.fritz.box>
 <20111129105538.GC2851@opensource.wolfsonmicro.com>
 <20111130051349.GG5435@truffala.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20111130051349.GG5435-MK4v0fQdeXQXU02nzanrWNbf9cGiqdzd@public.gmane.org>
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

On Wed, Nov 30, 2011 at 04:13:49PM +1100, David Gibson wrote:
> On Tue, Nov 29, 2011 at 10:55:38AM +0000, Mark Brown wrote:
> > On Tue, Nov 29, 2011 at 12:30:55PM +1100, David Gibson wrote:

> > > Um.. why?  These new properties don't appear to give any information
> > > that isn't already in the interrupts property (albeit in irq
> > > controller dependent form).

> > If nothing else because doing a custom binding for every single
> > interrupt controller out there is depressingly redundant; even if we've
> > got a bunch of legacy devices with odd bindings it's going to be better
> > all round if we have something new devices can just pick up.  Pretty
> > much every single interrupt controller in the embedded space is going to
> > need this information.

> Ok, so feel free to define a semi-standard way of encoding this
> information in interrupt specifiers, for use by all new PIC bindings.
> But these new properties still duplicate information that already has
> to be in the interrupts property.  Worse, it provides no way of
> specifying different information for each irq, if the device has
> several.

I'm sorry, I'm not following you.  In what way is this duplicating
information that's already there, and for what reason is it not possible
to specify different information per IRQ?  If the binding is custom to
each device then presumably it's not possible make any general comment
about the bindings...

Clearly if people are defining per-chip bindings that can't cope with
configuring different interrupts differently that's insane (and all the
more reason to come up with a standard binding so they don't have to
think) but this all seems so far off base that I fear there must be some
fundamental misunderstaniding here.

> > Actually there's a large element of things being fixed by the board but
> > the hardware being able to run with a wide range of board configurations
> > depending on what amuses the electrical engineers and what restrictions
> > the other devices in the system have.  For example, if there are pulls
> > on the board we would want the idle configuration to be whatever the
> > pull value is.

> Sure, but that's nothing new.  Board constraints are part of the fixed
> hardware information that can already be specified by fixed interrupt
> specifiers in the DT.

But according to what you say above each interrupt controller is on its
own when it comes to coming up with a mechanism for specifying this?
