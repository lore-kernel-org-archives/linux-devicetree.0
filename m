From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC] devicetree: new FDT format version
Date: Wed, 24 Jan 2018 16:27:10 -0800
Message-ID: <b5a72db1-45b2-f21f-9afd-0991b288840e@gmail.com>
References: <b96829f9-2e8b-fdc5-5090-58591e2260cf@gmail.com>
 <bc44f051-835d-1c8d-a928-be0fd4ef80b5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bc44f051-835d-1c8d-a928-be0fd4ef80b5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, "Pantelis Antomarek.vasut-Re5JQEeQqe/2sr8fMPgRzw@public.gmane.org" <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Kyle Evans <kevans-HZy0K5TPuP5AfugRpC6u6w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Alan Tull <atull-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 01/22/18 12:08, Frank Rowand wrote:
> + Alan Tull
> + Michael Ellerman
> 
> On 01/22/18 00:09, Frank Rowand wrote:
>> Hi All,
>>
>> I've tried to create a decent distribution list, but I'm sure I've missed
>> someone or some important list.  Please share this with anyone you think
>> will be affected.
>>
>> I have been playing around with some thoughts for some additions to
>> the devicetree FDT aka blob format.
>>
>> I would like to get the affected parties thinking about how additions to
>> the format could improve whichever pieces of FDT related technology you
>> work on or care about.  In my opinion, the FDT format should change
>> very infrequently because of the impact on so many projects that have
>> to work together to create a final solution, plus the many many users
>> of those projects.
>>
>> So I would like you guys to consider what I send out in a day or so,
>> but I don't want to preempt your creativity by laying out the details
>> of my proposal right now.
>>
>> I have not looked at how this would impact the devicetree compilers,
>> but I have hacked together a tool to convert existing blobs to the
>> new format.  The new format is backward compatible, but transforms
>> the overlay related metadata into separate blocks and removes the
>> metadata from nodes and properties.  My current proposal leaves
>> the fragment subtrees intact - it only transforms __symbols__,
>> __fixups__, and __local_fixups__.
>>
>> Some Advantages and disadvantages of my proposal are:

< snip >


Here are my current thoughts on a proposed update to the devicetree
Flattened Device Tree (FDT) aka blob format.

Version 18, FDT header:

   - Change version from 17 to 18.

   - last_comp_version remains 16.

   - Add field: u32 off_blocks

     This is the offset to a new block called "blocks".

   - Add field: u32 chained

     If non-zero, this indicates that an overlay FDT is concatenated
     to the end of this FDT.

     An alternative to adding this field would be to provide chaining
     information in some manner external to the FDT.  One advantage of
     using a data structure external to the FDT is that the information
     could include extra details such as how to relocate the overlay.
     For example the overlay could describe an add-on card, where the
     add-on card could be located in one of several slots.  For
     another example, there could be multiple instances of the add-on
     card and the same overlay could be relocated for each of those
     slots.

     The "chained" field does not preclude the use of an external
     data structure to provide additional information, such as
     relocations.

     This field shall be set to zero by the compiler, unless the
     compiler is creating a chain of FDTs.  This field would
     normally be set by a tools that assembles multiple FDTs
     into a block of chained FDTs.

     If "chained" is non-zero then the size of the FDT must provide
     the required alignment for a directly appended FDT.

     [[ The size/alignment intent is to simplify any tool that
     assembles a block of chained FDTs. ]]

   - Add field: u32 phandle_delta

     If non-zero, this indicates that phandle resolution has occurred
     on this FDT, and internal phandle references in properties have
     been incremented by this value.

     The intent of this field is for use when a running Linux kernel
     provides a chained FDT to kexec, which will in turn provide the
     chained FDT to a newly booting instance of the Linux kernel.  If
     the booting Linux kernel detects a non-zero phandle_delta then
     it should decrement the phandle references by this value and then
     perform phandle resolution again.

     Instead of adding this field to the FDT header, I prefer to add
     it to an external chaining information block.  If this field is
     in the FDT header, and the same FDT is applied for multiple
     connectors, then a separate FDT would need to be supplied for
     each instance of the overlay, because the delta would be different
     for each instance.  If the external chaining information block
     contained several sets of relocation information for the same
     FDT, then that relocation information would also contain the
     phandle_delta for that instance.

Version 17 has blocks:
   - mem_rsvmap
   - dt_struct
   - dt_strings

Version 18, add block:
   - blocks

     This block contains data about all blocks in the FDT, including
     the blocks that exist in version 17.  This means that the offsets
     and sizes of the version 17 blocks will exist in the FDT header
     and be duplicated in the "blocks" block.  Users of version 18 and
     above must use the information from the "blocks" block instead
     of from the FDT header.  Then after a few more version changes
     (say in 10 or 15 years), the offsets and sizes in FDT header (other
     than the offset of the "blocks" block) can be repurposed.

     The first field of "blocks" is the number of blocks described by
     "blocks".

     This field is followed by a tuple of offset and size for each of
     the blocks.

     A c representation of "blocks" is:

        struct fdt_blocks {
                u32     num_blocks;
                u32     blocks_off;
                u32     blocks_size;
                u32     csums_off;
                u32     csums_size;
                u32     dt_strings_off;
                u32     dt_strings_size;
                u32     dt_struct_off;
                u32     dt_struct_size;
                u32     ext_phandle_use_off;
                u32     ext_phandle_use_size;
                u32     int_phandle_use_off;
                u32     int_phandle_use_size;
                u32     mem_rsvmap_off;
                u32     mem_rsvmap_size;
                u32     symbols_off;
                u32     symbols_size;
                u32     validate_off;
                u32     validate_size;
        };

     The num_blocks field allows adding additional blocks without
     incrementing the FDT header version number.  Or the specification
     could require incrementing the version whenever a block is added.

     If the size field of a tuple is zero, then the block does not
     exist.

