From: atull <atull@opensource.altera.com>
Subject: Re: [PATCH v2 2/3] fpga manager: framework core
Date: Tue, 9 Dec 2014 10:07:42 -0600
Message-ID: <alpine.DEB.2.02.1412090958250.4875@linuxheads99>
References: <1414007405-32186-1-git-send-email-atull@opensource.altera.com> <1414007405-32186-3-git-send-email-atull@opensource.altera.com> <20141024105200.GA20775@amd> <CACxGe6sa=ysJAjx5TQZH5sKoas1PkoUUR4zT=Z35+uF6rrk-vw@mail.gmail.com>
 <20141208225519.64501d2d@lxorguk.ukuu.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20141208225519.64501d2d@lxorguk.ukuu.org.uk>
Sender: linux-doc-owner@vger.kernel.org
To: One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>
Cc: Grant Likely <grant.likely@linaro.org>, Pavel Machek <pavel@denx.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, "H. Peter Anvin" <hpa@zytor.com>, Michal Simek <monstr@monstr.eu>, Michal Simek <michal.simek@xilinx.com>, Randy Dunlap <rdunlap@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Rob Herring <robh+dt@kernel.org>, Ira Snyder <iws@ovro.caltech.edu>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Mark Brown <broonie@kernel.org>, philip@balister.org, rubini <rubini@gnudd.com>, Steffen Trumtrar <s.trumtrar@pengutronix.de>, Jason <jason@lakedaemon.net>, kyle.teske@ni.com, Nicolas Pitre <nico@linaro.org>, "Balbi, Felipe" <balbi@ti.com>, Mauro
List-Id: devicetree@vger.kernel.org

On Mon, 8 Dec 2014, One Thousand Gnomes wrote:

> On Sat, 6 Dec 2014 13:00:17 +0000
> Grant Likely <grant.likely@linaro.org> wrote:
> 
> > On Fri, Oct 24, 2014 at 11:52 AM, Pavel Machek <pavel@denx.de> wrote:
> > > Hi!
> > >
> > >> * /sys/class/fpga_manager/<fpga>/firmware
> > >>   Name of FPGA image file to load using firmware class.
> > >>   $ echo image.rbf > /sys/class/fpga_manager/<fpga>/firmware
> > >
> > > I .. still don't think this is good idea. What about namespaces?
> > > The path corresponds to path in which namespace?
> > 
> > I don't understand your concern here. This allows userspace to name
> > the FPGA bitstream that the kernel will use during request_firmware(),
> > and it will show up as the $FIRMWARE value in the uevent file, but it
> > is still the responsibility of userspace to choose what to load, and
> > it can freely ignore the setting of $FIRMWARE if it needs to.
> 
> I think the entire model here is basically pedicated on a bogus
> assumption that an FPGA is a one shot device. It's not. It's a fast
> reloadable reusable device. A lot of work being done with FPGAs in
> operating systems already involves basically task switching and
> scheduling FPGAs as a shared resource pool. Trying to nail something
> together with request_firmware is several years behind the curve.
> 
> From userspace it needs to be a open, load, use, close type model, not a
> static or semi-static pile of mappings.
> 
> Alan
> 

Hi Alan,

I agree with the view that a FPGA is something that can get reprogrammed a lot.
That's a flexibility we want to use.  I don't see a problem with using firmware
to do the programming as long as we have a lightweight interface where we can
load an image, use it, then later reset the FGPA and load a different image
instead.

This assumes that the system will have a pile of FPGA images sitting on
the filesystem for us to switch between.

My intent is to also support loading using device tree overlays.  This is a lot
more linux-like and less of something just bolted on.  The flow here is:

* load a DT overlay
* this causes the fpga to get programmed
* appropriate bridges get enabled
* appropriate drivers get probed

When the DT overlay is removed, all these get undone in the reverse order.

Alan Tull
