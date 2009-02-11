From: Hollis Blanchard <hollisb-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
Subject: Re: [Qemu-devel] [RFC] Machine description as data
Date: Wed, 11 Feb 2009 12:50:28 -0600
Message-ID: <1234378228.28751.79.camel@slate.austin.ibm.com>
References: <87iqnh6kyv.fsf@pike.pond.sub.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <87iqnh6kyv.fsf-A7mx1g9ivIOttUaS3K59qNi2O/JbrIOy@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: qemu-devel-qX2TKyscuCcdnm+yROfE0A@public.gmane.org
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 2009-02-11 at 16:40 +0100, Markus Armbruster wrote:
> Sorry for the length of this memo.  I tried to make it as concise as I
> could.  And there's working mock-up source code to go with it.
> 
> 
> Configuration should be data
> ----------------------------
> 
> A QEMU machine (selected with -M) is described by a struct QEMUMachine.
> Which contains almost nothing of interest.  Pretty much everything,
> including all the buses and devices is instead created by the machine's
> initialization function.
> 
> Init functions consider a plethora of ad hoc configuration parameters
> set by command line options.  Plenty of stuff remains hard-coded all
> the same.
> 
> Configuration should be data, not code.
> 
> A machine's buses and devices can be expressed as a device tree.  More
> on that below.
> 
> The need for a configuration file
> ---------------------------------
> 
> The command line is a rather odd place to define a virtual machine.
> Command line is fine for manipulating a particular run of the machine,
> but the machine description belongs into a configuration file.
> 
> Once configuration is data, we should be able to initialize it from a
> configuration file with relative ease.
> 
> However, this memo is only about the *internal* representation of
> configuration.  How we get there from a configuration file is a separate
> question.  It's without doubt a relevant question, but I feel I need to
> limit my scope to have a chance of getting anywhere.
> 
> The need for an abstract device interface
> -----------------------------------------
> 
> Currently, each virtual device is created, configured and initialized in
> its own idiosyncratic way.  Some configuration is received as arguments,
> some is passed in global variables.
> 
> This is workable as long as the machine is constructed by ad hoc init
> function code.  The resulting init function tends to be quite a
> hairball, though.
> 
> I'd like to propose an abstract device interface, so we can build a
> machine from its (tree-structured) configuration using just this
> interface.  Device idiosyncrasies are to be hidden in the driver code
> behind the interface.
> 
> What I propose to do
> --------------------
> 
> A. Configuration as data
> 
>    Define an internal machine configuration data structure.  Needs to be
>    sufficiently generic to be able to support even oddball machine
>    types.  Make it a decorated tree, i.e. a tree of named nodes with
>    named properties.
> 
>    Create an instance for a prototype machine type.  Make it a PC,
>    because that's the easiest to test.
> 
>    Define an abstract device interface, initially covering just device
>    configuration and initialization.
> 
>    Implement the device interface for the devices used by the prototype
>    machine type.
> 
>    Do not break existing machine types here.  This means we need to keep
>    legacy interfaces until their last user is gone (step B).  Could
>    become somewhat messy in places for a while.
> 
> B. Convert all the existing machine configurations to data.
> 
>    This can and should be done incrementally, each machine by people who
>    care and know about it.
> 
>    Clean up the legacy interfaces now unused, and any messes we made
>    behind them.
> 
> C. Read (and maybe write) machine configuration
> 
>    The external format to use is debatable.  Compared to the rest of the
>    task, its choice looks like detail to me, but I'm biased ;)
> 
>    Writing the data could be useful for debugging.
> 
> D. Command line options to modify the configuration tree
> 
>    If we want them.
> 
> E. Make legacy command line modify the configuration tree
> 
>    For compatibility.  This is my "favourite" part.
> 
> We need to start with A.  The other tasks are largely independent.
> 
> What I've already done
> ----------------------
> 
> Show me the code, they say.  Find attached a working prototype of step
> A.  It passes the "Linux boots" test for me.  I didn't bother to rebase
> to current HEAD, happy do to that on request.
> 
> Instead of hacking up machine "pc", I created a new machine "pcdt".  I
> took a number of shortcuts:
> 
> * I put the "pcdt" code into the new file dt.c, and copied code from
>   pc.c there.  I could have avoided that by putting my code in pc.c
>   instead.  Putting it in a new file helped me pick apart the pc.c
>   hairball.  To be cleaned up.
> 
> * I copied code from net.c.  Trivial to fix, just give it external
>   linkage there.
> 
> * I hard-coded the configuration tree in the wrong place (tree.c), out of
>   laziness.
> 
> * I didn't implement all the devices of the "pc" original.  The devices
>   I implemented might not support all existing command line options.
> 
> Notable qualities:
> 
> * Device drivers are cleanly separated from each other, and from the
>   device-agnostic configuration code.
> 
> * Each driver specifies the configurable properties in a single place.
> 
> * Device configuration is gotten from the configuration tree, which is
>   fully checked.  Unknown properties are rejected.
> 
> 
> Appendix: Linux device trees
> ----------------------------
> 
> This appendix is probably only of interest to some of you, feel free to
> skip.
> 
> The IEEE 1275 Open Firmware Device Tree solves a somewhat similar
> problem, namely to communicate environmental information (hardware and
> configuration) from firmware to operating system.  It's chiefly used on
> PowerPCs.  The OS calls Open Firmware to query the device tree.
> 
> Linux turns the Open Firmware device tree API into a data format.
> Actually two: the DT blob format is a binary data structure, and the
> DT source format is human-readable text.  The device tree compiler
> "dtc" can convert the two.
> 
> We already have a bit of code dealing with this, in device_tree.c.
> 
> I briefly examined the DT source format and the tree structure it
> describes for the purpose of QEMU configuration.  I decided against
> using it in my prototype because I found it awfully low-level and
> verbose for that purpose (I'm sure it serves the purpose it was designed
> for just fine).  Issues include:
> 
> * Since the DT is designed for booting kernels, not configuring QEMU,
>   there's information that has no place in QEMU configuration, and
>   required QEMU configuration isn't there.

What's needed is a "binding" in IEEE1275-speak: a document that
describes qemu-specific nodes/properties and how they are to be
interpreted.

As an example, you could require that block devices contain properties
named "qemu,path", "qemu,backend", etc.

> * Redundancy between node name and its device_type property.
> 
> * Property "reg", which encodes address ranges, does so in terms of
>   "cells": #address-cells 32-bit words (big endian) for the address,
>   followed by #size-cells words for the size, where #address-cells and
>   #size-cells are properties of the enclosing bus.  If this sounds
>   like gibberish to you, well, that's my point.

I'm CCing devicetree-discuss for broader discussion.

I won't say IEEE1275 is perfect, but IMHO it would be pretty silly to
reinvent all the design and infrastructure for a similar-but-different
device tree.

[Patch snipped]

-- 
Hollis Blanchard
IBM Linux Technology Center
