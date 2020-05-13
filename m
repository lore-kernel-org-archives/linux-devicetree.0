Return-Path: <SRS0=QJws=63=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDE78C2D0FA
	for <linux-devicetree@archiver.kernel.org>; Wed, 13 May 2020 14:08:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 805E6204EF
	for <linux-devicetree@archiver.kernel.org>; Wed, 13 May 2020 14:08:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DW8Ulm8G"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387927AbgEMOIk (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 13 May 2020 10:08:40 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:60690 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387608AbgEMOIk (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 13 May 2020 10:08:40 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1A28E51F;
        Wed, 13 May 2020 16:08:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1589378918;
        bh=gh7vku4NSeMzv0KAbhmRoUNTTiQEMMmz2tOWPU+t3L0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DW8Ulm8GXyANsGVzvVAWzAOk5XS36pIHFFHuRpXd2XeugUiSohRQUz9TJb5l8Z0mK
         6VNGO4rVE3YJDcU6uAypWgeEcNmzFju/RrpWTCbtzUrqb8OVmdM35QuRXp5PoYS9O+
         YIR48/JMbXv6oU+RM7cCqj8NLsdr7FFMhYC91WUA=
Date:   Wed, 13 May 2020 17:08:32 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo =?utf-8?Q?Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>, robh+dt@kernel.org,
        kernel@collabora.com, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, jason@lakedaemon.net
Subject: Re: [RFC PATCH] dt-bindings: display: ti,tfp410.txt: convert to yaml
Message-ID: <20200513140832.GI5945@pendragon.ideasonboard.com>
References: <20200428092048.14939-1-ricardo.canuelo@collabora.com>
 <3e377c73-25a3-a7b3-0604-41c54d70039e@ti.com>
 <20200506155320.GC15206@pendragon.ideasonboard.com>
 <20200513110957.dgb3axle24pmqp3a@rcn-XPS-13-9360>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200513110957.dgb3axle24pmqp3a@rcn-XPS-13-9360>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Ricardo,

On Wed, May 13, 2020 at 01:09:57PM +0200, Ricardo Cañuelo wrote:
> On mié 06-05-2020 18:53:20, Laurent Pinchart wrote:
> > I didn't if I remember correctly, I just mapped it to the hardware
> > features. The hardware register indeed takes a value between 0 and 7,
> > and that is mapped to [-4,3] x t(STEP). I don't mind either option.
> 
> I was taking a look at the ti-tfp410.c driver to see if it needs any
> changes to support the updated deskew property ranges [0-7], but I don't
> fully understand what this does (line 276):
> 
> 	/* Get the setup and hold time from vendor-specific properties. */
> 	of_property_read_u32(dvi->dev->of_node, "ti,deskew", (u32 *)&deskew);
> 	if (deskew < -4 || deskew > 3)
> 		return -EINVAL;
> 
> 	timings->setup_time_ps = min(0, 1200 - 350 * deskew);
> 	timings->hold_time_ps = min(0, 1300 + 350 * deskew);
> 
> It looks like that the driver doesn't really apply the deskew settings
> to the device and that this has not been really tested, so it's probably
> not a big deal.

The driver doesn't apply any setting to the device :-) The ti,deskew
property is meant to report the deskew settings selected by the chip's
configuration pins, not to set a value to be programmed to the device.

> I guess what you wanted to do was to adjust the setup and hold times
> around 1200 and 1300 ps respectively in increments/decrements of 350 ps
> depending on the deskew value, as the datasheet describes. But this code
> would set timings->setup_time_ps to 0 regardless of the deskew value,
> and timings->hold_time_ps would be either 0 or a very big integer value
> if deskew is -4 (both setup_time_ps and hold_time_ps are u32).
> 
> Am I missing something? Was this intentional?

Oops. That's embarassing... It should clearly be a max(), not a min().
And only for hold_time_ps is this required.

Would you like to send a patch, or should I do so ?

-- 
Regards,

Laurent Pinchart
