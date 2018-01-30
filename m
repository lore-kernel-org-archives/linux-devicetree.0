From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC] devicetree: new FDT format version
Date: Mon, 29 Jan 2018 17:29:06 -0800
Message-ID: <71a20901-dc43-cd13-19ab-0404cdeb49f8@gmail.com>
References: <b96829f9-2e8b-fdc5-5090-58591e2260cf@gmail.com>
 <bc44f051-835d-1c8d-a928-be0fd4ef80b5@gmail.com>
 <b5a72db1-45b2-f21f-9afd-0991b288840e@gmail.com>
 <20180127084831.GH2099@umbus>
 <2c352396-154e-ea75-c50b-0f2bfafd19da@gmail.com>
 <20180129105648.GG12900@umbus>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180129105648.GG12900@umbus>
Content-Language: en-US
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, "Pantelis Antomarek.vasut-Re5JQEeQqe/2sr8fMPgRzw@public.gmane.org" <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Kyle Evans <kevans-HZy0K5TPuP5AfugRpC6u6w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Alan Tull <atull-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 01/29/18 02:56, David Gibson wrote:
> On Mon, Jan 29, 2018 at 12:08:15AM -0800, Frank Rowand wrote:
>> On 01/27/18 00:48, David Gibson wrote:
>>> On Wed, Jan 24, 2018 at 04:27:10PM -0800, Frank Rowand wrote:
>>>> On 01/22/18 12:08, Frank Rowand wrote:
>>>>> + Alan Tull
>>>>> + Michael Ellerman
>>>>>
>>>>> On 01/22/18 00:09, Frank Rowand wrote:
>>>>>> Hi All,
>>>>>>
>>>>>> I've tried to create a decent distribution list, but I'm sure I've missed
>>>>>> someone or some important list.  Please share this with anyone you think
>>>>>> will be affected.
>>>>>>
>>>>>> I have been playing around with some thoughts for some additions to
>>>>>> the devicetree FDT aka blob format.
>>>>>>
>>>>>> I would like to get the affected parties thinking about how additions to
>>>>>> the format could improve whichever pieces of FDT related technology you
>>>>>> work on or care about.  In my opinion, the FDT format should change
>>>>>> very infrequently because of the impact on so many projects that have
>>>>>> to work together to create a final solution, plus the many many users
>>>>>> of those projects.
>>>>>>
>>>>>> So I would like you guys to consider what I send out in a day or so,
>>>>>> but I don't want to preempt your creativity by laying out the details
>>>>>> of my proposal right now.
>>>>>>
>>>>>> I have not looked at how this would impact the devicetree compilers,
>>>>>> but I have hacked together a tool to convert existing blobs to the
>>>>>> new format.  The new format is backward compatible, but transforms
>>>>>> the overlay related metadata into separate blocks and removes the
>>>>>> metadata from nodes and properties.  My current proposal leaves
>>>>>> the fragment subtrees intact - it only transforms __symbols__,
>>>>>> __fixups__, and __local_fixups__.
>>>>>>
>>>>>> Some Advantages and disadvantages of my proposal are:
>>>>
>>>> < snip >
>>>>
>>>>
>>>> Here are my current thoughts on a proposed update to the devicetree
>>>> Flattened Device Tree (FDT) aka blob format.
>>>>
>>>> Version 18, FDT header:
>>>>
>>>>    - Change version from 17 to 18.
>>>>
>>>>    - last_comp_version remains 16.
>>>
>>> Sure.
>>>
>>>>    - Add field: u32 off_blocks
>>>>
>>>>      This is the offset to a new block called "blocks".
>>>
>>> See later comments.
>>>
>>>>    - Add field: u32 chained
>>>>
>>>>      If non-zero, this indicates that an overlay FDT is concatenated
>>>>      to the end of this FDT.
>>>>
>>>>      An alternative to adding this field would be to provide chaining
>>>>      information in some manner external to the FDT.  One advantage of
>>>>      using a data structure external to the FDT is that the information
>>>>      could include extra details such as how to relocate the overlay.
>>>>      For example the overlay could describe an add-on card, where the
>>>>      add-on card could be located in one of several slots.  For
>>>>      another example, there could be multiple instances of the add-on
>>>>      card and the same overlay could be relocated for each of those
>>>>      slots.>>
>>>>      The "chained" field does not preclude the use of an external
>>>>      data structure to provide additional information, such as
>>>>      relocations.
>>>>
>>>>      This field shall be set to zero by the compiler, unless the
>>>>      compiler is creating a chain of FDTs.  This field would
>>>>      normally be set by a tools that assembles multiple FDTs
>>>>      into a block of chained FDTs.
>>>>
>>>>      If "chained" is non-zero then the size of the FDT must provide
>>>>      the required alignment for a directly appended FDT.
>>>>
>>>>      [[ The size/alignment intent is to simplify any tool that
>>>>      assembles a block of chained FDTs. ]]
>>
>> Spoiler alert:  almost everything I write in this reply becomes academic
>> if the format is instead changed to use FDT_EXTERNAL_PHANDLE and
>> FDT_INTERNAL_PHANDLE tags, as David suggests at the end of this email.
>>
>> The main thing that is not academic is that I agree there is not a
>> need for a blocks block - the new information can indeed just be
>> added to the header.
>>
>> I recommend jumping to the end of this email before reading anything
>> else that I wrote.
>>
>>
>>> I think this is a bad idea.
>>>
>>> You can treat a chained collection of overlays in one of two ways.  1)
>>> you treat it as a single effective tree which can be accessed into as
>>> a unit, or 2) you treat it as a bunch of separate pieces which you can
>>> only look into in detail once the overlays are resolved (either in a
>>> single flattened tree or at unflatten time).
>>>
>>> If (1), then as I've said in other places in the thread, this is just
>>> going to be horribly difficult.  I don't think it's feasible at all.
>>
>> Agreed.
>>
>>> If (2), then it's kind of weird to have an in-band signal, for what's
>>> essentially an out-of-band collection of elements.
>>
>> With my Linux kernel hat on, this is what I'm envisioning _if_ there
>> is not an external data object providing the chaining information.
>> (And I do think the external data object is the way to go.)
>>
>> For Linux, I would be able to do phandle resolution directly on each
>> overlay dtb, in place.  The data in the added blocks is precisely
>> the information I need to do this in a very straightforward and
>> efficient manner.
>>
>>
>>> But more, I don't see that you need this in the first place.  If
>>> you're loading a batch of dtbs from somewhere, you should have some
>>> idea of how much data you have in total.  Once you have that, you can
>>
>> Nope.  I just have a pointer to the beginning of the dtb.  If I added
>> another (external) header before the btd, then this external header
>> could provide the extra information.
> 
> Ah.  That makes things awkward.
> 
>>> just look past the end of a dtb and see if there's another magic
>>> number before the end of your buffer.  If there is, you have another
>>
>> I don't even know if there is any memory past the end of the dtb.
> 
> Drat.
> 
>>> overlay and carry on, otherwise, you're done.  That has the additional
>>> advantage that adding an overlay is *really* just an append (with
>>> maybe some alignment padding bytes first).  Your proposal requires
>>> working out where the second-to-last dtb begins, and poking its
>>> header.
>>
>> It seems that basically I'm agreeing with you.
>>
>>
>>>>    - Add field: u32 phandle_delta
>>>>
>>>>      If non-zero, this indicates that phandle resolution has occurred
>>>>      on this FDT, and internal phandle references in properties have
>>>>      been incremented by this value.
>>>
>>> This needs to be defined in terms of properties of the tree as it
>>> stands, not the history of what's happened to it.  I *think* this
>>> amounts to asserting that the dtb contains no phandles less than
>>> phandle_delta, but I'm not entirely sure.
>> This field, as created by the compiler, has the value zero.  It has
>> nothing to do with the tree as created by dtc.  You can boil my next
>> five paragraphs down to: this is a Linux specific field, that has no
>> meaning to a dtb passed to the Linux kernel (other than it must
>> initially be zero) _except_ for the case case where the Linux kernel
>> gave the dtb (with a modified phandle_delta) to kexec and kexec then
>> rebooted the kernel, passing the modified dtb to the newly booting
>> Linux kernel.
>>
>> This field is a direct fall out of my desire to do phandle resolution
>> in place on the dtb.  The reason this matters is that the Linux kernel
>> makes the contents of the dtb visible to user space (for kexec, as
>> I mention below).
>>
>> There are two classes of phandle resolution done on the dtb.  They both
>> update property values that contain the value of phandles.  These are
>> property values that are implicitly referring to the nodes that contain
>> the phandle value.  The first class of references are to nodes in an
>> external dtb.  The value of these is 0xffffffff before resolution is
>> performed.  After resolution, the value of each is replace with the
>> correct phandle value.  I can perform the same resolution algorithm
>> on these values multiple times, always getting the same result.  The
>> resolution is simply overwriting whatever value is present with the
>> correct value.  The second class of references are referring to nodes
>> internal to the dtb.  The values are the actual values of the phandle
>> properties in the dtb.  The resolution process adjusts the values in
>> the phandles and the phandle references in the same exact way.  For
>> the Linux kernel, the algorithm is to add a constant to each of them.
>> The constant is greater than the existing phandles in the live tree,
>> thus the phandles in the overlay will be in a different range than
>> the phandles in the live tree.  For this second class, if I adjust
>> the phandles in the dtb, I can not just repeat the same resolution
>> process multiple times and get the same result.
>>
>> This field reflects any phandle resolution that the Linux kernel
>> performs.  It is an easy way for the kernel to track whether a
>> dtb that is passes on to kexec, and then kexec passes on to a new
>> version of the kernel that kexec boots, then the new kernel knows
>> how the original dtb has been modified.
>>
>> If this information is not kept in the dtb, as modified by Linux,
>> then Linux needs to pass an unmodified copy of the dtb to kexec.
>> This can be done with a cost of memory.  Not difficult, but not
>> needed if a single word can instead be made available in the dtb.
>>
>> This field is also only of value to the Linux kernel if only one
>> relocation of the dtb is permitted, not multiple relocations.  I
>> mentioned above that external relocation data could specify that
>> the same dtb be used for the same type of card that appears in
>> multiple locations.  This allows a single dtb in the boot image,
>> but the current implementation of the Linux kernel would create
>> a separate copy of it for each location it is used.
> 
> Hrm.  I really don't like the idea of adding Linux specific fields.
> Some of the FreeBSD people know where I live ;).

