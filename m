From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [RFC] devicetree: new FDT format version
Date: Sat, 27 Jan 2018 19:48:31 +1100
Message-ID: <20180127084831.GH2099@umbus>
References: <b96829f9-2e8b-fdc5-5090-58591e2260cf@gmail.com>
 <bc44f051-835d-1c8d-a928-be0fd4ef80b5@gmail.com>
 <b5a72db1-45b2-f21f-9afd-0991b288840e@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Uu2n37VG4rOBDVuR"
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <b5a72db1-45b2-f21f-9afd-0991b288840e-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, "Pantelis Antomarek.vasut-Re5JQEeQqe/2sr8fMPgRzw@public.gmane.org" <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Kyle Evans <kevans-HZy0K5TPuP5AfugRpC6u6w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Alan Tull <atull-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--Uu2n37VG4rOBDVuR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 24, 2018 at 04:27:10PM -0800, Frank Rowand wrote:
> On 01/22/18 12:08, Frank Rowand wrote:
> > + Alan Tull
> > + Michael Ellerman
> >=20
> > On 01/22/18 00:09, Frank Rowand wrote:
> >> Hi All,
> >>
> >> I've tried to create a decent distribution list, but I'm sure I've mis=
sed
> >> someone or some important list.  Please share this with anyone you thi=
nk
> >> will be affected.
> >>
> >> I have been playing around with some thoughts for some additions to
> >> the devicetree FDT aka blob format.
> >>
> >> I would like to get the affected parties thinking about how additions =
to
> >> the format could improve whichever pieces of FDT related technology you
> >> work on or care about.  In my opinion, the FDT format should change
> >> very infrequently because of the impact on so many projects that have
> >> to work together to create a final solution, plus the many many users
> >> of those projects.
> >>
> >> So I would like you guys to consider what I send out in a day or so,
> >> but I don't want to preempt your creativity by laying out the details
> >> of my proposal right now.
> >>
> >> I have not looked at how this would impact the devicetree compilers,
> >> but I have hacked together a tool to convert existing blobs to the
> >> new format.  The new format is backward compatible, but transforms
> >> the overlay related metadata into separate blocks and removes the
> >> metadata from nodes and properties.  My current proposal leaves
> >> the fragment subtrees intact - it only transforms __symbols__,
> >> __fixups__, and __local_fixups__.
> >>
> >> Some Advantages and disadvantages of my proposal are:
>=20
> < snip >
>=20
>=20
> Here are my current thoughts on a proposed update to the devicetree
> Flattened Device Tree (FDT) aka blob format.
>=20
> Version 18, FDT header:
>=20
>    - Change version from 17 to 18.
>=20
>    - last_comp_version remains 16.

Sure.

>    - Add field: u32 off_blocks
>=20
>      This is the offset to a new block called "blocks".

See later comments.

>    - Add field: u32 chained
>=20
>      If non-zero, this indicates that an overlay FDT is concatenated
>      to the end of this FDT.
>=20
>      An alternative to adding this field would be to provide chaining
>      information in some manner external to the FDT.  One advantage of
>      using a data structure external to the FDT is that the information
>      could include extra details such as how to relocate the overlay.
>      For example the overlay could describe an add-on card, where the
>      add-on card could be located in one of several slots.  For
>      another example, there could be multiple instances of the add-on
>      card and the same overlay could be relocated for each of those
>      slots.
>=20
>      The "chained" field does not preclude the use of an external
>      data structure to provide additional information, such as
>      relocations.
>=20
>      This field shall be set to zero by the compiler, unless the
>      compiler is creating a chain of FDTs.  This field would
>      normally be set by a tools that assembles multiple FDTs
>      into a block of chained FDTs.
>=20
>      If "chained" is non-zero then the size of the FDT must provide
>      the required alignment for a directly appended FDT.
>=20
>      [[ The size/alignment intent is to simplify any tool that
>      assembles a block of chained FDTs. ]]

I think this is a bad idea.

You can treat a chained collection of overlays in one of two ways.  1)
you treat it as a single effective tree which can be accessed into as
a unit, or 2) you treat it as a bunch of separate pieces which you can
only look into in detail once the overlays are resolved (either in a
single flattened tree or at unflatten time).

If (1), then as I've said in other places in the thread, this is just
going to be horribly difficult.  I don't think it's feasible at all.

If (2), then it's kind of weird to have an in-band signal, for what's
essentially an out-of-band collection of elements.

But more, I don't see that you need this in the first place.  If
you're loading a batch of dtbs from somewhere, you should have some
idea of how much data you have in total.  Once you have that, you can
just look past the end of a dtb and see if there's another magic
number before the end of your buffer.  If there is, you have another
overlay and carry on, otherwise, you're done.  That has the additional
advantage that adding an overlay is *really* just an append (with
maybe some alignment padding bytes first).  Your proposal requires
working out where the second-to-last dtb begins, and poking its
header.

