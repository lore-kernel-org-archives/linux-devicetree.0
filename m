From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] dtc: Dynamic symbols & fixup support (v2)
Date: Mon, 11 Nov 2013 17:56:04 +0000
Message-ID: <20131111175604.ECF33C4233A@trevor.secretlab.ca>
References: <1383073266-12017-1-git-send-email-panto@antoniou-consulting.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1383073266-12017-1-git-send-email-panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Koen Kooi <koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org>, Pantelis-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 29 Oct 2013 21:01:06 +0200, Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org> wrote:
> Enable the generation of symbol & fixup information for
> usage with dynamic DT loading.
> 
> Passing the -@ option generates a __symbols__ node at the
> root node of the resulting blob for any node labels used.
> 
> When using the /plugin/ tag all unresolved label references
> be tracked in the __fixups__ node, while all local phandle
> references will the tracked in the __local_fixups__ node.
> 
> This is sufficient to implement a dynamic DT object loader.
> 
> Changes since v1:
> 
> * Forward ported to 1.4 version
> * Added manual entries for the -@ option
> 
> Signed-off-by: Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>

Hi Pantelis,

This looks pretty good on first look. Comments below.

> ---
>  Documentation/dt-object-internal.txt | 295 +++++++++++++++++++++++++++++++++++
>  Documentation/manual.txt             |  10 ++
>  checks.c                             | 120 +++++++++++++-
>  dtc-lexer.l                          |   5 +
>  dtc-parser.y                         |  23 ++-
>  dtc.c                                |   9 +-
>  dtc.h                                |  38 +++++
>  flattree.c                           | 139 +++++++++++++++++
>  8 files changed, 630 insertions(+), 9 deletions(-)
>  create mode 100644 Documentation/dt-object-internal.txt
> 
> diff --git a/Documentation/dt-object-internal.txt b/Documentation/dt-object-internal.txt
> new file mode 100644
> index 0000000..eb5d4c0
> --- /dev/null
> +++ b/Documentation/dt-object-internal.txt
> @@ -0,0 +1,295 @@
> +Device Tree Dynamic Object format internals
> +-------------------------------------------
> +
> +The Device Tree for most platforms is a static representation of
> +the hardware capabilities. This is insufficient for many platforms
> +that need to dynamically insert device tree fragments to the
> +running kernel's live tree.
> +
> +This document explains the the device tree object format and the
> +modifications made to the device tree compiler, which make it possible.
> +
> +1. Simplified Problem Definition
> +--------------------------------
> +
> +Assume we have a platform which boots using following simplified device tree.
> +
> +---- foo.dts -----------------------------------------------------------------
> +	/* FOO platform */
> +	/ {
> +		compatible = "corp,foo";
> +
> +		/* shared resources */
> +		res: res {
> +		};
> +
> +		/* On chip peripherals */
> +		ocp: ocp {
> +			/* peripherals that are always instantiated */
> +			peripheral1 { ... };
> +		}
> +	};
> +---- foo.dts -----------------------------------------------------------------
> +
> +We have a number of peripherals that after probing (using some undefined method)
> +should result in different device tree configuration.
> +
> +We cannot boot with this static tree because due to the configuration of the
> +foo platform there exist multiple conficting peripherals DT fragments.
> +
> +So for the bar peripheral we would have this:
> +
> +---- foo+bar.dts -------------------------------------------------------------
> +	/* FOO platform + bar peripheral */
> +	/ {
> +		compatible = "corp,foo";
> +
> +		/* shared resources */
> +		res: res {
> +		};
> +
> +		/* On chip peripherals */
> +		ocp: ocp {
> +			/* peripherals that are always instantiated */
> +			peripheral1 { ... };
> +
> +			/* bar peripheral */
> +			bar {
> +				compatible = "corp,bar";
> +				... /* various properties and child nodes */
> +			}
> +		}
> +	};
> +---- foo+bar.dts -------------------------------------------------------------
> +
> +While for the baz peripheral we would have this:
> +
> +---- foo+baz.dts -------------------------------------------------------------
> +	/* FOO platform + baz peripheral */
> +	/ {
> +		compatible = "corp,foo";
> +
> +		/* shared resources */
> +		res: res {
> +			/* baz resources */
> +			baz_res: res_baz { ... };
> +		};
> +
> +		/* On chip peripherals */
> +		ocp: ocp {
> +			/* peripherals that are always instantiated */
> +			peripheral1 { ... };
> +
> +			/* baz peripheral */
> +			baz {
> +				compatible = "corp,baz";
> +				/* reference to another point in the tree */
> +				ref-to-res = <&baz_res>;
> +				... /* various properties and child nodes */
> +			}
> +		}
> +	};
> +---- foo+baz.dts -------------------------------------------------------------
> +
> +We note that the baz case is more complicated, since the baz peripheral needs to
> +reference another node in the DT tree.
> +
> +2. Device Tree Object Format Requirements
> +-----------------------------------------
> +
> +Since the device tree is used for booting a number of very different hardware
> +platforms it is imperative that we tread very carefully.
> +
> +2.a) No changes to the Device Tree binary format. We cannot modify the tree
> +format at all and all the information we require should be encoded using device
> +tree itself. We can add nodes that can be safely ignored by both bootloaders and
> +the kernel.

