From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: Proposal: new device-tree syntax and semantics for
	extendinginformation from included dts files
Date: Thu, 14 Oct 2010 14:31:14 +1100
Message-ID: <20101014033114.GG4456@yookeroo>
References: <1286920561.4535.1315.camel@riker>
	<20101013231747.GD15286@angua.secretlab.ca>
	<d223e561-ed6e-44c2-8a99-8959e85ae022@VA3EHSMHS031.ehs.local>
	<20101014004550.GC4456@yookeroo>
	<20101014014657.GF15286@angua.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20101014014657.GF15286-MrY2KI0G/OVr83L8+7iqerDks+cytr/Z@public.gmane.org>
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
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, John Bonesio <bones-RkXMcIGFT/TR7s880joybQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 13, 2010 at 07:46:57PM -0600, Grant Likely wrote:
> On Thu, Oct 14, 2010 at 11:45:50AM +1100, David Gibson wrote:
> > On Wed, Oct 13, 2010 at 04:41:59PM -0700, Stephen Neuendorffer wrote:
> > > Personally, I hope to avoid replace and remove, since it is difficult to
> > > tell if
> > > assumptions about which nodes may be present in an included file if
> > > parts of the tree
> > > start getting removed.
> > 
> > Hrm, that's a point.  We may want to make a distinction between the
> > operations "delete and give an error if it wasn't there before" and
> > "delete if present".
> 
> We don't know if this is going to be an issue yet.  I suggest start
> with choosing a stance that covers the path of least surprise (or at
> least what we think is the path of least surprise), and add the syntax
> for the other behaviour only if it is actually needed.

Heh, I agree in principle, though I'm not at all sure which is the
least surprising.

> I say that when trying to delete a node, pitch an error (or warning)
> if the target node doesn't exist.  When adding or overriding an node,
> don't worry about whether or not an original exists (current behaviour).

I'm certainly not suggesting a change in current semantics for the
existing add/merge/override behaviour.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