I have to admit that I agree with the principal of not having OS specific
fields.  This is a hack.

If the new format is based on adding new tags instead of adding new
sections, then my envisioned Linux kernel implementation no longer
has any need for this hack.  With the format I proposed, I was
envisioning doing phandle resolution in-place in the FDT before
unflattening it.  With the new tags format, in the Linux kernel,
I think I would merge phandle resolution into the unflatten algorithm,
and leave the FDT unmodified.


> Even if we get past that, I still think we need to define exactly what
> this means in terms of observable qualities of the tree itself.  If
> might work for what Linux does right now, but there's no guarantee
> that will always be what Linux does - especially if we can't clearly
> describe what the impact of that process is.
> 
>>>>      The intent of this field is for use when a running Linux kernel
>>>>      provides a chained FDT to kexec, which will in turn provide the
>>>>      chained FDT to a newly booting instance of the Linux kernel.  If
>>>>      the booting Linux kernel detects a non-zero phandle_delta then
>>>>      it should decrement the phandle references by this value and then
>>>>      perform phandle resolution again.
>>>>
>>>>      Instead of adding this field to the FDT header, I prefer to add
>>>>      it to an external chaining information block.  If this field is
>>>>      in the FDT header, and the same FDT is applied for multiple
>>>>      connectors, then a separate FDT would need to be supplied for
>>>>      each instance of the overlay, because the delta would be different
>>>>      for each instance.  If the external chaining information block
>>>>      contained several sets of relocation information for the same
>>>>      FDT, then that relocation information would also contain the
>>>>      phandle_delta for that instance.
>>>>
>>>> Version 17 has blocks:
>>>>    - mem_rsvmap
>>>>    - dt_struct
>>>>    - dt_strings
>>>>
>>>> Version 18, add block:
>>>>    - blocks
>>>>
>>>>      This block contains data about all blocks in the FDT, including
>>>>      the blocks that exist in version 17.  This means that the offsets
>>>>      and sizes of the version 17 blocks will exist in the FDT header
>>>>      and be duplicated in the "blocks" block.  Users of version 18 and
>>>>      above must use the information from the "blocks" block instead
>>>>      of from the FDT header.  Then after a few more version changes
>>>>      (say in 10 or 15 years), the offsets and sizes in FDT header (other
>>>>      than the offset of the "blocks" block) can be repurposed.
>>>>
>>>>      The first field of "blocks" is the number of blocks described by
>>>>      "blocks".
>>>>
>>>>      This field is followed by a tuple of offset and size for each of
>>>>      the blocks.
>>>>
>>>>      A c representation of "blocks" is:
>>>>
>>>>         struct fdt_blocks {
>>>>                 u32     num_blocks;
>>>>                 u32     blocks_off;
>>>>                 u32     blocks_size;
>>>>                 u32     csums_off;
>>>>                 u32     csums_size;
>>>>                 u32     dt_strings_off;
>>>>                 u32     dt_strings_size;
>>>>                 u32     dt_struct_off;
>>>>                 u32     dt_struct_size;
>>>>                 u32     ext_phandle_use_off;
>>>>                 u32     ext_phandle_use_size;
>>>>                 u32     int_phandle_use_off;
>>>>                 u32     int_phandle_use_size;
>>>>                 u32     mem_rsvmap_off;
>>>>                 u32     mem_rsvmap_size;
>>>>                 u32     symbols_off;
>>>>                 u32     symbols_size;
>>>>                 u32     validate_off;
>>>>                 u32     validate_size;
>>>>         };
>>>
>>> Hrm, looking at this first, I wondered why you wouldn't just append
>>> this to the main header.  I think you need to express it as an array
>>> to make that clearer.
>>
>> I was being optimistic that it would be possible to add new blocks
>> without changing the version number.  But your comment below is likely
>> correct that my optimism is not realistic.
>>
>>> But even then, I don't think you want a special block for this.  Yes,
>>> having the various block offsets and sizes scattered about the header
>>> rather than in a nice table is ugly, but I don't think it's bad enough
>>> to warrant the complexity of the extra blocks block.  Just add what
>>> you need to the main header.
>>
>> If we were starting from scratch I would feel more strongly, because
>> this does regularize the block descriptions.  But since the descriptions
>> of the existing blocks are already scattered about the header, it's not
>> as strong an argument to not just add these to the header.
>>
>> Not having the new blocks structure also saves a few words and removes
>> one extra level of indirection to locate the various blocks.
>>
>>
>>>>
>>>>      The num_blocks field allows adding additional blocks without
>>>>      incrementing the FDT header version number.
>>>
>>> No, it wouldn't.  Something that doesn't understand the new block
>>> can't know if requires adjustments for any changes it might make
>>> elsewhere.  Therefore it would have to discard any blocks it doesn't
>>> understand.  If you add new blocks as extensions to the main header,
>>> that's already the behaviour you get by clamping the version.
>>
>> There is a very good chance that I am being too optimistic about this.
>> I really should be taking the more conservative approach that state.
> 
> Right.  Note that I'm talking generally above, but your fixups blocks
> are already examples of blocks that could not be safely passed through
> by something modifying the blob which wasn't aware of them.
> 
>>>> Or the specification
>>>>      could require incrementing the version whenever a block is added.
>>>>
>>>>      If the size field of a tuple is zero, then the block does not
>>>>      exist.
>>>>
>>>> Version 18, add block:
>>>>    - csums
>>>>
>>>>      Each tuple in this block contains one field, which is the
>>>>      checksum of the corresponding block.
>>>
>>> There's no reason this should be an extra block, rather than fields in
>>> the blocks block... or extra fields in the main header.   Obviously
>>> you'd also need to add a specific checksum algorithm.  I'm guessing
>>> you're thinking something simple like a CRC32, not a strong hash like
>>> SHA or whatever.
>>
>> I originally added the checksums directly in struct fdt_blocks, but
>> that made it more complicated to calculate the checksum of that
>> structure.
>>
>> Yes, if the other blocks data ended up in the header, this could also.
>>
>> Yes, I was thinking something simple.  I'm not a big proponent of
>> the checksum idea, and if someone else really wanted to push the
>> concept they might want a stronger algorithm.  I just did not want
>> to pass over the idea without letting other people consider it.
>>
>>
>>>>      The tuples in this block are in the same order as the tuples
>>>>      in the "blocks" block.  This leads me to argue that the
>>>>      "blocks" block tuples be in a fixed order, not allowing
>>>>      tuples for non-existent blocks to be absent.
>>>>
>>>>      Checksums are inspired by an old suggestion from Grant Likely.
>>>>      The intent was to allow a kernel to detect if a bootloader
>>>>      that did not understand the new version modified the FDT in
>>>>      a manner that corrupts version 18 data.
>>>>
>>>>      According to dgibson, "Altering a blob and not downrevving it
>>>>      to the latest version you understand is definitely a bug".
>>>>      That give me some assurance that the problem being protected
>>>>      against should not exist.  On the other hand, the checksums
>>>>      do not take up a lot of space.  The specification should
>>>>      choose to either make the "csums" block required or make
>>>>      it optional.
>>>>
>>>> Version 18, add block:
>>>>    - ext_phandle_use
>>>>
>>>>      This is the information needed to describe locations within
>>>>      properties that contain the value of a phandle, where the
>>>>      reference phandle property is external to this FDT.
>>>
>>> I can barely parse that, I've only made sense of what this is from the
>>> context below.
>>
>> Sorry.  I also found it hard to describe.
>>
>> I should have added how I want to use it in the Linux kernel.  This data
>> is present in an overlay dtb.  In the kernel, I already have a list of
>> symbols, and the value of the phandle property for the nodes with a
>> label matching the symbols.
>>
>> This data describes usage of phandles that refer to labels that are
>> _external_ to this dtb.
>>
>> I want to do phandle resolution directly on the dtb before
>> unflattening it.  The prop_value_offset tells me where the
>> phandle values are being used in dt_struct.  It is trivial
>> for me to look up the phandle value for a symbol and plug
>> it into the location specified by prop_value_offset.
>>
>>
>>>>      The name could be changed to "external_phandle_use" for
>>>>      more clarity.
>>>>
>>>>      The name change is intended to reflect "what the data is"
>>>>      instead of "what the consumer is supposed to do with the
>>>>      data".
>>>>
>>>>      The ext_phandle_use block is analagous to the data in the
>>>>      __fixups__ node.
>>>>
>>>>      Each entry in the "ext_phandle_use" block is a tuple of:
>>>>
>>>>         u32 prop_value_offset
>>>>         u32 symbol_offset
>>>
>>> This will need updating with any insertion or deletion in the tree,
>>> which is a bit of a pain.
>>
>> Yes.  But this information would only be used for an overlay dtb.  By
>> definition, a base dtb does not have any external references.
>>
>> If a bootloader needs to modify an overlay dtb, then it has entered
>> into an interesting level of complexity.
> 
> Ah, that is a good point.  Modifying a overlay dtb directly, rather
> than applying it to a base tree *then* modifying is probably a bad
> idea.
> 
>> Some possible alternatives (probably other possible approaches):
>>
>> (1) bootloader is allowed to modify an overlay dtb such that it has to
>>     modify this data, if affected by the modification.
>>
>> (2) bootloader is only allowed to modify an overlay dtb by inserting
>>     NOPs.  (2a) bootloader must NOP affected ext_phandle_use entries
>>     or (2b) the kernel must detect that an ext_phandle_use entry
>>     refers to a NOP range, and not process that entry.
>>
>> (3) bootloader is not allowed to modify an _overlay_ dtb.
>>
>> These are just some examples of how to approach the issue.  There are
>> other ways.
>>
>>
>>>>      The prop_value_offset contains the offset within the "dt_struct"
>>>>      block of the location within a property value that contains a
>>>>      phandle value.
>>>>
>>>>      The symbol_offset contains the offset within the "dt_strings"
>>>>      block that contains the name of the label corresponding to
>>>>      the node that contains the referenced phandle value, where the
>>>>      phandle value refers to a node in a different FDT.
>>>>
>>>>      The value to place at prop_value_offset will be found in the
>>>>      "symbols" block of the FDT that contains the labeled node.
>>>>
>>>> Version 18, add block:
>>>>    - int_phandle_use
>>>>
>>>>      This is the information needed to describe locations within
>>>>      properties that contain the value of a phandle, where the
>>>>      reference phandle property is internal to this FDT.
>>
>> And here I should have mentioned how I would like to use this data
>> in the Linux kernel.  Again, I would like to do phandle resolution
>> directly on the dtb before unflattening it.
>>
>> This data describes usage of phandles that refer to labels that are
>> _internal_ to this dtb.
>>
>> This is the remaining information needed to finish phandle resolution
>> in this dtb.  The locations that use these phandle values need to
>> have the values transformed from the range of phandle values
>> created in this dtb to a range that does not conflict with
>> any phandle values in the live tree.  As each overlay dtb is
>> resolved, consider the phandle values from any previously
>> resolved overlay dtb to already be in the live tree.
> 
> Right.  IIUC this is basically just a different encoding of
> __local_fixups__.

