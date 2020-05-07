Return-Path: <SRS0=rqTW=6V=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F121C35280
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 May 2020 21:39:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 06DE8208DB
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 May 2020 21:39:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dQ4tCio6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726598AbgEGVj3 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 7 May 2020 17:39:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726445AbgEGVj3 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 7 May 2020 17:39:29 -0400
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com [IPv6:2607:f8b0:4864:20::e42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CA2BC05BD43
        for <devicetree@vger.kernel.org>; Thu,  7 May 2020 14:39:29 -0700 (PDT)
Received: by mail-vs1-xe42.google.com with SMTP id u12so4506914vsq.0
        for <devicetree@vger.kernel.org>; Thu, 07 May 2020 14:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=M2REwmdOVymRYBMV7tQ7oOUCRpm+a0YhGPMvLHsCvKk=;
        b=dQ4tCio6irYP1q8bcUw+D4VKuUlm3btWo/5PTC4DAYF8EMw5Nq218WChyhlWlpgQlS
         LbygcAsZM3d8etC+ufLui8iRcw2Yt1L5GRs/b/QZ6rR04xDKfZOl0U6nS2BPJhgsYv9U
         9ac6paiz82cow2WGFoVPucwq70z58Ck4VpjcU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M2REwmdOVymRYBMV7tQ7oOUCRpm+a0YhGPMvLHsCvKk=;
        b=qLqObSOe+U4DMQGJFUktQxQ1z/SeAAG1j6JOtVICyqlTRTBqAg0sS0hGK/vWevr6Mk
         xq8JQZCywABemI1k8b2FgZus4e6tGES2hurBBQyYrTF/wZrzw/usJmbdDOrlTIE8gZHB
         mRPNF9EJ+byk5gi3Epg20wOpyP6i8QniHKrnooCYF/0ivYVUe3/c/ONLpQUcdSmYEsD2
         6WwlHImWKJfUZ2sDuVfVS9u135ZLg7hQ1Ki3iI5Y2FPVB6AcEwI1jxQJumEZSy9EZdZf
         kK0sNm+39LfVLCZCDIT/HILgOrmAzbNYvo+8on3p2hHsZMp/+ev2n+ipMqtDsn+L1RDu
         krtQ==
X-Gm-Message-State: AGi0PubIxDa5FmLSrAprp5lghlxWULtypBItmn223Qf0Rf2lLvNAj3r7
        Yen1gBJvh6crS+flr+HhTZ8Ne+d8at8=
X-Google-Smtp-Source: APiQypLAXDDlgBMBiFvisjnsbFslvXE1Wpx31qSb0ua9hKPJONUFbtt945XVcnTN3ZrqvJtP3Q16Uw==
X-Received: by 2002:a67:32c4:: with SMTP id y187mr13496363vsy.120.1588887568172;
        Thu, 07 May 2020 14:39:28 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id j6sm3829873vkj.55.2020.05.07.14.39.27
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2020 14:39:27 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id g2so4395361vsb.4
        for <devicetree@vger.kernel.org>; Thu, 07 May 2020 14:39:27 -0700 (PDT)
X-Received: by 2002:a67:fc46:: with SMTP id p6mr15561029vsq.169.1588887566823;
 Thu, 07 May 2020 14:39:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200506140208.v2.1.Ibc8eeddcee94984a608d6900b46f9ffde4045da4@changeid>
 <20200506140208.v2.2.I0a2bca02b09c1fcb6b09479b489736d600b3e57f@changeid>
In-Reply-To: <20200506140208.v2.2.I0a2bca02b09c1fcb6b09479b489736d600b3e57f@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 7 May 2020 14:39:15 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xp6m_MdnrxGG5S1YyateAkHua7iQ1EU5iftH0kYxTO5A@mail.gmail.com>
Message-ID: <CAD=FV=Xp6m_MdnrxGG5S1YyateAkHua7iQ1EU5iftH0kYxTO5A@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: drm/bridge: ti-sn65dsi86: Improve the
 yaml validation
To:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc:     Rob Clark <robdclark@chromium.org>,
        Sean Paul <seanpaul@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On Wed, May 6, 2020 at 2:03 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> This patch adds the following checks to the yaml:
> - Remapping of the eDP output lanes is now limited to the subset of
>   remappings that the hardware supports.
> - No more additional properties can be added under 'ports'.
>
> This patch fixes the following bugs in the original yaml conversion:
> - Fixed dependency between 'data-lanes' and 'lane-polarities', which
>   was backwards.  Now you can only specify 'lane-polarities' if you
>   specified 'data-lanes'.  I could have sworn I tried this before.
> - We can't remap input lanes in this hardware.
>
> This patch doesn't do, but if someone knew how I'd love to:
> - Make sure if we have both 'lane-polarities' and 'data-lanes' that
>   they have the same number of elements.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> This patch could be squashed atop the patch adding the yaml [1].  I'm
> sending separately for now to avoid churning the series another time.
>
> [1] https://lore.kernel.org/r/20200430124442.v4.4.Ifcdc4ecb12742a27862744ee1e8753cb95a38a7f@changeid
>
> Changes in v2:
> - ("... Improve the yaml validation") new for v2.
>
>  .../bindings/display/bridge/ti,sn65dsi86.yaml | 74 ++++++++++---------
>  1 file changed, 40 insertions(+), 34 deletions(-)

Please consider this patch abandoned.  Since I had other reasons to
send out a v5 of the original series this is now squashed in.  See:

https://lore.kernel.org/r/20200507143354.v5.4.Ifcdc4ecb12742a27862744ee1e8753cb95a38a7f@changeid

NOTE that patch #1 in this series, AKA ("drm/bridge: ti-sn65dsi86:
Implement lane reordering + polarity") is still sane/valid and still
applies just fine atop my v5 series.

-Doug
