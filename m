Return-Path: <SRS0=UIXH=76=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DE25C433E0
	for <linux-devicetree@archiver.kernel.org>; Wed, 17 Jun 2020 04:24:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 184762065F
	for <linux-devicetree@archiver.kernel.org>; Wed, 17 Jun 2020 04:24:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q5oFhyej"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726763AbgFQEYU (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 17 Jun 2020 00:24:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726728AbgFQEYU (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 17 Jun 2020 00:24:20 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1A1DC061573;
        Tue, 16 Jun 2020 21:24:19 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id z206so438536lfc.6;
        Tue, 16 Jun 2020 21:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=k4Z6DmcjO4F40f/mGsIu+r4CtG3oqiS9+2FvsS6aCpA=;
        b=q5oFhyejGgj4F26hFNM3e+35ecsdbAb0qtq8E2LzCpIuuWIQPjVV2bBp2b8fSjJ5+b
         xHQfu1jjqWd3rBUGyHsNqtM3EwUjEw+qKt68+27MIJen97Q4IW/qL1f4mLOlATbBp12L
         6a/xoF7tKvxAHndOM9qtRs2g/cdhWstMSLSFkQufItYwwQU7lCRxAKOUX9FrTB4gwYbm
         t8FxFQUlh8Zp14xrc/ee0xzBs+0rdfDPluQj+fo0tKneuS/cDyind+0W2hjbUjplZ0YK
         XWUZa0ArSxfdndbGS4l7X62o74I8Zspc2MnSFi0JSMKTj3EtUZe7HrxY8uIs8dWi9vZ8
         i9aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=k4Z6DmcjO4F40f/mGsIu+r4CtG3oqiS9+2FvsS6aCpA=;
        b=DCayjOq6Impsw2lrAUxbo5IFYbVlHK/mYsO6T3NNi2dpKMExaC0UIhkAfseg+Upalf
         oMhuArWDmvwViZ9u/dtg7lkCUCgZfrRuQI8i6yhJkJxcKqrYN1+tNBlP/WO1fiOXdDPL
         Xzd+j92Pc86yT5d+0vEBWO2dkonPK2rPIenMtqIVirlDGtEfdVzqwnmYpgws0HYkWRat
         x1PWMFQT5KgaqUsOR2GP+0mOYPsHaFk5xHD7r88PTPDQOey/p/pCJlCPcyqRksJyAMMV
         glmD/Sj3X7JQ4sfhF4u5HguU4uGkf1TL7EB7zX02nUE3bVpPVRF12JeUiIeLf/OoBAqY
         0qLw==
X-Gm-Message-State: AOAM531Oy8Tpomfst68Wh2By3EHgr+kP5e/A+P7ZrqlOzDyO7PBre0o3
        PlNG2Tbdn2CifNPsCFZG7QyvrmLs
X-Google-Smtp-Source: ABdhPJyuLFzxQUrqklsWbQwrG/hgHoSNkpkR9epdnuxeXa7GaJPTLt9weuaoLzDKQc+hHgE2pKUPmw==
X-Received: by 2002:ac2:57c6:: with SMTP id k6mr3403238lfo.179.1592367858148;
        Tue, 16 Jun 2020 21:24:18 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru. [79.139.237.54])
        by smtp.googlemail.com with ESMTPSA id 26sm4745278ljp.22.2020.06.16.21.24.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2020 21:24:17 -0700 (PDT)
Subject: Re: [PATCH 25/38] dt-bindings: gpio: tegra: Convert to json-schema
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20200612141903.2391044-1-thierry.reding@gmail.com>
 <20200612141903.2391044-26-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <186ceadd-317c-a7b2-d4ab-32473f857545@gmail.com>
Date:   Wed, 17 Jun 2020 07:24:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200612141903.2391044-26-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

12.06.2020 17:18, Thierry Reding пишет:
...
> +patternProperties:
> +  # GPIO hogs; /schemas/gpio/gpio-hog.yaml will match
> +  "^gpios(-[a-zA-Z0-9-]+)?$":
> +    type: object
> +    required:
> +      - gpio-hog

There are two problems here:

1. This naming limitation didn't exist before this patch, so it's not a
part of the conversion.

2. GPIO core uses the node's name for the hog's name. Hence by imposing
the "gpios-" prefix, you're forcing all hogs to be named as gpios-xxx,
which doesn't make much sense to me.

Please explain the rationale of this change.
