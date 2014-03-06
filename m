From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH v6 0/8] Move device tree graph parsing helpers to
	drivers/of
Date: Thu, 6 Mar 2014 15:50:18 +0000
Message-ID: <20140306155018.GD21483@n2100.arm.linux.org.uk>
References: <1394011242-16783-1-git-send-email-p.zabel@pengutronix.de> <20140306152414.GC21483@n2100.arm.linux.org.uk> <1394120379.3622.37.camel@paszta.hi.pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1394120379.3622.37.camel@paszta.hi.pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Grant Likely <grant.likely@linaro.org>, Mauro Carvalho Chehab <m.chehab@samsung.com>, Rob Herring <robh+dt@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Kyungmin Park <kyungmin.park@samsung.com>, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Mar 06, 2014 at 04:39:39PM +0100, Philipp Zabel wrote:
> Am Donnerstag, den 06.03.2014, 15:24 +0000 schrieb Russell King - ARM
> Linux:
> > On Wed, Mar 05, 2014 at 10:20:34AM +0100, Philipp Zabel wrote:
> > > this version of the OF graph helper move series further addresses a few of
> > > Tomi's and Sylwester's comments.
> > 
> > Philipp,
> > 
> > You mention in your other cover for imx-drm bits that this is available
> > via:
> > 
> > 	git://git.pengutronix.de/git/pza/linux.git topic/of-graph
> > 
> > What is this tree based upon?
> 
> It is based on v3.14-rc5.

Great.  As everyone seems happy, can you both send me and Mauro a pull
request for this please?  Once Mauro says it's in his tree, I'll pull
it in for imx-drm stuff.

Thanks.

-- 
FTTC broadband for 0.8mile line: now at 9.7Mbps down 460kbps up... slowly
improving, and getting towards what was expected from it.
