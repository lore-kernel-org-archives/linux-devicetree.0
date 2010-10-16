From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] Implements new features for updating existing device
	tree nodes.
Date: Sat, 16 Oct 2010 20:05:55 +1100
Message-ID: <20101016090555.GH5036@yookeroo>
References: <20101016010732.4855.52273.stgit@riker>
	<AANLkTimx4z-YkH+PXcnKYJpq3MEd3oJZ+ow7mWJzn1BN@mail.gmail.com>
	<1287199277.4535.1423.camel@riker> <20101016064744.GD5036@yookeroo>
	<20101016081012.GH653@angua.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20101016081012.GH653-MrY2KI0G/OVr83L8+7iqerDks+cytr/Z@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Oct 16, 2010 at 02:10:12AM -0600, Grant Likely wrote:
> On Sat, Oct 16, 2010 at 05:47:44PM +1100, David Gibson wrote:
> > On Fri, Oct 15, 2010 at 08:21:17PM -0700, John Bonesio wrote:
> > > On Fri, 2010-10-15 at 20:35 -0600, Grant Likely wrote:
[snip]
> > > Ok, so maybe I misunderstood. I thought we had decided that node
> > > modifications would only happen at the top level, but now that I'm
> > > looking back through your examples earlier today, and I see this isn't
> > > true.
> > 
> > Um.. that part of the discussion got confusing.  I think only allowing
> > the operations (and I still don't think the set implemented here are
> > quite right, though they're close) at the top-level is a better idea.
> > 
> > Grant, is there a reason you think we need to have replacement as an
> > option within each tree, rather than a "per-overlay-sheet" option.
> 
> Yes, because I need the ability to remove/replace a child of a
> labelled node.  Not every node that needs to be manipulated will
> necessarily have a label.
> 
> For example; I could have a labelled spi bus node with child nodes for
> each of the spi devices.  I want to be able to remove/replace the
> child nodes without having to label them first.

Ah, I see.  This could also be accomplished if we allowed overlays to
be targeted at (label + relative path) which we were talking about
anyway.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
