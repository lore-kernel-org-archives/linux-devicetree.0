From: Marek Vasut <marex@denx.de>
Subject: Re: [PATCHv16 0/7] of: add display helper
Date: Wed, 9 Jan 2013 21:59:07 +0100
Message-ID: <201301092159.08157.marex@denx.de>
References: <1355850256-16135-1-git-send-email-s.trumtrar@pengutronix.de> <20130109201541.GB4780@pengutronix.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <20130109201541.GB4780@pengutronix.de>
Sender: linux-media-owner@vger.kernel.org
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: devicetree-discuss@lists.ozlabs.org, Rob Herring <robherring2@gmail.com>, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Thierry Reding <thierry.reding@avionic-design.de>, Guennady Liakhovetski <g.liakhovetski@gmx.de>, linux-media@vger.kernel.org, Tomi Valkeinen <tomi.valkeinen@ti.com>, Stephen Warren <swarren@wwwdotorg.org>, kernel@pengutronix.de, Florian Tobias Schandinat <FlorianSchandinat@gmx.de>, David Airlie <airlied@linux.ie>, Rob Clark <robdclark@gmail.com>, Leela Krishna Amudala <leelakrishna.a@gmail.com>
List-Id: devicetree@vger.kernel.org

Dear Steffen Trumtrar,

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

MX53QSB and another custom MX53 board.

> Those are the people I know from the top of my head, that use
> or at least did use the patches in one of its iterations. If I forgot
> anyone, please speak up and possibly add your new HW to the list of tested
> devices.
> 
> Thanks,
> Steffen

Best regards,
Marek Vasut
