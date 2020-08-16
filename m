Return-Path: <SRS0=yifd=B2=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F3A3C433E3
	for <linux-devicetree@archiver.kernel.org>; Sun, 16 Aug 2020 07:27:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 534322067C
	for <linux-devicetree@archiver.kernel.org>; Sun, 16 Aug 2020 07:27:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726934AbgHPH1K (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 16 Aug 2020 03:27:10 -0400
Received: from asavdk4.altibox.net ([109.247.116.15]:42980 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726912AbgHPH1K (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 16 Aug 2020 03:27:10 -0400
Received: from ravnborg.org (unknown [188.228.123.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id 0ECD6804D0;
        Sun, 16 Aug 2020 09:27:07 +0200 (CEST)
Date:   Sun, 16 Aug 2020 09:27:05 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     dri-devel@lists.freedesktop.org, Marek Vasut <marex@denx.de>,
        devicetree@vger.kernel.org,
        Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
        Rob Herring <robh+dt@kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/8] dt-bindings: display: mxsfb: Rename to fsl,lcdif.yaml
Message-ID: <20200816072705.GE1201814@ravnborg.org>
References: <20200813012910.13576-1-laurent.pinchart@ideasonboard.com>
 <20200813012910.13576-5-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200813012910.13576-5-laurent.pinchart@ideasonboard.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
        a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
        a=kj9zAlcOel0A:10 a=P1BnusSwAAAA:8 a=7gkXJVJtAAAA:8 a=gEfo2CItAAAA:8
        a=e5mUnYsNAAAA:8 a=YmdqkXPptzrG-ARNvjQA:9 a=CjuIK1q_8ugA:10
        a=D0XLA9XvdZm18NrgonBM:22 a=E9Po1WZjFZOl8hwRPBS3:22
        a=sptkURWiP4Gy88Gu7hUp:22 a=Vxmtnl_E_bksehYqCbjh:22
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Aug 13, 2020 at 04:29:06AM +0300, Laurent Pinchart wrote:
> Rename the mxsfb.yaml binding schema to fsl,lcdif.yaml to match the
> usual bindings naming scheme.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I have been confused by the mxsfb name in the past, so this rename i
welcome.
Acked-by: Sam Ravnborg <sam@ravnborg.org>

> ---
>  .../devicetree/bindings/display/{mxsfb.yaml => fsl,lcdif.yaml}  | 2 +-
>  MAINTAINERS                                                     | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename Documentation/devicetree/bindings/display/{mxsfb.yaml => fsl,lcdif.yaml} (98%)
> 
> diff --git a/Documentation/devicetree/bindings/display/mxsfb.yaml b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
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
> -- 
> Regards,
> 
> Laurent Pinchart
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
