From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: Proposal: new device-tree syntax and semantics for extending
	information from included dts files
Date: Wed, 13 Oct 2010 17:17:47 -0600
Message-ID: <20101013231747.GD15286@angua.secretlab.ca>
References: <1286920561.4535.1315.camel@riker>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1286920561.4535.1315.camel@riker>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: John Bonesio <bones-RkXMcIGFT/TR7s880joybQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Oct 12, 2010 at 02:56:01PM -0700, John Bonesio wrote:
> Objective:
> The primary problem is that the same information gets repeated in
> various dts file that describe variations on the same base SOC. The
> information becomes redundant and when changes to the device tree
> syntax is made, extra work is necessary to update the same
> information in multiple files.

Thanks John.  Some comments below, but a reasonable proposal.  Next
you need to post the proposal to the devicetree-discuss list and cc:
David Gibson, Jon Loeliger and me.

... actually, this discussion is important enough that I don't want to
send this reply without David and Jon seeing it; otherwise we just end
up repeating the same rationals over again.  I'm going to cc the
list right now.

> 
> A solution needs to allow:
> a) nodes to be updated
> b) nodes to be overridden
> c) nodes to be removed
> d) properties to be overridden
> e) properties to be removed
> 
> Overview:
> The main thrust of this proposal is to suggest an overlay system
> where existing device tree nodes can be modified by dts statements
> later on in the "file". The "file" is defined as a file in memory
> after all /include/ statements have been processed.
> 
> Much of the functionality described in this proposal is already
> present in a test version of the device tree compiler (dtc). This
> proposal describes

s/test/unreleased/

> the functionality in it's entirety so that the changed parts can be
> viewed in light of the whole. This proposal suggests extensions, and
> might inadvertently suggest small modifications to this existing
> functionality.
> 
> The main idea of this proposal suggests that when duplicate nodes are
> encountered, later nodes seen by the compiler will update or in some way
> modify the node already encountered.
> 
> This proposal suggest that there be 3 ways in which an existing node
> can be modified. The node can be merged with the new information, it
> can be superseded by the new information, or it can be deleted. The
> method used would be defined by a new directive.
> 
> This proposal recommends that properties are not updated directly but
> that this overlay functionality only apply to nodes.

I'm not sure what you mean by this.  There will be situations when a
single property needs to be removed without affecting the rest of the
node contents (as you state in the requirements).

> 
> Proposal:
> 
> 1) Add a new keyword constant for property values, <Undefined>.

Personally, I'd prefer all lowercase: <undefined>.  There may be some
dickering over the exact keyword name, but I think the concept is
sound.

> 
> 	The constant means 'not defined'. If a property is assigned
> 	the value of <Undefined>, then it's as if the property was
> 	never defined. [Solves requirement (e)]

Ack.

> 
> 	Rationale:
> 		When we want to use /include/ and then modify or
> 		extend an existing base dts (.dtsi) file, using
> 		<Undefined> provides a clear indication to anyone
> 		reading the dts file that this property is being
> 		removed.  By using <Undefined> as a value, this syntax
> 		become a part of the device tree language rather than
> 		a command telling the compiler to do something.
> 
> 	Example:
> 		#size-cells = <Undefined>;
> 
> 2) Allow 3 directives for modifying existing nodes in the
> system: /extend/,
>    /replace/, /remove/
> 
> 	The test version of the dtc already provides the /extend/
> 	method of merging

s/test/unreleased/

> 	existing nodes. The version of the dtc may provide a way to
> 	extend properties as well, but this proposal suggest that
> 	individual properties should not be allowed to be updated.

Again, I'm not sure what you mean by not allowing properties to be
updated.  The current behaviour, which I think is sane, is that a
redefinition of a property will replace the value.

> 
> 	[Solves requirements (a-d)]
> 
> 	A) /extend/

"/extend-node/" is possibly a clearer naming to avoid confusion with
working with properties.

> 
> 	This is the default directive. When no directive is provided,
> 	it is assumed that /extend/ is to be used. If a node is
> 	described twice in the system, the second instance of the node
> 	merges with the first. If the second node has duplicate
> 	properties, the property in the last instance of the node is
> 	the value used.
> 
> 	Example:
> 		/ {
> 			...
> 			memory {
> 				device_type = "memory";
> 				reg = <0x00000000 0x04000000>;	// 64MB
> 			};
> 			...
> 
> 			memory /extend/ {
> 				reg = <0x00000000 0x08000000>;	// 128MB RAM
> 			}
> 
> 			memory {
> 				reg = <0x00000000 0x10000000>;	// 256MB RAM
> 			}
> 
> 		};

