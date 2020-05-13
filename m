Return-Path: <SRS0=QJws=63=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73250CA90AF
	for <linux-devicetree@archiver.kernel.org>; Wed, 13 May 2020 11:10:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4680620753
	for <linux-devicetree@archiver.kernel.org>; Wed, 13 May 2020 11:10:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728133AbgEMLKB (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 13 May 2020 07:10:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726743AbgEMLKB (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 13 May 2020 07:10:01 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73930C061A0C
        for <devicetree@vger.kernel.org>; Wed, 13 May 2020 04:10:01 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: rcn)
        with ESMTPSA id 1B6D92A0521
Date:   Wed, 13 May 2020 13:09:57 +0200
From:   Ricardo =?utf-8?Q?Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>, robh+dt@kernel.org,
        kernel@collabora.com, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, jason@lakedaemon.net
Subject: Re: [RFC PATCH] dt-bindings: display: ti,tfp410.txt: convert to yaml
Message-ID: <20200513110957.dgb3axle24pmqp3a@rcn-XPS-13-9360>
Mail-Followup-To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>, robh+dt@kernel.org,
        kernel@collabora.com, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, jason@lakedaemon.net
References: <20200428092048.14939-1-ricardo.canuelo@collabora.com>
 <3e377c73-25a3-a7b3-0604-41c54d70039e@ti.com>
 <20200506155320.GC15206@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200506155320.GC15206@pendragon.ideasonboard.com>
User-Agent: NeoMutt/20171215
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Laurent,

On mié 06-05-2020 18:53:20, Laurent Pinchart wrote:
> I didn't if I remember correctly, I just mapped it to the hardware
> features. The hardware register indeed takes a value between 0 and 7,
> and that is mapped to [-4,3] x t(STEP). I don't mind either option.

I was taking a look at the ti-tfp410.c driver to see if it needs any
changes to support the updated deskew property ranges [0-7], but I don't
fully understand what this does (line 276):

	/* Get the setup and hold time from vendor-specific properties. */
	of_property_read_u32(dvi->dev->of_node, "ti,deskew", (u32 *)&deskew);
	if (deskew < -4 || deskew > 3)
		return -EINVAL;

	timings->setup_time_ps = min(0, 1200 - 350 * deskew);
	timings->hold_time_ps = min(0, 1300 + 350 * deskew);

It looks like that the driver doesn't really apply the deskew settings
to the device and that this has not been really tested, so it's probably
not a big deal.

I guess what you wanted to do was to adjust the setup and hold times
around 1200 and 1300 ps respectively in increments/decrements of 350 ps
depending on the deskew value, as the datasheet describes. But this code
would set timings->setup_time_ps to 0 regardless of the deskew value,
and timings->hold_time_ps would be either 0 or a very big integer value
if deskew is -4 (both setup_time_ps and hold_time_ps are u32).

Am I missing something? Was this intentional?

Thanks,
Ricardo
