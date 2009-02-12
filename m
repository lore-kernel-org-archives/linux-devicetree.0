From: Markus Armbruster <armbru@redhat.com>
Subject: Re: [RFC] Machine description as data
Date: Thu, 12 Feb 2009 11:26:12 +0100
Message-ID: <87k57w0x4r.fsf@pike.pond.sub.org>
References: <87iqnh6kyv.fsf@pike.pond.sub.org>
	<1234378228.28751.79.camel@slate.austin.ibm.com>
Reply-To: qemu-devel@nongnu.org
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <qemu-devel-bounces+gceq-qemu-devel=gmane.org@nongnu.org>
In-Reply-To: <1234378228.28751.79.camel@slate.austin.ibm.com> (Hollis
	Blanchard's message of "Wed\, 11 Feb 2009 12\:50\:28 -0600")
List-Unsubscribe: <http://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.gnu.org/pipermail/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <http://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Sender: qemu-devel-bounces+gceq-qemu-devel=gmane.org@nongnu.org
Errors-To: qemu-devel-bounces+gceq-qemu-devel=gmane.org@nongnu.org
To: qemu-devel@nongnu.org
Cc: devicetree-discuss@ozlabs.org
List-Id: devicetree@vger.kernel.org

Hollis Blanchard <hollisb@us.ibm.com> writes:

> On Wed, 2009-02-11 at 16:40 +0100, Markus Armbruster wrote:
>> Sorry for the length of this memo.  I tried to make it as concise as I
>> could.  And there's working mock-up source code to go with it.
[...]
>> Appendix: Linux device trees
>> ----------------------------
>> 
>> This appendix is probably only of interest to some of you, feel free to
>> skip.
>> 
>> The IEEE 1275 Open Firmware Device Tree solves a somewhat similar
>> problem, namely to communicate environmental information (hardware and
>> configuration) from firmware to operating system.  It's chiefly used on
>> PowerPCs.  The OS calls Open Firmware to query the device tree.
>> 
>> Linux turns the Open Firmware device tree API into a data format.
>> Actually two: the DT blob format is a binary data structure, and the
>> DT source format is human-readable text.  The device tree compiler
>> "dtc" can convert the two.
>> 
>> We already have a bit of code dealing with this, in device_tree.c.
>> 
>> I briefly examined the DT source format and the tree structure it
>> describes for the purpose of QEMU configuration.  I decided against
>> using it in my prototype because I found it awfully low-level and
>> verbose for that purpose (I'm sure it serves the purpose it was designed
>> for just fine).  Issues include:
>> 
>> * Since the DT is designed for booting kernels, not configuring QEMU,
>>   there's information that has no place in QEMU configuration, and
>>   required QEMU configuration isn't there.
>
> What's needed is a "binding" in IEEE1275-speak: a document that
> describes qemu-specific nodes/properties and how they are to be
> interpreted.
>
> As an example, you could require that block devices contain properties
> named "qemu,path", "qemu,backend", etc.
>
>> * Redundancy between node name and its device_type property.
>> 
>> * Property "reg", which encodes address ranges, does so in terms of
>>   "cells": #address-cells 32-bit words (big endian) for the address,
>>   followed by #size-cells words for the size, where #address-cells and
>>   #size-cells are properties of the enclosing bus.  If this sounds
>>   like gibberish to you, well, that's my point.
>
> I'm CCing devicetree-discuss for broader discussion.
>
> I won't say IEEE1275 is perfect, but IMHO it would be pretty silly to
> reinvent all the design and infrastructure for a similar-but-different
> device tree.
>
> [Patch snipped]

I'm not at all opposed to adapting FDT for QEMU use.  My patch is a
prototype, and I'm prepared to throw away some or all of it.

To get this thing started, I wanted working code to demonstrate what I'm
talking about.  If I had dug deeper into FDTs first, we would not be
talking now.

The task I outlined in my memo involves much more than just coming up
with a device tree data structure.  That data structure is to me one
detail among many, and a much less hairy one than most others.  It
certainly was for the prototype.

If I read the comments correctly (all comments, not just this one), the
only real issue with my proposal is you'd rather use FDT for the config
tree.  I don't mind, except I don't know enough about that stuff to do
it all by myself, at least not in a reasonable time frame.  I think I
understand the concepts, can read .dts files with some head-scratching,
and I could perhaps even write one if I sacrificed a chicken or two.
Designing a binding, however, feels well above my level of
(in)competence.

So, to make FDT happen, I need help.  Specifically:

* Point me to the FDT code I'm supposed to integrate.  I'm looking for
  basic decorated tree stuff: create trees, traverse them, get and put
  properties, add and delete nodes, read and write them as plain,
  human-readable text.

* Provide an example tree describing a bare-bones PC, like the one in my
  prototype: CPU, RAM, BIOS, PIC, APIC, IOAPIC, PIT, DMA, UART, parallel
  port, floppy controller, CMOS & RTC, a20 gate (port 92) and other
  miscellanous I/O ports, i440fx, PIIX3 (ISA bridge, IDE, USB, ACPI),
  Cirrus VGA with BIOS, some PCI NIC.  This gives us all an idea of the
  tree structure.  Morphing that into something suitable for QEMU
  configuration shouldn't be too hard then, just an exercice in
  redecorating the tree.

* Advice as we go.

Volunteers?
