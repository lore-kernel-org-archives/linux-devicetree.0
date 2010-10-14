From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: Proposal: new device-tree syntax and semantics for extending
	information from included dts files
Date: Thu, 14 Oct 2010 11:38:33 +1100
Message-ID: <20101014003833.GB4456@yookeroo>
References: <1286920561.4535.1315.camel@riker>
	<20101013231747.GD15286@angua.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20101013231747.GD15286-MrY2KI0G/OVr83L8+7iqerDks+cytr/Z@public.gmane.org>
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

On Wed, Oct 13, 2010 at 05:17:47PM -0600, Grant Likely wrote:
> On Tue, Oct 12, 2010 at 02:56:01PM -0700, John Bonesio wrote:
> > Objective:
> > The primary problem is that the same information gets repeated in
> > various dts file that describe variations on the same base SOC. The
> > information becomes redundant and when changes to the device tree
> > syntax is made, extra work is necessary to update the same
> > information in multiple files.
> 
> Thanks John.  Some comments below, but a reasonable proposal.  Next
> you need to post the proposal to the devicetree-discuss list and cc:
> David Gibson, Jon Loeliger and me.
> 
> ... actually, this discussion is important enough that I don't want to
> send this reply without David and Jon seeing it; otherwise we just end
> up repeating the same rationals over again.  I'm going to cc the
> list right now.

Excellent :)

> > A solution needs to allow:
> > a) nodes to be updated
> > b) nodes to be overridden
> > c) nodes to be removed
> > d) properties to be overridden
> > e) properties to be removed
> > 
> > Overview:
> > The main thrust of this proposal is to suggest an overlay system
> > where existing device tree nodes can be modified by dts statements
> > later on in the "file". The "file" is defined as a file in memory
> > after all /include/ statements have been processed.

Um, I know what you mean, but the wording is incorrect on a
technicality - parsing and include processing are done at the same
time, so the full include-expanded "file" never exists as a whole in
memory, only conceptually.

> > Much of the functionality described in this proposal is already
> > present in a test version of the device tree compiler (dtc). This
> > proposal describes
> 
> s/test/unreleased/

Do you mean you have a test branch of your own, or do you mean the
partial overlay functionality that's already upstream?

Note that "released" is a somewhat fuzzy concept for dtc.  The overlay
code is not released in the sense that we haven't made a new version
number and tarball since it went in.  However, neither Jon nor I have
been particularly active about tagging and rolling up "releases".  The
small scope of dtc along with good test coverage have meant that for a
long time now just about any random git snapshot has been entirely
usable and stable.

> > the functionality in it's entirety so that the changed parts can be
> > viewed in light of the whole. This proposal suggests extensions, and
> > might inadvertently suggest small modifications to this existing
> > functionality.
> > 
> > The main idea of this proposal suggests that when duplicate nodes are
> > encountered, later nodes seen by the compiler will update or in some way
> > modify the node already encountered.
> > 
> > This proposal suggest that there be 3 ways in which an existing node
> > can be modified. The node can be merged with the new information, it
> > can be superseded by the new information, or it can be deleted. The
> > method used would be defined by a new directive.
> > 
> > This proposal recommends that properties are not updated directly but
> > that this overlay functionality only apply to nodes.
> 
> I'm not sure what you mean by this.  There will be situations when a
> single property needs to be removed without affecting the rest of the
> node contents (as you state in the requirements).

Yeah, the explanation you have below makes sense, but this wording is
confusing.

> > Proposal:
> > 
> > 1) Add a new keyword constant for property values, <Undefined>.
> 
> Personally, I'd prefer all lowercase: <undefined>.  There may be some
> dickering over the exact keyword name, but I think the concept is
> sound.

It should be /undefined/ to match existing keywords.  Or possibly
/delete/ or /remove-property/ or some such.  As Grant says there is
some dickering to be done there.

> > 	The constant means 'not defined'. If a property is assigned
> > 	the value of <Undefined>, then it's as if the property was
> > 	never defined. [Solves requirement (e)]
> 
> Ack.

Yes, this basic approach is also what I had in mind.

> > 	Rationale:
> > 		When we want to use /include/ and then modify or
> > 		extend an existing base dts (.dtsi) file, using
> > 		<Undefined> provides a clear indication to anyone
> > 		reading the dts file that this property is being
> > 		removed.  By using <Undefined> as a value, this syntax
> > 		become a part of the device tree language rather than
> > 		a command telling the compiler to do something.
> > 
> > 	Example:
> > 		#size-cells = <Undefined>;
> > 
> > 2) Allow 3 directives for modifying existing nodes in the
> > system: /extend/,
> >    /replace/, /remove/
> > 
> > 	The test version of the dtc already provides the /extend/
> > 	method of merging
> 
> s/test/unreleased/
> 
> > 	existing nodes. The version of the dtc may provide a way to
> > 	extend properties as well, but this proposal suggest that
> > 	individual properties should not be allowed to be updated.
> 
> Again, I'm not sure what you mean by not allowing properties to be
> updated.  The current behaviour, which I think is sane, is that a
> redefinition of a property will replace the value.
> 
> > 
> > 	[Solves requirements (a-d)]
> > 
> > 	A) /extend/
> 
> "/extend-node/" is possibly a clearer naming to avoid confusion with
> working with properties.

Better yet, since it is the default, just don't have the keyword at
all.  Upstream dtc already has "extend", adding an explicit keyword is
just extra syntax for no purpose.

