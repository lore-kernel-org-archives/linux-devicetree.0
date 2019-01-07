Return-Path: <SRS0=iARg=PP=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:19425 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727242AbfAGPRN (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 7 Jan 2019 10:17:13 -0500
Date: Mon, 7 Jan 2019 17:16:59 +0200
From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH 12/12] media: mt9m001: set all mbus format field when
 G_FMT and S_FMT ioctls
Message-ID: <20190107151658.rp2qwcg3goesp7a4@kekkonen.localdomain>
References: <1545498774-11754-1-git-send-email-akinobu.mita@gmail.com>
 <1545498774-11754-13-git-send-email-akinobu.mita@gmail.com>
 <20190107113243.dte4yqioqy33cwe5@kekkonen.localdomain>
 <CAC5umyjrnxZ4FdGsmy9UZ5FSx16RQwDu2StRg67Kov=pxZrodw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAC5umyjrnxZ4FdGsmy9UZ5FSx16RQwDu2StRg67Kov=pxZrodw@mail.gmail.com>
Sender: devicetree-owner@vger.kernel.org
To: Akinobu Mita <akinobu.mita@gmail.com>
Cc: linux-media@vger.kernel.org, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Mauro Carvalho Chehab <mchehab@kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Mon, Jan 07, 2019 at 11:18:47PM +0900, Akinobu Mita wrote:
> 2019年1月7日(月) 20:32 Sakari Ailus <sakari.ailus@linux.intel.com>:
> >
> > Hi Mita-san,
> >
> > On Sun, Dec 23, 2018 at 02:12:54AM +0900, Akinobu Mita wrote:
> > > This driver doesn't set all members of mbus format field when the
> > > VIDIOC_SUBDEV_{S,G}_FMT ioctls are called.
> > >
> > > This is detected by v4l2-compliance.
> > >
> > > Cc: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
> > > Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > Cc: Mauro Carvalho Chehab <mchehab@s-opensource.com>
> > > Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
> > > ---
> > >  drivers/media/i2c/mt9m001.c | 7 +++++++
> > >  1 file changed, 7 insertions(+)
> > >
> > > diff --git a/drivers/media/i2c/mt9m001.c b/drivers/media/i2c/mt9m001.c
> > > index f4afbc9..82b89d5 100644
> > > --- a/drivers/media/i2c/mt9m001.c
> > > +++ b/drivers/media/i2c/mt9m001.c
> > > @@ -342,6 +342,9 @@ static int mt9m001_get_fmt(struct v4l2_subdev *sd,
> > >       mf->code        = mt9m001->fmt->code;
> > >       mf->colorspace  = mt9m001->fmt->colorspace;
> > >       mf->field       = V4L2_FIELD_NONE;
> > > +     mf->ycbcr_enc   = V4L2_YCBCR_ENC_DEFAULT;
> > > +     mf->quantization = V4L2_QUANTIZATION_DEFAULT;
> > > +     mf->xfer_func   = V4L2_XFER_FUNC_DEFAULT;
> >
> > Instead of setting the fields individually, would it be feasible to just
> > assign mt9m001->fmt to mf?
> 
> The data type of mt9m001->fmt is struct mt9m001_datafmt, so it can't
> simply assign to mf.

Oh, good point. There are still three places in the driver where you're
setting effectively the same fields; if there is a way to reasonably
address that, it'd be nice to do that. Up to you.

-- 
Sakari Ailus
sakari.ailus@linux.intel.com
