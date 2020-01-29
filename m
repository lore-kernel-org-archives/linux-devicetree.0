Return-Path: <SRS0=kwC1=3S=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAB96C2D0DB
	for <linux-devicetree@archiver.kernel.org>; Wed, 29 Jan 2020 19:48:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7E732206D4
	for <linux-devicetree@archiver.kernel.org>; Wed, 29 Jan 2020 19:48:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727146AbgA2Tsx (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 29 Jan 2020 14:48:53 -0500
Received: from asavdk4.altibox.net ([109.247.116.15]:40392 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726251AbgA2Tsw (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 29 Jan 2020 14:48:52 -0500
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id EA28880477;
        Wed, 29 Jan 2020 20:48:49 +0100 (CET)
Date:   Wed, 29 Jan 2020 20:48:48 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
Cc:     noralf@tronnes.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 1/3] dt-bindings: add vendor prefix for OzzMaker and
 Waveshare Electronics
Message-ID: <20200129194848.GB29646@ravnborg.org>
References: <cover.1580134320.git.kamlesh.gurudasani@gmail.com>
 <aa8799c4164b54fa5c4ca55e48966d7b61352c2c.1580134320.git.kamlesh.gurudasani@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa8799c4164b54fa5c4ca55e48966d7b61352c2c.1580134320.git.kamlesh.gurudasani@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=TELmJA4fAAAA:8
        a=V4Th9uXqAAAA:8 a=pGLkceISAAAA:8 a=7gkXJVJtAAAA:8 a=3u5PU5XXhnd4_xb3wXMA:9
        a=CjuIK1q_8ugA:10 a=OxZBpCp95H4A:10 a=7nPLErV8LTYA:10
        a=0n8ANzlPCKH_0m4f1BvC:22 a=NPz-sUGDo_RSEfLfxCKS:22
        a=E9Po1WZjFZOl8hwRPBS3:22 a=2u7P7y6wY8-ADUGXAArp:22
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Kamlesh

On Mon, Jan 27, 2020 at 07:55:33PM +0530, Kamlesh Gurudasani wrote:
> Add vendor prefix for OzzMaker [1] and Waveshare Electronics [2]
> Both are display manufacturers
> 
> [1] https://ozzmaker.com/about/
> [2] https://www.waveshare.com/contact_us
> 
> Signed-off-by: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index ac4804d..dfb926d 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -721,6 +721,8 @@ patternProperties:
>      description: OmniVision Technologies
>    "^oxsemi,.*":
>      description: Oxford Semiconductor, Ltd.
> +  "^ozzmaker,.*":
> +    description: OzzMaker
>    "^panasonic,.*":
>      description: Panasonic Corporation
>    "^parade,.*":
> @@ -1038,6 +1040,8 @@ patternProperties:
>      description: Vision Optical Technology Co., Ltd.
>    "^vxt,.*":
>      description: VXT Ltd
> +  "^waveshare,.*":
> +    description: Waveshare Electronics
>    "^wd,.*":
>      description: Western Digital Corp.
>    "^wetek,.*":
> -- 
> 2.7.4