>    - Add field: u32 phandle_delta
>=20
>      If non-zero, this indicates that phandle resolution has occurred
>      on this FDT, and internal phandle references in properties have
>      been incremented by this value.

This needs to be defined in terms of properties of the tree as it
stands, not the history of what's happened to it.  I *think* this
amounts to asserting that the dtb contains no phandles less than
phandle_delta, but I'm not entirely sure.

>      The intent of this field is for use when a running Linux kernel
>      provides a chained FDT to kexec, which will in turn provide the
>      chained FDT to a newly booting instance of the Linux kernel.  If
>      the booting Linux kernel detects a non-zero phandle_delta then
>      it should decrement the phandle references by this value and then
>      perform phandle resolution again.
>=20
>      Instead of adding this field to the FDT header, I prefer to add
>      it to an external chaining information block.  If this field is
>      in the FDT header, and the same FDT is applied for multiple
>      connectors, then a separate FDT would need to be supplied for
>      each instance of the overlay, because the delta would be different
>      for each instance.  If the external chaining information block
>      contained several sets of relocation information for the same
>      FDT, then that relocation information would also contain the
>      phandle_delta for that instance.
>=20
> Version 17 has blocks:
>    - mem_rsvmap
>    - dt_struct
>    - dt_strings
>=20
> Version 18, add block:
>    - blocks
>=20
>      This block contains data about all blocks in the FDT, including
>      the blocks that exist in version 17.  This means that the offsets
>      and sizes of the version 17 blocks will exist in the FDT header
>      and be duplicated in the "blocks" block.  Users of version 18 and
>      above must use the information from the "blocks" block instead
>      of from the FDT header.  Then after a few more version changes
>      (say in 10 or 15 years), the offsets and sizes in FDT header (other
>      than the offset of the "blocks" block) can be repurposed.
>=20
>      The first field of "blocks" is the number of blocks described by
>      "blocks".
>=20
>      This field is followed by a tuple of offset and size for each of
>      the blocks.
>=20
>      A c representation of "blocks" is:
>=20
>         struct fdt_blocks {
>                 u32     num_blocks;
>                 u32     blocks_off;
>                 u32     blocks_size;
>                 u32     csums_off;
>                 u32     csums_size;
>                 u32     dt_strings_off;
>                 u32     dt_strings_size;
>                 u32     dt_struct_off;
>                 u32     dt_struct_size;
>                 u32     ext_phandle_use_off;
>                 u32     ext_phandle_use_size;
>                 u32     int_phandle_use_off;
>                 u32     int_phandle_use_size;
>                 u32     mem_rsvmap_off;
>                 u32     mem_rsvmap_size;
>                 u32     symbols_off;
>                 u32     symbols_size;
>                 u32     validate_off;
>                 u32     validate_size;
>         };

Hrm, looking at this first, I wondered why you wouldn't just append
this to the main header.  I think you need to express it as an array
to make that clearer.

But even then, I don't think you want a special block for this.  Yes,
having the various block offsets and sizes scattered about the header
rather than in a nice table is ugly, but I don't think it's bad enough
to warrant the complexity of the extra blocks block.  Just add what
you need to the main header.

>=20
>      The num_blocks field allows adding additional blocks without
>      incrementing the FDT header version number.

No, it wouldn't.  Something that doesn't understand the new block
can't know if requires adjustments for any changes it might make
elsewhere.  Therefore it would have to discard any blocks it doesn't
understand.  If you add new blocks as extensions to the main header,
that's already the behaviour you get by clamping the version.

> Or the specification
>      could require incrementing the version whenever a block is added.
>=20
>      If the size field of a tuple is zero, then the block does not
>      exist.
>=20
> Version 18, add block:
>    - csums
>=20
>      Each tuple in this block contains one field, which is the
>      checksum of the corresponding block.

There's no reason this should be an extra block, rather than fields in
the blocks block... or extra fields in the main header.   Obviously
you'd also need to add a specific checksum algorithm.  I'm guessing
you're thinking something simple like a CRC32, not a strong hash like
SHA or whatever.

>      The tuples in this block are in the same order as the tuples
>      in the "blocks" block.  This leads me to argue that the
>      "blocks" block tuples be in a fixed order, not allowing
>      tuples for non-existent blocks to be absent.
>=20
>      Checksums are inspired by an old suggestion from Grant Likely.
>      The intent was to allow a kernel to detect if a bootloader
>      that did not understand the new version modified the FDT in
>      a manner that corrupts version 18 data.
>=20
>      According to dgibson, "Altering a blob and not downrevving it
>      to the latest version you understand is definitely a bug".
>      That give me some assurance that the problem being protected
>      against should not exist.  On the other hand, the checksums
>      do not take up a lot of space.  The specification should
>      choose to either make the "csums" block required or make
>      it optional.
>=20
> Version 18, add block:
>    - ext_phandle_use
>=20
>      This is the information needed to describe locations within
>      properties that contain the value of a phandle, where the
>      reference phandle property is external to this FDT.

