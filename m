From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCHv16 0/7] of: add display helper
Date: Wed, 09 Jan 2013 21:42:47 +0100
Message-ID: <4468930.nIKSs7INEb@avalon>
References: <1355850256-16135-1-git-send-email-s.trumtrar@pengutronix.de>
	<20130109201541.GB4780@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <20130109201541.GB4780@pengutronix.de>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: linux-fbdev@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, devicetree-discuss@lists.ozlabs.org, Florian Tobias Schandinat <FlorianSchandinat@gmx.de>, dri-devel@lists.freedesktop.org, Tomi Valkeinen <tomi.valkeinen@ti.com>, Rob Herring <robherring2@gmail.com>, kernel@pengutronix.de, Guennady Liakhovetski <g.liakhovetski@gmx.de>, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wednesday 09 January 2013 21:15:41 Steffen Trumtrar wrote:
> On Tue, Dec 18, 2012 at 06:04:09PM +0100, Steffen Trumtrar wrote:
> > Hi!
> > 
> > Finally, right in time before the end of the world on friday, v16 of the
> > display helpers.
> 
> So, any more criticism on the series? Any takers for the series as is?
> I guess it could be merged via the fbdev-tree if David Airlie can agree
> to the DRM patches ?! Does that sound about right?
> 
> I think the series was tested at least with
> 	- imx6q: sabrelite, sabresd
> 	- imx53: tqma53/mba53
> 	- omap: DA850 EVM, AM335x EVM, EVM-SK
> 
> I don't know what Laurent Pinchart, Marek Vasut and Leela Krishna Amudala
> are using.

I've used the sh-mobile-lcdcfb driver.

> Those are the people I know from the top of my head, that use or at least
> did use the patches in one of its iterations. If I forgot anyone, please
> speak up and possibly add your new HW to the list of tested devices.

-- 
Regards,

Laurent Pinchart
