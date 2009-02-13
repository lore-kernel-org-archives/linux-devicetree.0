From: Paul Brook <paul-qD8j1LwMmJjtCj0u4l0SBw@public.gmane.org>
Subject: Re: [Qemu-devel] [RFC] Machine description as data
Date: Fri, 13 Feb 2009 13:33:46 +0000
Message-ID: <200902131333.47141.paul@codesourcery.com>
References: <87iqnh6kyv.fsf@pike.pond.sub.org>
	<200902131206.42427.paul@codesourcery.com>
	<87ocx6pkol.fsf@pike.pond.sub.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <87ocx6pkol.fsf-A7mx1g9ivIOttUaS3K59qNi2O/JbrIOy@public.gmane.org>
Content-Disposition: inline
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
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, Markus Armbruster <armbru-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> Hypothetical example: say the kernel needs to know exactly how the
> interrupts are wired.  But QEMU can wire the interrupts just one way,
> the way it has always wired them.  What's the point in putting that way
> into the machine configuration?  Verifying that whatever is there
> matches reality is no less work than generating the information from
> scratch, isn't it?

Much of the reason for having a machine config is that it allows control over 
things like interrupt routing. Particularly for embedded machines, it's 
common to have a variety of different machines all using the same components, 
but varying in how those components are connected. For example the ARM 
Integrator, Versatile, Realview and Luminary Stellaris boards are all based 
on approximately the same basic set of devices (the ARM PrimeCell SoC 
peripherals), just with different memory maps and interrupt topologies. I 
suspect the same is true for many of the PPC, SH4 and ColdFire boards, and 
probably the different SPARC sun4m/sun4u variants.

Most of the intrastructure to do modular machine construction is already there 
in qemu, it's just currently driven by hardcoded C QEMUMachineInitFunc rather 
than a runtime config.

I guess that's where I see the distinction. Roughly speaking the "machine 
config" replaces pc.c:pc_init1, and the "user config" replaces a lot of the 
goo in vl.c:main, drive_init, etc.

Paul