Version 18, add block:
   - csums

     Each tuple in this block contains one field, which is the
     checksum of the corresponding block.

     The tuples in this block are in the same order as the tuples
     in the "blocks" block.  This leads me to argue that the
     "blocks" block tuples be in a fixed order, not allowing
     tuples for non-existent blocks to be absent.

     Checksums are inspired by an old suggestion from Grant Likely.
     The intent was to allow a kernel to detect if a bootloader
     that did not understand the new version modified the FDT in
     a manner that corrupts version 18 data.

     According to dgibson, "Altering a blob and not downrevving it
     to the latest version you understand is definitely a bug".
     That give me some assurance that the problem being protected
     against should not exist.  On the other hand, the checksums
     do not take up a lot of space.  The specification should
     choose to either make the "csums" block required or make
     it optional.

Version 18, add block:
   - ext_phandle_use

     This is the information needed to describe locations within
     properties that contain the value of a phandle, where the
     reference phandle property is external to this FDT.

     The name could be changed to "external_phandle_use" for
     more clarity.

     The name change is intended to reflect "what the data is"
     instead of "what the consumer is supposed to do with the
     data".

     The ext_phandle_use block is analagous to the data in the
     __fixups__ node.

     Each entry in the "ext_phandle_use" block is a tuple of:

        u32 prop_value_offset
        u32 symbol_offset

     The prop_value_offset contains the offset within the "dt_struct"
     block of the location within a property value that contains a
     phandle value.

     The symbol_offset contains the offset within the "dt_strings"
     block that contains the name of the label corresponding to
     the node that contains the referenced phandle value, where the
     phandle value refers to a node in a different FDT.

     The value to place at prop_value_offset will be found in the
     "symbols" block of the FDT that contains the labeled node.

Version 18, add block:
   - int_phandle_use

     This is the information needed to describe locations within
     properties that contain the value of a phandle, where the
     reference phandle property is internal to this FDT.

     The name could be changed to "internal_phandle_use" for
     more clarity.

     The int_phandle_use block is analagous to the data in the
     __local_fixups__ node.

     The name change is intended to reflect "what the data is"
     instead of "what the consumer is supposed to do with the
     data".

     Each entry in the "ext_phandle_use" block is a single field of:

        u32 prop_value_offset

     The prop_value_offset contains the offset within the "dt_struct"
     block of the location within a property value that contains a
     phandle value, where the phandle value refers to a node in the
     same FDT.  The value of the phandle property in the referenced
     node is the same as the value located at prop_value_offset.

     The compiler shall create phandle property values in an increasing
     contigous range, beginning with one.  Exception: compiler created
     values will not duplicate phandle property values that are
     explicitly provided in the devicetree source file.

     The value to place at prop_value_offset is an implementation
     dependent value, where the value does not conflict with any
     phandle property values in the active devicetree.

     [[ for information only:  The Linux kernel creates the replacement
     value by adding a delta to all phandle properties in the FDT and
     all internal phandle references. ]]

Version 18, add block:
   - symbols

     This is the information that describes the values of the phandle
     properties in labeled nodes.

     The information in the FDT "symbols" block is used to resolve
     phandle references in an overlay when it is applied to the active
     devicetree.
     
     An overlay FDT may also contain a "symbols" block, which is used
     to resolve references in a subsequent overlay when it is applied
     to the active devicetree.

     Each entry in the "ext_phandle_use" block is a tuple of:

        u32 phandle_value
        u32 symbol_offset

     The phandle_value contains the value in this FDT of the phandle
     property in the labeled node whose label name is described by
     symbol_offset.

     The symbol_offset contains the offset within the "dt_strings"
     block that contains the name of the label corresponding to
     the node that contains the phandle value.

Version 18, add block:
   - validate

     This is the information that describes any validation of the
     FDT and/or the devicetree source that the FDT was created from.

     A c representation of "validate" is:

        u32     validation_done;
        u32     errors_count;
        u32     warnings_count;

     How the client program [[ eg kernel ]] uses the data is
     implementation dependent.

     I created these fields as a placeholder.  I would like the actual
     choice of fields to flow out of the current efforts to create
     devicetree validation tools.

     [[ for information only:  Some examples of what the Linux
     kernel could use this information for:
       - print a warning message if any warnings exist
       - print a warning message if any errors exist
       - taint the kernel if any errors exist
       - refuse to boot if any errors exist
     ]]

     One question I have is how to represent the base devicetree
     (or base devicetree plus one or more applied overlays)
     that this FDT was validated against when this FDT is
     an overlay FDT.

Version 18, add a footer field:
   - footer_magic

     This field allows detection of a partially completed FDT, where
     the FDT is created by a multi-pass tool.  The final action of
     such a tool is to set the value of this field.

     The value of this field shall be u32 0xeeeefeed.

     This field is located as the last u32 field in the FDT.  The FDT
     shall be zero padded as needed to provide proper alignment for
     this field.

The use of "dt_struct" block offsets and "dt_strings" block offsets is
intended to make phandle reference resolution easy and efficient when
an overlay is applied.

The downside to using block offsets is that if a boot program deletes
a property (by replacing the property entry in the "dt_struct" block
with NOPs), then the client program must be aware of the NOPs and
not attempt to overwrite a NOP with a phandle value.  I do not expect
this to be a significant complication.  The alternative to this
would be for the client program to have a policy (shared agreement
with the boot program) that no phandle values are allowed to be
deleted.  I think that this alternative is too restrictive, but
raise it as a possibility.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
