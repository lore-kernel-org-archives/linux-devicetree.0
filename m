From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: Proposal: new device-tree syntax and semantics for extending
	information from included dts files
Date: Sat, 16 Oct 2010 12:57:21 -0600
Message-ID: <AANLkTi=QaV5KvhFzyci2yykmsV9+Zz71vmoRrrFDGvK-@mail.gmail.com>
References: <1286920561.4535.1315.camel@riker>
	<20101013231747.GD15286@angua.secretlab.ca>
	<20101014003833.GB4456@yookeroo>
	<20101014014036.GE15286@angua.secretlab.ca>
	<20101014034821.GH4456@yookeroo>
	<20101014045413.GK15286@angua.secretlab.ca>
	<20101016070238.GE5036@yookeroo>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20101016070238.GE5036@yookeroo>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, John Bonesio <bones-RkXMcIGFT/TR7s880joybQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Oct 16, 2010 at 1:02 AM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Wed, Oct 13, 2010 at 10:54:13PM -0600, Grant Likely wrote:
>> On Thu, Oct 14, 2010 at 02:48:21PM +1100, David Gibson wrote:
>> > On Wed, Oct 13, 2010 at 07:40:36PM -0600, Grant Likely wrote:
>> > > &some-node {
>> > > =A0 node-to-remove /remove/;
>> > >
>> > > =A0 node-to-replace /remove/;
>> > > =A0 node-to-replace { prop =3D "blah"; };
>> > > };
>> > >
>> > > I don't like this one because it implies ordering between the first
>> > > and second 'node-to-replace' definitions, and to this point the synt=
ax
>> > > has not imposed any order assumptions.
>> >
>> > Hrm. =A0Well, more precisely I was thinking of:
>> >
>> > &{/some/node} /remove/;
>> >
>> > &{/some/node} {
>> > =A0 =A0 new-contents;
>> > };
>> >
>> > Since I thought the original proposal was that these node /replace/,
>> > /extend/ whatnot were only valid at the top level (for the reasons
>> > we've discussed on previous occasions).
>>
>> Hmmm, I thought we had figured out how to solve those issues by using
>> a flag to indicate that a node or property "masks out" the same node
>> or property in a preceding top-level tree.
>
> Um.. I don't follow.

Sorry, I was thinking about a different aspect of the problem and I
didn't make that clear.

>
>> > We do already have ordering
>> > amongst the top level items, since the last one wins.
>>
>> Right, but the ordering has been explicitly restricted to the top
>> level trees using the "stack of overlays" conceptual model.
>
> Right, my point exactly. =A0I'm suggesting we keep it restricted to the
> top level by only allowing these replace/remove operators (whatever
> they look like) at the top level.

Sounds like we're having an impedance mismatch.  Let me try to
clarify my position.  Ordering is still restricted to the top level
what I'm suggesting.  For example, the following would be legal:

	/ {
		node {
			prop;
		};
	};

	/{
		/trim-node/ node;
	};

But this would be illegal (enforced by dtc):

	/{
		node {
			prop;
		};
		/trim-node/ node;
	};

And this would also be illegal (also enforced):

	/ {
		node {
			prop;
		};
	};

	/{
		/trim-node/ node;
		node {
			newprop;
		};
	};

The model I'm suggesting is that each top level tree is fully
constructed before being merged into the preceding tree.  Additional
nodes and properties are easy to understand and it works already.
I'm suggesting that the above illegal examples are exactly the same as
the following illegal example:

	/ {
		node {
			prop;
		};
		node {
			another-prop;
		};
	};

It is illegal because the node is defined twice in the same block.  If
it were allowed, then it would raise the question of which node gets
processed first, and we have explicitly decided not to support that
model.

The removal or replacement of nodes is exactly the same.  However,
instead of adding to a node, we set a flag in the new node stating
that it replaces the node in the preceding tree.  Or in the case of
removal, we set a flag that states the node in the preceding tree is
to be removed without a replacement.

In terms of implementation this should be straight forward.  In the
merge_nodes function, check the new node for a replace/remove flag,
and if it is set then remove/replace the old node instead of merging
with the new.  This can probably be performed in the
while(new_node->children) loop.

This is what I was talking about when I mentioned using a flag
earlier.  The /*-node/ keyword could set a flag in the node structure
so that merge_nodes handles the operation correctly when merging the
trees.

>
>> > Now, if using
>> > labels rather than full paths it does get a bit curlier on the
>> > implementation side. =A0But I don't think it would be that hard to make
>> > labels stick around attached to a path, even when the path itself is
>> > removed.
>>
>> Ah right, the issue here was that a previous tree could be holding a
>> label reference that gets deleted in an overlay. =A0And there are
>> questions about what happens if a label is removed and then the same
>> label attached to a new node, specifically because labels aren't
>> resolved until after the trees are fully parsed. =A0(let me know if I'm
>> remembering incorrectly). =A0I think this is solvable though, but we're
>> going to need to define the semantics.
>>
>> I need to review the details though. =A0I can't remember all the ways
>> that the code handles label resolution.
>
> Right. =A0Having labels move around seriously muddies the waters, since
> the whole idea of labels is to unambiguously refer to a node. =A0I think
> the sanest thing is to prohibit duplicate labels, even if the labelled
> nodes have been removed between the duplicate declarations. =A0In the
> later stages of processing, then, referring to a deleted label would
> be detectable and trigger an error at that point.

Fair enough.  I can agree to that constraint.  It can be revisited
again if it is too restrictive, and it is easier to relax
restrictions later than it is to add new restrictions at a later date.

g.
