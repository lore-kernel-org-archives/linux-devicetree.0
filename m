Return-Path: <SRS0=iARg=PP=vger.kernel.org=devicetree-owner@kernel.org>
Received: from nblzone-211-213.nblnetworks.fi ([83.145.211.213]:51196 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726441AbfAGJtX (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 7 Jan 2019 04:49:23 -0500
Date: Mon, 7 Jan 2019 11:48:11 +0200
From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH 00/12] media: mt9m001: switch soc_mt9m001 to a standard
 subdev sensor driver
Message-ID: <20190107094811.7kx2s2wavh2enthi@valkosipuli.retiisi.org.uk>
References: <1545498774-11754-1-git-send-email-akinobu.mita@gmail.com>
 <20190107093601.izqknij7wy7e4d4c@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190107093601.izqknij7wy7e4d4c@kekkonen.localdomain>
Sender: devicetree-owner@vger.kernel.org
To: Akinobu Mita <akinobu.mita@gmail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Mauro Carvalho Chehab <mchehab@s-opensource.com>
List-ID: <devicetree@vger.kernel.org>

On Mon, Jan 07, 2019 at 11:36:03AM +0200, Sakari Ailus wrote:
> Hi Mita-san,
> 
> On Sun, Dec 23, 2018 at 02:12:42AM +0900, Akinobu Mita wrote:
> > This patchset converts soc_camera mt9m001 driver to a standard subdev
> > sensor driver.
> > 
> > Akinobu Mita (12):
> >   media: i2c: mt9m001: copy mt9m001 soc_camera sensor driver
> >   media: i2c: mt9m001: dt: add binding for mt9m001
> >   media: mt9m001: convert to SPDX license identifer
> >   media: mt9m001: add of_match_table
> >   media: mt9m001: introduce multi_reg_write()
> >   media: mt9m001: switch s_power callback to runtime PM
> >   media: mt9m001: remove remaining soc_camera specific code
> >   media: mt9m001: add media controller support
> >   media: mt9m001: register to V4L2 asynchronous subdevice framework
> >   media: mt9m001: support log_status ioctl and event interface
> >   media: mt9m001: make VIDIOC_SUBDEV_G_FMT ioctl work with
> >     V4L2_SUBDEV_FORMAT_TRY
> >   media: mt9m001: set all mbus format field when G_FMT and S_FMT ioctls
> > 
> >  .../devicetree/bindings/media/i2c/mt9m001.txt      |  37 +
> >  drivers/media/i2c/Kconfig                          |   9 +
> >  drivers/media/i2c/Makefile                         |   1 +
> >  drivers/media/i2c/mt9m001.c                        | 900 +++++++++++++++++++++
> >  4 files changed, 947 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/i2c/mt9m001.txt
> >  create mode 100644 drivers/media/i2c/mt9m001.c
> > 
> > Cc: Rob Herring <robh@kernel.org>
> > Cc: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
> > Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Cc: Mauro Carvalho Chehab <mchehab@s-opensource.com>
> 
> There's something wrong somewhere --- I can't see the set on the LMML.
> Could you resend it, please (or v2 to address Rob's comments)? I don't
> think the number of recipients is too big, so I hope this was a transient
> problem somehere that shouldn't have happened. Hmm.

Oh well, I can see my own reply as the set. Please ignore.

-- 
Sakari Ailus
