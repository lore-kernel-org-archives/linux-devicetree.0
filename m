From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: Proposal: new device-tree syntax and semantics for
	extendinginformation from included dts files
Date: Fri, 15 Oct 2010 09:18:40 -0600
Message-ID: <20101015151840.GB32705@angua.secretlab.ca>
References: <1286920561.4535.1315.camel@riker>
	<20101013231747.GD15286@angua.secretlab.ca>
	<d223e561-ed6e-44c2-8a99-8959e85ae022@VA3EHSMHS031.ehs.local>
	<20101014004550.GC4456@yookeroo>
	<21eeaef0-fc78-47c9-b1c5-bfefaa55fb85@SG2EHSMHS003.ehs.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <21eeaef0-fc78-47c9-b1c5-bfefaa55fb85-RaUQJvECHis6W+Ha+8ZLibjjLBE8jN/0@public.gmane.org>
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

On Thu, Oct 14, 2010 at 09:38:44AM -0700, Stephen Neuendorffer wrote:
[fixed quoting header]
> On Wed, Oct 13, 2010 5:46 PM, David Gibson wrote:
> > On Wed, Oct 13, 2010 at 04:41:59PM -0700, Stephen Neuendorffer wrote:
> > [snip]
> > > Or better yet, outside of the braces?
[...]
> > >             /remove/ {
> > >  				serial@2600 { };		// PSC4
> > >
> > >  				serial@2800 { };		// PSC5
> > >  		};
> > 
> > Um.. no.  That makes even less sense in the conceptual framework of a
> > stack of overlays.
> 
> Why exactly?  Instead of being a stack of overlays, it seems to me like
> a stack of trees with operators..
> The point is exactly that operators make most sense at the stack of
> trees level and not
> at the individual node level.

I don't think I'm understanding what you're trying to say.  How do you differentiate "stack of overlays" and "stack of trees"?

The reason I don't like this approach is that in many cases many
things will need to be changed by a single overlay, and not all those
changes will be the same operation.  For example, an overlay for a
board could add a bunch of nodes for i2c devices, and at the same time
remove an unused spi bus device.

The "stack of overlays" conceptual model that we've settled on uses
the concept that subsequent top level trees stack on top of the
preceding tree and can mask out or add/change nodes and properties.
The trees are merged together before going on to the next top level
tree.

g.
