Return-Path: <SRS0=sOYF=2R=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF5EFC2D0C6
	for <linux-devicetree@archiver.kernel.org>; Fri, 27 Dec 2019 12:39:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A66DC20CC7
	for <linux-devicetree@archiver.kernel.org>; Fri, 27 Dec 2019 12:39:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726379AbfL0Mjp (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 27 Dec 2019 07:39:45 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:43950 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726053AbfL0Mjo (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 27 Dec 2019 07:39:44 -0500
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 02C4B28B07D;
        Fri, 27 Dec 2019 12:39:40 +0000 (GMT)
Date:   Fri, 27 Dec 2019 13:39:38 +0100
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Jitao Shi <jitao.shi@mediatek.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
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
Message-ID: <20191227133938.5cf2550f@collabora.com>
In-Reply-To: <20191224113111.GB14837@ravnborg.org>
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
        <20191224113111.GB14837@ravnborg.org>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, 24 Dec 2019 12:31:11 +0100
Sam Ravnborg <sam@ravnborg.org> wrote:

> Hi Boris.
> 
> > Just a reminder of my 2 proposals:
> > 
> > 1/ implement the bridge_ops->pre_enable/post_disable() hooks so you can
> >    split your enable/disable logic in 2 parts and make sure things are
> >    ready when the panel/next bridge tries to send DSI commands
> > 2/ move everything that's needed to send DSI commands out of the  
> >    ->enable() path (maybe in runtime PM resume/suspend hooks) so you  
> >    can call that in the DSI transfer path too
> > 
> > As pointed out by Laurent, #1 doesn't work because some panel drivers
> > send DSI commands in their ->prepare() hook, and ->pre_enable() methods
> > are called in reverse order, meaning that the DRM panel bridge driver
> > would try to issue DSI commands before the DSI host controllers is ready
> > to send them. I still thing #2 is a good option.  
> 
> Jitao Shi suggested to extend panels so we had a sequence of:
> 
>   prepare_power()  <= new callback,
>                    here one should NOT be allowed to send
>                    DSI commands
>   prepare()
>   enable()
> 
>    #
>    # panel is now ready to show your favourite christmas movie
>    #
> 
>   disable()
>   unprepare()
>   unprepare_power()  <= new callback
> 
> 
> Would this help implement what you suggest above?
> Relevant panels would then have to be updated - but this
> is doable.

I didn't look at Jitao's proposal but it looks like it's addressing a
similar issue on the DSI slave/device side: the device probably needs
to be powered before the host can interact with it through the DSI+DPHY
bus. I'm not entirely sure why we'd need another hook to do that since
we already have the ->prepare() one.
