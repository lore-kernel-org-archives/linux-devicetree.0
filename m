From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Devicetree Workshop at Kernel Summit Prague (26 Oct 2017)
Date: Wed, 25 Oct 2017 22:47:38 -0700
Message-ID: <a8f2cdf3-7432-68f1-ee43-6c000b5d8c61@gmail.com>
References: <CACxGe6sxKzNKZbdGA-G=Th2oHwuanyC2kGYuaFcKbSRkuhep+Q@mail.gmail.com>
 <CACxGe6vhYV5dbnNQXyRoPq=XSA5HOtpN0FCqyoKvGVbRu-aRqA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACxGe6vhYV5dbnNQXyRoPq=XSA5HOtpN0FCqyoKvGVbRu-aRqA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "ksummit-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Kumar Gala <kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 10/19/17 04:10, Grant Likely wrote:
> Hi folks,
> 
> I've flushed out the schedule. It is still a draft, but I've got names
> against the topics and put them into a rough order.
> 
> If your name is listed below, it means I've asked you to frame the
> problem and moderate discussion for that topic. I'm *not* asking you
> to present unless the topic is specifically listed as a presentation.
> If you want you can have a slide or two, but you must get them to me
> by Tuesday evening, 24 October. I want to keep the time fiddling with
> projectors to a minimum.
> 
> Originally this was intended as a 1/2 day workshop, but given that we
> have the room for the full day, I've spread things out to give a bit
> more time for hallway track. I can also move things around if need be
> to avoid conflicts with the maintainers summit and KVM forum. The
> maintenance topics are in the afternoon under the assumption that
> there are folks in the maintainers summit who will want to attend. The
> tooling and schema topics are in the morning. I've also tried really
> hard to preserve the breaks and lunch to give time for hallway
> discussion.
> 
> As always, none of this is set in stone. If you have any specific
> conflicts or concerns then please say so.
> 
> Cheers,
> g.
> 
> ==Morning==
> 9:30 Welcome and Schedule bashing (0:10) (Grant Likely)
>
> ===Tooling & Schema===
> 9:40 (5min) Encoding and Schema checking: Framing the problem (Grant Likely)
> 9:45 (15min) DT YAML encoding overview (Pantelis Antoniou - presentation)
> 10:00 (20min) YAML encoding discussion
> 10:20 (15min) DT Schema format - option 1 (Pantelis Antoniou - presentation)
> 10:35 (15min) DT Schema format - option 2 (Grant Likely - presentation)
> 10:50 (20min) DT Schema discussion - what should go in the spec?
> 

< snip >

I want to share some information behind a topic that I will bring up
during the discussion.  One thing that is important in the validation
is being able to report the source file and location in the source
file of any validation warning or error.  I was working on how to
generate that information from dtc when run in the mode of source
input and source output.  Due to my total lack of knowledge of yacc,
and attempt to provide a solution without truly learning yacc, my
efforts were somewhat extended, and then I ran out of free time,
and moved the project to my "todo" list, where it still sits.