I can barely parse that, I've only made sense of what this is from the
context below.

>      The name could be changed to "external_phandle_use" for
>      more clarity.
>=20
>      The name change is intended to reflect "what the data is"
>      instead of "what the consumer is supposed to do with the
>      data".
>=20
>      The ext_phandle_use block is analagous to the data in the
>      __fixups__ node.
>=20
>      Each entry in the "ext_phandle_use" block is a tuple of:
>=20
>         u32 prop_value_offset
>         u32 symbol_offset

This will need updating with any insertion or deletion in the tree,
which is a bit of a pain.

>      The prop_value_offset contains the offset within the "dt_struct"
>      block of the location within a property value that contains a
>      phandle value.
>=20
>      The symbol_offset contains the offset within the "dt_strings"
>      block that contains the name of the label corresponding to
>      the node that contains the referenced phandle value, where the
>      phandle value refers to a node in a different FDT.
>=20
>      The value to place at prop_value_offset will be found in the
>      "symbols" block of the FDT that contains the labeled node.
>=20
> Version 18, add block:
>    - int_phandle_use
>=20
>      This is the information needed to describe locations within
>      properties that contain the value of a phandle, where the
>      reference phandle property is internal to this FDT.
>=20
>      The name could be changed to "internal_phandle_use" for
>      more clarity.
>=20
>      The int_phandle_use block is analagous to the data in the
>      __local_fixups__ node.
>=20
>      The name change is intended to reflect "what the data is"
>      instead of "what the consumer is supposed to do with the
>      data".
>=20
>      Each entry in the "ext_phandle_use" block is a single field of:
>=20
>         u32 prop_value_offset
>=20
>      The prop_value_offset contains the offset within the "dt_struct"
>      block of the location within a property value that contains a
>      phandle value, where the phandle value refers to a node in the
>      same FDT.  The value of the phandle property in the referenced
>      node is the same as the value located at prop_value_offset.
>=20
>      The compiler shall create phandle property values in an increasing
>      contigous range, beginning with one.  Exception: compiler created
>      values will not duplicate phandle property values that are
>      explicitly provided in the devicetree source file.
>=20
>      The value to place at prop_value_offset is an implementation
>      dependent value, where the value does not conflict with any
>      phandle property values in the active devicetree.
>=20
>      [[ for information only:  The Linux kernel creates the replacement
>      value by adding a delta to all phandle properties in the FDT and
>      all internal phandle references. ]]
>=20
> Version 18, add block:
>    - symbols
>=20
>      This is the information that describes the values of the phandle
>      properties in labeled nodes.
>=20
>      The information in the FDT "symbols" block is used to resolve
>      phandle references in an overlay when it is applied to the active
>      devicetree.
>     =20
>      An overlay FDT may also contain a "symbols" block, which is used
>      to resolve references in a subsequent overlay when it is applied
>      to the active devicetree.
>=20
>      Each entry in the "ext_phandle_use" block is a tuple of:
>=20
>         u32 phandle_value
>         u32 symbol_offset
>=20
>      The phandle_value contains the value in this FDT of the phandle
>      property in the labeled node whose label name is described by
>      symbol_offset.
>=20
>      The symbol_offset contains the offset within the "dt_strings"
>      block that contains the name of the label corresponding to
>      the node that contains the phandle value.
>=20
> Version 18, add block:
>    - validate
>=20
>      This is the information that describes any validation of the
>      FDT and/or the devicetree source that the FDT was created from.
>=20
>      A c representation of "validate" is:
>=20
>         u32     validation_done;
>         u32     errors_count;
>         u32     warnings_count;

Once again, this could go into the main header, rather than adding
another block to deal with.  It's also pretty poorly defined, IMO.

>      How the client program [[ eg kernel ]] uses the data is
>      implementation dependent.
>=20
>      I created these fields as a placeholder.  I would like the actual
>      choice of fields to flow out of the current efforts to create
>      devicetree validation tools.
>=20
>      [[ for information only:  Some examples of what the Linux
>      kernel could use this information for:
>        - print a warning message if any warnings exist
>        - print a warning message if any errors exist
>        - taint the kernel if any errors exist
>        - refuse to boot if any errors exist
>      ]]
>=20
>      One question I have is how to represent the base devicetree
>      (or base devicetree plus one or more applied overlays)
>      that this FDT was validated against when this FDT is
>      an overlay FDT.
>=20
> Version 18, add a footer field:
>    - footer_magic
>=20
>      This field allows detection of a partially completed FDT, where
>      the FDT is created by a multi-pass tool.  The final action of
>      such a tool is to set the value of this field.

