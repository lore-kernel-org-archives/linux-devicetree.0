From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: Configurable interrupt sources, and DT bindings
Date: Fri, 2 Dec 2011 11:27:22 +0000
Message-ID: <20111202112722.GG8245@opensource.wolfsonmicro.com>
References: <4ED40B5F.6030603@nvidia.com>
 <20111129013055.GH3508@truffala.fritz.box>
 <20111129105538.GC2851@opensource.wolfsonmicro.com>
 <20111130051349.GG5435@truffala.fritz.box>
 <20111130093305.GB2791@opensource.wolfsonmicro.com>
 <20111130133140.GL5435@truffala.fritz.box>
 <20111201110738.GA2915@opensource.wolfsonmicro.com>
 <20111202053814.GH5427@truffala.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20111202053814.GH5427-MK4v0fQdeXQXU02nzanrWNbf9cGiqdzd@public.gmane.org>
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

On Fri, Dec 02, 2011 at 04:38:14PM +1100, David Gibson wrote:
> On Thu, Dec 01, 2011 at 11:07:39AM +0000, Mark Brown wrote:

> > Right, but you could stuff those in an enormous array or whatever - the
> > point was to describe the per interrupt information.

> Well, ok, but that's not what you proposed.  In any case putting

Please stop claiming this, it's incredibly irritating.  At *no* point
have I suggested making the interrupt type a global property of the
interrupt controller, that would be silly.  What I did do was mistakenly
assume that the binding would be something more device tree like than a
table of magic numbers which you then projected into a desire to make
this a global property of the interrupt controller.

> important irq type information anywhere othrt than the irq specifers
> listed in the 'interrupts' property is not a good idea.  It would be
> breakin to overall model of the DT interrupt tree with poor
> justification.

I do think there's a reasonable case for just creatinng a new version of
the binding which is more readable but perhaps that's just me.

> > Well, then it'd be good if we could get that written up as a spec and
> > factor out the parsing code then start pushing back very strongly on any
> > new bindings that don't follow the spec.  

> Well, write up a best practice document and get it up on
> devicetree.org.  I think you overestimate the problem though.  The
> specific case you've described can be handled with an in-kernel
> mechanism for the irq controller driver to advertise the irq type back
> to the irq source's driver - no DT change necessary, and it even
> handles all the legacy cases.

The in kernel bit of this is already fine, the problem is on the device
tree side.

> > I don't think so really - it seems like what you're saying is "there's a
> > place where people could put this information in a device specific
> > fashion" and I'm looking for something that's not device specific as
> > this is a general need and we shouldn't have to be doing device specific 
> > things here.

> It'd be nice, but it's just not worth breaking away from existing
> practice to achieve it.  Remember that more or less by definition, we
> *already have* code to interpret the device specific tokens (in the
> irq controller driver).

Not in the real world, in the real world we don't have device tree
bindings for most of the interrupt controllers out there and therefore
no code exists to parse them.  There's a fairly small set of current
systems using device tree and a very large set of systems which have
never used it before and are currently working on implementing it.
