From: Serge Semin <fancer.lancer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 00/21] MIPS memblock: Remove bootmem code and switch to
 NO_BOOTMEM
Date: Mon, 22 May 2017 13:26:43 +0300
Message-ID: <20170522102643.GA17763@mobilestation>
References: <1482113266-13207-1-git-send-email-fancer.lancer@gmail.com>
 <be0b6614-708d-a32a-029d-7e606a673e5b@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <be0b6614-708d-a32a-029d-7e606a673e5b-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marcin Nowakowski <marcin.nowakowski-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, rabinv-VrBV9hrLPhE@public.gmane.org, matt.redfearn-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, alexander.sverdlin-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Sergey.Semin-vHJ8rsvMqnUPfZBKTuL5GA@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, May 22, 2017 at 11:48:36AM +0200, Marcin Nowakowski <marcin.nowakowski-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org> wrote:

Hello Marcin,

> Hi Serge,
> 
> On 19.12.2016 03:07, Serge Semin wrote:
> >Most of the modern platforms supported by linux kernel have already
> >been cleaned up of old bootmem allocator by moving to nobootmem
> >interface wrapping up the memblock. This patchset is the first
> >attempt to do the similar improvement for MIPS for UMA systems
> >only.
> >
> >Even though the porting was performed as much careful as possible
> >there still might be problem with support of some platforms,
> >especially Loonson3 or SGI IP27, which perform early memory manager
> >initialization by their self.
> >
> >The patchset is split so individual patch being consistent in
> >functional and buildable ways. But the MIPS early memory manager
> >will work correctly only either with or without the whole set being
> >applied. For the same reason a reviewer should not pay much attention
> >to methods bootmem_init(), arch_mem_init(), paging_init() and
> >mem_init() until they are fully refactored.
> >
> >The patchset is applied on top of kernel v4.9.
> 
> Have you progressed any further with these patches?
> They would definitely be useful to include for MIPS arch, so can you let us
> know if you are planning to send any updated version?
> 
> thanks,
> Marcin

Sorry for such a long delay with response. I have been really busy
during last three months. Alas I'll still be busy for next 1-2
months as well. You know how it usually works with urgent projects.
One needs to do this thing, then that thing, and at some point I just
forgot about this thread.

Regarding the patchset. I'm still pretty much eager to make it being
part of kernel MIPS arch. But there was a problem I outlined
in the patchset header message, which I can't fix by myself.
Particulary It's connected with Loonson3 or SGI IP27 code alteration,
so to make it free of ancient boot_mem_map dependencies (see the
patchset header message). Without a help from someone, who has
Loonson64 and SGI IP27 hardware and strong desire to make it free of
old bootmem allocator, it is useless to make any progress from my
side. That's why Ralf moved this email-thread into RFC actually.
Anyway If either you or someone else has got such hardware and is
interested in the cooperation, I'll be more than happy to push
my efforts forward with this patchset contribution. But only after
I got a bit less busy with my work. As I said it will happen within
next 1-2 months. So do you have the hardware and desire to be part
of this?

Regards,
-Sergey

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
