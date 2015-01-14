From: One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH v8 2/4] fpga manager: add sysfs interface document
Date: Wed, 14 Jan 2015 16:06:17 +0000
Message-ID: <20150114160617.02fb9135@lxorguk.ukuu.org.uk>
References: <1420575219-27061-1-git-send-email-atull@opensource.altera.com>
 <1420575219-27061-3-git-send-email-atull@opensource.altera.com>
 <20150107084819.GA1887@amd>
 <alpine.DEB.2.02.1501091302370.30067@linuxheads99>
 <20150109205643.GA5761@amd>
 <20150112210134.687176ed@lxorguk.ukuu.org.uk>
 <20150112214314.GA18610@obsidianresearch.com>
 <20150113162847.2778b5a5@lxorguk.ukuu.org.uk>
 <20150113200032.GA16205@obsidianresearch.com>
 <alpine.DEB.2.02.1501131455130.30192@linuxheads99>
 <20150113222450.GA17475@obsidianresearch.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20150113222450.GA17475@obsidianresearch.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
Cc: mark.rutland@arm.com, linux-doc@vger.kernel.org, rubini@gnudd.com, pantelis.antoniou@konsulko.com, hpa@zytor.com, s.trumtrar@pengutronix.de, devel@driverdev.osuosl.org, sameo@linux.intel.com, nico@linaro.org, ijc+devicetree@hellion.org.uk, michal.simek@xilinx.com, kyle.teske@ni.com, grant.likely@linaro.org, davidb@codeaurora.org, linus.walleij@linaro.org, cesarb@cesarb.net, devicetree@vger.kernel.org, jason@lakedaemon.net, pawel.moll@arm.com, iws@ovro.caltech.edu, atull <atull@opensource.altera.com>, galak@codeaurora.org, broonie@kernel.org, philip@balister.org, dinguyen@opensource.altera.com, monstr@monstr.eu, gregkh@linuxfoundation.org, yvanderv@opensource.altera.com, linux-kernel@vger.kernel.org, balbi@ti.com, delicious.quinoa@gmail.com, robh+dt@kernel.org, rob@landley.net, Pavel Machek <pavel@denx.de>, akpm@linux-foundation.org, davem@davemloft.net, m.chehab@samsung.c
List-Id: devicetree@vger.kernel.org

> The request_firmware interface should be for the DT overlay path, and
> other schemes shouldn't use it. The name should come from the DT and
> no place else.

For the static bindings agreed (or ACPI but that's a detail) or other
dynamic discovery post boot.

>  2) The bootloader starts the kernel and passes a DT that describes
>     the hard logic and soft logic using a scheme like I outlined. The
>     kernel is responsible to request_firmware the bitfile and start
>     the FPGA and connect the drivers.
> 
>     DT purists will rightly point out that this isn't great, but it
>     is a simple and pragmatic solution.
> 
>     This probably falls out automatically if #3 is implemented..
>  3) The bootloader starts the kernel with a DT that only describes the
>     hard logic.
> 
>     Userspace must load a DT overlay early on. Otherwise proceeds like #2.
> 
>     In both 2 and 3 the FPGA can be reprogrammed on resume by re-doing
>     request_firmware.

and I think you effectively have the user usage covered here for such
things. It much like GPIO pins - we can describe them but we can also
declare they are not visible to the user.

> And for folks that need more control, expose all the knobs explicitly
> to user space:
>   4) There is a /dev/ node for the fpga that allows
>      - ioctl to program via mmap'd file (no request_firmware)
> 
>        The ioctl has an option for the kernel to hang on to the mmap
>        for the repogram on resume case.
>      - ioctl to get status/error reporting/etc
>      - ioctl to load/bind a DT overlay to the FPGA instance
>        This provides a gap where userspace can boot and configure the
>        FPGA internals before binding the kernel drivers.
>        (end result is the same as #3 case, but no request_firmware)
>      - (future) ioctl to load a swappable FPGA (what Alan is talking
>        about)

The swappable case mostly comes out of the /dev node. Once you have the
dev node it becomes a detail of the OS not the FPGA driver as to who may
open it, and how it is handed about. It might be an FPU manager daemon it
might not.

> The key thing is that we have a FPGA object that can be associated
> with some DT element, and the kernel can then keep track if the FPGA
> is is in use or not. Exactly like you said in your reply.

I think this is right. You have a set of FPGA objects initially coming
from DT and system enumerations and later maybe even showing up via
hotplug.

You have a set of bindings which describes what to do with those that
have fixed bindings.

The fpga /dev entries are then a subset of the enumerated list which has
not been marked as OS in use (or they return -EBUSY and can't be opened)

At that point it works like pretty much everything else.

> I have no problem with the in kernel stuff, and I'd have no problem if
> the sysfs controls were in debugfs for testing purposes. It just
> doesn't make sense to me to expose that kind of interface as a
> permanent API...

That's my big concern too. We need an FPGA manager in kernel clearly. We
need kernel ability to program FPGA bitstreams (if only because there are
both boot time and suspend/resume cases that turn into complete insanity
otherwise).

Alan
