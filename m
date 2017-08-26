From: "Robert P. J. Day" <rpjday-L09J2beyid0N/H6P543EQg@public.gmane.org>
Subject: more pedantic proofing of DTSpec version 0.1
Date: Sat, 26 Aug 2017 10:50:46 -0400 (EDT)
Message-ID: <alpine.LFD.2.20.1708210705090.28188@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


  a few more notes on more of the 0.1 DTSpec; all page numbers refer
to the current PDF doc. lots of nitpickery, feel free to ignore any or
all.

p. 21: "... an [sic] DTSpec-compliant devicetree." (there are a number
of places in the spec that use "an" before "DTSpec", which seems
awkward.)

p. 21: in that early bullet list, is there a reason that the "/cpus"
node name has a leading slash, and the "memory" node name does not?
that seems inconsistent. (p.s. it's presented as "/memory" on the very
next page.)

p. 21: table 3.1 mentions "model" root node property but, as before,
it's not clear what value that property has, other than being mildly
informational. is it actually used for anything in terms of matching?

p. 21: table 3.1 uses example of "fsl,mpc8572ds" for compatibility;
there is no longer any such string in the kernel source, i'd replace
that with "fsl,ns16550", of which there are plenty of occurrences.

p. 21,22: explanation of /aliases node refers solely to property
values specifying the "full path" to a node in the device tree, using
examples like:

  aliases {
      serial0 = "/simple-bus@fe000000/serial@llc500";
      ethernet0 = "/simple-bus@fe000000/ethernet@31c000";
  }    <----- missing semicolon?

but (of course) everyone uses much shorter forms such as:

   aliases {
      mmcblk0 = &mmc1;
      mmcblk1 = &mmc2;
   };

is there a reason that section doesn't mention this second form? are
readers simply supposed to know automatically about that? note that
the wording in that section *strongly* implies that the property value
*must* be a full path and nothing else, so it seems at least a little
misleading.

p. 22: "Given the alias serial0, ..." i would render "serial0" in
monospaced font for consistency.

p. 23,24: i notice in the kernel that the OF code searches for the
node "/chosen" and, as an alternative, "/chosen@0". i assume a node
name of "/chosen@0" is long dead and need not be mentioned. in any
event, i don't see a single DTS file in the current tree that uses it.

p. 24,25: it might be worth rendering more content in monospaced font
to make it clear that content is, say, a proper (node?) name. eg., in
the section "/cpus Node Properties," lines like:

  "A [cpus] node ..."
  "... for child [cpu] nodes ..."
  "The [cpus] node ..."
  "A [cpu] node ..."
  "... may be placed in the [cpus] node instead."

  ... and so on. most of the time, node names are rendered that way,
so might as well be consistent. also using a leading slash in cases
like that would be consistent.

p. 25: table 3.6, the acronym "PIR" comes out of nowhere, perhaps
explain it the first time?

p. 32: "... of other each [sic]."

p. 32: "... if the new device fits into one [of] the ..."
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
