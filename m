Return-Path: <SRS0=XaEl=A3=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 784CDC433E3
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jul 2020 15:10:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 55AB9207E8
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jul 2020 15:10:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LOendPNI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728150AbgGPPKf (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 16 Jul 2020 11:10:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728207AbgGPPKe (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 16 Jul 2020 11:10:34 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A7DCC08C5CE
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2020 08:10:34 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id z13so7436103wrw.5
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2020 08:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=2m1M98EH1nfWkFNzV2VhpZKvvoVfQRllbm5fo3WQqlY=;
        b=LOendPNIH4Ofg8EGJ+B7ht+ifCEDSJEs0Y7UgjXJxJQUVInRrJUX57gDkVZxGHYjsZ
         huOkeoMfVADRZfQ+hxvRIZr+u5Kw73rUxW0y/W4OQO3t7mbSNpedFbhfSUi/CdqiP++F
         dZ8fMAHU7FhFKiF7paIyQ2XQR8qZlSeLOZeQLJCrzL6hVGpAq3BVRID66H3ssWcMrsNP
         ozgidJwcVDai/+ESiQysfhiLSY1ow3zSgzAp8e/bia4rwkV0FH8pPGVHwWFAYZrzFOak
         KfQ1/2F5dOZyvvoSt2ZCqsvWoyRER02JfoX87tgwcHKwMRAHLtZkyFcIzGaHF3A0DdNz
         VxJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=2m1M98EH1nfWkFNzV2VhpZKvvoVfQRllbm5fo3WQqlY=;
        b=IrEx9z5cHHiuyU+rv3Nq/WgV+rZQR/85Yf0Y1H+2CV+paPIW4ZA99DfKzneiPvvmsC
         4FpqZM0EUUDK6Qe9fj3xf/RWSpykBM3SDr6OSVyhUjr8sCx5Ihz1nHRfhRF8geg6KdyX
         eIw6SvLDxntLsLqgneNSgsMAZicFKbdoG88P47ojGH7mO1GM3UN59tk6l5Fe3eAKeBC1
         FZvyM2pC8aL/Wgj9nKXXzOscCYFhgE4MDUhq1m+wvNBcFNBJDk3NNeS/Wxds2FUuk9ID
         PY4BVnMnFnzI1Hti+zeN+fsVf8K8+1zlvTlmV+QtG5xKiR7JnSPEZgoswJ/IzpgPdGKa
         4snQ==
X-Gm-Message-State: AOAM531sJeI7Vf27am03RAwyGGhA7cI/qWqy2vugyWql3B9Kqm0z1xbk
        VR4lRn2BxEAxzMksj+//p2GmFg==
X-Google-Smtp-Source: ABdhPJwBTtAOhrqKUUqfWPZvxA5XjDD38qzwHlXSFn/QJ+SGDyX9onIUUbkdHZL69xzg75el0nUvDw==
X-Received: by 2002:a5d:55ca:: with SMTP id i10mr5507967wrw.225.1594912233054;
        Thu, 16 Jul 2020 08:10:33 -0700 (PDT)
Received: from dell ([2.31.163.61])
        by smtp.gmail.com with ESMTPSA id w7sm8654363wmc.32.2020.07.16.08.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 08:10:32 -0700 (PDT)
Date:   Thu, 16 Jul 2020 16:10:29 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Frank Lee <frank@allwinnertech.com>
Cc:     robh+dt@kernel.org, mripard@kernel.org, wens@csie.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        gregory.clement@bootlin.com, tglx@linutronix.de,
        jason@lakedaemon.net, maz@kernel.org,
        srinivas.kandagatla@linaro.org, linus.walleij@linaro.org,
        anarsoul@gmail.com, tiny.windzz@gmail.com, rui.zhang@intel.com,
        daniel.lezcano@linaro.org, amit.kucheria@verdurent.com,
        p.zabel@pengutronix.de, clabbe@baylibre.com, icenowy@aosc.io,
        megous@megous.com, stefan@olimex.com, bage@linutronix.de,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-pm@vger.kernel.org, huangshuosheng@allwinnertech.com,
        liyong@allwinnertech.com
Subject: Re: [PATCH v3 10/16] mfd: axp20x: Allow the AXP803 to be probed by
 I2C
Message-ID: <20200716151029.GA3165313@dell>
References: <20200708071942.22595-1-frank@allwinnertech.com>
 <20200708071942.22595-11-frank@allwinnertech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200708071942.22595-11-frank@allwinnertech.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, 08 Jul 2020, Frank Lee wrote:

> The AXP803 can be used both using the RSB proprietary bus, or a more
> traditional I2C bus.
> 
> Let's add that possibility.
> 
> Signed-off-by: Frank Lee <frank@allwinnertech.com>
> ---
>  drivers/mfd/axp20x-i2c.c | 2 ++
>  1 file changed, 2 insertions(+)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
