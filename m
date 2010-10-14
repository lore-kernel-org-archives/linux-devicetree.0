From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: Proposal: new device-tree syntax and semantics for extending
	information from included dts files
Date: Wed, 13 Oct 2010 22:54:13 -0600
Message-ID: <20101014045413.GK15286@angua.secretlab.ca>
References: <1286920561.4535.1315.camel@riker>
	<20101013231747.GD15286@angua.secretlab.ca>
	<20101014003833.GB4456@yookeroo>
	<20101014014036.GE15286@angua.secretlab.ca>
	<20101014034821.GH4456@yookeroo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20101014034821.GH4456@yookeroo>
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

On Thu, Oct 14, 2010 at 02:48:21PM +1100, David Gibson wrote:
> On Wed, Oct 13, 2010 at 07:40:36PM -0600, Grant Likely wrote:
> > &some-node {
> > 	node-to-remove /remove/;
> > 
> > 	node-to-replace /remove/;
> > 	node-to-replace { prop = "blah"; };
> > };
> > 
> > I don't like this one because it implies ordering between the first
> > and second 'node-to-replace' definitions, and to this point the syntax
> > has not imposed any order assumptions.
> 
> Hrm.  Well, more precisely I was thinking of:
> 
> &{/some/node} /remove/;
> 
> &{/some/node} {
> 	new-contents;
> };
> 
> Since I thought the original proposal was that these node /replace/,
> /extend/ whatnot were only valid at the top level (for the reasons
> we've discussed on previous occasions).

Hmmm, I thought we had figured out how to solve those issues by using
a flag to indicate that a node or property "masks out" the same node
or property in a preceding top-level tree.

> We do already have ordering
> amongst the top level items, since the last one wins.

Right, but the ordering has been explicitly restricted to the top
level trees using the "stack of overlays" conceptual model.

> Now, if using
> labels rather than full paths it does get a bit curlier on the
> implementation side.  But I don't think it would be that hard to make
> labels stick around attached to a path, even when the path itself is
> removed.

Ah right, the issue here was that a previous tree could be holding a
label reference that gets deleted in an overlay.  And there are
questions about what happens if a label is removed and then the same
label attached to a new node, specifically because labels aren't
resolved until after the trees are fully parsed.  (let me know if I'm
remembering incorrectly).  I think this is solvable though, but we're
going to need to define the semantics.

I need to review the details though.  I can't remember all the ways
that the code handles label resolution.

> 
> > Perhaps this:
> > 
> > &some-node {
> > 	node-to-remove /remove/;
> > 	node-to-replace /remove/ { prop = "blah"; };
> > };
> > 
> > Here the keyword essentially becomes a flag to drop the previous
> > definition of the node with the option to also provide a replacement
> > defintion.  I like this better, and the (lack of) ordering assumptions
> > are preserved.
> 
> Urg.  I think that is confusing for much the same reasons John Bonesio
> states in his later mail.  But, I can see a case for:
> 
> 	node-to-replace /replace/ { prop = "blah"; };
> 
> and allowing removal with:
> 
> 	node-to-replace /replace/ /undefined/;
> 
> So instead of substituting "remove+extend" for replace, we substitute
> "replace with nothing" for remove.  Either way we remove one syntactic
> element.  Have to think more about which I prefer.

Hmmm, this has possibilities.

> > Or perhaps with the keyword preceding:
> > 
> > &some-node {
> > 	/remove-prop/ property-to-remove;
> > 	property-to-replace = "new value";
> > 	property-to-replace-with-empty-prop;
> > 
> > 	/remove-node/ node-to-remove;
> > 	/remove-node/ node-to-replace { prop = "blah"; };
> > };
> 
> 
> I prefer this last example to the two previous ones.

Combining your last suggestion with this would give:

&some-node {
	/remove-prop/ property-to-remove;
	property-to-replace = "new value";
	property-to-replace-with-empty-prop;

	/replace-node/ node-to-remove /undefined/;
	/replace-node/ node-to-replace { prop = "blah"; };
};

I'm not sure.  It feels a little muddy.  It's late though.  I'm going
to go sleep on it, and take a fresh look in the morning.

> 
> > And the following construct would be forbidden:
> > 
> > 	/remove-prop/ property-to-remove = "new value;
> > 
> > 
> > Also, /remove-node/ feels awkward when working with replacing a node.
> > Would /clear-node/ or /trim-node/ be better?  '/replace-node/'
> 
> /clear-node/ suggests to me that it would leave the node in place,
> just removing subnodes and properties.  /trim-node/ might work.
> 
> > wouldn't be very because it doesn't make sense in the removal case,
> > and /delete-node/ has the same problem as /remove-node/.
> > /undefine-node/ as you suggested has possibilities too.  Anyone have
> > other suggestions for intuitive keyword names?
> 
> Well.. the "try not to surprise C programmers" rule of thumb has
> served us well so far for dtc, so /undef-node/ has some merit.  In
> principle I'd kind of like to use just preceding /undef/ for both, but
> that will cause some parsing problems.

Good point.  And yes, using the same for both it tricky.

> > > Directly allowing a label+relative path could be useful enough to
> > > reduce verbosity, but it will require careful thinking about the
> > > syntax.
> > 
> > Yes, (as discussed previously) this is just syntactic sugar.  The
> > syntax already supports the functionality, but it would be nice to be
> > less verbose.
> 
> Right, but I think that can wait until after we've decided and
> implemented on the core functionality.

Yes.
