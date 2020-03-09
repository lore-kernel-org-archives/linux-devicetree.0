Return-Path: <SRS0=Fzrg=42=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56D56C10F29
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Mar 2020 17:51:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 332CB2067C
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Mar 2020 17:51:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726335AbgCIRvQ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 9 Mar 2020 13:51:16 -0400
Received: from asavdk4.altibox.net ([109.247.116.15]:54642 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727357AbgCIRvQ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 9 Mar 2020 13:51:16 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id 08D1680611;
        Mon,  9 Mar 2020 18:51:09 +0100 (CET)
Date:   Mon, 9 Mar 2020 18:51:08 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Phong LE <ple@baylibre.com>
Cc:     airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
        mark.rutland@arm.com, a.hajda@samsung.com, narmstrong@baylibre.com,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@siol.net, mripard@kernel.org,
        heiko.stuebner@theobroma-systems.com, linus.walleij@linaro.org,
        stephan@gerhold.net, broonie@kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: add ITE vendor
Message-ID: <20200309175108.GA4841@ravnborg.org>
References: <20200309153654.11481-1-ple@baylibre.com>
 <20200309153654.11481-2-ple@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200309153654.11481-2-ple@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=Ns9eNvu6AAAA:8
        a=IpJZQVW2AAAA:8 a=7gkXJVJtAAAA:8 a=qPfvrsSIRTZQNikgLP0A:9
        a=CjuIK1q_8ugA:10 a=LZLx1i01EnjtqRv10NxV:22 a=IawgGOuG5U0WyFbmm1f5:22
        a=E9Po1WZjFZOl8hwRPBS3:22
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Phong.

On Mon, Mar 09, 2020 at 04:36:52PM +0100, Phong LE wrote:
> Add ITE Tech Inc. prefix "ite" in vendor-prefixes
Maybe add to the changelog that their domain is http://www.ite.com.tw/?

> 
> Signed-off-by: Phong LE <ple@baylibre.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>

> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index 9e67944bec9c..16d4c776fdc7 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -469,6 +469,8 @@ patternProperties:
>      description: Intersil
>    "^issi,.*":
>      description: Integrated Silicon Solutions Inc.
> +  "^ite,.*":
> +    description: ITE Tech Inc.
>    "^itead,.*":
>      description: ITEAD Intelligent Systems Co.Ltd
>    "^iwave,.*":
> -- 
> 2.17.1