Not /entirely/ true. It would be completely fine to bump up the binary
format version for the overlays since they will never be loaded
standalone. If there are specific things that you would like to have in
the marshalled format then go ahead and propose them. Then the overlay
would use the new protocol version, but the base tree would use the
existing one.

> +
> +2.b) Changes to the DTS source format should be absolutely minimal, and should
> +only be needed for the DT fragment definitions, and not the base boot DT.
> +
> +2.c) An explicit option should be used to instruct DTC to generate the required
> +information needed for object resolution. Platforms that don't use the
> +dynamic object format can safely ignore it.
> +
> +2.d) Finally, DT syntax changes should be kept to a minimum. It should be
> +possible to express everything using the existing DT syntax.
> +
> +3. Implementation
> +-----------------
> +
> +The basic unit of addressing in Device Tree is the phandle. Turns out it's
> +relatively simple to extend the way phandles are generated and referenced
> +so that it's possible to dynamically convert symbolic references (labels)
> +to phandle values.
> +
> +We can roughly divide the operation into two steps.
> +
> +3.a) Compilation of the base board DTS file using the '-@' option
> +generates a valid DT blob with an added __symbols__ node at the root node,
> +containing a list of all nodes that are marked with a label.
> +
> +Using the foo.dts file above the following node will be generated;
> +
> +$ dtc -@ -O dtb -o foo.dtb -b 0 foo.dts
> +$ fdtdump foo.dtb
> +...
> +/ {
> +	...
> +	res {
> +		...
> +		linux,phandle = <0x00000001>;
> +		phandle = <0x00000001>;
> +		...
> +	};
> +	ocp {
> +		...
> +		linux,phandle = <0x00000002>;
> +		phandle = <0x00000002>;
> +		...
> +	};
> +	__symbols__ {
> +		res="/res";
> +		ocp="/ocp";
> +	};
> +};
> +
> +Notice that all the nodes that had a label have been recorded, and that
> +phandles have been generated for them.
> +
> +This blob can be used to boot the board normally, the __symbols__ node will
> +be safely ignored both by the bootloader and the kernel (the only loss will
> +be a few bytes of memory and disk space).
> +
> +3.b) The Device Tree fragments must be compiled with the same option but they
> +must also have a tag (/plugin/) that allows undefined references to labels
> +that are not present at compilation time to be recorded so that the runtime
> +loader can fix them.
> +
> +So the bar peripheral's DTS format would be of the form:
> +
> +/plugin/;	/* allow undefined label references and record them */
> +/ {
> +	....	/* various properties for loader use; i.e. part id etc. */
> +	fragment@0 {
> +		target = <&ocp>;
> +		__overlay__ {
> +			/* bar peripheral */
> +			bar {
> +				compatible = "corp,bar";
> +				... /* various properties and child nodes */
> +			}
> +		};
> +	};
> +};
> +
> +Note that there's a target property that specifies the location where the
> +contents of the overlay node will be placed, and it references the label
> +in the foo.dts file.
> +
> +$ dtc -@ -O dtb -o bar.dtbo -b 0 bar.dts
> +$ fdtdump bar.dtbo
> +...
> +/ {
> +	... /* properties */
> +	fragment@0 {
> +		target = <0xdeadbeef>;
> +		__overlay__ {
> +			bar {
> +				compatible = "corp,bar";
> +				... /* various properties and child nodes */
> +			}
> +		};
> +	};
> +	__fixups__ {
> +	    ocp = "/fragment@0:target:0";
> +	};
> +};
> +
> +No __symbols__ has been generated (no label in bar.dts).
> +Note that the target's ocp label is undefined, so the phandle handle
> +value is filled with the illegal value '0xdeadbeef', while a __fixups__
> +node has been generated, which marks the location in the tree where
> +the label lookup should store the runtime phandle value of the ocp node.
> +
> +The format of the __fixups__ node entry is
> +
> +	<label> = "<local-full-path>:<property-name>:<offset>";
> +
> +<label> 		Is the label we're referring
> +<local-full-path>	Is the full path of the node the reference is
> +<property-name>		Is the name of the property containing the
> +			reference
> +<offset>		The offset (in bytes) of where the property's
> +			phandle value is located.
> +
> +Doing the same with the baz peripheral's DTS format is a little bit more
> +involved, since baz contains references to local labels which require
> +local fixups.
> +
> +/plugin/;	/* allow undefined label references and record them */
> +/ {
> +	....	/* various properties for loader use; i.e. part id etc. */
> +	fragment@0 {
> +		target = <&res>;
> +		__overlay__ {
> +			/* baz resources */
> +			baz_res: res_baz { ... };
> +		};
> +	};
> +	fragment@1 {
> +		target = <&ocp>;
> +		__overlay__ {
> +			/* baz peripheral */
> +			baz {
> +				compatible = "corp,baz";
> +				/* reference to another point in the tree */
> +				ref-to-res = <&baz_res>;
> +				... /* various properties and child nodes */
> +			}
> +		};
> +	};
> +};
> +
> +Note that &bar_res reference.
> +
> +$ dtc -@ -O dtb -o baz.dtbo -b 0 baz.dts
> +$ fdtdump baz.dtbo
> +...
> +/ {
> +	... /* properties */
> +	fragment@0 {
> +		target = <0xdeadbeef>;
> +		__overlay__ {
> +			res_baz {
> +				....
> +				linux,phandle = <0x00000001>;
> +				phandle = <0x00000001>;
> +			};
> +		};
> +	};
> +	fragment@1 {
> +		target = <0xdeadbeef>;
> +		__overlay__ {
> +			baz {
> +				compatible = "corp,baz";
> +				... /* various properties and child nodes */
> +				res=<0x00000001>;
> +			}
> +		};
> +	};
> +	__fixups__ {
> +		res = "/fragment@0:target:0";
> +		ocp = "/fragment@1:target:0";

What happens when multiple phandles in the overlay reference the same
node? This could result in a lot of strings for fixup references.

> +	};
> +	__local_fixups__ {
> +		fixup = </fragment@1/__overlay__/baz:res:0>;

Ditto here, I'm a little concerned that a ton of strings will end up in
this node.

> +	};

Another way to do this would be to not fixup the tree at all but instead
have a translation node and get Linux to keep track of which overlay a
node is a part of. Each overlay would have it's own set of phandle
translators. It /might/ result in simpler code on the OS implementation
side, particularly since all phandle resolutions should go through
of_find_node_by_phandle(). Doing so would mean all the above tree might
look something like:

/ {
	... /* properties */
	fragment@0 {
		target = <0x3>;
		__overlay__ {
			res_baz {
				....
				linux,phandle = <0x00000001>;
				phandle = <0x00000001>;
			};
		};
	};
	fragment@1 {
		target = <0x4>;
		__overlay__ {
			baz {
				compatible = "corp,baz";
				... /* various properties and child nodes */
				res=<0x00000001>;
			}
		};
	};
	__external_refs__ {
		res = 0x3;
		ocp = 0x4;
	};
};

Where the phandles within the tree are entirely self-consistent, and
external phandles are translated through the __external_refs__ node to
decode the phandle in the parent tree.

I'm not trying to force you down this path, but I'd like to know if you considered
other approaches such as this.

(Besides, there are a couple of unresolved items with my suggestion. It
is potentially problematic for kexec or anything else that reads the
tree from userspace. The phandle domains would need to be exposed via
sysfs/procfs. It also wouldn't be suitable for merging the tree at
runtime by firmware before passing to the kernel).

> +};
> +
> +This is similar to the bar case, but the reference of a local label by the
> +baz node generates a __local_fixups__ entry that records the place that the
> +local reference is being made. Since phandles are allocated starting at 1
> +the run time loader must apply an offset to each phandle in every dynamic
> +DT object loaded. The __local_fixups__ node records the place of every
> +local reference so that the loader can apply the offset.
> diff --git a/Documentation/manual.txt b/Documentation/manual.txt
> index 65c8540..9b4d329 100644
> --- a/Documentation/manual.txt
> +++ b/Documentation/manual.txt
> @@ -121,6 +121,14 @@ Options:
>  	Make space for <number> reserve map entries
>  	Relevant for dtb and asm output only.
>  
> +    -@
> +        Generates a __symbols__ node at the root node of the resulting blob
> +	for any node labels used.
> +
> +	When using the /plugin/ tag all unresolved label references
> +	be tracked in the __fixups__ node, while all local phandle
> +	references will the tracked in the __local_fixups__ node.
> +

I'm just curious: why did you choose '@'?

Overall the approach looks sane to me. I need to read through the
kernel patches now. I'll probably think of other things when I do.

Acked-in-principle-by: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

g.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
