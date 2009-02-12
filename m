From: Markus Armbruster <armbru-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [Qemu-devel] [RFC] Machine description as data
Date: Thu, 12 Feb 2009 19:53:24 +0100
Message-ID: <87fxijwkpn.fsf@pike.pond.sub.org>
References: <87iqnh6kyv.fsf@pike.pond.sub.org>
	<1234378228.28751.79.camel@slate.austin.ibm.com>
	<20090212040138.GD31142@yookeroo.seuss>
	<87iqng0x3t.fsf@pike.pond.sub.org>
	<1234461162.20305.16.camel@slate.austin.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <1234461162.20305.16.camel-EGjIuKC2qUdB0N6nvOmcJFaTQe2KTcn/@public.gmane.org> (Hollis
	Blanchard's message of "Thu\, 12 Feb 2009 11\:52\:42 -0600")
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Hollis Blanchard <hollisb-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, qemu-devel-qX2TKyscuCcdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hollis Blanchard <hollisb-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org> writes:

> On Thu, 2009-02-12 at 11:26 +0100, Markus Armbruster wrote:
>>  David Gibson <dwg-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org> writes:
>> 
>> > On Wed, Feb 11, 2009 at 12:50:28PM -0600, Hollis Blanchard wrote:
>> >> On Wed, 2009-02-11 at 16:40 +0100, Markus Armbruster wrote:
>> > [snip]
>> >> > I briefly examined the DT source format and the tree structure it
>> >> > describes for the purpose of QEMU configuration.  I decided
>> against
>> >> > using it in my prototype because I found it awfully low-level and
>> >> > verbose for that purpose (I'm sure it serves the purpose it was
>> designed
>> >> > for just fine).  Issues include:
>> >> > 
>> >> > * Since the DT is designed for booting kernels, not configuring
>> QEMU,
>> >> >   there's information that has no place in QEMU configuration,
>> and
>> >> >   required QEMU configuration isn't there.
>> >> 
>> >> What's needed is a "binding" in IEEE1275-speak: a document that
>> >> describes qemu-specific nodes/properties and how they are to be
>> >> interpreted.
>> >> 
>> >> As an example, you could require that block devices contain
>> properties
>> >> named "qemu,path", "qemu,backend", etc.
>> >
>> > Yes, it shouldn't be hard to annotate an IEEE1275 style tree with
>> > extra information for qemu's use.
>> 
>> I don't feel up to that task, because I'm not really familiar with
>> IEEE1275.  Could you help out?
>
> I'm not really a "language lawyer" for device trees, but I can help.

Appreciated!

> FWIW, I was imagining (from a PowerPC point of view) that a strict
> subset of the device tree interpreted by qemu would be passed into the
> guest. In other words, once qemu is done with it, it would strip every
> property prefixed with "qemu," and copy the result into guest memory.
> PowerPC kernels require this data structure, and even when firmware runs
> in the guest, you still need to tell the firmware what the system layout
> is, and the device tree is an obvious candidate...
>
> For x86, maybe it doesn't make sense to have in-guest BIOS split a
> qemu-provided device tree into all the nasty BIOS data structures, but I
> just wanted to give you an idea of how this could be used on multiple
> architectures.

We want a machine configuration: a tree describing configurable devices
and their configurable properties.

For PowerPC, we also want a machine description: a tree describing those
devices and properties that the kernel can't easily and safely probe.

Now, there will be some overlap, and to get the machine description, you
surely want to start with the machine configuration.  But you'll
certainly have to add information beyond configuration.  Just stripping
out "qemu," properties won't do, I fear, unless you're happy to put tons
of stuff in the configuration file that is not actually configurable.
Which would likely annoy its human users.  And what to do with it?  Just
pass it on?  Or verify it matches reality?  Wouldn't that work be better
spent on generating the additional information on the fly, for the
targets that need it?

Once again, I'm not opposed to using some FDT binding for QEMU
configuration.  Syntax is superficial anyway.  It's the tree that
matters.
