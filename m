From: atull <atull@opensource.altera.com>
Subject: Re: [PATCH v2 2/3] fpga manager: framework core
Date: Tue, 9 Dec 2014 16:12:37 -0600
Message-ID: <alpine.DEB.2.02.1412091513110.23735@linuxheads99>
References: <1414007405-32186-1-git-send-email-atull@opensource.altera.com> <1414007405-32186-3-git-send-email-atull@opensource.altera.com> <20141024105200.GA20775@amd> <CACxGe6sa=ysJAjx5TQZH5sKoas1PkoUUR4zT=Z35+uF6rrk-vw@mail.gmail.com>
 <20141208225519.64501d2d@lxorguk.ukuu.org.uk> <alpine.DEB.2.02.1412090958250.4875@linuxheads99> <20141209210248.2ca54287@lxorguk.ukuu.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20141209210248.2ca54287@lxorguk.ukuu.org.uk>
Sender: linux-doc-owner@vger.kernel.org
To: One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>
Cc: Grant Likely <grant.likely@linaro.org>, Pavel Machek <pavel@denx.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, "H. Peter Anvin" <hpa@zytor.com>, Michal Simek <monstr@monstr.eu>, Michal Simek <michal.simek@xilinx.com>, Randy Dunlap <rdunlap@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Rob Herring <robh+dt@kernel.org>, Ira Snyder <iws@ovro.caltech.edu>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Mark Brown <broonie@kernel.org>, philip@balister.org, rubini <rubini@gnudd.com>, Steffen Trumtrar <s.trumtrar@pengutronix.de>, Jason <jason@lakedaemon.net>, kyle.teske@ni.com, Nicolas Pitre <nico@linaro.org>, "Balbi, Felipe" <balbi@ti.com>, Mauro
List-Id: devicetree@vger.kernel.org

On Tue, 9 Dec 2014, One Thousand Gnomes wrote:

Hi Alan,

> > I agree with the view that a FPGA is something that can get reprogrammed a lot.
> > That's a flexibility we want to use.  I don't see a problem with using firmware
> > to do the programming as long as we have a lightweight interface where we can
> > load an image, use it, then later reset the FGPA and load a different image
> > instead.
> > 
> > This assumes that the system will have a pile of FPGA images sitting on
> > the filesystem for us to switch between.
> > 
> > My intent is to also support loading using device tree overlays.  This is a lot
> > more linux-like and less of something just bolted on.  The flow here is:
> > 
> > * load a DT overlay
> 
> Don't assume DT. The entire world doesn't run DT

There's all kinds of things I'm not assuming here.  But at the same time I want
this to be widely useful and to not set general policies for proper FPGA use.

This patchset provides a sysfs interface for doing fpga image programming.
So I'm not assuming DT always.  Also I am exporting some functions that can be
used to expose some other interface if you want.  Those functions can load the
FPGA given either a buffer or a chunk of a buffer or a name of a FPGA file.
So I'm looking to enable broad use while still having a framework that is
quite lightweight.

We aren't *required* ignore DT either, are we?  Exciting things are happening
with DT, now that it is starting to not be a static thing.

> 
> > * this causes the fpga to get programmed
> > * appropriate bridges get enabled
> > * appropriate drivers get probed
> 
> For the case of a fixed function device it's sort of equivalent to a
> firmware load (in fact it *is* just a firmware load). The fixed function
> cases don't actually even need a 'firmware manager' or an FPGA class. In
> fact they shouldn't IMHO have one because the fact version A of the
> device requires firmware bitstream X, and bitstream X is an altera FPGA
> bitstream is an implementation detail. Revision B could be a
> microcontroller or something else and you still just shove a bitstream
> down it. No FPGA class is needed or appropriate. FPGA loader helpers yes.

There are lots of FPGA use cases.  Yes, a production use case could involve
the FPGA being loaded by the boot loader or from EEPROM.  These patches
have nothing to do with that.

I'm not trying to set policy as to what the valid use cases for FPGA are.
I'm just providing a way to load FPGA images without rebooting Linux.

One case where that is helpful is when you are developing your FPGA
image and want to keep reloading it.

> 
> In the enterprise space the model for FPGA use is usually a lot more
> flexible, big racks of FPGA boards that are handed out as resources to
> processes. They may be uploading fixed bitstreams but they may also be
> splicing bitstreams (eg splicing in 'ROM' images) and in the future as
> the Chinese break the existing FPGA market up I imagine we'll even see
> open bitstream formats.

I have no problem with any of that.  For me, the 'firmware' interface is
a convenient way of getting an image.  We can reprogram as much as we
want with as many 'firmware' images we like.

Also note that this framework does not assume anything about the contents
of the 'firmware' images.  It does not try to parse those images.  It
just loads them.

> 
> In the smaller system world emulators, real time and all sorts of maker
> type projects use the FPGA boards as a dynamic resource already. It might
> be running GNU radio, then driving a 3D printer, then doing processor
> emulation for a games console. The FPGAs hanging off my desktop box have
> been all sorts of things from video processors to emulated systems and
> even block drivers for weird recalcitrant hardware. Next stop may well be
> Localtalk 8)
> 
> In the academic world the model is similar, they are being treated as OS
> resources by the various reconfigurable OS projects, most of which are
> themselves Linux patch sets.
> 
> IMHO we have two use cases
> 

There are a lot more than two use cases.  If you follow the history of
the FGPA manager on the mailing list, a lot of people who like one
use case have no use for any of the other use cases.

I want to provide something that is handles the low level stuff of
reconfiguring a FPGA.  

> 1. Fixed function firmware - in which case the driver already handles it
> and we don't care if its FPGA bitstreams or microcode or CPU code or
> whatever

If your FPGA is already configured before Linux boots, these patches aren't
needed for that use.  

But even in that case, it can be handy for reloading images during development.

> 
> 2. Dynamic use cases where we need a resource we own, which means
> enumerate/open/close/read/write interfaces including firmware.
> 

In the case of a framework that will (1) reconfigure the fpga and then turn
around and (2) expose what the fpga is providing as a resource, 
you will need a way of dynamically loading the image into the FPGA.  That's
what this provides.

> For use case #1 I don't believe we need magic classes for FPGA and in

Magic?  Nope, it's a device driver.  What I have here on my desk is a soc
with a FPGA bolted onto an ARM. There is a device in there that is called
the "fpga manager".  This device's function is to configure the FPGA.  So
I created a FPGA class to put the driver that controls this 'fpga manager'
device.  This is a framework because I want to expose a useful interfaces
that other manufacturors could use, promote common code and common
interfaces.

> fact they are actually a mistake, for use class #2 request_firmware()
> doesn't work because it's intentionally quite blind to things like
> namespaces and permissions models. Both benefit greatly from library
> functions to handle the more standardised uploaded mechanisms.
> 
> I agree entirely with Michael about putting it in staging and working
> from there.
> 

Please look at my v4 patches which move this to drivers/staging.  Also  I
have dropped the DT stuff for now since not all of what it depends on is
in the main tree yet.

Alan Tull

> Alan
> 

