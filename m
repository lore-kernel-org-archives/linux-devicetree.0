Return-Path: <SRS0=F2+Z=YR=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B66C8CA9EAF
	for <linux-devicetree@archiver.kernel.org>; Thu, 24 Oct 2019 07:59:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9250921872
	for <linux-devicetree@archiver.kernel.org>; Thu, 24 Oct 2019 07:59:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408841AbfJXH76 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 24 Oct 2019 03:59:58 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:32913 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404701AbfJXH75 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 24 Oct 2019 03:59:57 -0400
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1iNY2D-0006hy-CI; Thu, 24 Oct 2019 09:59:53 +0200
Message-ID: <b5653d484cb84160992355733153da711aef0849.camel@pengutronix.de>
Subject: Re: [PATCH v2 3/5] dt-bindings: reset: rcar-rst: Document r8a77961
 support
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Eugeniu Rosca <erosca@de.adit-jv.com>, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Date:   Thu, 24 Oct 2019 09:59:50 +0200
In-Reply-To: <20191023122911.12166-4-geert+renesas@glider.be>
References: <20191023122911.12166-1-geert+renesas@glider.be>
         <20191023122911.12166-4-geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: devicetree@vger.kernel.org
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Geert,

On Wed, 2019-10-23 at 14:29 +0200, Geert Uytterhoeven wrote:
> Add DT binding documentation for the Reset block in the Renesas R-Car
> M3-W+ (R8A77961) SoC.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
> v2:
>   - Add Reviewed-by.
> ---
>  Documentation/devicetree/bindings/reset/renesas,rst.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/reset/renesas,rst.txt b/Documentation/devicetree/bindings/reset/renesas,rst.txt
> index d6d6769a0c42735f..de7f06ccd003da9f 100644
> --- a/Documentation/devicetree/bindings/reset/renesas,rst.txt
> +++ b/Documentation/devicetree/bindings/reset/renesas,rst.txt
> @@ -31,6 +31,7 @@ Required properties:
>  		  - "renesas,r8a7794-rst" (R-Car E2)
>  		  - "renesas,r8a7795-rst" (R-Car H3)
>  		  - "renesas,r8a7796-rst" (R-Car M3-W)
> +		  - "renesas,r8a77961-rst" (R-Car M3-W+)
>  		  - "renesas,r8a77965-rst" (R-Car M3-N)
>  		  - "renesas,r8a77970-rst" (R-Car V3M)
>  		  - "renesas,r8a77980-rst" (R-Car V3H)

Acked-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

