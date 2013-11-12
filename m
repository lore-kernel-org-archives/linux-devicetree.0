From: Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
Subject: Re: [PATCH] dtc: Dynamic symbols & fixup support (v2)
Date: Tue, 12 Nov 2013 11:20:04 +0100
Message-ID: <DABC2A65-BC07-4481-B80C-A62777BD8732@antoniou-consulting.com>
References: <1383073266-12017-1-git-send-email-panto@antoniou-consulting.com> <20131111175604.ECF33C4233A@trevor.secretlab.ca>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131111175604.ECF33C4233A-WNowdnHR2B42iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Koen Kooi <koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org>, Pantelis-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Grant,

On Nov 11, 2013, at 6:56 PM, Grant Likely wrote:

> On Tue, 29 Oct 2013 21:01:06 +0200, Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org> wrote:
>> Enable the generation of symbol & fixup information for
>> usage with dynamic DT loading.
>> 
>> Passing the -@ option generates a __symbols__ node at the
>> root node of the resulting blob for any node labels used.
>> 
>> When using the /plugin/ tag all unresolved label references
>> be tracked in the __fixups__ node, while all local phandle
>> references will the tracked in the __local_fixups__ node.
>> 
>> This is sufficient to implement a dynamic DT object loader.
>> 
>> Changes since v1:
>> 
>> * Forward ported to 1.4 version
>> * Added manual entries for the -@ option
>> 
>> Signed-off-by: Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
> 
> Hi Pantelis,
> 
> This looks pretty good on first look. Comments below.
> 
>> ---
>> Documentation/dt-object-internal.txt | 295 +++++++++++++++++++++++++++++++++++
>> Documentation/manual.txt             |  10 ++

[snip]

>> +-----------------------------------------
>> +
>> +Since the device tree is used for booting a number of very different hardware
>> +platforms it is imperative that we tread very carefully.
>> +
>> +2.a) No changes to the Device Tree binary format. We cannot modify the tree
>> +format at all and all the information we require should be encoded using device
>> +tree itself. We can add nodes that can be safely ignored by both bootloaders and
>> +the kernel.
> 
> Not /entirely/ true. It would be completely fine to bump up the binary
> format version for the overlays since they will never be loaded
> standalone. If there are specific things that you would like to have in
> the marshalled format then go ahead and propose them. Then the overlay
> would use the new protocol version, but the base tree would use the
> existing one.

OK, I see. I am very hesitant to bump the format version, because both the
base DTS and the overlay need to be compiled with symbol support.
We can bump the version format for the overlay fragment, but bumping the
version for the base DTS will affect bootloaders badly.

> 
>> +
>> +2.b) Changes to the DTS source format should be absolutely minimal, and should
>> +only be needed for the DT fragment definitions, and not the base boot DT.
>> +

[snip]
>> +	};
>> +	__fixups__ {
>> +		res = "/fragment@0:target:0";
>> +		ocp = "/fragment@1:target:0";
> 
> What happens when multiple phandles in the overlay reference the same
> node? This could result in a lot of strings for fixup references.
> 

Yes. 

>> +	};
>> +	__local_fixups__ {
>> +		fixup = </fragment@1/__overlay__/baz:res:0>;
> 
> Ditto here, I'm a little concerned that a ton of strings will end up in
> this node.
> 

Same.

FWIW, it's a few bytes; to get to a waste of a K that's going to take
an overlay much more complex that I'm familiar with.

Maybe the FGPA guys can share about their cases and how long their strings
get.

>> +	};
> 
> Another way to do this would be to not fixup the tree at all but instead
> have a translation node and get Linux to keep track of which overlay a
> node is a part of. Each overlay would have it's own set of phandle
> translators. It /might/ result in simpler code on the OS implementation
> side, particularly since all phandle resolutions should go through
> of_find_node_by_phandle(). Doing so would mean all the above tree might
> look something like:
> 

> / {
> 	... /* properties */
> 	fragment@0 {
> 		target = <0x3>;
> 		__overlay__ {
> 			res_baz {
> 				....
> 				linux,phandle = <0x00000001>;
> 				phandle = <0x00000001>;
> 			};
> 		};
> 	};
> 	fragment@1 {
> 		target = <0x4>;
> 		__overlay__ {
> 			baz {
> 				compatible = "corp,baz";
> 				... /* various properties and child nodes */
> 				res=<0x00000001>;
> 			}
> 		};
> 	};
> 	__external_refs__ {
> 		res = 0x3;
> 		ocp = 0x4;
> 	};
> };
> 
> Where the phandles within the tree are entirely self-consistent, and
> external phandles are translated through the __external_refs__ node to
> decode the phandle in the parent tree.
> 
> I'm not trying to force you down this path, but I'd like to know if you considered
> other approaches such as this.
> 

It can be made to work, but I can't tell at a glance all the possible problems
that can crop up. It is much trickier that the current implementation.

> (Besides, there are a couple of unresolved items with my suggestion. It
> is potentially problematic for kexec or anything else that reads the
> tree from userspace. The phandle domains would need to be exposed via
> sysfs/procfs. It also wouldn't be suitable for merging the tree at
> runtime by firmware before passing to the kernel).
> 

See above: It can be made to work, and the gain will be a few hundred bytes
savings in blob size.

Whether this is worth it? IMHO no, not at this point.

We can tackle this as part of the next blob version update perhaps?

>> +};
>> +
>> +This is similar to the bar case, but the reference of a local label by the
>> +baz node generates a __local_fixups__ entry that records the place that the
>> +local reference is being made. Since phandles are allocated starting at 1
>> +the run time loader must apply an offset to each phandle in every dynamic
>> +DT object loaded. The __local_fixups__ node records the place of every
>> +local reference so that the loader can apply the offset.
>> diff --git a/Documentation/manual.txt b/Documentation/manual.txt
>> index 65c8540..9b4d329 100644
>> --- a/Documentation/manual.txt
>> +++ b/Documentation/manual.txt
>> @@ -121,6 +121,14 @@ Options:
>> 	Make space for <number> reserve map entries
>> 	Relevant for dtb and asm output only.
>> 
>> +    -@
>> +        Generates a __symbols__ node at the root node of the resulting blob
>> +	for any node labels used.
>> +
>> +	When using the /plugin/ tag all unresolved label references
>> +	be tracked in the __fixups__ node, while all local phandle
>> +	references will the tracked in the __local_fixups__ node.
>> +
> 
> I'm just curious: why did you choose '@'?
> 

Non-letter, and @=at. Symbols point _at_ something. Corny I know.

> Overall the approach looks sane to me. I need to read through the
> kernel patches now. I'll probably think of other things when I do.
> 
> Acked-in-principle-by: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> 

Thanks.

> g.

Regards

-- Pantelis

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
