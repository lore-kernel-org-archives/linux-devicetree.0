From: Serge Semin <fancer.lancer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 00/21] MIPS memblock: Remove bootmem code and switch to
 NO_BOOTMEM
Date: Mon, 22 May 2017 16:03:48 +0300
Message-ID: <20170522130348.GA20910@mobilestation>
References: <1482113266-13207-1-git-send-email-fancer.lancer@gmail.com>
 <be0b6614-708d-a32a-029d-7e606a673e5b@imgtec.com>
 <20170522102643.GA17763@mobilestation>
 <ef3d7a8c-2a73-2082-0d64-bdb4f95df204@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <ef3d7a8c-2a73-2082-0d64-bdb4f95df204-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joshua Kinard <kumba-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: Marcin Nowakowski <marcin.nowakowski-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, rabinv-VrBV9hrLPhE@public.gmane.org, matt.redfearn-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, alexander.sverdlin-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Sergey.Semin-vHJ8rsvMqnUPfZBKTuL5GA@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello folks,

On Mon, May 22, 2017 at 08:47:20AM -0400, Joshua Kinard <kumba-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> wrote:
> On 05/22/2017 06:26, Serge Semin wrote:
> > On Mon, May 22, 2017 at 11:48:36AM +0200, Marcin Nowakowski <marcin.nowakowski-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org> wrote:
> > 
> > Hello Marcin,
> > 
> >> Hi Serge,
> >>
> >> On 19.12.2016 03:07, Serge Semin wrote:
> >>> Most of the modern platforms supported by linux kernel have already
> >>> been cleaned up of old bootmem allocator by moving to nobootmem
> >>> interface wrapping up the memblock. This patchset is the first
> >>> attempt to do the similar improvement for MIPS for UMA systems
> >>> only.
> >>>
> >>> Even though the porting was performed as much careful as possible
> >>> there still might be problem with support of some platforms,
> >>> especially Loonson3 or SGI IP27, which perform early memory manager
> >>> initialization by their self.
> >>>
> >>> The patchset is split so individual patch being consistent in
> >>> functional and buildable ways. But the MIPS early memory manager
> >>> will work correctly only either with or without the whole set being
> >>> applied. For the same reason a reviewer should not pay much attention
> >>> to methods bootmem_init(), arch_mem_init(), paging_init() and
> >>> mem_init() until they are fully refactored.
> >>>
> >>> The patchset is applied on top of kernel v4.9.
> >>
> >> Have you progressed any further with these patches?
> >> They would definitely be useful to include for MIPS arch, so can you let us
> >> know if you are planning to send any updated version?
> >>
> >> thanks,
> >> Marcin
> > 
> > Sorry for such a long delay with response. I have been really busy
> > during last three months. Alas I'll still be busy for next 1-2
> > months as well. You know how it usually works with urgent projects.
> > One needs to do this thing, then that thing, and at some point I just
> > forgot about this thread.
> > 
> > Regarding the patchset. I'm still pretty much eager to make it being
> > part of kernel MIPS arch. But there was a problem I outlined
> > in the patchset header message, which I can't fix by myself.
> > Particulary It's connected with Loonson3 or SGI IP27 code alteration,
> > so to make it free of ancient boot_mem_map dependencies (see the
> > patchset header message). Without a help from someone, who has
> > Loonson64 and SGI IP27 hardware and strong desire to make it free of
> > old bootmem allocator, it is useless to make any progress from my
> > side. That's why Ralf moved this email-thread into RFC actually.
> > Anyway If either you or someone else has got such hardware and is
> > interested in the cooperation, I'll be more than happy to push
> > my efforts forward with this patchset contribution. But only after
> > I got a bit less busy with my work. As I said it will happen within
> > next 1-2 months. So do you have the hardware and desire to be part
> > of this?
> > 
> > Regards,
> > -Sergey
> 
> I have an SGI Onyx2 and just recently acquired a working SGI Origin 200.  The
> Onyx2 has NUMA issues yet to be hunted down, but I got ~3 days uptime out of
> the Origin 200 running compiles before powering it down.  Mainline needs 2-3
> small patches to make IP27 workable, last I tested.
> 
> I'd have to look at the IP27 code again and see if I can make sense of what
> it's doing.  I think it dealt with either setting up memory for an initrd
> (which I haven't used in over a decade), or it's for the NUMA stuff to discover
> all memory on each node.
> 
> -- 
> Joshua Kinard
> Gentoo/MIPS
> kumba-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org
> 6144R/F5C6C943 2015-04-27
> 177C 1972 1FB8 F254 BAD0 3E72 5C63 F4E3 F5C6 C943
> 
> "The past tempts us, the present confuses us, the future frightens us.  And our
> lives slip away, moment by moment, lost in that vast, terrible in-between."
> 
> --Emperor Turhan, Centauri Republic

It's great to hear of your willingness to help. Since both Loonson64 and SGI IP27
problematic architecture-specific code will be appropriately altered, I'll publish
the fixed general MIPS-memblock patchset within two months. I'll also try to
involve Ralf in it when I'm ready, so to make sure all my alterations are made
within kernel arch-code coding style. While I'm working on it, you can still use
the current patchset for some limited tests.

Regards,
-Sergey

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
