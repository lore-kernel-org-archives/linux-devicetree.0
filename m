Return-Path: <SRS0=1UAq=6U=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68753C28CBC
	for <linux-devicetree@archiver.kernel.org>; Wed,  6 May 2020 08:28:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4ECE920714
	for <linux-devicetree@archiver.kernel.org>; Wed,  6 May 2020 08:28:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727956AbgEFI2t (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 6 May 2020 04:28:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726935AbgEFI2t (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 6 May 2020 04:28:49 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54386C061A0F
        for <devicetree@vger.kernel.org>; Wed,  6 May 2020 01:28:49 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: rcn)
        with ESMTPSA id EA9C32A215D
Date:   Wed, 6 May 2020 10:28:43 +0200
From:   Ricardo =?utf-8?Q?Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     devicetree@vger.kernel.org, jason@lakedaemon.net,
        dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        kernel@collabora.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC PATCH] dt-bindings: display: ti,tfp410.txt: convert to yaml
Message-ID: <20200506082843.mkhip2n2uiimcf2z@rcn-XPS-13-9360>
Mail-Followup-To: Tomi Valkeinen <tomi.valkeinen@ti.com>,
        devicetree@vger.kernel.org, jason@lakedaemon.net,
        dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        kernel@collabora.com, linux-arm-kernel@lists.infradead.org
References: <20200428092048.14939-1-ricardo.canuelo@collabora.com>
 <3e377c73-25a3-a7b3-0604-41c54d70039e@ti.com>
 <20200506072155.6dmj35zdnr3to5ib@rcn-XPS-13-9360>
 <1cee742a-c16a-fb32-5caa-c6ac71689ab9@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1cee742a-c16a-fb32-5caa-c6ac71689ab9@ti.com>
User-Agent: NeoMutt/20171215
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Tomi,

On mié 06-05-2020 11:01:07, Tomi Valkeinen wrote: 
> Doesn't all this just point to a bug or missing feature in dt_binding_check?
> That's not a reason to change the ABI.

I agree and I'd vote for "missing feature", but seeing that there aren't
any other examples of this use case in the whole kernel dts collection
(at least I couldn't find any) I thought that maybe it's us who are
going against the norm here.

Maybe Rob can shed some light about this?

Cheers,
Ricardo