Yes.

And the ext_phandle_use block is basically just a different encoding
of __fixups__ and the symbols block is just a different encoding of
__symbols__.


>>>>      The name could be changed to "internal_phandle_use" for
>>>>      more clarity.
>>>>
>>>>      The int_phandle_use block is analagous to the data in the
>>>>      __local_fixups__ node.
>>>>
>>>>      The name change is intended to reflect "what the data is"
>>>>      instead of "what the consumer is supposed to do with the
>>>>      data".
>>>>
>>>>      Each entry in the "ext_phandle_use" block is a single field of:
>>>>
>>>>         u32 prop_value_offset
>>>>
>>>>      The prop_value_offset contains the offset within the "dt_struct"
>>>>      block of the location within a property value that contains a
>>>>      phandle value, where the phandle value refers to a node in the
>>>>      same FDT.  The value of the phandle property in the referenced
>>>>      node is the same as the value located at prop_value_offset.
>>>>
>>>>      The compiler shall create phandle property values in an increasing
>>>>      contigous range, beginning with one.  Exception: compiler created
>>>>      values will not duplicate phandle property values that are
>>>>      explicitly provided in the devicetree source file.
>>>>
>>>>      The value to place at prop_value_offset is an implementation
>>>>      dependent value, where the value does not conflict with any
>>>>      phandle property values in the active devicetree.
>>>>
>>>>      [[ for information only:  The Linux kernel creates the replacement
>>>>      value by adding a delta to all phandle properties in the FDT and
>>>>      all internal phandle references. ]]
>>>>
>>>> Version 18, add block:
>>>>    - symbols
>>>>
>>>>      This is the information that describes the values of the phandle
>>>>      properties in labeled nodes.
>>>>
>>>>      The information in the FDT "symbols" block is used to resolve
>>>>      phandle references in an overlay when it is applied to the active
>>>>      devicetree.
>>>>      
>>>>      An overlay FDT may also contain a "symbols" block, which is used
>>>>      to resolve references in a subsequent overlay when it is applied
>>>>      to the active devicetree.
>>>>
>>>>      Each entry in the "ext_phandle_use" block is a tuple of:
>>>>
>>>>         u32 phandle_value
>>>>         u32 symbol_offset
>>>>
>>>>      The phandle_value contains the value in this FDT of the phandle
>>>>      property in the labeled node whose label name is described by
>>>>      symbol_offset.
>>>>
>>>>      The symbol_offset contains the offset within the "dt_strings"
>>>>      block that contains the name of the label corresponding to
>>>>      the node that contains the phandle value.
>>>>
>>>> Version 18, add block:
>>>>    - validate
>>>>
>>>>      This is the information that describes any validation of the
>>>>      FDT and/or the devicetree source that the FDT was created from.
>>>>
>>>>      A c representation of "validate" is:
>>>>
>>>>         u32     validation_done;
>>>>         u32     errors_count;
>>>>         u32     warnings_count;
>>>
>>> Once again, this could go into the main header, rather than adding
>>> another block to deal with.
>>
>> Yes.
>>
>>> It's also pretty poorly defined, IMO.
>>
>> Indeed.  As I say below it is a placeholder, the actual form of it
>> should be one of the results of the work on creating devicetree
>> validation tools and process.
> 
> Ok.  Leave it out for now, I think.  While consolidating multiple
> format changes into one has merit, we don't necessarily need to do it
> with everything.  In particular it's *incompatible* changes that
> really want to be minimised.  It seems unlikely to me that adding the
> verification info would be an incompatible change, so we can
> potentially add it later without excessive churn.

