From: John Bonesio <bones-RkXMcIGFT/TR7s880joybQ@public.gmane.org>
Subject: Re: Proposal: new device-tree syntax and semantics for extending
	information from included dts files
Date: Sat, 16 Oct 2010 12:50:43 -0700
Message-ID: <1287258643.4535.1453.camel@riker>
References: <1286920561.4535.1315.camel@riker>
	<20101013231747.GD15286@angua.secretlab.ca>
	<20101014003833.GB4456@yookeroo>
	<20101014014036.GE15286@angua.secretlab.ca>
	<20101014034821.GH4456@yookeroo>
	<20101014045413.GK15286@angua.secretlab.ca>
	<20101016070238.GE5036@yookeroo>
	<AANLkTi=QaV5KvhFzyci2yykmsV9+Zz71vmoRrrFDGvK-@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
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
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, 2010-10-16 at 12:57 -0600, Grant Likely wrote:
> On Sat, Oct 16, 2010 at 1:02 AM, David Gibson
> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > On Wed, Oct 13, 2010 at 10:54:13PM -0600, Grant Likely wrote:
> >> On Thu, Oct 14, 2010 at 02:48:21PM +1100, David Gibson wrote:
> >> > On Wed, Oct 13, 2010 at 07:40:36PM -0600, Grant Likely wrote:
> >> > > &some-node {
> >> > >   node-to-remove /remove/;
> >> > >
> >> > >   node-to-replace /remove/;
> >> > >   node-to-replace { prop = "blah"; };
> >> > > };
> >> > >
> >> > > I don't like this one because it implies ordering between the first
> >> > > and second 'node-to-replace' definitions, and to this point the syntax
> >> > > has not imposed any order assumptions.
> >> >
> >> > Hrm.  Well, more precisely I was thinking of:
> >> >
> >> > &{/some/node} /remove/;
> >> >
> >> > &{/some/node} {
> >> >     new-contents;
> >> > };
> >> >
> >> > Since I thought the original proposal was that these node /replace/,
> >> > /extend/ whatnot were only valid at the top level (for the reasons
> >> > we've discussed on previous occasions).
> >>
> >> Hmmm, I thought we had figured out how to solve those issues by using
> >> a flag to indicate that a node or property "masks out" the same node
> >> or property in a preceding top-level tree.
> >
> > Um.. I don't follow.
> 
> Sorry, I was thinking about a different aspect of the problem and I
> didn't make that clear.
> 
> >
> >> > We do already have ordering
> >> > amongst the top level items, since the last one wins.
> >>
> >> Right, but the ordering has been explicitly restricted to the top
> >> level trees using the "stack of overlays" conceptual model.
> >
> > Right, my point exactly.  I'm suggesting we keep it restricted to the
> > top level by only allowing these replace/remove operators (whatever
> > they look like) at the top level.
> 
> Sounds like we're having an impedance mismatch.  Let me try to
> clarify my position.  Ordering is still restricted to the top level
> what I'm suggesting.  For example, the following would be legal:
> 
> 	/ {
> 		node {
> 			prop;
> 		};
> 	};
> 
> 	/{
> 		/trim-node/ node;
> 	};
> 
> But this would be illegal (enforced by dtc):
> 
> 	/{
> 		node {
> 			prop;
> 		};
> 		/trim-node/ node;
> 	};
> 
> And this would also be illegal (also enforced):
> 
> 	/ {
> 		node {
> 			prop;
> 		};
> 	};
> 
> 	/{
> 		/trim-node/ node;
> 		node {
> 			newprop;
> 		};
> 	};
> 
> The model I'm suggesting is that each top level tree is fully
> constructed before being merged into the preceding tree.  Additional
> nodes and properties are easy to understand and it works already.
> I'm suggesting that the above illegal examples are exactly the same as
> the following illegal example:
> 
> 	/ {
> 		node {
> 			prop;
> 		};
> 		node {
> 			another-prop;
> 		};
> 	};
> 
> It is illegal because the node is defined twice in the same block.  If
> it were allowed, then it would raise the question of which node gets
> processed first, and we have explicitly decided not to support that
> model.

I think it is natural for dtc to process nodes in the order they are
seen. I think it is also natural for people to assume that the things at
the top are processed first. I don't think there would be any confusion
at all, especially for "C" programmers. If there is ever a question, we
can just say, "they're processed top to bottom."

Probably I just don't understand some of the thinking behind why there
is a problem forcing an ordering for dtc to process the nodes.

> The removal or replacement of nodes is exactly the same.  However,
> instead of adding to a node, we set a flag in the new node stating
> that it replaces the node in the preceding tree.  Or in the case of
> removal, we set a flag that states the node in the preceding tree is
> to be removed without a replacement.
> 
> In terms of implementation this should be straight forward.  In the
> merge_nodes function, check the new node for a replace/remove flag,
> and if it is set then remove/replace the old node instead of merging
> with the new.  This can probably be performed in the
> while(new_node->children) loop.

This doesn't look straight forward to me at all. From what I can tell,
the dtc is pretty much a 2 pass compilation system. It parses and builds
up an in memory tree structure, then it runs through and generates the
bits for the dtb file.

Right now it merges trees during the parsing phase (not just my
implementation, but also with what was already implemented). So, if it
sees
	/trim-node/ node;
It's going to be looking for the node it will replace (or remove). At
this point it's not going to know if 'node' was defined in this instance
of the tree or if node is in a previous tree. Internally it just keeps
in memory the current merged tree it has processed so far.

It could be I'm misunderstanding the design of dtc, but enforcing this
looks to me like it will require:
1) building a data structure that holds the multiple trees unchanged
(changing the existing implementation as well as my additions).
2) creating another pass over the data structure to merge the parts that
need to be merged.

