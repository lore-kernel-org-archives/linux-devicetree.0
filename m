From: David Gibson <dwg-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [Qemu-devel] [RFC] Machine description as data
Date: Fri, 13 Feb 2009 12:46:32 +1100
Message-ID: <20090213014632.GF8104@yookeroo.seuss>
References: <20090212040138.GD31142@yookeroo.seuss>
	<20090212.094613.514366467.imp@bsdimp.com>
	<4994B22E.6060608@gmx.net>
	<200902122358.25864.paul@codesourcery.com>
	<4994BF93.2070409@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4994BF93.2070409-hi6Y0CQ0nG0@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Carl-Daniel Hailfinger <c-d.hailfinger.devel.2006-hi6Y0CQ0nG0@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, Paul Brook <paul-qD8j1LwMmJjtCj0u4l0SBw@public.gmane.org>, hollisb-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org, qemu-devel-qX2TKyscuCcdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Feb 13, 2009 at 01:32:19AM +0100, Carl-Daniel Hailfinger wrote:
> On 13.02.2009 00:58, Paul Brook wrote:
> >> Unless I'm mistaken, Linux is able to probe most hardware properties.
> >
> > You are badly mistaken.
> 
> Point taken.
> 
> 
> > On x86 workstation/server class hardware you might get away with it because 
> > everything interesting is either  standard legacy ports or PCI, and your 
> > firmware/bios already took care of the really hairy bits.
> 
> If the firmware doesn't set up the things which can't be probed, can it
> even be called firmware or is it more like a glorified bootloader?

A bootloader, not even much glorified, is often all there is on
embedded systems.

> > On embedded systems there's often very little that can be automatically 
> > detected, much less functionality provided by the firmware (You're lucky if 
> > all your RAM is even turned on!) and you just have to know where stuff is.
> 
> Ouch. I always thought turning on all the RAM was either a hardware (old
> x86) or firmware (modern x86) task.
> 
> I'm a bit surprised by the lack of automatically detectable features in
> embedded systems. Wouldn't automatic detection allow reusing whole OS
> images on slighly different systems and thus lower development cost?

Automatic detection requires protocols between hardware, firmware and
OS to implement it.  The ones that exist for full systems are too
heavyweight for embedded systems, or assume things about the hardware
setup that don't suit what embedded systems want to include.
Typically it's just been easier for embedded vendors to hack their
kernels to know the hardware directly.

The tradeoffs we've made for use of flattened device trees represent
an effort to achieve lower development cost precisely as you describe
here.  Inherently probably hardware (e.g. PCI, USB) is mostly omitted
from the tree, leaving a minimal blob of almost static information
which the firmware/bootloader can include to tell the OS about the
hardware setup while still having almost no "moving parts".

The kernel can still neatly support systems which don't provide a
flattened tree by being built with a wrapper.  The wrapper, which is
specific to a particular hardware/firmware combination contains a
flattened tree, plus some code to tweak it with what little
information the embedded firmware / hardware does provide (ram size
and flash size are common examples).

This way we have a kernel which can run unmodified on many systems
which do provide a flattened tree, and we're no worse off for systems
which don't (a hardware specific kernel is replaced by a hardware
specific kernel+wrapper combination).

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
