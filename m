Return-Path: <SRS0=YFsx=BV=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61EEBC433DF
	for <linux-devicetree@archiver.kernel.org>; Tue, 11 Aug 2020 09:22:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 323FA2076B
	for <linux-devicetree@archiver.kernel.org>; Tue, 11 Aug 2020 09:22:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="PNWhmOLK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728416AbgHKJWj (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 11 Aug 2020 05:22:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728224AbgHKJWj (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 11 Aug 2020 05:22:39 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B41F6C06174A
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2020 02:22:38 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id f1so10789969wro.2
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2020 02:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=w64oVDD5gdf7Qw0VtBt9S+2PP1vnTe6g0uPYYCqYgyE=;
        b=PNWhmOLKV7K6Fo7G0zQe2MW7DlRtBjrIF20cAwk8+IDodtpdQZBhq0E7+2wR1Gj45Y
         lpLkj2VXumRbfPixy4WehOgocK3LVetgkauMWBTLO/ErgzGT6yqi5jkIfR7N+z1OMZs9
         eG26M9dUUewJ39DaBm6onl2Jbinnt9waqwTJH+4F0VX9wuJN8r3DfUKyg3+i7cy7XE/c
         uq+ScJIgOFda7Eq90zf/grOPArgS7yLfDCsUJKDRc7my2urYuQrRVJVL6Co49+B+b9vY
         DnjQ1JdG5ww1Lf2Ryt7jBFaicMHYh3zYjyxuRJRy7NKelHSKs3rmUOkywe5Dyc+VfERx
         Qsjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=w64oVDD5gdf7Qw0VtBt9S+2PP1vnTe6g0uPYYCqYgyE=;
        b=gPhucVfECITEFXHXH3WUzeVzUzcc9u8Pvr0BQmkYPvsdWGG7Gr90qO1+6YwbFq+Op8
         ijPGrj9dbrqzCpEsV5J+J/4xofi5pAOW/K+DcSe1eUyGzH+JVFRLkJPiTec+CUaeSIEq
         Vc9qL2QZyUQQuN+3g9cmoCTl5jnQ6XJQa4sblwW8dmwcD1eu4Gg0cPVzePDfWOPKrWuN
         XG5WHVdmoqlU6vX0jq0mHNZ11a0tNXSrb2h44zvpdUeCC13a3goytFcaLD9mWVsW5kDo
         nBZ8nH8Eu8XFi13olJEMjpPLkHOHsBhbDTqgrHdlvKEcviig5ZXvKKs+w/LdRR2B1qr8
         6mbg==
X-Gm-Message-State: AOAM532FwliTgRKEDmp1d67J2Ua6gkr6lijJ+guOH0V3VkpWcuabBlUB
        5jKQpOUcvhJxO3XKKfBZmxg8y6M8N+pJow20kKt4Ng==
X-Google-Smtp-Source: ABdhPJxaiIP5JzOlZwg7fT24TWAQ4pFHHAZdvKBm+k8d3C7DP4bFD6gpNXC+E72Yewf4zubx1kzQJQ2c1ZI6KwRJQ88=
X-Received: by 2002:a5d:5383:: with SMTP id d3mr5274204wrv.42.1597137757402;
 Tue, 11 Aug 2020 02:22:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200810215543.113206-1-jacopo+renesas@jmondi.org> <20200810215543.113206-5-jacopo+renesas@jmondi.org>
In-Reply-To: <20200810215543.113206-5-jacopo+renesas@jmondi.org>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Tue, 11 Aug 2020 10:22:21 +0100
Message-ID: <CAPY8ntAX+W2Hpv4tVouWe2WR9d=5ob-cyjbzfGiWiN5GH_Z8Fg@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] media: MAINTAINERS: ov5647: Replace maintainer
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Roman Kovalivskyi <roman.kovalivskyi@globallogic.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, 10 Aug 2020 at 22:52, Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
>
> Since the current maintainer email address bounces back, replace
> the entry and make myself and Dave Stevenson maintainers of the driver.
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Acked-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  MAINTAINERS | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 21e6c3120152..6a9d87282578 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12625,7 +12625,8 @@ T:      git git://linuxtv.org/media_tree.git
>  F:     drivers/media/i2c/ov5640.c
>
>  OMNIVISION OV5647 SENSOR DRIVER
> -M:     Luis Oliveira <lolivei@synopsys.com>
> +M:     Dave Stevenson <dave.stevenson@raspberrypi.com>
> +M:     Jacopo Mondi <jacopo@jmondi.org>
>  L:     linux-media@vger.kernel.org
>  S:     Maintained
>  T:     git git://linuxtv.org/media_tree.git
> --
> 2.27.0
>
