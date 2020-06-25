Return-Path: <SRS0=bF7C=AG=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3962C433E1
	for <linux-devicetree@archiver.kernel.org>; Thu, 25 Jun 2020 22:21:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 83B2D20767
	for <linux-devicetree@archiver.kernel.org>; Thu, 25 Jun 2020 22:21:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hQeh5IvC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404101AbgFYWVa (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 25 Jun 2020 18:21:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403905AbgFYWV3 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 25 Jun 2020 18:21:29 -0400
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com [IPv6:2607:f8b0:4864:20::e36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA73BC08C5C1
        for <devicetree@vger.kernel.org>; Thu, 25 Jun 2020 15:21:29 -0700 (PDT)
Received: by mail-vs1-xe36.google.com with SMTP id 190so4446766vsr.9
        for <devicetree@vger.kernel.org>; Thu, 25 Jun 2020 15:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HiC4BtBcvypNi0TT+uKmaMyQomfNIooMQQ9SMeSvJuE=;
        b=hQeh5IvCT9+c5THqtc6WWb2AHU0aYgWF5ReZ+qFjCCpfIqgW19aaZnB90R90eRy0XI
         aqqBosgZeXnP5zp2JACRzpjqBvLLkUVWfrSy6pNESy7bXlN8NAGyTcPtiDfqcYQkAXxh
         Dtax+BMxyCZeltX5LaizJxMHd1OeZVgKaCSgM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HiC4BtBcvypNi0TT+uKmaMyQomfNIooMQQ9SMeSvJuE=;
        b=amc80p6SxnHecbJ+Ii9LRHs8bfFvjFpIFVX1wVxmFMD/zOvvOjTzB1/Ebwpa/IA52x
         4BGsDxLuWqO1Op3jySIZiiqFAZOQeT7PGbZZU4GyQkue8R0wL7p7qWMdaC7oXHvnEnWP
         XZSN1YW0yVCtQnVKY/3mw1b70/Tr5DJ39XPjKy6F5rtbaMQ5snD9pyc1NPSbMIEgUf0I
         I9SSVCfrq+sadOrs0Yrq4eYbG3IiYTEStMhLZxapaewd9+zBTwSUWIeDK+0+/YzqDy65
         wwzUFzZjTKcUgR7BzLDiAYJOKKLha7tRCChrwUpLEUMmirOJ5lZthiXOckekXGrnFudI
         j4Uw==
X-Gm-Message-State: AOAM531DXLAQfT7Vvl7+LXgGpFrQFWFjWqGe36hM1BXzs6/+Xz9DS/6K
        HZtzRV2Zn6nIi6Hx9067mCo4J8uwo1Q=
X-Google-Smtp-Source: ABdhPJyhzwf4uDL8p7EzkMS281UK62bF2Ybfg9q/dvceTAQQjlRo2/Fh10CRWPE9fIAG66DoMMW5Fg==
X-Received: by 2002:a67:2d16:: with SMTP id t22mr360403vst.160.1593123688405;
        Thu, 25 Jun 2020 15:21:28 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id p7sm1189100vsl.25.2020.06.25.15.21.27
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2020 15:21:27 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id e15so4465897vsc.7
        for <devicetree@vger.kernel.org>; Thu, 25 Jun 2020 15:21:27 -0700 (PDT)
X-Received: by 2002:a05:6102:20c8:: with SMTP id i8mr347826vsr.106.1593123686688;
 Thu, 25 Jun 2020 15:21:26 -0700 (PDT)
MIME-Version: 1.0
References: <1593087419-903-1-git-send-email-kalyan_t@codeaurora.org>
In-Reply-To: <1593087419-903-1-git-send-email-kalyan_t@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 25 Jun 2020 15:21:15 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VXAQagbM-dn7MWGm08DdBxefc4jHNbkvHzuBjSM_jWnw@mail.gmail.com>
Message-ID: <CAD=FV=VXAQagbM-dn7MWGm08DdBxefc4jHNbkvHzuBjSM_jWnw@mail.gmail.com>
Subject: Re: [v2] drm/msm/dpu: add support for dither block in display
To:     Kalyan Thota <kalyan_t@codeaurora.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Sean Paul <seanpaul@chromium.org>,
        "Kristian H. Kristensen" <hoegsberg@chromium.org>,
        mkrishn@codeaurora.org, travitej@codeaurora.org,
        nganji@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On Thu, Jun 25, 2020 at 5:17 AM Kalyan Thota <kalyan_t@codeaurora.org> wrote:
>
> This change enables dither block for primary interface
> in display.
>
> Enabled for 6bpc in the current version.
>
> Changes in v1:
>  - Remove redundant error checks (Rob).
>
> Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c     | 39 +++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c | 63 +++++++++++++++++++++----
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h | 28 +++++++++++
>  3 files changed, 121 insertions(+), 9 deletions(-)

Tested-by: Douglas Anderson <dianders@chromium.org>