If we can get the validation people to come up with a good definition
of this data, I'd really like to get it into this version update.

I'd much rather that end users only have to update their bootloader
once instead of twice (and the bootloader developers only having to
maintain one new versions of the bootloader instead of two new
versions).


>>>>      How the client program [[ eg kernel ]] uses the data is
>>>>      implementation dependent.
>>>>
>>>>      I created these fields as a placeholder.  I would like the actual
>>>>      choice of fields to flow out of the current efforts to create
>>>>      devicetree validation tools.
>>>>
>>>>      [[ for information only:  Some examples of what the Linux
>>>>      kernel could use this information for:
>>>>        - print a warning message if any warnings exist
>>>>        - print a warning message if any errors exist
>>>>        - taint the kernel if any errors exist
>>>>        - refuse to boot if any errors exist
>>>>      ]]
>>>>
>>>>      One question I have is how to represent the base devicetree
>>>>      (or base devicetree plus one or more applied overlays)
>>>>      that this FDT was validated against when this FDT is
>>>>      an overlay FDT.
>>>>
>>>> Version 18, add a footer field:
>>>>    - footer_magic
>>>>
>>>>      This field allows detection of a partially completed FDT, where
>>>>      the FDT is created by a multi-pass tool.  The final action of
>>>>      such a tool is to set the value of this field.
>>>
>>> I like the idea of adding a footer, to detect truncated blobs.  I'm
>>> having trouble making real sense of the description above, though.
>>
>> It sounds like you got the sense of what I intended.
> 
> Yeah, I think so.  To make sure, let me summarize a more precise
> version which I think covers it:
>   * v18 files must have totalsize a multiple of 4
>   * totalsize must be at least 4 greater than the end of the last
>     sub-block
>   * last 4 bytes in the blob (as defined by totalsize) should be a
>     magic number (different from the magic number at the start)

