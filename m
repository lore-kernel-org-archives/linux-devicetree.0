Return-Path: <SRS0=9zIi=6I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26C96C54FCB
	for <linux-devicetree@archiver.kernel.org>; Fri, 24 Apr 2020 17:14:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0440D21556
	for <linux-devicetree@archiver.kernel.org>; Fri, 24 Apr 2020 17:14:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="crFmzsS8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727988AbgDXRO0 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 24 Apr 2020 13:14:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727841AbgDXRO0 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 24 Apr 2020 13:14:26 -0400
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26533C09B048
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2020 10:14:26 -0700 (PDT)
Received: by mail-io1-xd41.google.com with SMTP id f3so11169062ioj.1
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2020 10:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RYByyO3QIEU47gTN7mqAa4K1vs54y8GQ0x5KuvlJFVY=;
        b=crFmzsS8lWUOAAgiwUHxODA0VdX/NmN1uriNwtVUUxeQaK6UjeTU8g+fpOFh5DHg5Z
         ywSPkI7dTX4Q+k1xGvY8RE+c1imAur9njIPVgQGFLJrrJWol7k8ymDw011RnY4NCmTRD
         J8cDVFeHjut2K/RXWWmDzhYA0uh2wEb/vXvkY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RYByyO3QIEU47gTN7mqAa4K1vs54y8GQ0x5KuvlJFVY=;
        b=WLomF4Ig5WszXaP6H2VIjuJ3I3CKPLoCUXjQqLg32jQckXr1ZBIDfGzxg6ilN22a9R
         CDM8HqS1MYQ9H4H6yx0Vx8WuYErB/zqBSUZudo2p64oETeK9+M+FimbVjAjQiLOf/oLP
         UYok0mJzJ4No2s7bjZqkc6OJdLD/24G+xtfFd25d3xqfISh4ayNRsC7JQ9MsWvifk8FU
         GGG6EOXr+JizQm4eBdrapK5GW2h3nrqL/yCgMpH9pExMftIvFMsvt91eaCkLRipYm5xg
         P121dV4FcRuBNKpUyO7bz22LwHf1nphHlVQcjsRnKuHz6SJ+Y8k7IsYlm/5v1II1pPdi
         kD8w==
X-Gm-Message-State: AGi0Pua+27/l2oYIFFsuPweACgqyGRtCivLTyT0shp6t2wFRXl9z+W7G
        yYg4fpCNE7BQWQbEqrdsmCREjk3MkpkUQg==
X-Google-Smtp-Source: APiQypJWmgfnDsGCx5aqmz2mzbwPxZAbfCwHdKLqPO3iKiiXqH8gUEzh4pHfWl2KBJ7pap0EDyN7AQ==
X-Received: by 2002:a02:9642:: with SMTP id c60mr9030699jai.87.1587748464677;
        Fri, 24 Apr 2020 10:14:24 -0700 (PDT)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com. [209.85.166.45])
        by smtp.gmail.com with ESMTPSA id j3sm2013625ioj.27.2020.04.24.10.14.13
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2020 10:14:18 -0700 (PDT)
Received: by mail-io1-f45.google.com with SMTP id k6so11150949iob.3
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2020 10:14:13 -0700 (PDT)
X-Received: by 2002:a5d:8615:: with SMTP id f21mr9473817iol.155.1587748451793;
 Fri, 24 Apr 2020 10:14:11 -0700 (PDT)
MIME-Version: 1.0
References: <1585701031-28871-1-git-send-email-tanmay@codeaurora.org>
In-Reply-To: <1585701031-28871-1-git-send-email-tanmay@codeaurora.org>
From:   Sean Paul <seanpaul@chromium.org>
Date:   Fri, 24 Apr 2020 13:13:34 -0400
X-Gmail-Original-Message-ID: <CAOw6vbKus8S-ZWjuozKQ8Ft4s-8dPsihrNoZf-GjcToR466RZA@mail.gmail.com>
Message-ID: <CAOw6vbKus8S-ZWjuozKQ8Ft4s-8dPsihrNoZf-GjcToR466RZA@mail.gmail.com>
Subject: Re: [DPU PATCH v5 0/5] Add support for DisplayPort driver on SnapDragon.
To:     Tanmay Shah <tanmay@codeaurora.org>
Cc:     freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        devicetree@vger.kernel.org, swboyd@chromium.org,
        Rob Clark <robdclark@gmail.com>, abhinavk@codeaurora.org,
        nganji@codeaurora.org, Jeykumar Sankaran <jsanka@codeaurora.org>,
        aravindh@codeaurora.org,
        Kristian Kristensen <hoegsberg@google.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Mar 31, 2020 at 8:31 PM Tanmay Shah <tanmay@codeaurora.org> wrote:
>
> These patches add support for Display-Port driver on SnapDragon 845 hardware. It adds
> DP driver and DP PLL driver files along with the needed device-tree bindings.
>

I focused on patches 2, 3 & 5, seems like you have good feedback on
the others by more qualified folks than me.

At a high level I don't have any major issues with the set. There are
some rough edges that I noticed as I was reading it (as would any
patch of this size), but I think it's probably not a good use of
either of our time for me to nitpick 10k lines of code over multiple
iterations.

So in the interest of not letting the perfect get in the way of the
good, I suggest we apply the set and fix up as time and necessity
allow.

Patches 2/3/5 are:

Acked-by: Sean Paul <seanpaul@chromium.org>

Sean


