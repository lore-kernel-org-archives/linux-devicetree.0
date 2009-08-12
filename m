From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: ARM clock API to PowerPC
Date: Thu, 13 Aug 2009 07:34:07 +1000
Message-ID: <1250112847.3587.26.camel@pasglop>
References: <1250063825.15143.43.camel@pasglop>
	<20090812123551.GC11227@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20090812123551.GC11227-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Mark Brown <broonie-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Cc: John Jacques <john.jacques-M7mHMAq9Yzo@public.gmane.org>, linuxppc-dev list <linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Torez Smith <torez-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>, Russell King <rmk-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 2009-08-12 at 13:35 +0100, Mark Brown wrote:
> On Wed, Aug 12, 2009 at 05:57:05PM +1000, Benjamin Herrenschmidt wrote:
> 
> >  - From the above, question: Do we want to keep that parent pointer ?
> > Does it make sense ? Will we have objects that are clock providers and
> > themselves source from multiple parent ? Or we don't care and it becomes
> 
> That happens and at times one or more of the sources is off-chip.

Right. That's somewhat what I thought. I think the best approach
initially is not to impose a hierarchy in our "core" and keep that to
the actual clock provider implementation. We'll see in the long term
with practice whether we then want to move some of that back into core.

> What happens if another clock gets added or the list gets reordered for
> some reason?

The device-tree is mostly static in that regard. I'm not sure what you
mean. Clocks are referenced by IDs so if you want to add more clocks you
can just add them to the end. The "NULL" case is typically for things
that have only one clock (which seems to be reasonably common in ARM
land).

I think it's reasonable to ask whoever produces the device-tree to keep
the two properties in sync.

> Note that the present ARM implementations don't handle anything except
> the core SoC normally.

Ok, interesting. I don't see why the API would prevent going further
tho. In any case, that isn't a big deal, at least until somebody proves
me wrong, I believe what I proposed remains simple enough and leaves
enough to the actual implementations to allow pretty much anything in
that area.

Cheers,
Ben.
