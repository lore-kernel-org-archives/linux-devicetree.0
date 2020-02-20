Return-Path: <SRS0=21hy=4I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BBD3C11D20
	for <linux-devicetree@archiver.kernel.org>; Thu, 20 Feb 2020 21:02:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D3288208E4
	for <linux-devicetree@archiver.kernel.org>; Thu, 20 Feb 2020 21:02:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JsoqIRD4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728996AbgBTVCo (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 20 Feb 2020 16:02:44 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:36597 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728936AbgBTVCo (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 20 Feb 2020 16:02:44 -0500
Received: by mail-pg1-f196.google.com with SMTP id d9so2539118pgu.3
        for <devicetree@vger.kernel.org>; Thu, 20 Feb 2020 13:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=yCWhyMONDF7/2d7s+slz/xE4GsVXYJ+VIwzdQklkW/U=;
        b=JsoqIRD4xomQetfHM7XtcK7FHq/ipSAEkJsVnBvyST4DrAaAZF6BueSVgo/A0us1yb
         ELSgSfno5PgHnoJm/NzqbsG8qQ02kmK3xDxajwkASRuGLEPI5+BMdVoxVksurm9wJ1Hp
         6IrSh0MG+2h1RvRA1zHGLa4KQ8N8MtjmIgGKw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=yCWhyMONDF7/2d7s+slz/xE4GsVXYJ+VIwzdQklkW/U=;
        b=TQe/3wPqP6n6z7jmw/z4pYycpIyc5pyRnrsUEsujil6N3hQuHNONLnBVtCkJGKP6NB
         y8p+hw108vacTHW7tWR+wXNjoC1hYw15x8zlV2N4pSBwx0ZpscDqrAul70pb10+KOIDN
         zTdhTGgQ1CCyH8x+Q1XzL9VdsVIG9ghh/R4B6HQvgXzSAUSKGyoKGkQDrP3B1ThQ1XKa
         +3WqQRbor8qb2UCUCjy0WYm/EgY/p+A40uMoAK8N68DzDSQ8C5/mtqPf7u4ZyFOagAYv
         0iMAPURz0HLFqvgLhBoJvC1RWQHr2ONazLEtu4318Eo10jhg4c/utHT4+h2j3BFj9vyR
         eQ1A==
X-Gm-Message-State: APjAAAVxGq5KVwLpE+cgEyxCQymcVcGCIqoM7b6pFPpseJsne+5F8eCv
        fjZOqV/vVkz/EdGmoHecusUV6Q==
X-Google-Smtp-Source: APXvYqybBEIA4/pqHt8cShquf8H+vaT94NLFSfun4J2uEKy/wjt157bBu3t/D8co6V54Gr/xmMNoZQ==
X-Received: by 2002:a63:565e:: with SMTP id g30mr3053334pgm.206.1582232563637;
        Thu, 20 Feb 2020 13:02:43 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id o73sm341592pje.7.2020.02.20.13.02.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2020 13:02:43 -0800 (PST)
Date:   Thu, 20 Feb 2020 13:02:42 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sharat Masetty <smasetty@codeaurora.org>
Cc:     freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        dri-devel@freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org,
        jcrouse@codeaurora.org, dianders@chromium.org
Subject: Re: [PATCH] dt-bindings: arm-smmu: update the list of clocks
Message-ID: <20200220210242.GC24720@google.com>
References: <1582186342-3484-1-git-send-email-smasetty@codeaurora.org>
 <1582186342-3484-2-git-send-email-smasetty@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1582186342-3484-2-git-send-email-smasetty@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Feb 20, 2020 at 01:42:22PM +0530, Sharat Masetty wrote:
> This patch adds a clock definition needed for powering on the GPU TBUs
> and the GPU TCU.
> 
> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> index 6515dbe..235c0df 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> @@ -28,6 +28,7 @@ properties:
>            - enum:
>                - qcom,msm8996-smmu-v2
>                - qcom,msm8998-smmu-v2
> +              - qcom,sc7180-smmu-v2

The addition of the compatible string isn't (directly) related with $subject,
this should be done in a separate patch.
