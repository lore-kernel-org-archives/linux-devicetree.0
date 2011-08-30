From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [ANN] Meeting minutes of the Cambourne meeting
Date: Tue, 30 Aug 2011 21:39:06 +0100
Message-ID: <20110830203906.GC14976@sirena.org.uk>
References: <201107261647.19235.laurent.pinchart@ideasonboard.com>
 <20110830201929.GS2061@opensource.wolfsonmicro.com>
 <CACxGe6v0Tm8oz5+vcrdjzk3x0DdvBoyeqEv=aZv=XEA=Ev7WpQ@mail.gmail.com>
 <201108302237.22468.laurent.pinchart@ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-media-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201108302237.22468.laurent.pinchart@ideasonboard.com>
Sender: linux-media-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, Tomasz Stanislawski <t.stanislaws@samsung.com>, Hans Verkuil <hverkuil@xs4all.nl>, Sakari Ailus <sakari.ailus@maxwell.research.nokia.com>, Mauro Carvalho Chehab <mchehab@redhat.com>, devicetree-discuss@lists.ozlabs.org, Sylwester Nawrocki <snjw23@gmail.com>, Tuukka Toivonen <tuukka.toivonen@intel.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-media <linux-media@vger.kernel.org>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 30, 2011 at 10:37:21PM +0200, Laurent Pinchart wrote:
> On Tuesday 30 August 2011 22:35:59 Grant Likely wrote:

> > Yes. Aggregate devices are sufficiently complex that there is a strong
> > argument for using a node to describe one.

> Is there any document or sample implementation ?

ASoC.  Unfortunately there are several rather annoying problems in the
Linux device model which make this substantially less straightforward
than it might otherwise be, the main ones being waiting for everything
to probe and making sure everything suspends and resumes in the correct
order.
