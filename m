From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v4 14/36] [media] v4l2-mc: add a function to inherit
 controls from a pipeline
Date: Sun, 26 Mar 2017 19:41:19 +0300
Message-ID: <1885494.0WWl3X9G1A@avalon>
References: <20170310130733.GU21222@n2100.armlinux.org.uk>
 <20170312193745.636df0bf@vento.lan> <20170314182635.GA3744@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20170314182635.GA3744@amd>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Pavel Machek <pavel@ucw.cz>
Cc: mark.rutland@arm.com, andrew-ct.chen@mediatek.com, minghsiu.tsai@mediatek.com, sakari.ailus@linux.intel.com, nick@shmanahar.org, songjun.wu@microchip.com, Hans Verkuil <hverkuil@xs4all.nl>, Steve Longerbeam <steve_longerbeam@mentor.com>, robert.jarzmik@free.fr, markus.heiser@darmarit.de, laurent.pinchart+renesas@ideasonboard.com, g@osuosl.org, shuah@kernel.org, Russell King - ARM Linux <linux@armlinux.org.uk>, Mauro Carvalho Chehab <mchehab@s-opensource.com>, devel@driverdev.o, geert@linux-m68k.org, Steve Longerbeam <slongerbeam@gmail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de, arnd@arndb.de, mchehab@kernel.org, bparrot@ti.com, robh+dt@kernel.org, horms+renesas@verge.net.au, tiffany.lin@mediatek.com, Jacek Anaszewski <j.anaszewski@samsung.com>, linux-arm-kernel@lists.infradead.org, niklas.soderlund+renesas@ragnatech.se, gregkh@l
List-Id: devicetree@vger.kernel.org

Hi Pavel,

On Tuesday 14 Mar 2017 19:26:35 Pavel Machek wrote:
> Hi!
> 
> >> Mid-layer is difficult... there are _hundreds_ of possible
> >> pipeline setups. If it should live in kernel or in userspace is a
> >> question... but I don't think having it in kernel helps in any way.
> > 
> > Mid-layer is difficult, because we either need to feed some
> > library with knowledge for all kernel drivers or we need to improve
> > the MC API to provide more details.
> > 
> > For example, several drivers used to expose entities via the
> > generic MEDIA_ENT_T_DEVNODE to represent entities of different
> > 
> > types. See, for example, entities 1, 5 and 7 (and others) at:
> > > https://mchehab.fedorapeople.org/mc-next-gen/igepv2_omap3isp.png
> 
> Well... we provide enough information, so that device-specific code
> does not have to be in kernel.
> 
> There are few types of ENT_T_DEVNODE there. "ISP CCP2" does not really
> provide any functionality to the user. It just has to be there,
> because the pipeline needs to be connected. "ISP Preview" provides
> format conversion. "ISP Resizer" provides rescaling.
> 
> I'm not sure if it ever makes sense to use "ISP Preview
> output". Normally you take data for display from "ISP Resizer
> output". (Would there be some power advantage from that?)

There was a bug on the preview engine to resizer hardware bus in OMAP34xx that 
required capturing data from the preview engine output and performing the 
scaling in memory-to-memory mode in some cases. You can also capture at the 
preview engine output if you don't need scaling, or if you want to render on 
the image before scaling (to draw pieces of a GUI for instance). There could 
be other use cases.

> > A device-specific code could either be hardcoding the entity number
> > or checking for the entity strings to add some logic to setup
> > controls on those "unknown" entities, a generic app won't be able
> > to do anything with them, as it doesn't know what function(s) such
> > entity provide.
> 
> Generic app should know if it wants RGGB10 data, then it can use "ISP
> CCDC output", or if it wants "cooked" data suitable for display, then
> it wants to use "ISP Resizer output". Once application knows what
> output it wants, there's just one path through the system. So being
> able to tell the ENT_T_DEVNODEs apart does not seem to be critical.
> 
> OTOH, for useful camera application, different paths are needed at
> different phases.

-- 
Regards,

Laurent Pinchart
