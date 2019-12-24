Return-Path: <SRS0=v23k=2O=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DA65C2D0CF
	for <linux-devicetree@archiver.kernel.org>; Tue, 24 Dec 2019 11:31:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DDE40206B7
	for <linux-devicetree@archiver.kernel.org>; Tue, 24 Dec 2019 11:31:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726195AbfLXLbU (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 24 Dec 2019 06:31:20 -0500
Received: from asavdk3.altibox.net ([109.247.116.14]:57670 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726102AbfLXLbU (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 24 Dec 2019 06:31:20 -0500
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id 4F88F20025;
        Tue, 24 Dec 2019 12:31:13 +0100 (CET)
Date:   Tue, 24 Dec 2019 12:31:11 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Boris Brezillon <boris.brezillon@collabora.com>,
        Jitao Shi <jitao.shi@mediatek.com>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        dri-devel@lists.freedesktop.org,
        Mark Rutland <mark.rutland@arm.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        kernel@collabora.com,
        Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
        Andrey Smirnov <andrew.smirnov@gmail.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Chris Healy <cphealy@gmail.com>, devicetree@vger.kernel.org,
        Jonas Karlman <jonas@kwiboo.se>,
        Rob Herring <robh+dt@kernel.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Seung-Woo Kim <sw0312.kim@samsung.com>
Subject: Re: [PATCH v4 04/11] drm/bridge: Make the bridge chain a
 double-linked list
Message-ID: <20191224113111.GB14837@ravnborg.org>
References: <20191203141515.3597631-1-boris.brezillon@collabora.com>
 <CGME20191203141542eucas1p23771a9c49ef18144c832fc536bdae61a@eucas1p2.samsung.com>
 <20191203141515.3597631-5-boris.brezillon@collabora.com>
 <4e901ab9-07d4-4238-7322-c7c5a3959513@samsung.com>
 <20191216155551.083dcbaf@collabora.com>
 <75a06e2a-4587-ee16-0f5d-af75fbe89793@samsung.com>
 <20191216162542.261c821c@collabora.com>
 <60f03d50-7c0f-c3d0-920f-0625c08b2171@samsung.com>
 <1010f5fc-0672-643c-4410-e053a928cb66@samsung.com>
 <20191224104422.25dbf980@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191224104422.25dbf980@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
        a=Mk4_XeWDY7XfxF_RUtAA:9 a=CjuIK1q_8ugA:10
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Boris.

> Just a reminder of my 2 proposals:
> 
> 1/ implement the bridge_ops->pre_enable/post_disable() hooks so you can
>    split your enable/disable logic in 2 parts and make sure things are
>    ready when the panel/next bridge tries to send DSI commands
> 2/ move everything that's needed to send DSI commands out of the
>    ->enable() path (maybe in runtime PM resume/suspend hooks) so you
>    can call that in the DSI transfer path too
> 
> As pointed out by Laurent, #1 doesn't work because some panel drivers
> send DSI commands in their ->prepare() hook, and ->pre_enable() methods
> are called in reverse order, meaning that the DRM panel bridge driver
> would try to issue DSI commands before the DSI host controllers is ready
> to send them. I still thing #2 is a good option.

Jitao Shi suggested to extend panels so we had a sequence of:

  prepare_power()  <= new callback,
                   here one should NOT be allowed to send
                   DSI commands
  prepare()
  enable()

   #
   # panel is now ready to show your favourite christmas movie
   #

  disable()
  unprepare()
  unprepare_power()  <= new callback


Would this help implement what you suggest above?
Relevant panels would then have to be updated - but this
is doable.

	Sam