> The block diagram of DP driver is shown below:
>
>
>                  +-------------+
>                  |DRM FRAMEWORK|
>                  +------+------+
>                         |
>                    +----v----+
>                    | DP DRM  |
>                    +----+----+
>                         |
>                    +----v----+
>      +------------+|   DP    +----------++------+
>      +             | DISPLAY |+---+      |      |
>      |             +-+-----+-+    |      |      |
>      |               |     |      |      |      |
>      |               |     |      |      |      |
>      |               |     |      |      |      |
>      v               v     v      v      v      v
>  +------+          +---+ +----+ +----+ +---+ +-----+
>  |  DP  |          |DP | | DP | | DP | |DP | | DP  |
>  |PARSER|          |AUX| |LINK| |CTRL| |PHY| |POWER|
>  +--+---+          +---+ +----+ +--+-+ +-+-+ +-----+
>     |                              |     |
>  +--v---+                         +v-----v+
>  |DEVICE|                         |  DP   |
>  | TREE |                         |CATALOG|
>  +------+                         +---+---+
>                                       |
>                                   +---v----+
>                                   |CTRL/PHY|
>                                   |   HW   |
>                                   +--------+
>
>
> These patches have dependency on clock driver changes mentioned below:
> https://patchwork.kernel.org/patch/10632753/
> https://patchwork.kernel.org/patch/10632757/
>
> Chandan Uddaraju (4):
>   dt-bindings: msm/dp: add bindings of DP/DP-PLL driver for Snapdragon
>   drm: add constant N value in helper file
>   drm/msm/dp: add displayPort driver support
>   drm/msm/dp: add support for DP PLL driver
>
> Jeykumar Sankaran (1):
>   drm/msm/dpu: add display port support in DPU
>
>  .../devicetree/bindings/display/msm/dp-sc7180.yaml |  325 ++++
>  .../devicetree/bindings/display/msm/dpu.txt        |   16 +-
>  drivers/gpu/drm/i915/display/intel_display.c       |    2 +-
>  drivers/gpu/drm/msm/Kconfig                        |   21 +
>  drivers/gpu/drm/msm/Makefile                       |   16 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |   28 +-
>  .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |    8 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   65 +-
>  drivers/gpu/drm/msm/dp/dp_aux.c                    |  531 ++++++
>  drivers/gpu/drm/msm/dp/dp_aux.h                    |   35 +
>  drivers/gpu/drm/msm/dp/dp_catalog.c                |  988 +++++++++++
>  drivers/gpu/drm/msm/dp/dp_catalog.h                |   86 +
>  drivers/gpu/drm/msm/dp/dp_ctrl.c                   | 1707 ++++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_ctrl.h                   |   35 +
>  drivers/gpu/drm/msm/dp/dp_display.c                |  943 +++++++++++
>  drivers/gpu/drm/msm/dp/dp_display.h                |   31 +
>  drivers/gpu/drm/msm/dp/dp_drm.c                    |  170 ++
>  drivers/gpu/drm/msm/dp/dp_drm.h                    |   19 +
>  drivers/gpu/drm/msm/dp/dp_hpd.c                    |   69 +
>  drivers/gpu/drm/msm/dp/dp_hpd.h                    |   79 +
>  drivers/gpu/drm/msm/dp/dp_link.c                   | 1216 ++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_link.h                   |  132 ++
>  drivers/gpu/drm/msm/dp/dp_panel.c                  |  490 ++++++
>  drivers/gpu/drm/msm/dp/dp_panel.h                  |   95 ++
>  drivers/gpu/drm/msm/dp/dp_parser.c                 |  473 ++++++
>  drivers/gpu/drm/msm/dp/dp_parser.h                 |  220 +++
>  drivers/gpu/drm/msm/dp/dp_power.c                  |  545 +++++++
>  drivers/gpu/drm/msm/dp/dp_power.h                  |  115 ++
>  drivers/gpu/drm/msm/dp/dp_reg.h                    |  489 ++++++
>  drivers/gpu/drm/msm/dp/pll/dp_pll.c                |  127 ++
>  drivers/gpu/drm/msm/dp/pll/dp_pll.h                |   57 +
>  drivers/gpu/drm/msm/dp/pll/dp_pll_10nm.c           |  401 +++++
>  drivers/gpu/drm/msm/dp/pll/dp_pll_10nm.h           |   86 +
>  drivers/gpu/drm/msm/dp/pll/dp_pll_10nm_util.c      |  524 ++++++
>  drivers/gpu/drm/msm/msm_drv.c                      |    2 +
>  drivers/gpu/drm/msm/msm_drv.h                      |   53 +-
>  include/drm/drm_dp_helper.h                        |    2 +
>  37 files changed, 10178 insertions(+), 23 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_aux.c
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_aux.h
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_catalog.c
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_catalog.h
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_ctrl.c
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_ctrl.h
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_display.c
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_display.h
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_drm.c
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_drm.h
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_hpd.c
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_hpd.h
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_link.c
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_link.h
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_panel.c
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_panel.h
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_parser.c
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_parser.h
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_power.c
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_power.h
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_reg.h
>  create mode 100644 drivers/gpu/drm/msm/dp/pll/dp_pll.c
>  create mode 100644 drivers/gpu/drm/msm/dp/pll/dp_pll.h
>  create mode 100644 drivers/gpu/drm/msm/dp/pll/dp_pll_10nm.c
>  create mode 100644 drivers/gpu/drm/msm/dp/pll/dp_pll_10nm.h
>  create mode 100644 drivers/gpu/drm/msm/dp/pll/dp_pll_10nm_util.c
>
> --
> 1.9.1