The main concept I want to share is having an agreed upon format of
how to represent location information for the device tree source
file that is the result of having processed cpp and processed the
/include/ directives.  The following attached email is an example
of the concept (that was aimed at humans trying to resolve compile
errors or understand what file had to be modified to change the
final value of an item such as a property, which might be specified
and re-specified multiple times.  So it is not a proposal of what
would be a good format for the validation tools, but instead a
concrete example for people to understand the concept.




-------- Forwarded Message --------
Subject: [RFC PATCH v6 0/2] dtc: dts source location annotation
Date: Fri, 02 Oct 2015 21:44:05 -0700
From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Reply-To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
To: david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org, jdl-CYoMK+44s/E@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Proof of concept patch.

Annotates input source file and line number of nodes and properties
as comments in output .dts file when --annotate flag is supplied.


A common dts source file convention is for a system .dts file
to include default SOC and/or device .dtsi files and then add
additional system specific properties or over-ride property values
from the .dtsi files.  It can be a time consuming and error prone
exercise to determine exactly what nodes, properties, and property
values are in the final .dtb binary blob and where they originated.

Modify the dtc compiler to read a (possibly cpp pre-processed) .dts
file and for the output .dts annotate each node and property with
the corresponding source location.

As an example, one device tree node for the dragonboard in the
Linux kernel source tree (hand edited to remove leading path
components) is:

  -----  long format  -----

  sdhci@f9824900 { /* qcom-apq8074-dragonboard.dts:14.3-18.5 */
        compatible = "qcom,sdhci-msm-v4"; /* qcom-msm8974.dtsi:240.4-37 */
        reg = <0xf9824900 0x11c 0xf9824000 0x800>; /* qcom-msm8974.dtsi:241.4-49 */
        reg-names = "hc_mem", "core_mem"; /* qcom-msm8974.dtsi:242.4-37 */
        interrupts = <0x0 0x7b 0x0 0x0 0x8a 0x0>; /* qcom-msm8974.dtsi:243.4-38 */
        interrupt-names = "hc_irq", "pwr_irq"; /* qcom-msm8974.dtsi:244.4-42 */
        clocks = <0xd 0xd8 0xd 0xd7>; /* qcom-msm8974.dtsi:245.4-36 */
        clock-names = "core", "iface"; /* qcom-msm8974.dtsi:246.4-34 */
        status = "ok"; /* qcom-apq8074-dragonboard.dts:17.4-18 */
        bus-width = <0x8>; /* qcom-apq8074-dragonboard.dts:15.4-20 */
        non-removable; /* qcom-apq8074-dragonboard.dts:16.4-18 */
  }; /* qcom-apq8074-dragonboard.dts:14.3-18.5 */


  ----- short format  -----

  sdhci@f9824900 { /* qcom-apq8074-dragonboard.dts:14 */
        compatible = "qcom,sdhci-msm-v4"; /* qcom-msm8974.dtsi:240 */
        reg = <0xf9824900 0x11c 0xf9824000 0x800>; /* qcom-msm8974.dtsi:241 */
        reg-names = "hc_mem", "core_mem"; /* qcom-msm8974.dtsi:242 */
        interrupts = <0x0 0x7b 0x0 0x0 0x8a 0x0>; /* qcom-msm8974.dtsi:243 */
        interrupt-names = "hc_irq", "pwr_irq"; /* qcom-msm8974.dtsi:244 */
        clocks = <0xd 0xd8 0xd 0xd7>; /* qcom-msm8974.dtsi:245 */
        clock-names = "core", "iface"; /* qcom-msm8974.dtsi:246 */
        status = "ok"; /* qcom-apq8074-dragonboard.dts:17 */
        bus-width = <0x8>; /* qcom-apq8074-dragonboard.dts:15 */
        non-removable; /* qcom-apq8074-dragonboard.dts:16 */
  }; /* qcom-apq8074-dragonboard.dts:18 */


qcom-apq8074-dragonboard.dts:
   - last referenced the sdhci node
   - changed the value of the "status" property from "disabled" to "ok"
   - added two properties, "bus-width" and "non-removable"

qcom-msm8974.dtsi:
   - initially set the value the "status" property to "disabled"
     (not visible in the annotated .dts)
   - provided all of the other property values


When the dtc compiler is run within the Linux kernel build system,
the path of the source files will be the full absolute path, just
as seen for gcc warnings and errors.  I always trim away the path
leading up to the Linux kernel source tree by passing the kernel
build output through a sed pipe.  I have done the same to the
above example to remove the excessive verbosity in the source paths.

Implementation notes:

  - Added new function srcpos_string_short() which is similar to
    srcpos_string() but limits the location information to one
    line number.  The fuller output of srcpos_string() adds noise
    to the annotation which (in my opinion) is not especially
    useful in this specific context.

    The one downside to this choice is that the column numbers for
    multiple properties on the same input line will not be reported.
    This is unlikely to be an issue unless a .dts contains all of
    the properties on a single line (which might be the case for
    a machine generated .dts).  I do not think that the extra
    noise for the common case justifies handling this case.

  - The source location of each node and property is saved in the
    respective node or property during the parse phase because
    the source location information from current_srcfile is no longer
    available when the final values are written out from dt_to_source()
    and the functions that it calls.

  - A check is added to dtc.c to ensure that input and output format
    are both device tree source.  An alternate choice would be to
    turn off the --annotate flag if either the input file or the
    output file is not device tree source.  In the alternate case,
    the disabling of --annotate could be silent or a warning could
    be issued.


TODO:
  - Update "make check" tests to reflect review comments.
  - Test against a wider set of .dts files.  There are some rules
    that I did not test extensively (and some rules, such as delete
    that I did not test at all in this version).
  - Change the --annotate option to choose either long or short format.
  - Fix location for:  devicetree: '/' nodedef


Changes from v5:
  - Add more pointer checking to patch 1.
  - Change from two to one srcpos fields in struct node.  Move the
    logic to choose begin or end to the annotation print logic for
    the case of short location format.
  - Move the setting of srcpos back to name_node() and build_prop()
    instead of adding new functions to save that information.
  - Patch 2 reports the location in long format (beginning and end
    of the object).  Adding patch 3 changes for format to short (the
    current source line only).
.
