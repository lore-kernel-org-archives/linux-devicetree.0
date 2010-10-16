From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: Proposal: new device-tree syntax and semantics for extending
	information from included dts files
Date: Sat, 16 Oct 2010 18:02:38 +1100
Message-ID: <20101016070238.GE5036@yookeroo>
References: <1286920561.4535.1315.camel@riker>
	<20101013231747.GD15286@angua.secretlab.ca>
	<20101014003833.GB4456@yookeroo>
	<20101014014036.GE15286@angua.secretlab.ca>
	<20101014034821.GH4456@yookeroo>
	<20101014045413.GK15286@angua.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20101014045413.GK15286-MrY2KI0G/OVr83L8+7iqerDks+cytr/Z@public.gmane.org>
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

On Wed, Oct 13, 2010 at 10:54:13PM -0600, Grant Likely wrote:
> On Thu, Oct 14, 2010 at 02:48:21PM +1100, David Gibson wrote:
> > On Wed, Oct 13, 2010 at 07:40:36PM -0600, Grant Likely wrote:
> > > &some-node {
> > > 	node-to-remove /remove/;
> > > 
> > > 	node-to-replace /remove/;
> > > 	node-to-replace { prop = "blah"; };
> > > };
> > > 
> > > I don't like this one because it implies ordering between the first
> > > and second 'node-to-replace' definitions, and to this point the syntax
> > > has not imposed any order assumptions.
> > 
> > Hrm.  Well, more precisely I was thinking of:
> > 
> > &{/some/node} /remove/;
> > 
> > &{/some/node} {
> > 	new-contents;
> > };
> > 
> > Since I thought the original proposal was that these node /replace/,
> > /extend/ whatnot were only valid at the top level (for the reasons
> > we've discussed on previous occasions).
> 
> Hmmm, I thought we had figured out how to solve those issues by using
> a flag to indicate that a node or property "masks out" the same node
> or property in a preceding top-level tree.

Um.. I don't follow.

> > We do already have ordering
> > amongst the top level items, since the last one wins.
> 
> Right, but the ordering has been explicitly restricted to the top
> level trees using the "stack of overlays" conceptual model.

Right, my point exactly.  I'm suggesting we keep it restricted to the
top level by only allowing these replace/remove operators (whatever
they look like) at the top level.

> > Now, if using
> > labels rather than full paths it does get a bit curlier on the
> > implementation side.  But I don't think it would be that hard to make
> > labels stick around attached to a path, even when the path itself is
> > removed.
> 
> Ah right, the issue here was that a previous tree could be holding a
> label reference that gets deleted in an overlay.  And there are
> questions about what happens if a label is removed and then the same
> label attached to a new node, specifically because labels aren't
> resolved until after the trees are fully parsed.  (let me know if I'm
> remembering incorrectly).  I think this is solvable though, but we're
> going to need to define the semantics.
> 
> I need to review the details though.  I can't remember all the ways
> that the code handles label resolution.

Right.  Having labels move around seriously muddies the waters, since
the whole idea of labels is to unambiguously refer to a node.  I think
the sanest thing is to prohibit duplicate labels, even if the labelled
nodes have been removed between the duplicate declarations.  In the
later stages of processing, then, referring to a deleted label would
be detectable and trigger an error at that point.

[snip]
> > > Or perhaps with the keyword preceding:
> > > 
> > > &some-node {
> > > 	/remove-prop/ property-to-remove;
> > > 	property-to-replace = "new value";
> > > 	property-to-replace-with-empty-prop;
> > > 
> > > 	/remove-node/ node-to-remove;
> > > 	/remove-node/ node-to-replace { prop = "blah"; };
> > > };
> > 
> > 
> > I prefer this last example to the two previous ones.
> 
> Combining your last suggestion with this would give:

Uh, sorry, not all of my suggestions were intended to be used in
conjuction.  Some were alternate possibilities which do not mix well.

> &some-node {
> 	/remove-prop/ property-to-remove;

For example if we're doing node removal as a "replace with nothing",
then we'd certainly do the same for properties, i.e. "prop =
/undefine/;" not a /remove-prop/ keyword.

> 	property-to-replace = "new value";
> 	property-to-replace-with-empty-prop;
> 
> 	/replace-node/ node-to-remove /undefined/;
> 	/replace-node/ node-to-replace { prop = "blah"; };
> };
> 
> I'm not sure.  It feels a little muddy.  It's late though.  I'm going
> to go sleep on it, and take a fresh look in the morning.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
