Return-Path: <SRS0=Re5X=7C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A85DC433E0
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 May 2020 07:49:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5187C207F9
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 May 2020 07:49:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726785AbgETHtD (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 20 May 2020 03:49:03 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:50957 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726403AbgETHtC (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 20 May 2020 03:49:02 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 82797FF813;
        Wed, 20 May 2020 07:48:57 +0000 (UTC)
Date:   Wed, 20 May 2020 09:52:17 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>, libcamera-devel@lists.libcamera.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh@kernel.org>, tfiga@google.com, pavel@ucw.cz,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v11 13/13] dt-bindings: Add media properties
Message-ID: <20200520075217.zxpirx5migumekwx@uno.localdomain>
References: <20200509090456.3496481-1-jacopo@jmondi.org>
 <20200509090456.3496481-14-jacopo@jmondi.org>
 <6a8add4e-c1f6-bd08-8928-3c8884eeda2c@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6a8add4e-c1f6-bd08-8928-3c8884eeda2c@xs4all.nl>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Hans,

On Mon, May 11, 2020 at 09:27:57AM +0200, Hans Verkuil wrote:
> On 09/05/2020 11:04, Jacopo Mondi wrote:
> > Add a DT header file to contain definitions for standard media properties.
> >
> > The file is named after:
> > Documentation/devicetree/bindings/media/video-interfaces.txt
> > which contains the standard media properties definitions.
> >
> > Initially add three macros to define the supported 'orientation'
> > property values.
> >
> > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > ---
> >
> > I currently don't have users in mainline for this, I understand this implies
> > this is probably not going to be accepted. At the same time we don't have a
> > common place for media-related definitions, which support properties defined in
> > video-interfaces.txt
> >
> > I leave it here at the end of the series for discussions, but I'm fine dropping
> > it from the series.
> >
> > Thanks
> >   j
> >
> > ---
> >  include/dt-bindings/media/video-interfaces.h | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> >  create mode 100644 include/dt-bindings/media/video-interfaces.h
> >
> > diff --git a/include/dt-bindings/media/video-interfaces.h b/include/dt-bindings/media/video-interfaces.h
> > new file mode 100644
> > index 0000000000000..404c697d6bd6e
> > --- /dev/null
> > +++ b/include/dt-bindings/media/video-interfaces.h
> > @@ -0,0 +1,15 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * include/dt-bindings/media/video-interfaces.h
> > + *
> > + * Copyright (C) 2020 Jacopo Mondi <jacopo@jmondi.org>
> > + */
> > +
> > +#ifndef __DT_BINDINGS_MEDIA_VIDEO_INTERFACES_H__
> > +#define __DT_BINDINGS_MEDIA_VIDEO_INTERFACES_H__
> > +
> > +#define FRONT_CAMERA		<0>
> > +#define BACK_CAMERA		<1>
> > +#define EXTERNAL_CAMERA		<2>
>
> Uh, shouldn't that be 0, 1 and 2 instead of <0>, <1> and <2> ?

I used that notation to be able to write
        orientation = FRONT_CAMERA
in place of
        orientation = <FRONT_CAMERA>

Do you think it's wrong ?

Thanks
  j

>
> I'm skipping this patch for the PR.
>
> Regards,
>
> 	Hans
>
> > +
> > +#endif /* __DT_BINDINGS_MEDIA_VIDEO_INTERFACES_H__ */
> > --
> > 2.26.1
> >
>
