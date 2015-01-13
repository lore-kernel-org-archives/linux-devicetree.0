From: atull <atull@opensource.altera.com>
Subject: Re: [PATCH v8 2/4] fpga manager: add sysfs interface document
Date: Tue, 13 Jan 2015 11:27:05 -0600
Message-ID: <alpine.DEB.2.02.1501131124320.27340@linuxheads99>
References: <20150107084819.GA1887@amd> <alpine.DEB.2.02.1501091302370.30067@linuxheads99> <20150109205643.GA5761@amd> <4D4EA2D5-68DD-49F7-9E2D-3A0A8F6AF9CA@konsulko.com> <20150110151118.GA16036@amd> <alpine.DEB.2.10.1501111009180.2556@shineypoop>
 <20150112084530.GA28681@amd> <bed1d7ce1b984c79acc75a47495cb959@BL2FFO11FD043.protection.gbl> <20150113072857.GA11760@amd> <D62286C4-2800-47B6-9D69-6F92E27347AF@konsulko.com> <20150113075651.GB11760@amd>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="8323329-132828085-1421170041=:27340"
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20150113075651.GB11760@amd>
Sender: linux-doc-owner@vger.kernel.org
To: Pavel Machek <pavel@denx.de>
Cc: Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Michal Simek <michal.simek@xilinx.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, jgunthorpe@obsidianresearch.com, hpa@zytor.com, Michal Simek <monstr@monstr.eu>, rdunlap@infradead.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, robh+dt@kernel.org, Grant Likely <grant.likely@linaro.org>, iws@ovro.caltech.edu, linux-doc@vger.kernel.org, Mark Brown <broonie@kernel.org>, philip@balister.org, rubini@gnudd.com, Steffen Trumtrar <s.trumtrar@pengutronix.de>, jason@lakedaemon.net, kyle.teske@ni.com, nico@linaro.org, Felipe Balbi <balbi@ti.com>, m.chehab@samsung.com, davidb@codeaurora.org, Rob Landley <rob@landley.net>, davem@davemloft.net, cesarb@cesarb.net, sameo@linux.intel.com, akpm@linux-foundation.org, Linus Walleij <linus.walleij@lina>
List-Id: devicetree@vger.kernel.org

--8323329-132828085-1421170041=:27340
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT

On Tue, 13 Jan 2015, Pavel Machek wrote:

> On Tue 2015-01-13 09:40:18, Pantelis Antoniou wrote:
> > Hi Pavel,
> > 
> > > On Jan 13, 2015, at 09:28 , Pavel Machek <pavel@denx.de> wrote:
> > > 
> > > Hi!
> > > 
> > >>>>>>>>>> +What:		/sys/class/fpga_manager/<fpga>/firmware
> > >>>>>>>>>> +Date:		October 2014
> > >>>>>>>>>> +KernelVersion:	3.18
> > >>>>>>>>>> +Contact:	Alan Tull <atull@opensource.altera.com>
> > >>>>>>>>>> +Description:	Name of the FPGA image file to load using firmware
> > >>>>>>>>>> class.
> > >>>>>>>>> 
> > >>>>>>>>> This one is ugly: it unneccessarily passes firmware name through the
> > >>>>>>>>> kernel. Just make interface and code simpler by always passing
> > >>>>>>>>> "socfpga-fpga-image" or something like that.
> > > ...
> > > 
> > >>> What is cumbersome about symlink? Why is "fake" symlink in sysfs better?
> > >>> 
> > >>>> Previous uses of the firmware layer has been to use it to load once after
> > >>>> bootup; this is different since some use cases will want to switch out
> > >>>> the FPGA image.  If someone wants there to be only one FPGA image on
> > >>>> the FGPA forever, they will probably not be using this framework; their
> > >>>> FPGA will probably be loaded before Linux boots up.
> > >>> 
> > >>> Why? I have just one image on the fpga, and would prefer to load it
> > >>> from Linux.
> > >> 
> > >> Pavel: These patches target staging and sysfs interface doesn't need to be stable
> > >> at this time. I would prefer to add these patches to staging for 3.20
> > >> and feel free to send the patch which fix this.
> > > 
> > > Interesting way to address patch review. "We'll merge it, and you can
> > > fix it up later".
> > > 
> > >> With your code will be exactly clear how you want to use it and we can
> > >> talk about it.
> > > 
> > > I'm pretty sure Alan knows what I want at this point, he just does not
> > > want to do it.
> > > 
> > > For the record, I want to drop "firmware" file, use fixed firmware
> > > name, and deal with multiple firmwares in userspace (using symlink or
> > > udev magic).
> > 
> > That’s completely bogus. Using a fixed firmware file does not respond to
> > real world usage, and there are no words to describe the hacks using
> > symlinks and udev in an embedded product.
> 
> > > I believe this is simplest solution, should be adequate, and is
> > > certainly less ugly than implementing fake symlink in
> > > /sys/.../firmware. And I have yet to hear what is wrong with that
> > > suggestion.
> > 
> > Everything.
> 
> Can you be more specific? Current solution already has a fake symlink,
> implemented badly.
> 
> Just remove it, and use real symlink (and then you can optionally
> think of something better...)
> 

Hi Pavel,

I still don't get what you are saying.  It's not a symlink.  I'm not
changing it.  

Alan


> 
> 									Pavel
> -- 
> (english) http://www.livejournal.com/~pavelmachek
> (cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
> 
--8323329-132828085-1421170041=:27340--
