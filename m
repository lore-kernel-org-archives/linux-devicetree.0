Return-Path: <SRS0=rjyW=3U=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39198C2D0DB
	for <linux-devicetree@archiver.kernel.org>; Fri, 31 Jan 2020 18:08:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 10A0420663
	for <linux-devicetree@archiver.kernel.org>; Fri, 31 Jan 2020 18:08:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="k/miQjGo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727066AbgAaSIb (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 31 Jan 2020 13:08:31 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:54846 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726712AbgAaSIb (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 31 Jan 2020 13:08:31 -0500
Received: by mail-wm1-f66.google.com with SMTP id g1so8952198wmh.4
        for <devicetree@vger.kernel.org>; Fri, 31 Jan 2020 10:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=D8/xsMbR/1C0MwwMOIRTL1zG4nSwZ0s7u5Zu3XQfNwM=;
        b=k/miQjGosr8Qq+sNUdmKHQIanY6GKem8TVK5BMnmBa5hE/J6cZ+rrptRilf5U2JqHl
         9iGjkSHee+kWJhw2/+aN0Xo60NozixAYos32AE7qBiGHkEQ577UVF5Bf+dF/Zwb8lut7
         dFq6p0JtuqxtJveL7E3mVHY7EGuk9MAJZUMrk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=D8/xsMbR/1C0MwwMOIRTL1zG4nSwZ0s7u5Zu3XQfNwM=;
        b=rRLAcWd7zKYmP8X3WObD6ybDUrCYJBngcm1Sj4uxBdu8G3REUNbTXPYnZbSwGitwfu
         2QZ49cJ5pIdBYJ/Xz3c0wwHcQOnJywtmLH28ctuPvetk4use7KiG7eB7ZLrP+ARsM6iW
         rMzk+TGmUsVGGKHifXnu5RwaWKYkIqUf8iXtkv5PY3DKPrFcGIJyQBKwR5zvB2fj5A7K
         MD5opQj0on3AWvLMNqPedwSwKCqWjDQwoTakObZXNMCwyqXUMTSWWAgzPQMGJJk5JhKR
         IOnLZHrmoJA1sZrFb28kphJOWDgFwbd6W9SWgEbeTI5w2vR8SZiwQiacMeKYpp39PVAW
         Xnww==
X-Gm-Message-State: APjAAAVJ/vtBVet+oxgEdNwqFySkoTDnUizvE65ycwWRzPcuP4W43wOj
        2BCg4fxpM9JMPgPmBcRxCPu1Zw==
X-Google-Smtp-Source: APXvYqwYvtVHJrAFR5skp02TD59UIcI7Dpfa7ZdmIEDocr5H02fBwVRkIDgGAFjK6lnalWJC0u9LQQ==
X-Received: by 2002:a1c:e2c3:: with SMTP id z186mr13396519wmg.70.1580494109356;
        Fri, 31 Jan 2020 10:08:29 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id a9sm11599623wmm.15.2020.01.31.10.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2020 10:08:27 -0800 (PST)
Date:   Fri, 31 Jan 2020 19:08:25 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     dri-devel@lists.freedesktop.org,
        Lucas Stach <l.stach@pengutronix.de>,
        Chris Healy <cphealy@gmail.com>,
        Andrey Smirnov <andrew.smirnov@gmail.com>,
        Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
        kernel@collabora.com, Daniel Vetter <daniel@ffwll.ch>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, intel-gfx-trybot@lists.freedesktop.org
Subject: Re: [PATCH v10 00/12] drm: Add support for bus-format negotiation
Message-ID: <20200131180825.GO43062@phenom.ffwll.local>
References: <20200128135514.108171-1-boris.brezillon@collabora.com>
 <20200131164244.6955ec45@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200131164244.6955ec45@collabora.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Jan 31, 2020 at 04:42:44PM +0100, Boris Brezillon wrote:
> On Tue, 28 Jan 2020 14:55:02 +0100
> Boris Brezillon <boris.brezillon@collabora.com> wrote:
> 
> > Hello,
> > 
> > This patch series aims at adding support for runtime bus-format
> > negotiation between all elements of the
> > 'encoder -> bridges -> connector/display' section of the pipeline.
> > 
> > In order to support that, we need drm bridges to fully take part in the
> > atomic state validation process, which requires adding a
> > drm_bridge_state and a new drm_bridge_funcs.atomic_check() hook.
> > Once those basic building blocks are in place, we can add new hooks to
> > allow bus format negotiation (those are called just before
> > ->atomic_check()). The bus format selection is done at runtime by  
> > testing all possible combinations across the whole bridge chain until
> > one is reported to work.
> > 
> > No fundamental changes in this v10, just collected R-bs, addressed
> > Philipp's comments and moved the changelog back to the visible part
> > of the commit message.
> > 
> > I plan to apply patches 1 to 7 soon, so if there's anything you don't
> > like in there, please say it now. Still waiting for review on the LVDS
> > bridge and panel stuff.
> > 
> > This patch series is also available here [1].
> > 
> > Thanks,
> > 
> > Boris
> > 
> > [1]https://github.com/bbrezillon/linux-0day/commits/drm-bridge-busfmt-v10
> > 
> > Boris Brezillon (12):
> >   drm/bridge: Add a drm_bridge_state object
> >   drm/rcar-du: Plug atomic state hooks to the default implementation
> >   drm/bridge: analogix: Plug atomic state hooks to the default
> >     implementation
> >   drm/bridge: Patch atomic hooks to take a drm_bridge_state
> >   drm/bridge: Add an ->atomic_check() hook
> >   drm/bridge: Add the necessary bits to support bus format negotiation
> >   drm/imx: pd: Use bus format/flags provided by the bridge when
> >     available
> 
> Patches 1 to 7 applied.
> 
> >   drm/bridge: lvds-codec: Implement basic bus format negotiation
> >   dt-bindings: display: bridge: lvds-codec: Add new bus-width prop
> >   drm/bridge: panel: Propage bus format/flags
> 
> Laurent, when you find some time, could you have a look at patches 8-10?
> 
> >   drm/panel: simple: Fix the lt089ac29000 bus_format
> 
> Sam, I'll let you apply that one since dim complained that it was
> missing a R-b (you only gave your A-b).

A-b should be enough ... some typo in the A-b tag maybe?
-Daniel

> 
> >   ARM: dts: imx: imx51-zii-rdu1: Fix the display pipeline definition
> > 
> >  .../bindings/display/bridge/lvds-codec.yaml   |   8 +
> >  arch/arm/boot/dts/imx51-zii-rdu1.dts          |  24 +-
> >  .../drm/bridge/analogix/analogix_dp_core.c    |  44 +-
> >  drivers/gpu/drm/bridge/lvds-codec.c           |  64 ++-
> >  drivers/gpu/drm/bridge/panel.c                |   4 +
> >  drivers/gpu/drm/drm_atomic.c                  | 116 +++++
> >  drivers/gpu/drm/drm_atomic_helper.c           |  73 ++-
> >  drivers/gpu/drm/drm_atomic_state_helper.c     | 103 +++++
> >  drivers/gpu/drm/drm_bridge.c                  | 437 +++++++++++++++++-
> >  drivers/gpu/drm/imx/parallel-display.c        | 177 ++++++-
> >  drivers/gpu/drm/panel/panel-simple.c          |   2 +-
> >  drivers/gpu/drm/rcar-du/rcar_lvds.c           |  11 +-
> >  include/drm/drm_atomic.h                      |  76 +++
> >  include/drm/drm_atomic_helper.h               |   8 +
> >  include/drm/drm_atomic_state_helper.h         |  13 +
> >  include/drm/drm_bridge.h                      | 179 ++++++-
> >  16 files changed, 1258 insertions(+), 81 deletions(-)
> > 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
