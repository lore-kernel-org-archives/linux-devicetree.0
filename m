From: Russell King - ARM Linux <linux@armlinux.org.uk>
Subject: Re: [PATCH v4 14/36] [media] v4l2-mc: add a function to inherit
 controls from a pipeline
Date: Mon, 20 Mar 2017 16:10:03 +0000
Message-ID: <20170320161003.GO21222@n2100.armlinux.org.uk>
References: <cc8900b0-c091-b14b-96f4-01f8fa72431c@xs4all.nl>
 <20170310125342.7f047acf@vento.lan>
 <20170310223714.GI3220@valkosipuli.retiisi.org.uk>
 <20170311082549.576531d0@vento.lan>
 <20170313124621.GA10701@valkosipuli.retiisi.org.uk>
 <20170314004533.3b3cd44b@vento.lan>
 <e0a6c60b-1735-de0b-21f4-d8c3f4b3f10f@xs4all.nl>
 <20170314072143.498cde9b@vento.lan>
 <5c935062-61f4-40e7-0ee9-87655197e661@xs4all.nl>
 <20170320123938.0503c931@vento.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <20170320123938.0503c931@vento.lan>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Mauro Carvalho Chehab <mchehab@s-opensource.com>
Cc: mark.rutland@arm.com, andrew-ct.chen@mediatek.com, minghsiu.tsai@mediatek.com, sakari.ailus@linux.intel.com, nick@shmanahar.org, songjun.wu@microchip.com, Hans Verkuil <hverkuil@xs4all.nl>, Steve Longerbeam <steve_longerbeam@mentor.com>, pavel@ucw.cz, robert.jarzmik@free.fr, devel@driverdev.osuosl.org, markus.heiser@darmarIT.de, laurent.pinchart+renesas@ideasonboard.com, shuah@kernel.org, Nicolas Dufresne <nicolas@ndufresne.ca>, geert@linux-m68k.org, Steve Longerbeam <slongerbeam@gmail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de, arnd@arndb.de, mchehab@kernel.org, bparrot@ti.com, robh+dt@kernel.org, Jacek Anaszewski <jacek.anaszewski@gmail.com>, horms+renesas@verge.net.au, tiffany.lin@mediatek.com, linux-arm-kernel@lists.infradead.org, niklas.soderlund+renesas@ragnatech.se, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Mar 20, 2017 at 12:39:38PM -0300, Mauro Carvalho Chehab wrote:
> Em Mon, 20 Mar 2017 14:24:25 +0100
> Hans Verkuil <hverkuil@xs4all.nl> escreveu:
> > I don't think this control inheritance patch will magically prevent you
> > from needed a plugin.
> 
> Yeah, it is not just control inheritance. The driver needs to work
> without subdev API, e. g. mbus settings should also be done via the
> video devnode.
> 
> Btw, Sakari made a good point on IRC: what happens if some app 
> try to change the pipeline or subdev settings while another
> application is using the device? The driver should block such 
> changes, maybe using the V4L2 priority mechanism.

My understanding is that there are already mechanisms in place to
prevent that, but it's driver dependent - certainly several of the
imx driver subdevs check whether they have an active stream, and
refuse (eg) all set_fmt calls with -EBUSY if that is so.

(That statement raises another question in my mind: if the subdev is
streaming, should it refuse all set_fmt, even for the TRY stuff?)

> In parallel, someone has to fix libv4l for it to be default on
> applications like gstreamer, e. g. adding support for DMABUF
> and fixing other issues that are preventing it to be used by
> default.

Hmm, not sure what you mean there - I've used dmabuf with gstreamer's
v4l2src linked to libv4l2, importing the buffers into etnaviv using
a custom plugin.  There are distros around (ubuntu) where the v4l2
plugin is built against libv4l2.

> My understanding here is that there are developers wanting/needing
> to have standard V4L2 apps support for (some) i.MX6 devices. Those are
> the ones that may/will allocate some time for it to happen.

Quite - but we need to first know what is acceptable to the v4l2
community before we waste a lot of effort coding something up that
may not be suitable.  Like everyone else, there's only a limited
amount of effort available, so using it wisely is a very good idea.

Up until recently, it seemed that the only solution was to solve the
userspace side of the media controller API via v4l2 plugins and the
like.

Much of my time that I have available to look at the imx6 capture
stuff at the moment is taken up by triping over UAPI issues with the
current code (such as the ones about CSI scaling, colorimetry, etc)
and trying to get concensus on what the right solution to fix those
issues actually is, and at the moment I don't have spare time to
start addressing any kind of v4l2 plugin for user controls nor any
other solution.

Eg, I spent much of this last weekend sorting out my IMX219 camera
sensor driver for my new understanding about how scaling is supposed
to work, the frame enumeration issue (which I've posted patches for)
and the CSI scaling issue (which I've some half-baked patch for at the
moment, but probably by the time I've finished sorting that, Philipp
or Steve will already have a solution.)

That said, my new understanding of the scaling impacts the four patches
I posted, and probably makes the frame size enumeration in CSI (due to
its scaling) rather obsolete.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
