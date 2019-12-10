Return-Path: <SRS0=BuJn=2A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39792C43603
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Dec 2019 11:04:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 15B1220663
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Dec 2019 11:04:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727053AbfLJLEY (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 10 Dec 2019 06:04:24 -0500
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:34589 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727018AbfLJLEY (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 10 Dec 2019 06:04:24 -0500
X-Originating-IP: 90.182.112.136
Received: from localhost (136.112.broadband15.iol.cz [90.182.112.136])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 0C0A6FF802;
        Tue, 10 Dec 2019 11:04:21 +0000 (UTC)
Date:   Tue, 10 Dec 2019 12:04:19 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Peter Rosin <peda@axentia.se>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>
Subject: Re: [PATCH] dt-bindings: arm: Remove leftover axentia.txt
Message-ID: <20191210110419.GI1463890@piout.net>
References: <20191120145536.17884-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191120145536.17884-1-robh@kernel.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 20/11/2019 08:55:36-0600, Rob Herring wrote:
> The bindings described in axentia.txt are already covered by
> atmel-at91.yaml, so remove the file.
> 
> Cc: Peter Rosin <peda@axentia.se>
> Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
> Signed-off-by: Rob Herring <robh@kernel.org>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
>  .../devicetree/bindings/arm/axentia.txt       | 28 -------------------
>  MAINTAINERS                                   |  1 -
>  2 files changed, 29 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/axentia.txt
> 
> diff --git a/Documentation/devicetree/bindings/arm/axentia.txt b/Documentation/devicetree/bindings/arm/axentia.txt
> deleted file mode 100644
> index de58f2463880..000000000000
> --- a/Documentation/devicetree/bindings/arm/axentia.txt
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -Device tree bindings for Axentia ARM devices
> -============================================
> -
> -Linea CPU module
> -----------------
> -
> -Required root node properties:
> -compatible = "axentia,linea",
> -	     "atmel,sama5d31", "atmel,sama5d3", "atmel,sama5";
> -and following the rules from atmel-at91.txt for a sama5d31 SoC.
> -
> -
> -Nattis v2 board with Natte v2 power board
> ------------------------------------------
> -
> -Required root node properties:
> -compatible = "axentia,nattis-2", "axentia,natte-2", "axentia,linea",
> -	     "atmel,sama5d31", "atmel,sama5d3", "atmel,sama5";
> -and following the rules from above for the axentia,linea CPU module.
> -
> -
> -TSE-850 v3 board
> -----------------
> -
> -Required root node properties:
> -compatible = "axentia,tse850v3", "axentia,linea",
> -	     "atmel,sama5d31", "atmel,sama5d3", "atmel,sama5";
> -and following the rules from above for the axentia,linea CPU module.
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 97b28c913813..8d711f764dfb 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2859,7 +2859,6 @@ AXENTIA ARM DEVICES
>  M:	Peter Rosin <peda@axentia.se>
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  S:	Maintained
> -F:	Documentation/devicetree/bindings/arm/axentia.txt
>  F:	arch/arm/boot/dts/at91-linea.dtsi
>  F:	arch/arm/boot/dts/at91-natte.dtsi
>  F:	arch/arm/boot/dts/at91-nattis-2-natte-2.dts
> -- 
> 2.20.1
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
