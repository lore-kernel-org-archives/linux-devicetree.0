From: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Subject: Re: [PATCH v8 2/4] fpga manager: add sysfs interface document
Date: Thu, 15 Jan 2015 11:47:26 -0700
Message-ID: <20150115184726.GA23247@obsidianresearch.com>
References: <20150107084819.GA1887@amd>
 <alpine.DEB.2.02.1501091302370.30067@linuxheads99>
 <20150109205643.GA5761@amd>
 <20150112210134.687176ed@lxorguk.ukuu.org.uk>
 <20150112214314.GA18610@obsidianresearch.com>
 <20150113162847.2778b5a5@lxorguk.ukuu.org.uk>
 <20150113200032.GA16205@obsidianresearch.com>
 <alpine.DEB.2.02.1501131455130.30192@linuxheads99>
 <20150113222450.GA17475@obsidianresearch.com>
 <alpine.DEB.2.02.1501150936390.16760@linuxheads99>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.02.1501150936390.16760@linuxheads99>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: atull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, One Thousand Gnomes <gnomes-qBU/x9rampVanCEyBjwyrvXRex20P6io@public.gmane.org>, Pavel Machek <pavel-ynQEQJNshbs@public.gmane.org>, hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org, monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org, michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, iws-lulEs6mt1IksTUYHLfqkUA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, philip-6RQC9ztksjxg9hUCZPvPmw@public.gmane.org, rubini-kaDoWcXyVrEAvxtiuMwx3w@public.gmane.org, s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, kyle.teske-acOepvfBmUk@public.gmane.org, nico-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, cesarb-PWySMVKUnqmsTnJN9+BGXg@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dinguyen@opensource.
List-Id: devicetree@vger.kernel.org

On Thu, Jan 15, 2015 at 10:34:39AM -0600, atull wrote:

> This is great!  The way I had it working was using Pantelis' devicetree
> configfs interface.

I figured you were very close to this already in your overlay work..
 
> The DT fragment described the FPGA logic and included a filename
> for firmware to load. In another branch of this thread, I see discussion
> starting on what the overlay should look like and whether it could somehow
> contain the DT itself.

It is a novel idea, my concern would be that embedding the FPGA in the
DT makes it permanent unswappable kernel memory.

Not having the kernel hold the FPGA is best for many uses.

Having the kernel hold the FPGA as a swppable file handle/mmap of some
sort is next best (obviously the fs must be operating during resume)

Unswappable kernel memory is the worst choice

> Long ago this driver started out with a /dev interface.  It didn't have
> an ioctl yet at that point, but programming the fpga was by opening
> the devnode and writing to it.  Greg KH preferred sysfs or configfs
> over adding another ioctl:

I think to justify the ioctls you need a reason to have the context
of a FD. sysfs is stateless, so if my process dies the kernel doesn't
know.

But now that we are talking about adding locking and ownership
concepts a FD is the natural anchor for that in user space.

Ie, if I open the dev node, program a FPGA and then crash the kernel
doesn't attach drivers, and immediately de-programs the
chip. Userspace has to make it all the way through to the DT bind
before the FPGA lifetime would exceed the FD.

> https://lkml.org/lkml/2013/10/8/677

I think Greg's reply makes sense in the context of the question being
asked. Thinking of the FPGA as lockable ref counted kind of resource
changes the question somewhat.

Identifying the ioctls needed would probably clarify things. My
rough start would be 

- Get status: programed, not programmed, error?
  Bitfile type? (eg Xilinx has nearly every permutation of bit/byte
  ordering)
- Start Program with with some kind of context (ie this a new bit
  file, partial reconfiguration basis X, partial reconfiguration
  overlay on X)
- for (;;) write() to do programming
- Get Error to return detailed failure information (CRC error,
  auth error, etc)
- Hand over to a DT overlay (how does this work?) Lock transfers
  from FD to kernel

-  .. something something VFIO .. ?

Where start program is refused if the FPGA is already locked, and
  locks it 
Where start program -> close() returns the FPGA back to reset and
  unlocks
Where start program -> hand over -> close() keeps the FPGA loaded with
 kernel drivers attached and fpga locked (remove the overlay to
 de-program and unlock)

Not sure exactly how to tie together DT overlays with the FPGA state,
but that seems the natural combination..

Not sure about partial reconfiguration - clearly the kernel needs to
know and check that the bitfiles are of the correct family, I wonder
if the approach should be to program a basis on the FPGA which then
creates a new FPGA device in the system that can accept the partial
reconfiguration - this way the locking makes sense, the basis is
locked by the kernel and devices and the overlay remains
lockable/swappable/whatever by a dedicated /dev/ node ??

Just thinking aloud, I've never had a use case for partial
reconfiguration.

Jason
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
