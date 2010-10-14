From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: Proposal: new device-tree syntax and semantics for extending
	information from included dts files
Date: Wed, 13 Oct 2010 19:40:36 -0600
Message-ID: <20101014014036.GE15286@angua.secretlab.ca>
References: <1286920561.4535.1315.camel@riker>
	<20101013231747.GD15286@angua.secretlab.ca>
	<20101014003833.GB4456@yookeroo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20101014003833.GB4456@yookeroo>
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

On Thu, Oct 14, 2010 at 11:38:33AM +1100, David Gibson wrote:
> On Wed, Oct 13, 2010 at 05:17:47PM -0600, Grant Likely wrote:
> > On Tue, Oct 12, 2010 at 02:56:01PM -0700, John Bonesio wrote:
> > > Objective:
> > > The primary problem is that the same information gets repeated in
> > > various dts file that describe variations on the same base SOC. The
> > > information becomes redundant and when changes to the device tree
> > > syntax is made, extra work is necessary to update the same
> > > information in multiple files.
> > 
> > Thanks John.  Some comments below, but a reasonable proposal.  Next
> > you need to post the proposal to the devicetree-discuss list and cc:
> > David Gibson, Jon Loeliger and me.
> > 
> > ... actually, this discussion is important enough that I don't want to
> > send this reply without David and Jon seeing it; otherwise we just end
> > up repeating the same rationals over again.  I'm going to cc the
> > list right now.
> 
> Excellent :)

:-D

> 
> > > A solution needs to allow:
> > > a) nodes to be updated
> > > b) nodes to be overridden
> > > c) nodes to be removed
> > > d) properties to be overridden
> > > e) properties to be removed
> > > 
> > > Overview:
> > > The main thrust of this proposal is to suggest an overlay system
> > > where existing device tree nodes can be modified by dts statements
> > > later on in the "file". The "file" is defined as a file in memory
> > > after all /include/ statements have been processed.
> 
> Um, I know what you mean, but the wording is incorrect on a
> technicality - parsing and include processing are done at the same
> time, so the full include-expanded "file" never exists as a whole in
> memory, only conceptually.
> 
> > > Much of the functionality described in this proposal is already
> > > present in a test version of the device tree compiler (dtc). This
> > > proposal describes
> > 
> > s/test/unreleased/
> 
> Do you mean you have a test branch of your own, or do you mean the
> partial overlay functionality that's already upstream?

We're talking about the already upstreamed bits.

> > > Proposal:
> > > 
> > > 1) Add a new keyword constant for property values, <Undefined>.
> > 
> > Personally, I'd prefer all lowercase: <undefined>.  There may be some
> > dickering over the exact keyword name, but I think the concept is
> > sound.
> 
> It should be /undefined/ to match existing keywords.  Or possibly
> /delete/ or /remove-property/ or some such.  As Grant says there is
> some dickering to be done there.

ah, of course.  I missed that.  <...> already has a meaning in dts
syntax, so that should definitely be avoided.  /.../ it is.

> > > 	B) /replace/
> > 
> > /replace-node/ perhaps?
> 
> There is no need for this.  It's equivalent to a /remove/ then an
> /extend/, which is barely more verbose.

Need to flush this out.  What would this look like then?  This?

&some-node {
	node-to-remove /remove/;

	node-to-replace /remove/;
	node-to-replace { prop = "blah"; };
};

I don't like this one because it implies ordering between the first
and second 'node-to-replace' definitions, and to this point the syntax
has not imposed any order assumptions.

Perhaps this:

&some-node {
	node-to-remove /remove/;
	node-to-replace /remove/ { prop = "blah"; };
};

Here the keyword essentially becomes a flag to drop the previous
definition of the node with the option to also provide a replacement
defintion.  I like this better, and the (lack of) ordering assumptions
are preserved.

How then would it look when compared with removing properties?

&some-node {
	property-to-remove = /remove/;
	property-to-replace = "new value";
	property-to-replace-with-empty-prop;

	node-to-remove /remove/;
	node-to-replace /remove/ { prop = "blah"; };
};

