Return-Path: <SRS0=iARg=PP=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mga12.intel.com ([192.55.52.136]:34981 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727574AbfAGPPa (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 7 Jan 2019 10:15:30 -0500
Date: Mon, 7 Jan 2019 17:15:23 +0200
From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH 03/12] media: mt9m001: convert to SPDX license identifer
Message-ID: <20190107151522.5eh5oluj22pck3sf@kekkonen.localdomain>
References: <1545498774-11754-1-git-send-email-akinobu.mita@gmail.com>
 <1545498774-11754-4-git-send-email-akinobu.mita@gmail.com>
 <20190107113708.oex222eb6ndd3hou@kekkonen.localdomain>
 <CAC5umyjG7i+1OJSZLoUSAmgqrfVR8QZ-aREEpM3ssMDEbgbGJw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAC5umyjG7i+1OJSZLoUSAmgqrfVR8QZ-aREEpM3ssMDEbgbGJw@mail.gmail.com>
Sender: devicetree-owner@vger.kernel.org
To: Akinobu Mita <akinobu.mita@gmail.com>
Cc: linux-media@vger.kernel.org, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Mauro Carvalho Chehab <mchehab@kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Mon, Jan 07, 2019 at 11:20:29PM +0900, Akinobu Mita wrote:
> 2019年1月7日(月) 20:37 Sakari Ailus <sakari.ailus@linux.intel.com>:
> >
> > Hi Mita-san,
> >
> > On Sun, Dec 23, 2018 at 02:12:45AM +0900, Akinobu Mita wrote:
> > > Replace GPL license statements with SPDX license identifiers (GPL-2.0).
> > >
> > > Cc: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
> > > Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > Cc: Mauro Carvalho Chehab <mchehab@s-opensource.com>
> > > Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
> > > ---
> > >  drivers/media/i2c/mt9m001.c | 5 +----
> > >  1 file changed, 1 insertion(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/media/i2c/mt9m001.c b/drivers/media/i2c/mt9m001.c
> > > index a1a85ff..65ff59d 100644
> > > --- a/drivers/media/i2c/mt9m001.c
> > > +++ b/drivers/media/i2c/mt9m001.c
> > > @@ -1,11 +1,8 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > >  /*
> > >   * Driver for MT9M001 CMOS Image Sensor from Micron
> > >   *
> > >   * Copyright (C) 2008, Guennadi Liakhovetski <kernel@pengutronix.de>
> > > - *
> > > - * This program is free software; you can redistribute it and/or modify
> > > - * it under the terms of the GNU General Public License version 2 as
> > > - * published by the Free Software Foundation.
> > >   */
> > >
> > >  #include <linux/videodev2.h>
> >
> > The MODULE_LICENSE macro at the end of the file lists "GPL" as the license,
> > i.e. including later versions. I'm not sure what was the intention
> > originally. I guess it's safer to stick to 2.0, at least unless the
> > original author is able to shed some light into this.
> 
> I've come across the same thought, and I found the following conversation.
> 
> https://lkml.org/lkml/2018/6/24/457
> 
> So I think MODULE_LICENSE() mismatch can be resolved in the future.

I don't see a reason to postpone it. Strictly speaking, for GPL 2+ we'd
need an approval from anyone who has submitted patches to the file. For GPL
v2 it'd be just a patch that fixes the MODULE_LICENSE.

-- 
Sakari Ailus
sakari.ailus@linux.intel.com
