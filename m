From: Markus Armbruster <armbru-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [Qemu-devel] [RFC] Machine description as data
Date: Fri, 13 Feb 2009 15:13:36 +0100
Message-ID: <871vu2pgq7.fsf@pike.pond.sub.org>
References: <87iqnh6kyv.fsf@pike.pond.sub.org>
	<200902131206.42427.paul@codesourcery.com>
	<87ocx6pkol.fsf@pike.pond.sub.org>
	<200902131333.47141.paul@codesourcery.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <200902131333.47141.paul-qD8j1LwMmJjtCj0u4l0SBw@public.gmane.org> (Paul Brook's message
	of "Fri\, 13 Feb 2009 13\:33\:46 +0000")
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Paul Brook <paul-qD8j1LwMmJjtCj0u4l0SBw@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, qemu-devel-qX2TKyscuCcdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Paul Brook <paul-qD8j1LwMmJjtCj0u4l0SBw@public.gmane.org> writes:

>> Hypothetical example: say the kernel needs to know exactly how the
>> interrupts are wired.  But QEMU can wire the interrupts just one way,
>> the way it has always wired them.  What's the point in putting that way
>> into the machine configuration?  Verifying that whatever is there
>> matches reality is no less work than generating the information from
>> scratch, isn't it?
>
> Much of the reason for having a machine config is that it allows control over 
> things like interrupt routing. Particularly for embedded machines, it's 
> common to have a variety of different machines all using the same components, 
> but varying in how those components are connected. For example the ARM 
> Integrator, Versatile, Realview and Luminary Stellaris boards are all based 
> on approximately the same basic set of devices (the ARM PrimeCell SoC 
> peripherals), just with different memory maps and interrupt topologies. I 
> suspect the same is true for many of the PPC, SH4 and ColdFire boards, and 
> probably the different SPARC sun4m/sun4u variants.

We make stuff configurable in QEMU when we need it more than one way.
While the kernel wants to see configuration when it could conceivably
exist in more than one way.

> Most of the intrastructure to do modular machine construction is already there 
> in qemu, it's just currently driven by hardcoded C QEMUMachineInitFunc rather 
> than a runtime config.
>
> I guess that's where I see the distinction. Roughly speaking the "machine 
> config" replaces pc.c:pc_init1, and the "user config" replaces a lot of the 
> goo in vl.c:main, drive_init, etc.
>
> Paul

Not that I disagree with that.

Look, my goals are rather modest.  I want to start where we are, put
devices behind a nice abstract interface one by one, picking apart the
pc.c hairball on the way.  The idea is not to design the perfect,
all-encompassing abstract device interface, just to capture what we
need, and extend as we go.  The abstract device interface makes a simple
machine builder possible, driven by tree-structured configuration.  That
in turn makes it easier to make things configurable.  Which can be
expected to lead to more configurability, when and where there's a need
for it.

All this can be done in nice, safe baby steps.  I don't need to come up
with an all-singing machine description fit for a picky kernel before I
can start doing something useful.

Now, if you hand me such a configuration on a platter, I'd be a fool not
to take it.  The catch: I need one for a PC.

I believe there's significant overlap in what we two want to accomplish.
We just come from different directions, with somewhat differing
priorities.
