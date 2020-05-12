Return-Path: <SRS0=NYOC=62=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4A76C54E4B
	for <linux-devicetree@archiver.kernel.org>; Tue, 12 May 2020 07:18:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 99DB320675
	for <linux-devicetree@archiver.kernel.org>; Tue, 12 May 2020 07:18:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725933AbgELHSL (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 12 May 2020 03:18:11 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:47529 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725889AbgELHSK (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 12 May 2020 03:18:10 -0400
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 7A7DB200008;
        Tue, 12 May 2020 07:18:05 +0000 (UTC)
Date:   Tue, 12 May 2020 09:21:18 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Rob Herring <robh@kernel.org>
Cc:     libcamera-devel@lists.libcamera.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        devicetree@vger.kernel.org, pavel@ucw.cz, tfiga@google.com,
        "open list:MEDIA INPUT INFRASTRUCTURE V4L/DVB" 
        <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v10 01/13] dt-bindings: video-interfaces: Document
 'orientation' property
Message-ID: <20200512072118.y7rhkhkdfvnmhkpn@uno.localdomain>
References: <20200508100158.3437161-1-jacopo@jmondi.org>
 <20200508100158.3437161-2-jacopo@jmondi.org>
 <20200511172008.GA25628@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200511172008.GA25628@bogus>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Rob,

On Mon, May 11, 2020 at 12:20:08PM -0500, Rob Herring wrote:
> On Fri,  8 May 2020 12:01:46 +0200, Jacopo Mondi wrote:
> > Add the 'orientation' device property, used to specify the device mounting
> > position. The property is particularly meaningful for mobile devices
> > with a well defined usage orientation.
> >
> > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > ---
> >  .../devicetree/bindings/media/video-interfaces.txt    | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >
>
>
> Please add Acked-by/Reviewed-by tags when posting new versions. However,
> there's no need to repost patches *only* to add the tags. The upstream
> maintainer will do that for acks received on the version they apply.
>

Yours and Tomasz's tags are back in v11, for which Hans has sent a
pull request.

Sorry I've missed them in v10, not sure what happened :)

Thanks
   j

> If a tag was not added on purpose, please state why and what changed.
>
