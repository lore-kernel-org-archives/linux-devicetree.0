Return-Path: <SRS0=wnEW=6Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4BB0C47255
	for <linux-devicetree@archiver.kernel.org>; Mon, 11 May 2020 07:28:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B0EDC207FF
	for <linux-devicetree@archiver.kernel.org>; Mon, 11 May 2020 07:28:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="ZWq9BdqO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725790AbgEKH2C (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 11 May 2020 03:28:02 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:56463 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728425AbgEKH2B (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Mon, 11 May 2020 03:28:01 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id Y2qzjxHritKAsY2r0jnQb4; Mon, 11 May 2020 09:27:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1589182079; bh=djFYuodzN4n71AJy/ln34i1tOSfwYHOl2CIsBKilu2g=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=ZWq9BdqOaAblLRg+t/bVIpo8mW/NtldKPrpfGt6uTLxWx4wqwz85DWUeu0dJTdBnB
         Q9O3zOpyTzaUN0uPLmDXgvZWA4DrA25Fl1ULSf+AfBydN21hGRdbD2R0qtW6aaqXD0
         WY0/bIy4nENa6xCc1qbEpos27RELjDnsncS0ayiKB0v/uapvp4PbFaiuIybrvskWAp
         zjlXzjvJ1/iBduAYULZF6cfz/WkF+pqutUNvVy9V8684eTeJfNsfN9qD7jo5cFv/7H
         IIIGj3mWchf+57FjY6DlpzlSdZysgVSEldAbuZt6xgesI4AomOCXTDT6lNL3uao3+5
         WJ6eNlwxg/Q5Q==
Subject: Re: [PATCH v11 13/13] dt-bindings: Add media properties
To:     Jacopo Mondi <jacopo@jmondi.org>,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>, libcamera-devel@lists.libcamera.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh@kernel.org>
Cc:     tfiga@google.com, pavel@ucw.cz, devicetree@vger.kernel.org
References: <20200509090456.3496481-1-jacopo@jmondi.org>
 <20200509090456.3496481-14-jacopo@jmondi.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <6a8add4e-c1f6-bd08-8928-3c8884eeda2c@xs4all.nl>
Date:   Mon, 11 May 2020 09:27:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200509090456.3496481-14-jacopo@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfIeiB9Ead4aZl4KJTvWnhlmpMLPgM5Y3oDscyguEHliG8TMHRc+79DqIOQIikfhxtqF8mmh9MxNnSzGbmrkDtuKJBTo4F80Syfrv/3oVnt+t1ZzwwMA6
 EMboqN0CJ2H9jq4dMyli6kanivlpzNiIz+T+RGRmyTVW37v+vJ4e+Ve6SCqR3uKvzs2EFYs9vtCCJqX/H1ISq3zuAje05mTQxHBH3Rt51YgAABYcGcDShuat
 nQsXe9JROuF70Im1EtTcOzmXxufCEFDBDnXaLy3wOPkMgu/wtk7LDYImzMCbUwZ8nrSwwtIJz1ZiTovOoUkrIdks4ZEDsb5X/bKQ0r/0egOSRivS9kgAl1ew
 vuw6FJR5XXdqikrrbExfo6YYpPLKNd6vcELdo7Oj7cprEGTgG/oeQi+lQvvuNdS4s+TFZqTHcSu4DlxJlfPmDDLFtvqLjTtGAvycbYJgzVJmTK/ggjY77YYh
 ud7eDe8O9pDpalSr/l14CQOKrrYlwhkhq23XGdVKcGs83czbXNJNefpe/D/vWNriJ6VVKeCDXvrw0Cn74JwkTTVUJ1C1MNutBvKFf3B9wnjU6JG1GnV52dSG
 pmyHoojaLSWJHbdCxBlxFycc
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 09/05/2020 11:04, Jacopo Mondi wrote:
> Add a DT header file to contain definitions for standard media properties.
> 
> The file is named after:
> Documentation/devicetree/bindings/media/video-interfaces.txt
> which contains the standard media properties definitions.
> 
> Initially add three macros to define the supported 'orientation'
> property values.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
> 
> I currently don't have users in mainline for this, I understand this implies
> this is probably not going to be accepted. At the same time we don't have a
> common place for media-related definitions, which support properties defined in
> video-interfaces.txt
> 
> I leave it here at the end of the series for discussions, but I'm fine dropping
> it from the series.
> 
> Thanks
>   j
> 
> ---
>  include/dt-bindings/media/video-interfaces.h | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 include/dt-bindings/media/video-interfaces.h
> 
> diff --git a/include/dt-bindings/media/video-interfaces.h b/include/dt-bindings/media/video-interfaces.h
> new file mode 100644
> index 0000000000000..404c697d6bd6e
> --- /dev/null
> +++ b/include/dt-bindings/media/video-interfaces.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * include/dt-bindings/media/video-interfaces.h
> + *
> + * Copyright (C) 2020 Jacopo Mondi <jacopo@jmondi.org>
> + */
> +
> +#ifndef __DT_BINDINGS_MEDIA_VIDEO_INTERFACES_H__
> +#define __DT_BINDINGS_MEDIA_VIDEO_INTERFACES_H__
> +
> +#define FRONT_CAMERA		<0>
> +#define BACK_CAMERA		<1>
> +#define EXTERNAL_CAMERA		<2>

Uh, shouldn't that be 0, 1 and 2 instead of <0>, <1> and <2> ?

I'm skipping this patch for the PR.

Regards,

	Hans

> +
> +#endif /* __DT_BINDINGS_MEDIA_VIDEO_INTERFACES_H__ */
> --
> 2.26.1
> 

