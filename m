Return-Path: <SRS0=QVf9=4R=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 319B1C3F2CE
	for <linux-devicetree@archiver.kernel.org>; Sat, 29 Feb 2020 13:07:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D67B0246B0
	for <linux-devicetree@archiver.kernel.org>; Sat, 29 Feb 2020 13:07:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726944AbgB2NHq (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 29 Feb 2020 08:07:46 -0500
Received: from asavdk3.altibox.net ([109.247.116.14]:53464 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726933AbgB2NHq (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 29 Feb 2020 08:07:46 -0500
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id 212D020023;
        Sat, 29 Feb 2020 14:07:43 +0100 (CET)
Date:   Sat, 29 Feb 2020 14:07:42 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        dri-devel@lists.freedesktop.org, Rob Herring <robh@kernel.org>,
        devicetree@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>
Subject: Re: [PATCH 1/3 v2] dt-bindings: Add vendor prefix for Hydis
 technologies
Message-ID: <20200229130742.GD5447@ravnborg.org>
References: <20200223121841.26836-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200223121841.26836-1-linus.walleij@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=VwQbUJbxAAAA:8
        a=j8Cu_9a8AAAA:8 a=KKAkSRfTAAAA:8 a=MUtAX5rBKiqykKBiaX4A:9
        a=CjuIK1q_8ugA:10 a=AjGcO6oz07-iQ99wixmX:22 a=A2jcf3dkIZPIRbEE90CI:22
        a=cvBusfyB2V15izCimMoJ:22
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sun, Feb 23, 2020 at 01:18:39PM +0100, Linus Walleij wrote:
> This vendor has produced a number of display panels,
> including HVA40WV1.
> 
> Cc: devicetree@vger.kernel.org
> Cc: Stephan Gerhold <stephan@gerhold.net>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Applied to drm-misc-next with Rob's ack

> ---
> ChangeLog v1->v2:
> - New patch adding this vendor.
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index 9e67944bec9c..95ef233dbb52 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -421,6 +421,8 @@ patternProperties:
>      description: Shenzhen Hugsun Technology Co. Ltd.
>    "^hwacom,.*":
>      description: HwaCom Systems Inc.
> +  "^hydis,.*":
> +    description: Hydis Technologies
>    "^hyundai,.*":
>      description: Hyundai Technology
>    "^i2se,.*":
> -- 
> 2.21.1
