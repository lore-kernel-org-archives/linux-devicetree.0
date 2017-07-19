Return-Path: <SRS0=59qh=6W=ideasonboard.com=laurent.pinchart@kernel.org>
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] media: Convert to using %pOF instead of full_name
Date: Wed, 19 Jul 2017 16:13:05 +0300
Message-ID: <2365474.Q2cOWx8lkM@avalon>
In-Reply-To: <564a6768-3b23-6dc7-ecb5-cb4f4359b633@samsung.com>
References: <CGME20170718215328epcas2p2e5e1d7df96fcd894e70a961df864abdd@epcas2p2.samsung.com> <20170718214339.7774-33-robh@kernel.org> <564a6768-3b23-6dc7-ecb5-cb4f4359b633@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Rob Herring <robh@kernel.org>, linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, Songjun Wu <songjun.wu@microchip.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Minghsiu Tsai <minghsiu.tsai@mediatek.com>, Houlong Wei <houlong.wei@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Niklas =?ISO-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Hyun Kwon <hyun.kwon@xilinx.com>, Michal Simek <michal.simek@xilinx.com>, =?ISO-8859-1?Q?S=F6ren?= Brinkmann <soren.brinkmann@xilinx.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-re nesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi Sylwester,

On Wednesday 19 Jul 2017 11:41:37 Sylwester Nawrocki wrote:
> On 07/18/2017 11:43 PM, Rob Herring wrote:
> > Now that we have a custom printf format specifier, convert users of
> > full_name to use %pOF instead. This is preparation to remove storing
> > of the full path string for each node.
> > 
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > 
> > ---
> > 
> >   drivers/media/i2c/s5c73m3/s5c73m3-core.c       |  3 +-
> >   drivers/media/i2c/s5k5baf.c                    |  7 ++--
> >   drivers/media/platform/am437x/am437x-vpfe.c    |  4 +-
> >   drivers/media/platform/atmel/atmel-isc.c       |  4 +-
> >   drivers/media/platform/davinci/vpif_capture.c  | 16 ++++----
> >   drivers/media/platform/exynos4-is/fimc-is.c    |  8 ++--
> >   drivers/media/platform/exynos4-is/fimc-lite.c  |  3 +-
> >   drivers/media/platform/exynos4-is/media-dev.c  |  8 ++--
> >   drivers/media/platform/exynos4-is/mipi-csis.c  |  4 +-
> >   drivers/media/platform/mtk-mdp/mtk_mdp_comp.c  |  6 +--
> >   drivers/media/platform/mtk-mdp/mtk_mdp_core.c  |  8 ++--
> >   drivers/media/platform/omap3isp/isp.c          |  8 ++--
> >   drivers/media/platform/pxa_camera.c            |  2 +-
> >   drivers/media/platform/rcar-vin/rcar-core.c    |  4 +-
> >   drivers/media/platform/soc_camera/soc_camera.c |  6 +--
> >   drivers/media/platform/xilinx/xilinx-vipp.c    | 52 ++++++++++----------
> >   drivers/media/v4l2-core/v4l2-async.c           |  4 +-
> >   drivers/media/v4l2-core/v4l2-clk.c             |  3 +-
> >   include/media/v4l2-clk.h                       |  4 +-
> >   19 files changed, 71 insertions(+), 83 deletions(-)
> > 
> > diff --git a/drivers/media/platform/xilinx/xilinx-vipp.c
> > b/drivers/media/platform/xilinx/xilinx-vipp.c index
> > ac4704388920..9233ad0b1b6b 100644
> > --- a/drivers/media/platform/xilinx/xilinx-vipp.c
> > +++ b/drivers/media/platform/xilinx/xilinx-vipp.c
> > @@ -144,9 +144,8 @@ static int xvip_graph_build_one(struct
> > xvip_composite_device *xdev,
> >   		remote = ent->entity;
> >   		if (link.remote_port >= remote->num_pads) {
> > -			dev_err(xdev->dev, "invalid port number %u on %s\n",
> > -				link.remote_port,
> > -				to_of_node(link.remote_node)->full_name);
> > +			dev_err(xdev->dev, "invalid port number %u on %pOF\n",
> > +				link.remote_port, link.remote_node);
> 
> Shouldn't there be to_of_node(link.remote_node) instead of link.remote_node 
?

Good catch, I had missed that one.

> >   			v4l2_fwnode_put_link(&link);
> >   			ret = -EINVAL;
> >   			break;

[snip]

-- 
Regards,

Laurent Pinchart
