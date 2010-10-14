From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: Proposal: new device-tree syntax and semantics for extending
	information from included dts files
Date: Thu, 14 Oct 2010 14:48:21 +1100
Message-ID: <20101014034821.GH4456@yookeroo>
References: <1286920561.4535.1315.camel@riker>
	<20101013231747.GD15286@angua.secretlab.ca>
	<20101014003833.GB4456@yookeroo>
	<20101014014036.GE15286@angua.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20101014014036.GE15286-MrY2KI0G/OVr83L8+7iqerDks+cytr/Z@public.gmane.org>
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

On Wed, Oct 13, 2010 at 07:40:36PM -0600, Grant Likely wrote:
> On Thu, Oct 14, 2010 at 11:38:33AM +1100, David Gibson wrote:
> > On Wed, Oct 13, 2010 at 05:17:47PM -0600, Grant Likely wrote:
> > > On Tue, Oct 12, 2010 at 02:56:01PM -0700, John Bonesio wrote:
[snip]
> > > > Proposal:
> > > > 
> > > > 1) Add a new keyword constant for property values, <Undefined>.
> > > 
> > > Personally, I'd prefer all lowercase: <undefined>.  There may be some
> > > dickering over the exact keyword name, but I think the concept is
> > > sound.
> > 
> > It should be /undefined/ to match existing keywords.  Or possibly
> > /delete/ or /remove-property/ or some such.  As Grant says there is
> > some dickering to be done there.
> 
> ah, of course.  I missed that.  <...> already has a meaning in dts
> syntax, so that should definitely be avoided.  /.../ it is.
> 
> > > > 	B) /replace/
> > > 
> > > /replace-node/ perhaps?
> > 
> > There is no need for this.  It's equivalent to a /remove/ then an
> > /extend/, which is barely more verbose.
> 
> Need to flush this out.  What would this look like then?  This?
> 
> &some-node {
> 	node-to-remove /remove/;
> 
> 	node-to-replace /remove/;
> 	node-to-replace { prop = "blah"; };
> };
> 
> I don't like this one because it implies ordering between the first
> and second 'node-to-replace' definitions, and to this point the syntax
> has not imposed any order assumptions.

Hrm.  Well, more precisely I was thinking of:

&{/some/node} /remove/;

&{/some/node} {
	new-contents;
};

Since I thought the original proposal was that these node /replace/,
/extend/ whatnot were only valid at the top level (for the reasons
we've discussed on previous occasions).  We do already have ordering
amongst the top level items, since the last one wins.  Now, if using
labels rather than full paths it does get a bit curlier on the
implementation side.  But I don't think it would be that hard to make
labels stick around attached to a path, even when the path itself is
removed.

> Perhaps this:
> 
> &some-node {
> 	node-to-remove /remove/;
> 	node-to-replace /remove/ { prop = "blah"; };
> };
> 
> Here the keyword essentially becomes a flag to drop the previous
> definition of the node with the option to also provide a replacement
> defintion.  I like this better, and the (lack of) ordering assumptions
> are preserved.

Urg.  I think that is confusing for much the same reasons John Bonesio
states in his later mail.  But, I can see a case for:

	node-to-replace /replace/ { prop = "blah"; };

and allowing removal with:

	node-to-replace /replace/ /undefined/;

So instead of substituting "remove+extend" for replace, we substitute
"replace with nothing" for remove.  Either way we remove one syntactic
element.  Have to think more about which I prefer.

> How then would it look when compared with removing properties?
> 
> &some-node {
> 	property-to-remove = /remove/;
> 	property-to-replace = "new value";
> 	property-to-replace-with-empty-prop;
> 
> 	node-to-remove /remove/;
> 	node-to-replace /remove/ { prop = "blah"; };
> };
> 
> In this form, the only syntactic difference between removing
> properties and removing nodes is that removing properties has an '='
> token between them.  I think that this has the potential to be
> confusing to users, and probably a common source of defects.  That is
> part of why I like the idea of different keywords when dealing with
> nodes and properties.  What about this?
> 
> &some-node {
> 	property-to-remove /remove-prop/;
> 	property-to-replace = "new value";
> 	property-to-replace-with-empty-prop;
> 
> 	node-to-remove /remove-node/;
> 	node-to-replace /remove-node/ { prop = "blah"; };
> };
> 
> Or perhaps with the keyword preceding:
> 
> &some-node {
> 	/remove-prop/ property-to-remove;
> 	property-to-replace = "new value";
> 	property-to-replace-with-empty-prop;
> 
> 	/remove-node/ node-to-remove;
> 	/remove-node/ node-to-replace { prop = "blah"; };
> };


I prefer this last example to the two previous ones.

> And the following construct would be forbidden:
> 
> 	/remove-prop/ property-to-remove = "new value;
> 
> 
> Also, /remove-node/ feels awkward when working with replacing a node.
> Would /clear-node/ or /trim-node/ be better?  '/replace-node/'

/clear-node/ suggests to me that it would leave the node in place,
just removing subnodes and properties.  /trim-node/ might work.

> wouldn't be very because it doesn't make sense in the removal case,
> and /delete-node/ has the same problem as /remove-node/.
> /undefine-node/ as you suggested has possibilities too.  Anyone have
> other suggestions for intuitive keyword names?

Well.. the "try not to surprise C programmers" rule of thumb has
served us well so far for dtc, so /undef-node/ has some merit.  In
principle I'd kind of like to use just preceding /undef/ for both, but
that will cause some parsing problems.

[snip]
> > > I've thought about this too, and I'd like to implement it, but there
> > > are some nasty gotchas here because /.../ is already used as the
> > > keyword delimiter.  There would need to be a way to ensure the grammer
> > > is unambiguous about which are keywords and which are node names.
> > 
> > Yeah.  But I think there's an obvious way to fix it.  We already have
> > a full-path reference syntax we can use for inserting phandles.  So I
> > think we should make the syntax here:
> > 
> > &{/full/path/to/node} {
> > 	property-to-override = "something";
> > };
> 
> True.  That would work.  And I like the reuse of existing syntax
> elements.
> 
> > 
> > Or of course you can already do
> > 
> > / {
> > 	full {
> > 		path {
> > 			to {
> > 				node {
> > 					etc.
> 
> Right.
> 
> > > On that line, it might also be possible to specify a node by both
> > > label and path:
> > 
> > Well, this is sort of already possible:
> > 
> > &soc {
> > 	serial@2600 {
> > 		current-speed = <115200>;
> > 	};
> > };
> > 
> > Directly allowing a label+relative path could be useful enough to
> > reduce verbosity, but it will require careful thinking about the
> > syntax.
> 
> Yes, (as discussed previously) this is just syntactic sugar.  The
> syntax already supports the functionality, but it would be nice to be
> less verbose.

Right, but I think that can wait until after we've decided and
implemented on the core functionality.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
