Return-Path: <SRS0=7KtL=73=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30446C433DF
	for <linux-devicetree@archiver.kernel.org>; Sun, 14 Jun 2020 22:17:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 065062067B
	for <linux-devicetree@archiver.kernel.org>; Sun, 14 Jun 2020 22:17:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X8Hjqf1i"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727928AbgFNWRt (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 14 Jun 2020 18:17:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727924AbgFNWRt (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 14 Jun 2020 18:17:49 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04B37C05BD43
        for <devicetree@vger.kernel.org>; Sun, 14 Jun 2020 15:17:49 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id r9so12781717wmh.2
        for <devicetree@vger.kernel.org>; Sun, 14 Jun 2020 15:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=5TgbMQr2ynpkjkeHceDs7ejinDsY4qGV2JU6Wh2aUoo=;
        b=X8Hjqf1iNpJ4l4eLhFIw932NLhIEB1uR/cBAuY7aJfGQl/Poorn1tdoLhc3l94aT1t
         e4pgEgEdOuImd9UMpEt/BmxW9Ryv/ZDuS7q9ubgpAh344Oh96+4nVAhFBKGDE/1vkDmc
         ZD9BOxgIA1GQq6tCFYiivmBJDDhmJsGIftFkKG1T8wSl8SEa4Yk95JAfHYvAHKjVLE0g
         j/BQW6ThCpsBoQyXS+geuNcXkEOj1OcJxre5rkkC+hYn6bEKsR14Rmd6wl97LuJ3QM9B
         IHcwKvSr6O4JzaoL6iX/9MbRSDKZSnFAYAU9NiK9jntVvbL4wLlGRZj3/mMYCSSOAG3S
         DMZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5TgbMQr2ynpkjkeHceDs7ejinDsY4qGV2JU6Wh2aUoo=;
        b=LqVao++8mXeMwoxTMAyFoW8wyWJ9EDqa0RxJjUDxQbsbIB3dBuz6YL6KRlVPwZu9vy
         X9ZoFHX8ZoglIgdmWSRPwZoNhOEObQ2y0bNgcfrNrKF+wqoL8lq+cdWJJ68QNCqmwUBC
         n3a8VVXOdOXf76rSzqWCnu+th4X0c0HQOWBsBpw1U+wDGd8+D5/lz7yFpG4saiciZtYi
         utzWfFbf03UamCrTwoCaSMbSTpgt0DVAUYejGz+2tU+wZsulUsUsxdTgpH0aXVAt6SED
         927yw6x+kB8WOc8Ce8XI0Bloid2KtHTpnTvNjEkPDisxqed0LSIlj6U1EpFBWlGAx1BT
         MzeA==
X-Gm-Message-State: AOAM5302eQoqlX4tqACYZvagkUsZL5ZMEaglFFQl4dZFeNpot+ANcDf4
        qhKdI4ntgxco3XG5kRVnWVo=
X-Google-Smtp-Source: ABdhPJxvrGIoXnMWmpHerrw4JnxtmxjqhDEJQfJMkMM6l5G792MPS2W79Hk4BTSg9nI4z8AsDa21lA==
X-Received: by 2002:a7b:c8d6:: with SMTP id f22mr9627845wml.108.1592173067668;
        Sun, 14 Jun 2020 15:17:47 -0700 (PDT)
Received: from [192.168.1.3] (ip68-111-84-250.oc.oc.cox.net. [68.111.84.250])
        by smtp.gmail.com with ESMTPSA id u7sm22134570wrm.23.2020.06.14.15.17.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jun 2020 15:17:46 -0700 (PDT)
Subject: Re: [PATCH 1/3] ARM: dts: NSP: Disable PL330 by default, add
 dma-coherent property
To:     Matthew Hagan <mnhagan88@gmail.com>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Russell King <linux@armlinux.org.uk>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <c19be985a3e7abc8ac05fc30678475aeadb73c50.1591719237.git.mnhagan88@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <9e83df99-fae3-107d-3983-1e79d9591e00@gmail.com>
Date:   Sun, 14 Jun 2020 15:17:43 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <c19be985a3e7abc8ac05fc30678475aeadb73c50.1591719237.git.mnhagan88@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org



On 6/9/2020 9:58 AM, Matthew Hagan wrote:
> Currently the PL330 is enabled by default. However if left in IDM reset, as is
> the case with the Meraki and Synology NSP devices, the system will hang when
> probing for the PL330's AMBA peripheral ID. We therefore should be able to
> disable it in these cases.
> 
> The PL330 is also included among of the list of peripherals put into coherent
> mode, so "dma-coherent" has been added here as well.
> 
> Signed-off-by: Matthew Hagan <mnhagan88@gmail.com>

Applied to devicetree/fixes with:

Fixes: 5fa1026a3e4d ("ARM: dts: NSP: Add PL330 support")

Thanks!
-- 
Florian