This example isn't correct.  In the current design, nodes will only
get merged at the top-level and the same node cannot be redefined
within the same top-level tree structure.  In essence, device tree
nodes are unordered sets of properties and child nodes.  Overriding
a node within the same tree has been explicitly avoided.  This example
should be:

	/ {
		...
		memory {
			device_type = "memory";
			reg = <0x00000000 0x04000000>;	// 64MB
		};
		...
	};

	/ {
		memory /extend/ {
			reg = <0x00000000 0x08000000>;	// 128MB RAM
		};
	};

	/ {
		memory {
			reg = <0x00000000 0x10000000>;	// 256MB RAM
		};
	};

Each subsequent tree is merged into the main tree before going on to
process the next one.

Or alternately:

	/ {
		...
		memorynode: memory {
			device_type = "memory";
			reg = <0x00000000 0x04000000>;	// 64MB
		};
		...
	};

	&memorynode {
		reg = <0x00000000 0x08000000>;	// 128MB RAM
	};

Which is a shortcut to a particular place in the tree

> 
> 		In this example, first the 2nd instance of the node,
> 		memory, is merged with the first with the /extend/
> 		directive. The reg property is overridden to 128MB.
> 		Then the 3rd instance of the node, memory, is also
> 		merged. The reg property is overridden to 256MB. In
> 		this second case, /extend/ is assumed since it is the
> 		default method of modifying an existing node.
> 
> 	B) /replace/

/replace-node/ perhaps?

> 
> 	This directive tells the device tree compiler to drop all
> 	existing properties from the node and replace them with the
> 	new node information.
> 
> 	Example:
> 		/ {
> 			soc: soc5200@f0000000 {
> 				#address-cells = <1>;
> 				#size-cells = <1>;
> 				compatible = "fsl,mpc5200b-immr";
> 				...
> 
> 				timer@600 {	// General Purpose Timer
> 					compatible = "fsl,mpc5200b-gpt","fsl,mpc5200-gpt";
> 					reg = <0x600 0x10>;
> 					interrupts = <1 9 0>;
> 					fsl,has-wdt;
> 				};
> 
> 				timer@600 /replace/ {	// General Purpose Timer
> 					compatible = "fsl,mpc5200-gpt";
> 					reg = <0x600 0x10>;
> 					interrupts = <1 15 0>;
> 					fsl,has-wdt;
> 				};
> 		};

Ditto on example needs to be fixed.

> 
> 		In this simple example, all of the properties are
> 		dropped from the first definition of 'timer' and are
> 		replaced by the second instance.  The second instance
> 		in this example, has different compatible and
> 		interrupts properties.

What about the child nodes?  Do they get dropped too (I think they
should)?

> 
> 	C) /remove/

/remove-node/?

