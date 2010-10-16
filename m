From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: Proposal: new device-tree syntax and semantics for
	extendinginformation from included dts files
Date: Sat, 16 Oct 2010 18:05:46 +1100
Message-ID: <20101016070546.GF5036@yookeroo>
References: <1286920561.4535.1315.camel@riker>
	<20101013231747.GD15286@angua.secretlab.ca>
	<d223e561-ed6e-44c2-8a99-8959e85ae022@VA3EHSMHS031.ehs.local>
	<20101014004550.GC4456@yookeroo>
	<21eeaef0-fc78-47c9-b1c5-bfefaa55fb85@SG2EHSMHS003.ehs.local>
	<20101015151840.GB32705@angua.secretlab.ca>
	<b04d95cc-c35b-4597-8fbe-f7c48f23ef92@VA3EHSMHS036.ehs.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <b04d95cc-c35b-4597-8fbe-f7c48f23ef92-+Ck8Kgl/v09DUMyIFHz4objjLBE8jN/0@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, John Bonesio <bones-RkXMcIGFT/TR7s880joybQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 15, 2010 at 09:10:55AM -0700, Stephen Neuendorffer wrote:
[snip]
> > > Why exactly?  Instead of being a stack of overlays, it seems to me
> like
> > > a stack of trees with operators..
> > > The point is exactly that operators make most sense at the stack of
> > > trees level and not
> > > at the individual node level.
> > 
> > I don't think I'm understanding what you're trying to say.  How do you
> differentiate "stack of
> > overlays" and "stack of trees"?
> > 
> > The reason I don't like this approach is that in many cases many
> > things will need to be changed by a single overlay, and not all those
> > changes will be the same operation.  For example, an overlay for a
> > board could add a bunch of nodes for i2c devices, and at the same time
> > remove an unused spi bus device.
> 
> So why not have two trees stacked to do the job? 
>  
> > The "stack of overlays" conceptual model that we've settled on uses
> > the concept that subsequent top level trees stack on top of the
> > preceding tree and can mask out or add/change nodes and properties.
> > The trees are merged together before going on to the next top level
> > tree.
> 
> I guess I'm stuck on 'overlay' to me implies '/extend/', so I associate
> the operations being on trees, not individual nodes.
> (Although, there's still the tough part about /remove-node/ vs
> /remove-property/,
> which might meant that the operations have to be in the trees to
> distinguish that).

I'm with Steve here, even though I still don't follow his reasoning
from here to the syntax he proposed earlier.  But I think we've
kind of moved past that option now, anyway.

There can be multiple overlays / top-level items per-file so there's
no reason the example above can't be done as multiple overlays with
different operaitons.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