I can understand that we may want to prevent nodes from being defined
twice in a tree because that is likely an unintended error on the dts
writer's part.

Perhaps it would be better to require explicit extension of nodes. This
would be a change to the current implementation where two trees are
automatically merged. This idea would be to require one of the
keywords, /extend-node/, /trim-node/, /replace-node/ (or whatever we
decide these to be) when an existing node is modified. Otherwise, it
would be assumed there are duplicate nodes, and dtc will give an error.

So:

	/ {
		node {
			prop;
		};
		node {
			another-prop;
		};
	};

would be an error. But

	/ { 
		node {
			prop;
		};
		/extend-node/ node {
			another-prop;
		};
	};

would be allowed.

> 
> This is what I was talking about when I mentioned using a flag
> earlier.  The /*-node/ keyword could set a flag in the node structure
> so that merge_nodes handles the operation correctly when merging the
> trees.

See above - I don't think just setting a flag is going to be sufficient.

> 
> >
> >> > Now, if using
> >> > labels rather than full paths it does get a bit curlier on the
> >> > implementation side.  But I don't think it would be that hard to make
> >> > labels stick around attached to a path, even when the path itself is
> >> > removed.
> >>
> >> Ah right, the issue here was that a previous tree could be holding a
> >> label reference that gets deleted in an overlay.  And there are
> >> questions about what happens if a label is removed and then the same
> >> label attached to a new node, specifically because labels aren't
> >> resolved until after the trees are fully parsed.  (let me know if I'm
> >> remembering incorrectly).  I think this is solvable though, but we're
> >> going to need to define the semantics.
> >>
> >> I need to review the details though.  I can't remember all the ways
> >> that the code handles label resolution.
> >
> > Right.  Having labels move around seriously muddies the waters, since
> > the whole idea of labels is to unambiguously refer to a node.  I think
> > the sanest thing is to prohibit duplicate labels, even if the labelled
> > nodes have been removed between the duplicate declarations.  In the
> > later stages of processing, then, referring to a deleted label would
> > be detectable and trigger an error at that point.
> 
> Fair enough.  I can agree to that constraint.  It can be revisited
> again if it is too restrictive, and it is easier to relax
> restrictions later than it is to add new restrictions at a later date.
> 
> g.