> 
> 	This directive provides a simple clear method for removing nodes that
> 	were previously defined.
> 
> 	Exmaple:
> 		/ {
> 			soc: soc5200@f0000000 {
> 				#address-cells = <1>;
> 				#size-cells = <1>;
> 				compatible = "fsl,mpc5200b-immr";
> 				...
> 
> 				serial@2600 {		// PSC4
> 					compatible = "fsl,mpc5200b-psc-uart","fsl,mpc5200-psc-uart";
> 					reg = <0x2600 0x100>;
> 					interrupts = <2 11 0>;
> 				};
> 
> 				serial@2800 {		// PSC5
> 					compatible = "fsl,mpc5200b-psc-uart","fsl,mpc5200-psc-uart";
> 					reg = <0x2800 0x100>;
> 					interrupts = <2 12 0>;
> 				};
> 
> 
> 				serial@2600 /remove/ { };		// PSC4
> 
> 				serial@2800 /remove/ { };		// PSC5
> 		};

Ditto on fixing example.

I'm not thrilled with the example because it still shows the empty
braces which could be construed as the node still being present.  How
about this syntax instead:
	serial@2800 /remove-node/;

I also wonder if it would be better to have the directives before the
node name.  ie:
	/extend/ node1 { ... };
	/replace/ node1 { ... };
	/remove/ node1;

> 
> 		In this example, two serial devices are removed.
> 
> 	Rationale:
> 
> 		By specifying the method for combining, overriding, or
> 		removing nodes, it should be easy to understand what
> 		is taking place.  /extend/ allows new properties to be
> 		added, existing properties to be replaced, and
> 		existing properties to be removed if the <Undefined>
> 		value is used.
> 
> 		/replace/ provides a convenient way of substituting
> 		node properties without having to remove each property
> 		by name with the /extend/ directive.
>
> 		/remove/ allows a method a node to be removed
> 		completely. /replace/ with an empty property list
> 		could be used, but this leaves an empty node still
> 		being defined.
> 
> 		The reason that only nodes are to be modified by the
> 		overlay system is that updates to specific properties
> 		will likely be confusing to a reader, especially when
> 		labels are used (which will be the common case). By
> 		updating whole nodes, a reader can more easily figure
> 		out what information is being updated.
> 
> 		For example, one might have:
> 			&reg5 = <3 0 0x10000>;
> 		A reader might be wonder which reg is this, it might be updated to:
> 			&uart3_reg = <3 0 0x10000>;
> 
> 		At this point we might as well just specify the node:
> 			&uart3 /extends/ {
> 				reg = <3 0 0x10000>;
> 			};

Ah, yes. I see.  Yes, I don't at all want to reference properties by
label for purpose of overlays.  It must always be done from the node
context.

> 
> 3) Use labels to specify node updates.
> 	This functionality is already present in the test dtc. The
> 	idea is that nodes can be specified by their label rather than
> 	their full path.
> 
> 	Rationale:
> 		In some systems (in FPGAs in particular) a node might
> 		be located in different places in the device tree, but
> 		be the same basic node. In this instance, the base
> 		device tree can still be generated by the FPGA tools
> 		and the node can still be overridden by referring them
> 		with the label
> 
> 		In addition, it is just a lot nicer to be able to
> 		specify labels rather than having to specify the full
> 		path all over again.
> 
> 	Example:
> 		Here is the serial example again, but not inlined with labels:
> 
> 		/ {
> 			soc: soc5200@f0000000 {
> 				#address-cells = <1>;
> 				#size-cells = <1>;
> 				compatible = "fsl,mpc5200b-immr";
> 				...
> 
> 				psc4: serial@2600 {		// PSC4
> 					compatible = "fsl,mpc5200b-psc-uart","fsl,mpc5200-psc-uart";
> 					reg = <0x2600 0x100>;
> 					interrupts = <2 11 0>;
> 				};
> 
> 				psc5: serial@2800 {		// PSC5
> 					compatible = "fsl,mpc5200b-psc-uart","fsl,mpc5200-psc-uart";
> 					reg = <0x2800 0x100>;
> 					interrupts = <2 12 0>;
> 				};
> 		};
> 
> 		&psc4 /remove/ { };		// PSC4
> 		&psc5 /remove/ { };		// PSC5
> 
> 4) Allow full paths to be used to override nodes.
> 
> 	This suggest that labels aren't required. Most people will
> 	want to use labels, but for the device tree syntax to be
> 	orthogonal, full paths should still be allowed.
> 
> 	Example:
> 		Here is the serial example again. Not inlined with paths:
> 
> 		/ {
> 			soc: soc5200@f0000000 {
> 				#address-cells = <1>;
> 				#size-cells = <1>;
> 				compatible = "fsl,mpc5200b-immr";
> 				...
> 
> 				psc4: serial@2600 {		// PSC4
> 					compatible = "fsl,mpc5200b-psc-uart","fsl,mpc5200-psc-uart";
> 					reg = <0x2600 0x100>;
> 					interrupts = <2 11 0>;
> 				};
> 
> 				psc5: serial@2800 {		// PSC5
> 					compatible = "fsl,mpc5200b-psc-uart","fsl,mpc5200-psc-uart";
> 					reg = <0x2800 0x100>;
> 					interrupts = <2 12 0>;
> 				};
> 		};
> 
> 		/soc5200@f0000000/serial@2600 /remove/ { };		// PSC4
> 		/soc5200@f0000000/serial@2800 /remove/ { };		// PSC5

I've thought about this too, and I'd like to implement it, but there
are some nasty gotchas here because /.../ is already used as the
keyword delimiter.  There would need to be a way to ensure the grammer
is unambiguous about which are keywords and which are node names.

On that line, it might also be possible to specify a node by both
label and path:

	/ {
		soc: soc5200@f0000000 {
			#address-cells = <1>;
			#size-cells = <1>;
			compatible = "fsl,mpc5200b-immr";
			...

			psc4: serial@2600 {		// PSC4
				compatible = "fsl,mpc5200b-psc-uart","fsl,mpc5200-psc-uart";
				reg = <0x2600 0x100>;
				interrupts = <2 11 0>;
			};

			psc5: serial@2800 {		// PSC5
				compatible = "fsl,mpc5200b-psc-uart","fsl,mpc5200-psc-uart";
				reg = <0x2800 0x100>;
				interrupts = <2 12 0>;
			};
	};

	&soc/serial@2600 { current-speed = <115200>; };
	&soc/serial@2800 /remove-node/;

g.
