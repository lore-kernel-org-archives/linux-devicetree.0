From: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
Subject: Re: [PATCH v8 2/4] fpga manager: add sysfs interface document
Date: Mon, 12 Jan 2015 11:06:08 -0700
Message-ID: <20150112180608.GA11295@obsidianresearch.com>
References: <1420575219-27061-1-git-send-email-atull@opensource.altera.com>
 <1420575219-27061-3-git-send-email-atull@opensource.altera.com>
 <20150107084819.GA1887@amd>
 <alpine.DEB.2.02.1501091302370.30067@linuxheads99>
 <20150109205643.GA5761@amd>
 <4D4EA2D5-68DD-49F7-9E2D-3A0A8F6AF9CA@konsulko.com>
 <20150110151118.GA16036@amd>
 <alpine.DEB.2.10.1501111009180.2556@shineypoop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.10.1501111009180.2556@shineypoop>
Sender: linux-kernel-owner@vger.kernel.org
To: atull <atull@opensource.altera.com>
Cc: Pavel Machek <pavel@denx.de>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, hpa@zytor.com, Michal Simek <monstr@monstr.eu>, Michal Simek <michal.simek@xilinx.com>, rdunlap@infradead.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, robh+dt@kernel.org, Grant Likely <grant.likely@linaro.org>, iws@ovro.caltech.edu, linux-doc@vger.kernel.org, Mark Brown <broonie@kernel.org>, philip@balister.org, rubini@gnudd.com, Steffen Trumtrar <s.trumtrar@pengutronix.de>, jason@lakedaemon.net, kyle.teske@ni.com, nico@linaro.org, Felipe Balbi <balbi@ti.com>, m.chehab@samsung.com, davidb@codeaurora.org, Rob Landley <rob@landley.net>, davem@davemloft.net, cesarb@cesarb.net, sameo@linux.intel.com, akpm@linux-foundation.org, Linus Walleij <linus.walleij@linaro.org>, pawel.moll@arm.com, mark.rutl
List-Id: devicetree@vger.kernel.org

On Sun, Jan 11, 2015 at 10:29:00AM -0600, atull wrote:
> the FPGA image.  If someone wants there to be only one FPGA image on
> the FGPA forever, they will probably not be using this framework; their
> FPGA will probably be loaded before Linux boots up.

Nonsense, loading the FPGA through Linux is much better, it avoids
having to deal with this complexity in the boot loader and means that
Linux can be used to locate the huge image in some kind of sensible
filesystem, log failures, do any FPGA startup sequence/etc.

With hotplug and DT I find this this works very well. The FPGA devices
simply are not registered with the kernel until userspace gives the OK
(in future a DT overload can handle this)

If you keep with the notion that the DT overload specifies the
matching FPGA firmware then it makes alot more sense to me to use DT
overlays as the API to change the file name - not sysfs.

To reload a FPGA, unload the DT overlay (this would have to disconnect
all the drivers), de-program the FPGA, the load a new DT overlay,
which reprograms and re-binds the new drivers. All those steps have to
be done anyhow, you can't just swap the HW while drivers are attached.

.. and if there are no drivers then Alan is right, this is the wrong
interface for the 'FPGA as a user space co-processor' model.

I would also re-iterate my earlier comments: requiring the whole FPGA
image to be held in ram makes this useless for any of my applications.

Jason
