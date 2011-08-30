From: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
Subject: Re: [ANN] Meeting minutes of the Cambourne meeting
Date: Tue, 30 Aug 2011 17:59:25 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.1108301755390.19151@axis700.grange>
References: <201107261647.19235.laurent.pinchart@ideasonboard.com>
 <Pine.LNX.4.64.1108301600020.19151@axis700.grange>
 <CACxGe6tCLJ6F-Rsf=1ENj98YzXHRm9p9xr4-TAiWTHpQbQVOVA@mail.gmail.com>
 <201108301742.56581.laurent.pinchart@ideasonboard.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <201108301742.56581.laurent.pinchart@ideasonboard.com>
Sender: linux-media-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Tomasz Stanislawski <t.stanislaws@samsung.com>, Sylwester Nawrocki <snjw23@gmail.com>, Sakari Ailus <sakari.ailus@maxwell.research.nokia.com>, Mauro Carvalho Chehab <mchehab@redhat.com>, devicetree-discuss@lists.ozlabs.org, linux-media <linux-media@vger.kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Tuukka Toivonen <tuukka.toivonen@intel.com>
List-Id: devicetree@vger.kernel.org

On Tue, 30 Aug 2011, Laurent Pinchart wrote:

> A dependency system is tempting but will be very complex to implement 
> properly, especially when faced with cyclic dependencies. For instance the 
> OMAP3 ISP driver requires the camera sensor device to be present to proceed, 

Switching to a notifier instead of waiting in probe() might be a good idea 
(TM).

> and the camera sensor requires a clock provided by the OMAP3 ISP. To solve 
> this we need to probe the OMAP3 ISP first, have it register its clock devices, 
> and then wait until all sensors become available.

Thanks
Guennadi
---
Guennadi Liakhovetski, Ph.D.
Freelance Open-Source Software Developer
http://www.open-technology.de/
