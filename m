From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [ANN] Meeting minutes of the Cambourne meeting
Date: Tue, 30 Aug 2011 22:37:21 +0200
Message-ID: <201108302237.22468.laurent.pinchart@ideasonboard.com>
References: <201107261647.19235.laurent.pinchart@ideasonboard.com> <20110830201929.GS2061@opensource.wolfsonmicro.com> <CACxGe6v0Tm8oz5+vcrdjzk3x0DdvBoyeqEv=aZv=XEA=Ev7WpQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <CACxGe6v0Tm8oz5+vcrdjzk3x0DdvBoyeqEv=aZv=XEA=Ev7WpQ@mail.gmail.com>
Sender: linux-media-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>, Tuukka Toivonen <tuukka.toivonen@intel.com>, Tomasz Stanislawski <t.stanislaws@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Sakari Ailus <sakari.ailus@maxwell.research.nokia.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Mauro Carvalho Chehab <mchehab@redhat.com>, Sylwester Nawrocki <snjw23@gmail.com>, linux-media <linux-media@vger.kernel.org>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Hans Verkuil <hverkuil@xs4all.nl>, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Tuesday 30 August 2011 22:35:59 Grant Likely wrote:
> On Aug 30, 2011 2:19 PM, "Mark Brown" wrote:
> > On Tue, Aug 30, 2011 at 10:12:30PM +0200, Laurent Pinchart wrote:
> > > Would such a device be included in the DT ? My understanding is that
> > > the DT should only describe the hardware.
> > 
> > For ASoC they will be, the view is that the schematic for the board is
> > sufficiently interesting to count as hardware.
> 
> Yes. Aggregate devices are sufficiently complex that there is a strong
> argument for using a node to describe one.

Is there any document or sample implementation ?

-- 
Regards,

Laurent Pinchart
