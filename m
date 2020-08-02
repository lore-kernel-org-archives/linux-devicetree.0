Return-Path: <SRS0=9TIE=BM=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70311C433E0
	for <linux-devicetree@archiver.kernel.org>; Sun,  2 Aug 2020 21:57:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 55EC0206E7
	for <linux-devicetree@archiver.kernel.org>; Sun,  2 Aug 2020 21:57:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726807AbgHBV5i (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 2 Aug 2020 17:57:38 -0400
Received: from foss.arm.com ([217.140.110.172]:50564 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725925AbgHBV5h (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sun, 2 Aug 2020 17:57:37 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 294F81FB;
        Sun,  2 Aug 2020 14:57:37 -0700 (PDT)
Received: from [10.57.35.143] (unknown [10.57.35.143])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6A81F3F71F;
        Sun,  2 Aug 2020 14:57:36 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] dt-bindings: Add doc for FriendlyARM NanoPi R2S
To:     David Bauer <mail@david-bauer.net>,
        linux-arm-kernel@lists.infradead.org
Cc:     linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org
References: <20200730232054.286381-1-mail@david-bauer.net>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <c8e16fb6-ea83-4a04-4488-3681e395cc9b@arm.com>
Date:   Sun, 2 Aug 2020 22:57:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200730232054.286381-1-mail@david-bauer.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi David,

On 2020-07-31 00:20, David Bauer wrote:
> Add devicetree binding documentation for the FriendlyARM NanoPi R2S.
> 
> Signed-off-by: David Bauer <mail@david-bauer.net>
> ---
>   Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
> index d4a4045092df..b17931ec2d86 100644
> --- a/Documentation/devicetree/bindings/arm/rockchip.yaml
> +++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
> @@ -104,6 +104,11 @@ properties:
>                 - firefly,roc-rk3399-pc-mezzanine
>             - const: rockchip,rk3399
>   
> +      - description: FriendlyARM NanoPi R2S

Nit: as the context below hints at, the company call themselves 
"FriendlyElec" these days - certainly since long before this board 
existed - so for consistency we should probably use that name in the 
description (but keep the established vendor prefix).

Robin.

> +        items:
> +          - const: friendlyarm,nanopi-r2s
> +          - const: rockchip,rk3328
> +
>         - description: FriendlyElec NanoPi4 series boards
>           items:
>             - enum:
> 
