From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [ANN] Meeting minutes of the Cambourne meeting
Date: Tue, 30 Aug 2011 00:26:04 +0200
Message-ID: <201108300026.05489.laurent.pinchart@ideasonboard.com>
References: <201107261647.19235.laurent.pinchart@ideasonboard.com> <201108291508.59649.laurent.pinchart@ideasonboard.com> <Pine.LNX.4.64.1108300018490.5065@axis700.grange>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.1108300018490.5065@axis700.grange>
Sender: linux-media-owner@vger.kernel.org
To: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
Cc: Sylwester Nawrocki <snjw23@gmail.com>, linux-media <linux-media@vger.kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, Sakari Ailus <sakari.ailus@maxwell.research.nokia.com>, Tuukka Toivonen <tuukka.toivonen@intel.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Stanislawski <t.stanislaws@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, devicetree-discuss@lists.ozlabs.org, Mauro Carvalho Chehab <mchehab@redhat.com>
List-Id: devicetree@vger.kernel.org

Hi Guennadi,

On Tuesday 30 August 2011 00:20:09 Guennadi Liakhovetski wrote:
> On Mon, 29 Aug 2011, Laurent Pinchart wrote:
> 
> [snip]
> 
> > My idea was to let the kernel register all devices based on the DT or
> > board code. When the V4L2 host/bridge driver gets registered, it will
> > then call a V4L2 core function with a list of subdevs it needs. The V4L2
> > core would store that information and react to bus notifier events to
> > notify the V4L2 host/bridge driver when all subdevs are present. At that
> > point the host/bridge driver will get hold of all the subdevs and call
> > (probably through the V4L2 core) their .registered operation. That's
> > where the subdevs will get access to their clock using clk_get().
> 
> Correct me, if I'm wrong, but this seems to be the case of sensor (and
> other i2c-client) drivers having to succeed their probe() methods without
> being able to actually access the hardware?

That's right. I'd love to find a better way :-) Note that this is already the 
case for many subdev drivers that probe the hardware in the .registered() 
operation instead of the probe() method.

-- 
Regards,

Laurent Pinchart
