Return-Path: <SRS0=iARg=PP=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-pl1-f193.google.com ([209.85.214.193]:44643 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726827AbfAGOUl (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 7 Jan 2019 09:20:41 -0500
MIME-Version: 1.0
References: <1545498774-11754-1-git-send-email-akinobu.mita@gmail.com>
 <1545498774-11754-4-git-send-email-akinobu.mita@gmail.com> <20190107113708.oex222eb6ndd3hou@kekkonen.localdomain>
In-Reply-To: <20190107113708.oex222eb6ndd3hou@kekkonen.localdomain>
From: Akinobu Mita <akinobu.mita@gmail.com>
Date: Mon, 7 Jan 2019 23:20:29 +0900
Message-ID: <CAC5umyjG7i+1OJSZLoUSAmgqrfVR8QZ-aREEpM3ssMDEbgbGJw@mail.gmail.com>
Subject: Re: [PATCH 03/12] media: mt9m001: convert to SPDX license identifer
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Mauro Carvalho Chehab <mchehab@kernel.org>
List-ID: <devicetree@vger.kernel.org>

2019=E5=B9=B41=E6=9C=887=E6=97=A5(=E6=9C=88) 20:37 Sakari Ailus <sakari.ail=
us@linux.intel.com>:
>
> Hi Mita-san,
>
> On Sun, Dec 23, 2018 at 02:12:45AM +0900, Akinobu Mita wrote:
> > Replace GPL license statements with SPDX license identifiers (GPL-2.0).
> >
> > Cc: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
> > Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Cc: Mauro Carvalho Chehab <mchehab@s-opensource.com>
> > Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
> > ---
> >  drivers/media/i2c/mt9m001.c | 5 +----
> >  1 file changed, 1 insertion(+), 4 deletions(-)
> >
> > diff --git a/drivers/media/i2c/mt9m001.c b/drivers/media/i2c/mt9m001.c
> > index a1a85ff..65ff59d 100644
> > --- a/drivers/media/i2c/mt9m001.c
> > +++ b/drivers/media/i2c/mt9m001.c
> > @@ -1,11 +1,8 @@
> > +// SPDX-License-Identifier: GPL-2.0
> >  /*
> >   * Driver for MT9M001 CMOS Image Sensor from Micron
> >   *
> >   * Copyright (C) 2008, Guennadi Liakhovetski <kernel@pengutronix.de>
> > - *
> > - * This program is free software; you can redistribute it and/or modif=
y
> > - * it under the terms of the GNU General Public License version 2 as
> > - * published by the Free Software Foundation.
> >   */
> >
> >  #include <linux/videodev2.h>
>
> The MODULE_LICENSE macro at the end of the file lists "GPL" as the licens=
e,
> i.e. including later versions. I'm not sure what was the intention
> originally. I guess it's safer to stick to 2.0, at least unless the
> original author is able to shed some light into this.

I've come across the same thought, and I found the following conversation.

https://lkml.org/lkml/2018/6/24/457

So I think MODULE_LICENSE() mismatch can be resolved in the future.
