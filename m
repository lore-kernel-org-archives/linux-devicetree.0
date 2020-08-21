Return-Path: <SRS0=+ed7=B7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD939C433DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 21 Aug 2020 14:55:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9BC40207C3
	for <linux-devicetree@archiver.kernel.org>; Fri, 21 Aug 2020 14:55:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=agner.ch header.i=@agner.ch header.b="IefJ1nb6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726828AbgHUOzl (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 21 Aug 2020 10:55:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726324AbgHUOzk (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 21 Aug 2020 10:55:40 -0400
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74F7AC061573
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2020 07:55:40 -0700 (PDT)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
        by mail.kmu-office.ch (Postfix) with ESMTPSA id 6905E5C0103;
        Fri, 21 Aug 2020 16:55:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
        t=1598021738;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0TA3FZS7kVsXd7eINmfr24d0wg+8GW4dhawrETnf224=;
        b=IefJ1nb6INnbNsfE/IGOysA9cnyp/fUAVaUzkWEEZjmbFoeFK6C8J6uTIxsrCT5NGTDa9y
        VXt378MaJTTdTqk5cNMl7kGoO2hXgFnRbFRY1bIGwx6y5XjVBG+Jpa6RPG5lBOD9FwbcMt
        496hjJQnCWEXVuQeW3rblRar5wtvqyo=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Date:   Fri, 21 Aug 2020 16:55:38 +0200
From:   Stefan Agner <stefan@agner.ch>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        Marek Vasut <marex@denx.de>, Rob Herring <robh+dt@kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-arm-kernel@lists.infradead.org,
        =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>
Subject: Re: [PATCH 4/8] dt-bindings: display: mxsfb: Rename to fsl,lcdif.yaml
In-Reply-To: <20200813012910.13576-5-laurent.pinchart@ideasonboard.com>
References: <20200813012910.13576-1-laurent.pinchart@ideasonboard.com>
 <20200813012910.13576-5-laurent.pinchart@ideasonboard.com>
User-Agent: Roundcube Webmail/1.4.1
Message-ID: <2a74823ac7b6f978d36185aac34de383@agner.ch>
X-Sender: stefan@agner.ch
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 2020-08-13 03:29, Laurent Pinchart wrote:
> Rename the mxsfb.yaml binding schema to fsl,lcdif.yaml to match the
> usual bindings naming scheme.

I tend to prefer to just name it fsl,lcdif.yaml from the get-go.

If you prefer keeping it separate, then it should be patch 2 of the
series.

--
Stefan

> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  .../devicetree/bindings/display/{mxsfb.yaml => fsl,lcdif.yaml}  | 2 +-
>  MAINTAINERS                                                     | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename Documentation/devicetree/bindings/display/{mxsfb.yaml =>
> fsl,lcdif.yaml} (98%)
> 
> diff --git a/Documentation/devicetree/bindings/display/mxsfb.yaml
> b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> similarity index 98%
> rename from Documentation/devicetree/bindings/display/mxsfb.yaml
> rename to Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> index d15bb8edc29f..60210775c31e 100644
> --- a/Documentation/devicetree/bindings/display/mxsfb.yaml
> +++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>  %YAML 1.2
>  ---
> -$id: http://devicetree.org/schemas/display/mxsfb.yaml#
> +$id: http://devicetree.org/schemas/display/fsl,lcdif.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
>  title: Freescale/NXP i.MX LCD Interface (LCDIF)
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e3fac23383d2..fe1bda639a39 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11757,7 +11757,7 @@ M:	Stefan Agner <stefan@agner.ch>
>  L:	dri-devel@lists.freedesktop.org
>  S:	Supported
>  T:	git git://anongit.freedesktop.org/drm/drm-misc
> -F:	Documentation/devicetree/bindings/display/mxsfb.yaml
> +F:	Documentation/devicetree/bindings/display/fsl,lcdif.yaml
>  F:	drivers/gpu/drm/mxsfb/
>  
>  MYLEX DAC960 PCI RAID Controller