Yes, that is much more clearly stated.

Except 8 byte alignment instead of 4 byte (ePAPR section '8.6 Alignment'.
I think this alignment is driven by the memory reservation block.


> Revisiting the idea of a "continuation" flag again, putting that as
> two different footer values rather than in the header is probably a
> better idea.  It's not quite a single append, but it does mean you can
> just change the last bytes of what you have then append, rather than
> having to locate the start of the last existing overlay before adding
> another one.

Yes, I agree.  Good idea.


>>>>      The value of this field shall be u32 0xeeeefeed.
>>>>
>>>>      This field is located as the last u32 field in the FDT.  The FDT
>>>>      shall be zero padded as needed to provide proper alignment for
>>>>      this field.
>>>
>>> Ok - I'd be happy enough for the new version to say that totalsize
>>> must always be aligned to 32 (or even 64) bits, too.
>>>>
>>>> The use of "dt_struct" block offsets and "dt_strings" block offsets is
>>>> intended to make phandle reference resolution easy and efficient when
>>>> an overlay is applied.
>>>>
>>>> The downside to using block offsets is that if a boot program deletes
>>>> a property (by replacing the property entry in the "dt_struct" block
>>>> with NOPs), then the client program must be aware of the NOPs and
>>>> not attempt to overwrite a NOP with a phandle value.  I do not expect
>>>> this to be a significant complication.
>>>
>>> So, there are rather more complications here:
>>
>> Yes.  This seems to be one of the more difficult areas of concern
>> for me.  I list a few possible ways to deal with modifying dtbs
>> earlier in this reply.
>>
>>
>>> Whenever you insert and delete (for reals, not with nops) you need to
>>> adjust all the offsets in the fixup blocks - and remove any fixups
>>> that reference something in a deleted chunk.
>>
>> Yes.
>>
>>
>>> Nops don't require offset adjustments but you *still* must remove any
>>> fixups pointing into the nopped region. It's not possible to deal> with this at the time of applying the fixup with the information
>>> available: the existing property value can contain anything, so
>>> there's no way to detect a NOP vs. what was there.  You can't check
>>> for a NOP where the FDT_PROP used to be, because you don't know the
>>> offset of the FDT_PROP tag.  Remember that the structure block is
>>> traversable forwards, but not backwards.
>>
>> The dt_struct can be scanned, and all ranges of NOPs can be detected.
>> Thus the Linux kernel could create such a temporary table of NOP
>> ranges, before using any of the offsets into dt_struct to modify
>> phandle values in dt_struct.
> 
> Hm, yeah, I guess you can do that.  It requires an extra pass through
> the dtb, and keeping an ancillary data structure, which is kind of
> awkward.
> 
>> I would like to hear from the bootloader experts what the use cases
>> for modifying dtbs, and especially for modifying overlay dtbs are.
>> And the real life examples that they are seeing.  I am especially
>> lacking information in this area.
>>
>> Note that modifying a base dtb is a lot easier than modifying an
>> overlay dtb because the symbols block has no "pointers" (offsets
>> into dt_struct.  It does have offsets into dt_strings, but
>> modifications to dt_strings can be restricted to adding new
>> strings at the end.  The symbols block does have a copy of the
>> value of each phandle property.  It is hard to imagine that a
>> bootloader would need to delete a phandle property (and even
>> harder to imagine that it would change the value of a phandle
>> property).  If it needed to add a new phandle property, then
>> that phandle value will only be useful to an overlay if a label
>> symbol is also created.  I would say we've gone wildly astray
>> if we are dynamically creating a label that will be used by
>> an overlay.
> 
> When you say deleting or changing a phandle property do you mean
> deleting or changing the actual property called 'phandle' or any
> property which includes a phandle?

The actual property called 'phandle'.

If you have any suggested names for the two different concepts, that
would be great.  I find it very difficult to write concisely and
clearly about which of the two is intended.


>>>> The alternative to this
>>>> would be for the client program to have a policy (shared agreement
>>>> with the boot program) that no phandle values are allowed to be
>>>> deleted.  I think that this alternative is too restrictive, but
>>>> raise it as a possibility.
>>>
>>> Some further general points.
>>>
>>>  * Any addition of blocks to the blob makes libfdt's job a lot harder
>>>    for write operations.  Juggling the 3 existing blocks is already
>>>    pretty awkward.
>>
>> Sounds like a good reason to keep all the new fields in the header
>> then.  It will not be a problem for the Linux kernel if the fields
>> are in the header.
>>
>>>
>>>  * Given that the new fixup information can't be understood by
>>>    something that isn't v18 aware, and any non-v18-aware (write)
>>>    processing steps in the middle will have to strip the v18
>>>    information, I'm wondering how valuable backwards compatibility
>>>    actually is.> If we drop the requirement for backwards compat, it beomces possible
>>> to encode the fixup information in a much more natural and easy to
>>> handle format.  Instead of adding new blocks, we add new tags to the
>>> structure block.  So, say FDT_EXTERNAL_PHANDLE with a property offset
>>> and strings table offset would replace a __fixups__ entry, and an
>>> FDT_INTERNAL_PHANDLE with just a property offset would replace a
>>> __local_fixups__ entry.  The don't need an explicit property> reference, because they'd just apply to the immediately preceding
>>> property.
>>
>> In this case, the "property offset" is the offset within the property
>> value?
> 
> Yes.
> 
>> If a property contained multiple phandle values then there would
>> be one FDT_EXTERNAL_PHANDLE (or FDT_INTERNAL_PHANDLE as appropriate) entry
>> for each of the phandle values?
> 
> Yes.  A form which has a number and list of offsets would be fine too
> - probably just want to look at existing overlays and see which ends up
> more compact on average.

Agreed.  Thinking about the code to process either form, I think that
the form with a number and a list of offsets would result in cleaner
code.


>> If implemented this way, then the Linux kernel could fold the phandle
>> resolution into the unflattening process.  This is intriguing, I'll
>> have to think through the implications of that.
>>
>> My initial reaction is to like this approach.

The other information needed is what is in __symbols__ or the proposed
symbols block.  If the phandle tags are added, then it seems like an
FDT_SYMBOLS tag with a number of symbols and with a strings table offset
for each property would provide the information.


>>> That approach means we're back to local data, which can be shuffled
>>> around pretty easily for inserts and deletes.  You'd have to adjust
>>> offsets in the fixups for one property when it was altered but not any
>>> further away than that.
>>>
>>> It also extends easily to add path fixups as well.
> 
> Ok, well, while we're thinking about changing the overlay format,
> here's some other things to consider:
> 
>  * I think we should deprecate the 'target' property on overlay
>    fragments in favor of 'target-path' (already defined) or
>    'target-label' (not yet defined.  The existing target format with a
>    phandle always needs to be fixed up before it can be resolved, and
>    always requires a two-stage lookup (label to phandle, then phandle
>    to path or offset).
> 
>  * Actually.. I'd be inclined to ditch target-label as well, and just
>    use target-path, but extend it to allow OF-style paths that start
>    with an alias, instead of just absolute paths from the root node.

One advantage of using a phandle (and thus a label in the original
source) is that the same overlay can be applied on top of two different
base devicetrees that provide the label, even when the label is for
different paths.


>  * Going further, we might want to consider buliding the fragments
>    into the structure itself - e.g. rather than there just being a
>    single FDT_BEGIN_NODE..FDT_END_NODE pair encompassing everything,
>    have a sequence of FDT_BEGIN_NODE..FDT_END_NODE before the final
>    FDT_END, each one representing a separate fragment of the overlay.
>    Or even add an FDT_OVERLAY tag to make it more explicit still.

Thinking _only_ about the Linux implementation, this would make the
unflattening code slightly more complex and (I think) would have no
impact on the apply overlay code.  I'll have to think about this a
bit more.

Trying to think about applying an overlay in the FDT realm, without
unflattening, I'll also have to think about a bit more.
