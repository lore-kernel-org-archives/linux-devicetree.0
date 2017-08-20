From: "Robert P. J. Day" <rpjday-L09J2beyid0N/H6P543EQg@public.gmane.org>
Subject: editing-type thoughts on devicetree spec 0.1 document
Date: Sun, 20 Aug 2017 15:08:00 -0400 (EDT)
Message-ID: <alpine.LFD.2.20.1708170751220.8230@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


  Was recently asked to give a short tutorial on device trees, so
started perusing the current 0.1 spec, comparing contents to current
linux git repo, made a few notes, here they are, admittedly incredibly
nitpicky so anyone is free to do with them what they want or just
ignore them in their entirety; it's just my editor/proofreader side
coming out. Page numbers refer to PDF document.

p. 2: "... would like [to] thank ..."

p. 2: "... development [of] this specification ..."

p. 3: "In this document the term boot program ..."; italicize "boot
program"

p. 3,4: "Examples of a boot programs [sic] ..."

p. 4: "IEEE-1275" should not be hyphenated (occurs more than once)

p. 4: Should it be "PowerISA" or "Power ISA"? Both forms are used.

p. 6: "An [sic] DTSpec-compliant ..."

p. 7: "The nodes with the name Ethernet [sic] ..." actually, it's
"ethernet".

p. 8: Why are uart node and first ethernet node both at fe001000? Is
that deliberate? That seems wrong.

p. 9: Non-standard property names include orgs fsl, ibm and linux ...
i would be tempted to add samsung since there is a *ton* of samsung
content of that form. Just a thought.

p. 11: "Chapter 4 describes the representation of specific devices
[and?] may also specify additional requirements."

p. 11: Example of compatible property is:

  compatible = "fsl,mpc8641-uart", "ns16550";

No such line appears in the current kernel source, but there is a
*pile* of:

  compatible = "fsl,ns16550", "ns16550";

if one wants to provide an example that actually occurs in the source.

p. 11: What is the "model" property used for? Apart from being
moderately informational, is it used for any compatibility matching?
That short section doesn't make that clear.

p. 12: Regarding the deprecated "linux,phandle" property, the current
linux source using that as part of an actual DTS file appears to
consist entirely of three occurrences:

  arm/boot/dts/imx6qdl-gw560x.dtsi:	linux,phandle = <&reg_vdd_arm>;
  arm/boot/dts/imx6qdl-gw5903.dtsi:	linux,phandle = <&reg_vdd_arm>;
  arm/boot/dts/imx6qdl-gw5903.dtsi:	linux,phandle = <&reg_vdd_soc>;

If those last three instances were fixed, would there be any need to
continue supporting "linux,phandle"?

Still on the topic of phandles, i notice a number of lines of the
form:

  dcr-parent = <&{/cpus/cpu@0}>;

What's with the curly braces there? Perhaps i missed it, but those
don't seem to be explained in the spec. Are curly braces required when
specifying the full path to the node name? If so, is that mentioned
somewhere?

p. 12: One listed value for status is "okay", but I notice a number of
lines in various DTS files:

  status = "ok";

If that's an acceptable alternative, it should be mentioned.

p. 13: "arbitraty"


  i think i need to take a break and read the interrupts section
carefully.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================



--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
