From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] dtc: Add ability to delete nodes and properties
Date: Wed, 21 Mar 2012 17:13:40 +1100
Message-ID: <20120321061340.GE15997@truffala.fritz.box>
References: <1331678894-31251-1-git-send-email-swarren@wwwdotorg.org>
 <4F68C677.7070501@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4F68C677.7070501-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Mar 20, 2012 at 12:03:35PM -0600, Stephen Warren wrote:
> On 03/13/2012 04:48 PM, Stephen Warren wrote:
> > dtc currently allows the contents of properties to be changed, and the
> > contents of nodes to be added to. There are situations where removing
> > properties or nodes may be useful. This change implements the following
> > syntax to do that:
> > 
> >     / {
> >         propname /delprop/;
> >         nodename /delnode/;
> >     };
> > 
> > or:
> > 
> >     &noderef /delnode/;
> 
> Jon, David, any thoughts on this?

Hrm, some, but not terribly clear ones.

So, superficially, your patch looks fine, making the obvious
straightforward implementation of deletion.  I'm about 85% convinced
the syntax for it is as good as we can reasonably get.

Unfortunately the obvious deletion implementation raises some issues
with labels.  With this patch, for the first time ever, it's possible
to delete labels (along with the node or property they're attached
to).  And further, having deleted a labelled node or property a new
one could created using the same label.

Our label semantics have been worked out with the assumption that
labels are immutable, so the order of anything to do with them doesn't
matter.  Now, if a label is attached, removed then reassigned,
references to that label could resolve differently depending on the
not-obvious-to-the-user internal order of processing.

I think the sanest way to resolve this from the user visible point of
view is to keep the assumption that labels are always fixed.  That
means that even if a labelled node is removed, the label cannot be
reused.  Attempting to re-use the label will give an error as will
referencing the label (from anywhere that's not itself deleted).

But implementing that means doing a rework on how we store labels /
nodes / properties and manage their lifetimes.  It's not a huge body
of work, but it's not completely trivial either.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
