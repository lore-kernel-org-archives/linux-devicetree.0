Return-Path: <SRS0=g9lS=AL=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B787C433DF
	for <linux-devicetree@archiver.kernel.org>; Tue, 30 Jun 2020 20:49:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 18D4120663
	for <linux-devicetree@archiver.kernel.org>; Tue, 30 Jun 2020 20:49:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech-se.20150623.gappssmtp.com header.i=@ragnatech-se.20150623.gappssmtp.com header.b="mJ07pMpR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726312AbgF3Utx (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 30 Jun 2020 16:49:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725805AbgF3Utx (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 30 Jun 2020 16:49:53 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9760C061755
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2020 13:49:52 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id h19so24203105ljg.13
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2020 13:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=8TEkXURApU0QO8MhCg+aHvCyG0nhnoU07dZv94xTVGo=;
        b=mJ07pMpRasorccttMvFeublKoWgl6moNVn/kgRrhUYBKSPeNY6rlr4P90R/rf/X6Fs
         /NQZ0KmwuJcIXRAdIjBzw2+q6vhzL3LoPDZRO161GLz4XO+AZrzR46hvG8LVrw1Y4ceE
         IaMvm2G+KzJPo4OkJTSvlAH797zL8HN47VvcJ4+BUXS9xv0CQo1pN8mESaMjTfssYcVz
         9pvQ2yQCtTxjHnrYX7GDwTj2qit7e4gPtLvL+jmtwoDtW8a47FNRiBYFzZZztab2W2fB
         2YsPMBa1nrbTBiDujLWmHYEQnyLEJKucC6nGdR+pntm8MWHjRyT7H7vCZZ2Yfe+8Gsu8
         KTJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=8TEkXURApU0QO8MhCg+aHvCyG0nhnoU07dZv94xTVGo=;
        b=BqS1hPgNljAq/cW1P6ft7m3wvhflw2/pOA6YBAS0WNbv0RuClaB4wTVINBZh8qyQJQ
         7mrNC2NWfmb8/FaWOeIRaYaK9CfaL1eHnKcxxbITUwXnUH2syb/2C+6kjNaDlrxIqdku
         wu6NxjodCBNsaZlhX7Zuz5pwQFOvFAz9iBaQQfB4EX6UnEcUGCPgg1wnFJbl1B/Yk1QR
         3qTcfQ+AI9qDtY9zrhNNesRyr1MwRu0KZFt++crfgyeKZdsimq8+x2YP+n18gzRbMGMm
         ktj6o81LfFwI8huRNygn/NR1yPLyfdvvt8gMjtCzVqUNKP3sWV4aSL02CXgceIZxrybF
         byJQ==
X-Gm-Message-State: AOAM533bt7H5/+1ZBp8sxyZIP25l9dZDv8ogVZfEY6F5wieSuZ3Ygg4P
        ehx1WcDkETuWVaG1n6wsGSDfOTH5Nv0=
X-Google-Smtp-Source: ABdhPJwzNlAKj3F1zAIxQkau8KUphOIgeVAY6ZwKxOS0S8DxDn9IFc3GL96+N5Cq6VTL2/fqCBdQZw==
X-Received: by 2002:a05:651c:284:: with SMTP id b4mr508659ljo.283.1593550190979;
        Tue, 30 Jun 2020 13:49:50 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id a9sm1083806ljm.84.2020.06.30.13.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 13:49:50 -0700 (PDT)
Date:   Tue, 30 Jun 2020 22:49:49 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 2/8] dt-bindings: media: renesas,fcp: Make
 power-domains mandatory
Message-ID: <20200630204949.GB2365286@oden.dyn.berto.se>
References: <20200621004734.28602-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200621004734.28602-3-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200621004734.28602-3-laurent.pinchart+renesas@ideasonboard.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Laurent,

Thanks for your work.

On 2020-06-21 03:47:28 +0300, Laurent Pinchart wrote:
> All DT source files in the kernel tree specify the power-domains
> property. Make it mandatory.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> Changes since v1:
> 
> - Fix typo in commit message
> ---
>  Documentation/devicetree/bindings/media/renesas,fcp.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/renesas,fcp.yaml b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
> index 9241bf3c5efc..eeca7e255420 100644
> --- a/Documentation/devicetree/bindings/media/renesas,fcp.yaml
> +++ b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
> @@ -38,6 +38,7 @@ required:
>    - compatible
>    - reg
>    - clocks
> +  - power-domains
>  
>  additionalProperties: false
>  
> -- 
> Regards,
> 
> Laurent Pinchart
> 

-- 
Regards,
Niklas Söderlund