> > 	This is the default directive. When no directive is provided,
> > 	it is assumed that /extend/ is to be used. If a node is
> > 	described twice in the system, the second instance of the node
> > 	merges with the first. If the second node has duplicate
> > 	properties, the property in the last instance of the node is
> > 	the value used.
> > 
> > 	Example:
> > 		/ {
> > 			...
> > 			memory {
> > 				device_type = "memory";
> > 				reg = <0x00000000 0x04000000>;	// 64MB
> > 			};
> > 			...
> > 
> > 			memory /extend/ {
> > 				reg = <0x00000000 0x08000000>;	// 128MB RAM
> > 			}
> > 
> > 			memory {
> > 				reg = <0x00000000 0x10000000>;	// 256MB RAM
> > 			}
> > 
> > 		};
> 
> This example isn't correct.  In the current design, nodes will only
> get merged at the top-level and the same node cannot be redefined
> within the same top-level tree structure.  In essence, device tree
> nodes are unordered sets of properties and child nodes.  Overriding
> a node within the same tree has been explicitly avoided.  This example
> should be:

What Grant said.

[snip]
> > 		In this example, first the 2nd instance of the node,
> > 		memory, is merged with the first with the /extend/
> > 		directive. The reg property is overridden to 128MB.
> > 		Then the 3rd instance of the node, memory, is also
> > 		merged. The reg property is overridden to 256MB. In
> > 		this second case, /extend/ is assumed since it is the
> > 		default method of modifying an existing node.
> > 
> > 	B) /replace/
> 
> /replace-node/ perhaps?

There is no need for this.  It's equivalent to a /remove/ then an
/extend/, which is barely more verbose.

[snip]
> > 	C) /remove/
> 
> /remove-node/?
> 
> > 	This directive provides a simple clear method for removing nodes that
> > 	were previously defined.
> > 
> > 	Exmaple:
> > 		/ {
> > 			soc: soc5200@f0000000 {
> > 				#address-cells = <1>;
> > 				#size-cells = <1>;
> > 				compatible = "fsl,mpc5200b-immr";
> > 				...
> > 
> > 				serial@2600 {		// PSC4
> > 					compatible = "fsl,mpc5200b-psc-uart","fsl,mpc5200-psc-uart";
> > 					reg = <0x2600 0x100>;
> > 					interrupts = <2 11 0>;
> > 				};
> > 
> > 				serial@2800 {		// PSC5
> > 					compatible = "fsl,mpc5200b-psc-uart","fsl,mpc5200-psc-uart";
> > 					reg = <0x2800 0x100>;
> > 					interrupts = <2 12 0>;
> > 				};
> > 
> > 
> > 				serial@2600 /remove/ { };		// PSC4
> > 
> > 				serial@2800 /remove/ { };		// PSC5
> > 		};
> 
> Ditto on fixing example.
> 
> I'm not thrilled with the example because it still shows the empty
> braces which could be construed as the node still being present.  How
> about this syntax instead:
> 	serial@2800 /remove-node/;

Absolutely, the braces should not be there on a remove.

> I also wonder if it would be better to have the directives before the
> node name.  ie:
> 	/extend/ node1 { ... };
> 	/replace/ node1 { ... };
> 	/remove/ node1;

Maybe, yes, although I think the first two should go away anyway.

Actually, how about:
	node1 /undefine/;

Using the same /undefine/ keyword as for removing individual
properties (but without the =).

[snip]
> > 4) Allow full paths to be used to override nodes.
> > 
> > 	This suggest that labels aren't required. Most people will
> > 	want to use labels, but for the device tree syntax to be
> > 	orthogonal, full paths should still be allowed.
> > 
> > 	Example:
> > 		Here is the serial example again. Not inlined with paths:
> > 
> > 		/ {
> > 			soc: soc5200@f0000000 {
> > 				#address-cells = <1>;
> > 				#size-cells = <1>;
> > 				compatible = "fsl,mpc5200b-immr";
> > 				...
> > 
> > 				psc4: serial@2600 {		// PSC4
> > 					compatible = "fsl,mpc5200b-psc-uart","fsl,mpc5200-psc-uart";
> > 					reg = <0x2600 0x100>;
> > 					interrupts = <2 11 0>;
> > 				};
> > 
> > 				psc5: serial@2800 {		// PSC5
> > 					compatible = "fsl,mpc5200b-psc-uart","fsl,mpc5200-psc-uart";
> > 					reg = <0x2800 0x100>;
> > 					interrupts = <2 12 0>;
> > 				};
> > 		};
> > 
> > 		/soc5200@f0000000/serial@2600 /remove/ { };		// PSC4
> > 		/soc5200@f0000000/serial@2800 /remove/ { };		// PSC5
> 
> I've thought about this too, and I'd like to implement it, but there
> are some nasty gotchas here because /.../ is already used as the
> keyword delimiter.  There would need to be a way to ensure the grammer
> is unambiguous about which are keywords and which are node names.

Yeah.  But I think there's an obvious way to fix it.  We already have
a full-path reference syntax we can use for inserting phandles.  So I
think we should make the syntax here:

&{/full/path/to/node} {
	property-to-override = "something";
};

Or of course you can already do

/ {
	full {
		path {
			to {
				node {
					etc.

> On that line, it might also be possible to specify a node by both
> label and path:

Well, this is sort of already possible:

&soc {
	serial@2600 {
		current-speed = <115200>;
	};
};

Directly allowing a label+relative path could be useful enough to
reduce verbosity, but it will require careful thinking about the
syntax.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
