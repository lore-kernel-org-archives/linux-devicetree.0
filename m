Return-Path: <SRS0=xnVj=BG=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4076BC433ED
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jul 2020 14:12:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1A7CD2083E
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jul 2020 14:12:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=vanguardiasur-com-ar.20150623.gappssmtp.com header.i=@vanguardiasur-com-ar.20150623.gappssmtp.com header.b="B8ffA7US"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730245AbgG0OMo (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 27 Jul 2020 10:12:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730246AbgG0OMn (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 27 Jul 2020 10:12:43 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF5D8C061794
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2020 07:12:42 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id v22so1474526edy.0
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2020 07:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bHapzJ0P6xUuZ32/Fm3FmLxN3+W0YiwvdWtul3bH0zc=;
        b=B8ffA7US+1YKsKILPUPB+8nSLr6m3RTdAtBDehe3oxJyYQ7mRu0QiHt38w+fEdoQLG
         jdtbJLjSnRSRs/U27O/03LK5W+gje6bfwur455MeP9VxwLT2oacer2EFrUSWfGQTiLPB
         4h1da6SxVTQRL/KFHQX9UU1+yoqZj9ixBqaNUTqHfI65CDLmTa5U4K/qYpJ+TliA0tp2
         JVZQcMqIOpnHq74+mduHT8TTmn6SyfFisCcaQWuKE/+ebwlkl0D/ua+qRPGv0qGwiZcL
         3yq6hBbdW9Ougv+EJhJsaYgbOO5xj0GXvY97kJG3ZLX1bVQmX4PiZjuEtSHUsYJRo6n/
         vhgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bHapzJ0P6xUuZ32/Fm3FmLxN3+W0YiwvdWtul3bH0zc=;
        b=IzDmu0+Sz7nnQlVftNVUhxLvsR9337XC9FRTsqFRAkSoGPqeGnnHTvz+2XRhbv4PQW
         GBxxvda6gM99jkO7e43ArQC9nbFBdl4hdLE9zber37jDWGsJ3xVHjMdUKiVk0+K/49Mq
         3EELusb+GTuCCwdR/N1LLbpp/qg/e3kNHFvi2JJh0GeLyHrtgi3a4O1uCVKaE/Erpi8X
         srrky0zGr/kGxF/OqvaAvL4TVb4TA/pHEazN0sfSNHP8fpLctpeUpBVka9ygJgxTYI2g
         /PNeHOBW0t+fR9myEKmwxgLLLCVXxvPBbMJmM7D4TWsMru41zeNk+81iinrnZGNCeIT7
         e/+w==
X-Gm-Message-State: AOAM5301tona4fET85BiXju5oTC3ExiSYzvCFh679nToGk5T3clbdJzS
        TRFCHyXU2V9gnfryZIIhr4txMXD+Svukl3T4rxfxQXDK
X-Google-Smtp-Source: ABdhPJzL6g6Q0QOmH9j7dy280O/qkgraYf1W+MBlD2oMwuVrryHQjjWkm7mAfQzWBU2TtCCTk/dPSXhirg3BW3/hgPg=
X-Received: by 2002:a05:6402:947:: with SMTP id h7mr21787651edz.213.1595859161489;
 Mon, 27 Jul 2020 07:12:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200713060842.471356-1-acourbot@chromium.org>
 <20200713060842.471356-3-acourbot@chromium.org> <CAAEAJfD8yfdTptkmXoPzrw6S=6eKr=K4yL9-5aq2JtWF7M3=7w@mail.gmail.com>
 <CAPBb6MW3AC2savGCHk8w98u1oRuZAs9m6sqz++ksJ58DGvJ5nQ@mail.gmail.com>
In-Reply-To: <CAPBb6MW3AC2savGCHk8w98u1oRuZAs9m6sqz++ksJ58DGvJ5nQ@mail.gmail.com>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Mon, 27 Jul 2020 11:12:30 -0300
Message-ID: <CAAEAJfB1cBM-QCg1Sg6iwyQps7r6osY69p68Q-0_YzmSPhNgXw@mail.gmail.com>
Subject: Re: [PATCH v3 02/16] dt-bindings: media: mtk-vcodec: document SCP node
To:     Alexandre Courbot <acourbot@chromium.org>
Cc:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        linux-media <linux-media@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, 27 Jul 2020 at 06:06, Alexandre Courbot <acourbot@chromium.org> wrote:
>
> On Thu, Jul 23, 2020 at 6:37 AM Ezequiel Garcia
> <ezequiel@vanguardiasur.com.ar> wrote:
> >
> > On Mon, 13 Jul 2020 at 03:09, Alexandre Courbot <acourbot@chromium.org> wrote:
> > >
> > > The mediatek codecs can use either the VPU or the SCP as their interface
> > > to firmware. Reflect this in the DT bindings.
> > >
> > > Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> > > Acked-by: Tiffany Lin <tiffany.lin@mediatek.com>
> > > ---
> > >  Documentation/devicetree/bindings/media/mediatek-vcodec.txt | 4 +++-
> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> > > index b6b5dde6abd8..7aef0a4fe207 100644
> > > --- a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> > > +++ b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> > > @@ -19,7 +19,9 @@ Required properties:
> > >  - iommus : should point to the respective IOMMU block with master port as
> > >    argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
> > >    for details.
> > > -- mediatek,vpu : the node of video processor unit
> > > +One of the two following nodes:
> > > +- mediatek,vpu : the node of the video processor unit, if using VPU.
> > > +- mediatek,scp : the noode of the SCP unit, if using SCP.
> > >
> >
> > This interface doesn't enforce the fact only one of the two
> > should be present, but not both (which is the case, right?).
>
> That's correct.
>
> >
> > I hope I'm not bikeshedding here, but from an interface POV,
> > would it be cleaner to just have a single mediatek,coprocessor
> > property, and then use of_device_is_compatible
> > to distinguish VPU from SCP type?
>
> From an interface point of view maybe, however doing so would
> introduce a backward-incompatible change with the existing MT8173
> bindings. I also feel like it is less error-prone to have the property
> explicitly state what it is expecting at the other end of the phandle
> (vpu or scp) instead of the more generic "coprocessor".
>
> >
> > Moreover, I'd argue you don't need a dt-binding change
> > and should just keep the current mediatek-vpu property,
> > and then rely on of_device_is_compatible.
>
> VPU and SCP are different kinds of processors, so I'm not sure whether
> it is desirable to use VPU interchangeably like this. Note that I'm
> not strongly against it either, but for things like bindings I tend to
> prefer precise language to avoid confusions.

Yeah, I guess that makes sense.

Not only from a language precision point of view (after all
DT are not designed to be human readable).

But as you mention, given the processors will have different compatible
strings it would make sense to not allow overloading the property.

In any case, I don't have a strong opinion either.

Thanks,
Ezequiel
