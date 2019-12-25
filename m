Return-Path: <SRS0=FlbI=2P=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDBFDC2D0C3
	for <linux-devicetree@archiver.kernel.org>; Wed, 25 Dec 2019 01:37:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B52DE20663
	for <linux-devicetree@archiver.kernel.org>; Wed, 25 Dec 2019 01:37:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Ot0aZFqU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726246AbfLYBhM (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 24 Dec 2019 20:37:12 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:41048 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726237AbfLYBhM (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 24 Dec 2019 20:37:12 -0500
Received: from pendragon.ideasonboard.com (56.199-200-80.adsl-dyn.isp.belgacom.be [80.200.199.56])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id ECD1B53C;
        Wed, 25 Dec 2019 02:37:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1577237829;
        bh=azacCQcbySN9VZLvMizLOfz70t2Vpn/nqfnh76NYys4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ot0aZFqUjz8fQOHfha6X5QExXU0q/Fl1rsh2+yOD35i323MAxOfx1O0SwLO11G+8y
         m68VC5PgMm3XcGVxrC6a/G12fqubdI0gXntiSFyySHEwIVI6aSnAdOjzWNani8ok9R
         qSyDb3LrMJW99iEoOCtzLqKWPjru0jc5oU68hv0c=
Date:   Wed, 25 Dec 2019 03:36:56 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Boris Brezillon <boris.brezillon@collabora.com>,
        Jitao Shi <jitao.shi@mediatek.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        dri-devel@lists.freedesktop.org,
        Mark Rutland <mark.rutland@arm.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Thierry Reding <thierry.reding@gmail.com>,
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
Message-ID: <20191225013656.GB28817@pendragon.ideasonboard.com>
References: <CGME20191203141542eucas1p23771a9c49ef18144c832fc536bdae61a@eucas1p2.samsung.com>
 <20191203141515.3597631-5-boris.brezillon@collabora.com>
 <4e901ab9-07d4-4238-7322-c7c5a3959513@samsung.com>
 <20191216155551.083dcbaf@collabora.com>
 <75a06e2a-4587-ee16-0f5d-af75fbe89793@samsung.com>
 <20191216162542.261c821c@collabora.com>
 <60f03d50-7c0f-c3d0-920f-0625c08b2171@samsung.com>
 <1010f5fc-0672-643c-4410-e053a928cb66@samsung.com>
 <20191224104422.25dbf980@collabora.com>
 <20191224113111.GB14837@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191224113111.GB14837@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Sam,

On Tue, Dec 24, 2019 at 12:31:11PM +0100, Sam Ravnborg wrote:
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

Please note that you will need corresponding bridge operations in order
to implement the DRM panel bridge.

> Would this help implement what you suggest above?
> Relevant panels would then have to be updated - but this
> is doable.

The fundamental issue is that the enable/disable sequence requirements
are inherently driven by sinks, while the bridge API goes from source to
sink. A DSI panel could for instance require the following enable
sequence.

0. DSI bus disabled (LP-00 state)
1. Power up the panel
2. Enable the DSI bus (LP-11 state)
3. Configure the panel (through DCS LP mode writes, SPI, GPIOs, ...)
4. Transition the source to HS mode, sending sync packets, but no data
5. Perform additional configuration for the panel
6. Enable transmission of video from the source

For a given bus type there are thus well-specified states for a source
(in this case disabled, enabled in LP mode, in HS mode, sending sync
packets, sending video packets).

As our API operates from source to sink, fine-grained control of bridges
is difficult. We can of course always make bridge and panel operations
more fine-grained, but that's more of a ad-hoc solution that may lead to
abuse. We would at the very least document very explicitly what each
operation would be allowed to do for every bus type.

-- 
Regards,

Laurent Pinchart
