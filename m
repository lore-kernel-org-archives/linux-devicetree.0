From: Markus Armbruster <armbru-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [Qemu-devel] [RFC] Machine description as data
Date: Fri, 13 Feb 2009 13:48:10 +0100
Message-ID: <87ocx6pkol.fsf@pike.pond.sub.org>
References: <87iqnh6kyv.fsf@pike.pond.sub.org>
	<20090213003724.GA8104@yookeroo.seuss>
	<87ab8qr317.fsf@pike.pond.sub.org>
	<200902131206.42427.paul@codesourcery.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <200902131206.42427.paul-qD8j1LwMmJjtCj0u4l0SBw@public.gmane.org> (Paul Brook's message
	of "Fri\, 13 Feb 2009 12\:06\:41 +0000")
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

Paul Brook <paul-qD8j1LwMmJjtCj0u4l0SBw@public.gmane.org> writes:

>> Now let's examine how QEMU machine configuration and FDT machine
>> descriptions for kernels are related.
>>
>> In a way, both can be regarded as copies of a complete machine
>> description with lots of stuff pruned.  Except the complete machine
>> description doesn't exist.  Because there is no use for it.
>>
>> FDT routinely prunes stuff like PCI and USB devices, because those are
>> better probed.
>>
>> QEMU configuration should certainly prune everything that is not
>> actually configurable.
>
> I'm not sure I agree here, or at least we may be talking past each other.

That could be my fault; I guess I didn't express myself clearly.  What
"configurable" means depends on your point of view.

One point of view is assembling pieces of QEMU functionality into a
virtual machine type.  You call that "machine config" below.

Another point of view is configuring a specific virtual machine, based
on a virtual machine type.  I think you call that "user config" below.

In my view, we start with static machine configuration, which we then
modify according to the user's wishes.  The result then drives the
construction of the virtual machine.

My prototype has the static machine configuration compiled in, but I
think it belongs in a config file.

A config file would also be convenient for users.  I guess we'll also
want to support existing command line options, at least for some time.

I'm arguing that both the static machine configuration and the final
configuration (after user config is edited in) lack stuff that needs to
be put into the FDT for the kernel.

Hypothetical example: say the kernel needs to know exactly how the
interrupts are wired.  But QEMU can wire the interrupts just one way,
the way it has always wired them.  What's the point in putting that way
into the machine configuration?  Verifying that whatever is there
matches reality is no less work than generating the information from
scratch, isn't it?

> IMHO the machine config should specify all the bits of the machine that don't 
> really want to be exposed to the average user. e.g. the memory layout and 
> interrupt routings, etc. We then have a seaparate user config file (possibly 
> structured differently) which exposes things like host bindings for disks and 
> network devices.
>
> It's all a bit muddy because the current commandline options effect both the 
> devices present and the host bindings for the corresponding interfaces. While 
> this seems like a good idea to start with, I'm not convinced this is actually 
> a desirable feature.  Certainly for embedded machines you want a fixed set of 
> hardware. e.g. if we have a SoC with 3 UARTs we should always create those 3 
> devices, and it's not meaningful to have more. If the user doesn't specify 
> sufficient -serial options then the remainder just get connected 
> to /dev/null. Likewise there's a good argument for having the vlan and disc 
> configuration be separate from creation of the NIC/HBA devices.
>
> One possibility is that it might actually make more sense to specify 
> hot-pluggable devices (e.g. PCI and USB) in a sumilar way that they would be 
> added at runtime, rather than trying to force them into a static tree.
>
> My implementation focsed on just the machine config, mostly ignoring the user 
> config and host bindings.
>
> Paul

I'm still reading your code.  It would help if you could provide a
Makefile patch that let me actually build it.

My initial impression is that we both approached the problem from
different directions, yet converged on fairly similar solutions.  Each
of us covers stuff the other glossed over.  More later.
