From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: Proposal: new device-tree syntax and semantics for extending
	information from included dts files
Date: Tue, 19 Oct 2010 13:48:13 +1100
Message-ID: <20101019024813.GE24726@yookeroo>
References: <1286920561.4535.1315.camel@riker>
	<20101013231747.GD15286@angua.secretlab.ca>
	<20101014003833.GB4456@yookeroo>
	<20101014014036.GE15286@angua.secretlab.ca>
	<20101014034821.GH4456@yookeroo>
	<20101014045413.GK15286@angua.secretlab.ca>
	<20101016070238.GE5036@yookeroo>
	<AANLkTi=QaV5KvhFzyci2yykmsV9+Zz71vmoRrrFDGvK-@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <AANLkTi=QaV5KvhFzyci2yykmsV9+Zz71vmoRrrFDGvK--JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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

On Sat, Oct 16, 2010 at 12:57:21PM -0600, Grant Likely wrote:
> On Sat, Oct 16, 2010 at 1:02 AM, David Gibson
> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > On Wed, Oct 13, 2010 at 10:54:13PM -0600, Grant Likely wrote:
> >> On Thu, Oct 14, 2010 at 02:48:21PM +1100, David Gibson wrote:
> >> > On Wed, Oct 13, 2010 at 07:40:36PM -0600, Grant Likely wrote:
[snip]
> >> > We do already have ordering
> >> > amongst the top level items, since the last one wins.
> >>
> >> Right, but the ordering has been explicitly restricted to the top
> >> level trees using the "stack of overlays" conceptual model.
> >
> > Right, my point exactly. =A0I'm suggesting we keep it restricted to the
> > top level by only allowing these replace/remove operators (whatever
> > they look like) at the top level.
> =

> Sounds like we're having an impedance mismatch.  Let me try to

Yes, I noticed that :)

> clarify my position.  Ordering is still restricted to the top level
> what I'm suggesting.  For example, the following would be legal:

[snip]
> The model I'm suggesting is that each top level tree is fully
> constructed before being merged into the preceding tree.  Additional
> nodes and properties are easy to understand and it works already.
> I'm suggesting that the above illegal examples are exactly the same as
> the following illegal example:
> =

> 	/ {
> 		node {
> 			prop;
> 		};
> 		node {
> 			another-prop;
> 		};
> 	};
> =

> It is illegal because the node is defined twice in the same block.  If
> it were allowed, then it would raise the question of which node gets
> processed first, and we have explicitly decided not to support that
> model.
> =

> The removal or replacement of nodes is exactly the same.  However,
> instead of adding to a node, we set a flag in the new node stating
> that it replaces the node in the preceding tree.  Or in the case of
> removal, we set a flag that states the node in the preceding tree is
> to be removed without a replacement.
> =

> In terms of implementation this should be straight forward.  In the
> merge_nodes function, check the new node for a replace/remove flag,
> and if it is set then remove/replace the old node instead of merging
> with the new.  This can probably be performed in the
> while(new_node->children) loop.

> This is what I was talking about when I mentioned using a flag
> earlier.  The /*-node/ keyword could set a flag in the node structure
> so that merge_nodes handles the operation correctly when merging the
> trees.

Right, I understand the model and, yes, it's simple enough to
implement.  I'm just not sure if it's a good idea - allowing the
replace versus extend flag to be per sub-tree rather than per toplevel
tree is a step up in model complexity, and hence a step down in
obviousness.  I'm not yet sure if it's worth it (or perhaps rather, if
there's a cleaner alternative).

> >> > Now, if using
> >> > labels rather than full paths it does get a bit curlier on the
> >> > implementation side. =A0But I don't think it would be that hard to m=
ake
> >> > labels stick around attached to a path, even when the path itself is
> >> > removed.
> >>
> >> Ah right, the issue here was that a previous tree could be holding a
> >> label reference that gets deleted in an overlay. =A0And there are
> >> questions about what happens if a label is removed and then the same
> >> label attached to a new node, specifically because labels aren't
> >> resolved until after the trees are fully parsed. =A0(let me know if I'm
> >> remembering incorrectly). =A0I think this is solvable though, but we're
> >> going to need to define the semantics.
> >>
> >> I need to review the details though. =A0I can't remember all the ways
> >> that the code handles label resolution.
> >
> > Right. =A0Having labels move around seriously muddies the waters, since
> > the whole idea of labels is to unambiguously refer to a node. =A0I think
> > the sanest thing is to prohibit duplicate labels, even if the labelled
> > nodes have been removed between the duplicate declarations. =A0In the
> > later stages of processing, then, referring to a deleted label would
> > be detectable and trigger an error at that point.
> =

> Fair enough.  I can agree to that constraint.  It can be revisited
> again if it is too restrictive, and it is easier to relax
> restrictions later than it is to add new restrictions at a later date.

Ok.

-- =

David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
