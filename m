Return-Path: <SRS0=UIXH=76=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 204AAC433E0
	for <linux-devicetree@archiver.kernel.org>; Wed, 17 Jun 2020 22:07:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F26EC21548
	for <linux-devicetree@archiver.kernel.org>; Wed, 17 Jun 2020 22:07:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gnPSUYqc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726835AbgFQWHq (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 17 Jun 2020 18:07:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726840AbgFQWHp (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 17 Jun 2020 18:07:45 -0400
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com [IPv6:2607:f8b0:4864:20::b44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36BC7C061755
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2020 15:07:43 -0700 (PDT)
Received: by mail-yb1-xb44.google.com with SMTP id k18so2030761ybm.13
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2020 15:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=y+nBmhNSgE5/KJgzUGIyU14Car0+dblfov0Gz+IxE+Y=;
        b=gnPSUYqcV/QHB6lDj/49U8FH/Y2M6vfoPn4+JBtghQI1XLfhiH8LLgUSnfmksiYo3I
         2P1UQv+mBcannQnF+aIAE6SwCxtZU5k16VUb29LJCtBZrjLCUSCYgr8hXYGmKkqxkzvT
         /2v9/AQCRVbeaFt0k3Iu8GEM26/sQq7tFhKS+6h+HB7xjQnKGuG5qyk6YFDC985c80Hx
         YmyOWLQhb+lvVJmcIHSKjwNy7xJG9BEB2OyV4xiD766tXLCaTK1NOl8U7gGSnubPDrrB
         4PCtYhoRo4FaSlzvdJ7fsWEe/CCrtFqa0wH/dXP5hign3sp+n43z6DaBdfT/WIKmoYmT
         PC6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y+nBmhNSgE5/KJgzUGIyU14Car0+dblfov0Gz+IxE+Y=;
        b=Vg/4qsOmTgEIKzE9Z2Ybs2kvaIK8k8055+fOCG7TBBC4pPxi1f8poIDaYJtqbvn9LE
         jzw2tY7g4ayuOTuuMsgsHlMtG2sLZvaL+fq3ox2CaKTOBQ1MF5J218/qNOUiQwAHvK1y
         VPSqb2RPxXoxxsg3RCm06FWxKy/WyjHbrco+u/T0f34Tzi8DJr1tuqsnMgHE0/puPZyk
         x+dgGvmTvDK6ttcARs0HhK6vA/s069NEMD9fucIjH8SIHsNdiw/snapfbGa3N3R630Md
         YGa3siFdYba171l4J/QTI4CJ0hUoHvdZb3VqpHozzXpgGN/Os+GbZpX7WEA3Kr9fJQ/E
         8kUQ==
X-Gm-Message-State: AOAM531iuI7E6S2j928YO+tWpOX+5O/k5YOUKtAe8aYW+IiZ39IHnhPg
        Vvk4nMSwX/dMYL09U/54w6ouWYIODWk+NWW4oKZaWg==
X-Google-Smtp-Source: ABdhPJyfXGntakeTVfHZEfQG9XfX+r1JGGWMwayN2tLsGEeNCZVfjhh9l6O5KED7dswsY8IcAKjmmk3cbZ2V2+GTdc8=
X-Received: by 2002:a25:ca45:: with SMTP id a66mr1830715ybg.164.1592431662324;
 Wed, 17 Jun 2020 15:07:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200615193811.233737-1-jnchase@google.com> <20200615193811.233737-2-jnchase@google.com>
 <20200617202645.GA2728573@bogus>
In-Reply-To: <20200617202645.GA2728573@bogus>
From:   Jeff Chase <jnchase@google.com>
Date:   Wed, 17 Jun 2020 15:07:31 -0700
Message-ID: <CALTkaQ2q0=Z5bo4p5jwJcS9j9TikKq-TzSXhWLyP8P71n1m0Zw@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: Add ch7322 media i2c device
To:     Rob Herring <robh@kernel.org>
Cc:     mchehab@kernel.org, robh+dt@kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Jun 17, 2020 at 1:26 PM Rob Herring <robh@kernel.org> wrote:
>
> On Mon, 15 Jun 2020 15:38:10 -0400, Jeff Chase wrote:
> > The ch7322 is a Chrontel CEC controller.
> >
> > Signed-off-by: Jeff Chase <jnchase@google.com>
> > ---
> >  .../bindings/media/i2c/chrontel,ch7322.yaml   | 67 +++++++++++++++++++
> >  MAINTAINERS                                   |  7 ++
> >  2 files changed, 74 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/i2c/chrontel,ch7322.yaml
> >
>
>
> Please add Acked-by/Reviewed-by tags when posting new versions. However,
> there's no need to repost patches *only* to add the tags. The upstream
> maintainer will do that for acks received on the version they apply.
>
> If a tag was not added on purpose, please state why and what changed.

Sorry, still learning this process.

Hans, should I resubmit or would you add the Reviewed-by tag from v4?

Thanks,
Jeff
