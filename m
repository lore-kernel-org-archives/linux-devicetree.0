Return-Path: <SRS0=HudI=AZ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B165C433E1
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Jul 2020 23:46:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 555142072D
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Jul 2020 23:46:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FlM7bNYf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727810AbgGNXqR (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Jul 2020 19:46:17 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:47266 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726542AbgGNXqR (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 14 Jul 2020 19:46:17 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AF97871D;
        Wed, 15 Jul 2020 01:46:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594770375;
        bh=aYQL0PAEIFTWBzyk+VfBeg5GLCtHOyzrxZh8L8XMnHI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FlM7bNYftDy6p+MDJycdBaZeM66Ph+XoUKU5G800izffi9PxleK/qVUWddMqF0JjA
         WZB+r0MqmYMhTMVOjCnYfvah+KX7gFtjbq9AuCDtqoaatxNZNCypjlsxJCico5/2b/
         kZAH9IGGc6k00exquQj6q33VGN/btWkdPCwlpo0o=
Date:   Wed, 15 Jul 2020 02:46:09 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl,
        dave.stevenson@raspberrypi.com, dongchun.zhu@mediatek.com,
        linux-renesas-soc@vger.kernel.org,
        roman.kovalivskyi@globallogic.com
Subject: Re: [PATCH v2 3/3] media: MAINTAINERS: ov5647: Add myself as
 maintainer
Message-ID: <20200714234609.GO5854@pendragon.ideasonboard.com>
References: <20200714142856.58365-1-jacopo+renesas@jmondi.org>
 <20200714142856.58365-4-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200714142856.58365-4-jacopo+renesas@jmondi.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Tue, Jul 14, 2020 at 04:28:56PM +0200, Jacopo Mondi wrote:
> Since the current maintainer email address bounces back, replace
> the entry and make myself maintainer of the driver since I have the
> sensor and platforms to test it.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

And thank you for stepping up :-)

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1742fa1a88cd..e2128afd83b6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12607,7 +12607,7 @@ T:	git git://linuxtv.org/media_tree.git
>  F:	drivers/media/i2c/ov5640.c
>  
>  OMNIVISION OV5647 SENSOR DRIVER
> -M:	Luis Oliveira <lolivei@synopsys.com>
> +M:	Jacopo Mondi <jacopo@jmondi.org>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  T:	git git://linuxtv.org/media_tree.git

-- 
Regards,

Laurent Pinchart