I like the idea of adding a footer, to detect truncated blobs.  I'm
having trouble making real sense of the description above, though.

>      The value of this field shall be u32 0xeeeefeed.
>=20
>      This field is located as the last u32 field in the FDT.  The FDT
>      shall be zero padded as needed to provide proper alignment for
>      this field.

Ok - I'd be happy enough for the new version to say that totalsize
must always be aligned to 32 (or even 64) bits, too.
>=20
> The use of "dt_struct" block offsets and "dt_strings" block offsets is
> intended to make phandle reference resolution easy and efficient when
> an overlay is applied.
>=20
> The downside to using block offsets is that if a boot program deletes
> a property (by replacing the property entry in the "dt_struct" block
> with NOPs), then the client program must be aware of the NOPs and
> not attempt to overwrite a NOP with a phandle value.  I do not expect
> this to be a significant complication.

So, there are rather more complications here:

Whenever you insert and delete (for reals, not with nops) you need to
adjust all the offsets in the fixup blocks - and remove any fixups
that reference something in a deleted chunk.

Nops don't require offset adjustments but you *still* must remove any
fixups pointing into the nopped region.  It's not possible to deal
with this at the time of applying the fixup with the information
available: the existing property value can contain anything, so
there's no way to detect a NOP vs. what was there.  You can't check
for a NOP where the FDT_PROP used to be, because you don't know the
offset of the FDT_PROP tag.  Remember that the structure block is
traversable forwards, but not backwards.

> The alternative to this
> would be for the client program to have a policy (shared agreement
> with the boot program) that no phandle values are allowed to be
> deleted.  I think that this alternative is too restrictive, but
> raise it as a possibility.

Some further general points.

 * Any addition of blocks to the blob makes libfdt's job a lot harder
   for write operations.  Juggling the 3 existing blocks is already
   pretty awkward.

 * Given that the new fixup information can't be understood by
   something that isn't v18 aware, and any non-v18-aware (write)
   processing steps in the middle will have to strip the v18
   information, I'm wondering how valuable backwards compatibility
   actually is.

If we drop the requirement for backwards compat, it beomces possible
to encode the fixup information in a much more natural and easy to
handle format.  Instead of adding new blocks, we add new tags to the
structure block.  So, say FDT_EXTERNAL_PHANDLE with a property offset
and strings table offset would replace a __fixups__ entry, and an
FDT_INTERNAL_PHANDLE with just a property offset would replace a
__local_fixups__ entry.  They don't need an explicit property
reference, because they'd just apply to the immediately preceding
property.

That approach means we're back to local data, which can be shuffled
around pretty easily for inserts and deletes.  You'd have to adjust
offsets in the fixups for one property when it was altered but not any
further away than that.

It also extends easily to add path fixups as well.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Uu2n37VG4rOBDVuR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlpsPN0ACgkQbDjKyiDZ
s5InAhAAwtQ7BqETS3hWovMh2oAqOFcj8I1YlSxyJ2Q/RoRz1y9kYH/Bh+V1ixvx
CdZOf0TDWR6RPjUSz/Z8cRQYBFpUR/SnhxQ+009kAOYsGQHsKq60eXuBuvKtMAty
tBNg83XQ1f5GtuB+Y/+vYWqMvC5uBuFSlw9aaj7jmPd1TvOKEofwftuwbzn0DmW2
AHl4WnCNgUChyr9RBvnh9HrlAX6R2xU75mOxmouHT4L3pNhn9iw03Zc/TStL6jxI
lij76bSi4IkJn8Kej04KZ7lKvQAvpRZ2Nmh1IDQuDM7p39xI0b/H3v+dgrFTecpB
uyfxhnaXOf+wdUU+vXdVViiiosbOdVH8Pu5GI9/L0AztDNtYIera8MdVmmYhcx8e
mx/HF3TzmtrrxPp2jeaFYgita4lxLSKeQ4cR487qIgYLi/xnk9W1xA3EAcLgNs5E
36V0ct++sY8gSq0KDRIEQBDXomL2p3dGgWg9KlnMmw80M20JWEEaJOARwcsmjyTx
chfS/s4riEg4cl2o9RY+6sKLbJUgjJ7Yp9rfuR6I5oawF1VAwpHzC+/Qqjkl64yU
2OaZzChZSTf+swsfHoLPi7a5oRXMdthyGs6/OvFMhQittm0gLNW+d3pZyjq5G/4S
XP5uxWJgbXDao6g4+3sH4wT//A0jzDGqsm1x8o5zlEq5redxFyQ=
=J+yE
-----END PGP SIGNATURE-----

--Uu2n37VG4rOBDVuR--
