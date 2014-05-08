From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: KConfig and DTS files
Date: Thu, 8 May 2014 07:55:32 -0400
Message-ID: <20140508115532.GJ28159@titan.lakedaemon.net>
References: <536A697D.3020002@boundarydevices.com>
 <142702592.Qpp2HrZZke@wuerfel>
 <536A8456.1040208@boundarydevices.com>
 <5898724.4EExDycMZy@wuerfel>
 <536A8F03.5070509@boundarydevices.com>
 <CAJAp7OjNdmsomhm9jJ9-jP01z1Uz9snVgRCD07zOFdMYAhQ6Lw@mail.gmail.com>
 <536ABC89.8060301@boundarydevices.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <536ABC89.8060301-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Nelson <eric.nelson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Cc: Bjorn Andersson <bjorn-UYDU3/A3LUY@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, May 07, 2014 at 04:06:49PM -0700, Eric Nelson wrote:
> Hi Bjorn,
> 
> On 05/07/2014 03:20 PM, Bjorn Andersson wrote:
> >On Wed, May 7, 2014 at 12:52 PM, Eric Nelson
> ><eric.nelson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org> wrote:
> >[...]
> >>
> >>I still wonder about the choice of not allowing inclusion
> >>of at least include/generated/autoconf.h.
> >
> >Because what you just showed is the use case where you have 1 defconfig, build 1
> >zImage and then you can have a completely separate delivery of X number of
> >dtbs, all defining some variant of your original board.
> >All without recompiling, or even have the source available.
> >
> 
> I agree that there's some benefit in being able to generate
> different DTBs, and it's an advantage (size, speed) to customize
> the .config as well.
> 
> When those clearly go together, it seems natural to define them as
> such.

But they don't.  The end goal is that the dtb and the Linux kernel
_aren't_ tied together.  The dtb is shipped with the board, and you
configure/build your kernel how you want, and boot it.

Look at the dtb as replacement for the mach-type or boardid number.
It's handed to the OS (not necessarily Linux) by the bootloader to say
"Here's what you're running on".  It's *not* a reflection of the
configuration of the Linux Kernel.  The dtb describes the hardware for a
specific board.  Nothing more, nothing less.

Several other projects use the dts files from the kernel tree.  Ian
Campbell even set up a filter-branch version of the dts files and the
binding docs so that other projects could clone that repo without
getting the entire Linux commit history.  If we tied the dts files to
Kconfig symbols, we'd make other projects lives much more difficult.
Not to mention possibly driving Ian to drink excessively. :)

hth,

Jason.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