In this form, the only syntactic difference between removing
properties and removing nodes is that removing properties has an '='
token between them.  I think that this has the potential to be
confusing to users, and probably a common source of defects.  That is
part of why I like the idea of different keywords when dealing with
nodes and properties.  What about this?

&some-node {
	property-to-remove /remove-prop/;
	property-to-replace = "new value";
	property-to-replace-with-empty-prop;

	node-to-remove /remove-node/;
	node-to-replace /remove-node/ { prop = "blah"; };
};

Or perhaps with the keyword preceding:

&some-node {
	/remove-prop/ property-to-remove;
	property-to-replace = "new value";
	property-to-replace-with-empty-prop;

	/remove-node/ node-to-remove;
	/remove-node/ node-to-replace { prop = "blah"; };
};

And the following construct would be forbidden:

	/remove-prop/ property-to-remove = "new value;


Also, /remove-node/ feels awkward when working with replacing a node.
Would /clear-node/ or /trim-node/ be better?  '/replace-node/'
wouldn't be very because it doesn't make sense in the removal case,
and /delete-node/ has the same problem as /remove-node/.
/undefine-node/ as you suggested has possibilities too.  Anyone have
other suggestions for intuitive keyword names?

> > I also wonder if it would be better to have the directives before the
> > node name.  ie:
> > 	/extend/ node1 { ... };
> > 	/replace/ node1 { ... };
> > 	/remove/ node1;
> 
> Maybe, yes, although I think the first two should go away anyway.
> 
> Actually, how about:
> 	node1 /undefine/;
> 
> Using the same /undefine/ keyword as for removing individual
> properties (but without the =).

See discussion above.  :-)

> 
> [snip]
> > > 4) Allow full paths to be used to override nodes.
> > > 
> > > 	This suggest that labels aren't required. Most people will
> > > 	want to use labels, but for the device tree syntax to be
> > > 	orthogonal, full paths should still be allowed.
> > > 
> > > 	Example:
> > > 		Here is the serial example again. Not inlined with paths:
> > > 
> > > 		/ {
> > > 			soc: soc5200@f0000000 {
> > > 				#address-cells = <1>;
> > > 				#size-cells = <1>;
> > > 				compatible = "fsl,mpc5200b-immr";
> > > 				...
> > > 
> > > 				psc4: serial@2600 {		// PSC4
> > > 					compatible = "fsl,mpc5200b-psc-uart","fsl,mpc5200-psc-uart";
> > > 					reg = <0x2600 0x100>;
> > > 					interrupts = <2 11 0>;
> > > 				};
> > > 
> > > 				psc5: serial@2800 {		// PSC5
> > > 					compatible = "fsl,mpc5200b-psc-uart","fsl,mpc5200-psc-uart";
> > > 					reg = <0x2800 0x100>;
> > > 					interrupts = <2 12 0>;
> > > 				};
> > > 		};
> > > 
> > > 		/soc5200@f0000000/serial@2600 /remove/ { };		// PSC4
> > > 		/soc5200@f0000000/serial@2800 /remove/ { };		// PSC5
> > 
> > I've thought about this too, and I'd like to implement it, but there
> > are some nasty gotchas here because /.../ is already used as the
> > keyword delimiter.  There would need to be a way to ensure the grammer
> > is unambiguous about which are keywords and which are node names.
> 
> Yeah.  But I think there's an obvious way to fix it.  We already have
> a full-path reference syntax we can use for inserting phandles.  So I
> think we should make the syntax here:
> 
> &{/full/path/to/node} {
> 	property-to-override = "something";
> };

True.  That would work.  And I like the reuse of existing syntax
elements.

> 
> Or of course you can already do
> 
> / {
> 	full {
> 		path {
> 			to {
> 				node {
> 					etc.

Right.

> > On that line, it might also be possible to specify a node by both
> > label and path:
> 
> Well, this is sort of already possible:
> 
> &soc {
> 	serial@2600 {
> 		current-speed = <115200>;
> 	};
> };
> 
> Directly allowing a label+relative path could be useful enough to
> reduce verbosity, but it will require careful thinking about the
> syntax.

Yes, (as discussed previously) this is just syntactic sugar.  The
syntax already supports the functionality, but it would be nice to be
less verbose.

g.
