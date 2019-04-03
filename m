From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v4 3/5] media: sunxi: Add A10 CSI driver
Date: Wed, 3 Apr 2019 12:37:58 +0300
Message-ID: <20190403093758.z2wlnx5ck6ck36ib@paasikivi.fi.intel.com>
References: <cover.2aba8cbd95630d87f927465cc2beb881936c83d9.1553010938.git-series.maxime.ripard@bootlin.com>
 <bf348ec10d4444dd80eab0caddc4e2d3ce3131d4.1553010938.git-series.maxime.ripard@bootlin.com>
 <20190403091221.qd5ivgcoviazccv7@paasikivi.fi.intel.com>
 <20190403092655.engthyfinpxvndh4@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190403092655.engthyfinpxvndh4@flea>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Hans Verkuil <hans.verkuil@cisco.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
List-Id: devicetree@vger.kernel.org

On Wed, Apr 03, 2019 at 11:26:55AM +0200, Maxime Ripard wrote:
> Hi Sakari,
> 
> On Wed, Apr 03, 2019 at 12:12:21PM +0300, Sakari Ailus wrote:
> > Thanks for the update and my apologies for the late review.
> >
> > On Tue, Mar 19, 2019 at 04:55:46PM +0100, Maxime Ripard wrote:
> > > The older CSI drivers have camera capture interface different from the one
> > > in the newer ones.
> > >
> > > This IP is pretty simple. Some variants (one controller out of two
> > > instances on some SoCs) have an ISP embedded, but there's no code that make
> > > use of it, so we ignored that part for now.
> > >
> > > Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> >
> > Could you add a sub-device for the CSI-2 receiver, please?
> >
> > See e.g. drivers/media/pci/intel/ipu3/ipu3-cio2.c for an example.
> 
> It's confusing, I know, but this isn't a MIPI-CSI receiver. The IP is
> called CSI, but it's only capable of handling parallel and BT656.

Right, for the parallel (or Bt.656) receiver then.

-- 
Sakari Ailus
sakari.ailus@linux.intel.com
