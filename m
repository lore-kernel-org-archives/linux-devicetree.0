Return-Path: <SRS0=0pfk=6G=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E899C5518A
	for <linux-devicetree@archiver.kernel.org>; Wed, 22 Apr 2020 10:29:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EF8B02084D
	for <linux-devicetree@archiver.kernel.org>; Wed, 22 Apr 2020 10:29:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XNRaT88T"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730806AbgDVK1A (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 22 Apr 2020 06:27:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730799AbgDVK06 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 22 Apr 2020 06:26:58 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 367A5C03C1AB
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2020 03:26:58 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id n24so745688plp.13
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2020 03:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=6gdINTWw5qbNqv+goCkAx9WxOclB6kfMGhupWamyF/Q=;
        b=XNRaT88T1nqiUZ51J9UejP6i7hnQv7eU7Uue7ieUv0Az3LPOAyUC97V8zUzOY7UV3P
         7vS9knLlETaJKXjxoJO5Nd29sCjQR0b5lVKY+ZUpsO/rQYe7B0eMZZ9OhMsOoHv7AAnO
         lj7bnr88UGowfAV2pYpeiEXswsaPg8GYpgJOo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=6gdINTWw5qbNqv+goCkAx9WxOclB6kfMGhupWamyF/Q=;
        b=KhMTYI+6tgr+5gI0pKiPETV6YPUGdTw8lr9HdgHODIe7psLYsgqFjs+MMlcJahyKhq
         C0e5TglICM12QYvUC3FqX7N+IUTHWWIz65H5s6ztRT1Ze7xG/hJlE+79LYULL6pQiCHv
         tAJ53g0ZGx5FaKKF+vu9ZtU3oZvkociJborOxDZCYr25v1AhUv7F8WpcU0mDEB2yu6E1
         8e3vm0mp9bdyae+lpuMZlK1tF3ZzcZh+3F2K5DNcZpKJEAlBKW+LkIij3S+2/Ltn28JP
         2eBQMV0ZCGNnkV6GyiEUVXBvEMnhzKxisYpghqm4RpAVE20Fx0kYbwFtFTr0bKX4I9d4
         oaWg==
X-Gm-Message-State: AGi0PuaQxs2+UW6oDS0TVyUINVScAtTajz7jSIkDl3/ia+uQ+LwVlaGW
        V3wRrfdkUOBb7tjcWq3lPx5UaA==
X-Google-Smtp-Source: APiQypIskeEJItuLaEBjMhbnRTsFEb0DYilPaPMtUzz55q/ztGTMyUgTbonADiaJsrnVUd76J6a9Uw==
X-Received: by 2002:a17:90a:cb09:: with SMTP id z9mr11612172pjt.120.1587551217755;
        Wed, 22 Apr 2020 03:26:57 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id p2sm3994378pgh.25.2020.04.22.03.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2020 03:26:57 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200420220458.v2.6.I89df9b6094549b8149aa8b8347f7401c678055b0@changeid>
References: <20200421050622.8113-1-dianders@chromium.org> <20200420220458.v2.6.I89df9b6094549b8149aa8b8347f7401c678055b0@changeid>
Subject: Re: [PATCH v2 6/6] arm64: dts: sdm845: Add "no-hpd" to sn65dsi86 on cheza
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     jonas@kwiboo.se, jeffrey.l.hugo@gmail.com,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        jernej.skrabec@siol.net, bjorn.andersson@linaro.org,
        robdclark@chromium.org, Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
To:     Douglas Anderson <dianders@chromium.org>,
        Laurent.pinchart@ideasonboard.com, a.hajda@samsung.com,
        airlied@linux.ie, bgolaszewski@baylibre.com, daniel@ffwll.ch,
        linus.walleij@linaro.org, narmstrong@baylibre.com,
        robh+dt@kernel.org, spanda@codeaurora.org
Date:   Wed, 22 Apr 2020 03:26:56 -0700
Message-ID: <158755121629.159702.14849607096816306080@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Douglas Anderson (2020-04-20 22:06:22)
> We don't have the HPD line hooked up to the bridge chip.  Add it as
> suggested in the patch ("dt-bindings: drm/bridge: ti-sn65dsi86:
> Document no-hpd").
>=20
> NOTE: this patch isn't expected to have any effect but just keeps us
> cleaner for the future.  Currently the driver in Linux just assumes
> that nobody has HPD hooked up.  This change allows us to later
> implement HPD support in the driver without messing up sdm845-cheza.
>=20
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
