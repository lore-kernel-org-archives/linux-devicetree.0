From: Markus Armbruster <armbru@redhat.com>
Subject: Re: [RFC] Machine description as data
Date: Thu, 12 Feb 2009 11:26:46 +0100
Message-ID: <87iqng0x3t.fsf@pike.pond.sub.org>
References: <87iqnh6kyv.fsf@pike.pond.sub.org>
	<1234378228.28751.79.camel@slate.austin.ibm.com>
	<20090212040138.GD31142@yookeroo.seuss>
Reply-To: qemu-devel@nongnu.org
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <qemu-devel-bounces+gceq-qemu-devel=gmane.org@nongnu.org>
In-Reply-To: <20090212040138.GD31142@yookeroo.seuss> (David Gibson's message
	of "Thu\, 12 Feb 2009 15\:01\:38 +1100")
List-Unsubscribe: <http://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.gnu.org/pipermail/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <http://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Sender: qemu-devel-bounces+gceq-qemu-devel=gmane.org@nongnu.org
Errors-To: qemu-devel-bounces+gceq-qemu-devel=gmane.org@nongnu.org
To: Hollis Blanchard <hollisb@us.ibm.com>
Cc: devicetree-discuss@ozlabs.org, qemu-devel@nongnu.org
List-Id: devicetree@vger.kernel.org

David Gibson <dwg@au1.ibm.com> writes:

> On Wed, Feb 11, 2009 at 12:50:28PM -0600, Hollis Blanchard wrote:
>> On Wed, 2009-02-11 at 16:40 +0100, Markus Armbruster wrote:
> [snip]
>> > I briefly examined the DT source format and the tree structure it
>> > describes for the purpose of QEMU configuration.  I decided against
>> > using it in my prototype because I found it awfully low-level and
>> > verbose for that purpose (I'm sure it serves the purpose it was designed
>> > for just fine).  Issues include:
>> > 
>> > * Since the DT is designed for booting kernels, not configuring QEMU,
>> >   there's information that has no place in QEMU configuration, and
>> >   required QEMU configuration isn't there.
>> 
>> What's needed is a "binding" in IEEE1275-speak: a document that
>> describes qemu-specific nodes/properties and how they are to be
>> interpreted.
>> 
>> As an example, you could require that block devices contain properties
>> named "qemu,path", "qemu,backend", etc.
>
> Yes, it shouldn't be hard to annotate an IEEE1275 style tree with
> extra information for qemu's use.

I don't feel up to that task, because I'm not really familiar with
IEEE1275.  Could you help out?

>                                    As for the other direction, in some
> cases it may be appropriate for qemu's device tree code to fill in
> missing device tree properties, based on what the device emulation
> code knows about itself.

Agreed.  Configuration should only contain what is actually
configurable.  Anything else that is needed by a consumer of the tree
should be filled in automatically.

>> > * Redundancy between node name and its device_type property.
>
> Note that "device_type" may not mean what you think.  It describes
> what methods the device support within the OF client interface.  New
> device trees that aren't linked to a full OF implementation with
> client interface should generally omit device_type in most places
> (there are a few special cases for compatibility with OSes that expect
> device_type properties in certain places).

I guess the ignorance I mentioned shows ;)

>> > * Property "reg", which encodes address ranges, does so in terms of
>> >   "cells": #address-cells 32-bit words (big endian) for the address,
>> >   followed by #size-cells words for the size, where #address-cells and
>> >   #size-cells are properties of the enclosing bus.  If this sounds
>> >   like gibberish to you, well, that's my point.
>
> #address-cells and #size-cells takes a little getting used to, but
> it's really not that bad.  It's just a way of representing the fact
> that different busses have different sized address encodings.

I didn't mean to say they are a bad idea for FDTs, just that they're on
an awkward level of abstraction for QEMU configuration.  There, I'd
rather express a PCI address as "02:01.0" than as <0x00000220>.
Translating text to binary is the machine's job, not the user's.
