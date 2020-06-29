Return-Path: <SRS0=mth2=AK=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0422C433E2
	for <linux-devicetree@archiver.kernel.org>; Mon, 29 Jun 2020 23:19:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6FAA720776
	for <linux-devicetree@archiver.kernel.org>; Mon, 29 Jun 2020 23:19:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="LNTxKl8b"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728902AbgF2XTu (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 29 Jun 2020 19:19:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728638AbgF2XTt (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 29 Jun 2020 19:19:49 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AB2AC03E979
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2020 16:19:49 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id bj10so2465460plb.11
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2020 16:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5++k/h4J6s9YL0WyWuyzxTlU/vQOJjdsqu0rKb/+Hlw=;
        b=LNTxKl8bebPeFeSx476BYJS3w0hYrs7DOYuvktuSNqJd0fgQiXfpALN3ycAZPoaAKS
         fVFeurobCFOO/sU9O02/7GPD8RNIYmCdnG6tByMjuJgwhDTTevn1BVmpPl3EZwpttui1
         LxANr7G7V/sneGdEhYLNMBgxkV5c0O/UVROia8rANewWhoe+uEoeU4z6e+k28xxQkUhc
         WVHqT891YREel5dJ3r9CaAxkQuYXeTirVcUB1FOdSnjzGLNxu5v6d+GH87OpFIwPVF1P
         7Ft6QKg0JcXfkhrf0aR4fXOoX9La2LqAiX7UBjZN7hzq/TQSyYMsTMwvM/h6/W9iRFfB
         upKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5++k/h4J6s9YL0WyWuyzxTlU/vQOJjdsqu0rKb/+Hlw=;
        b=hOhle44UA1ZBhhMM0bPqYFOI0Pr1++z0Mr/y8A41tr8yvdWUAD3RaxW9LiIrbVCPIM
         kRmX/cUodLuh4e0G++7vIjh1ICGiiiUNZSeWG4FZwiQI+NN5WlOY2Cw9oqhFc9A6XqDy
         X5f1pASWiNK70bp1lwX+s9xqdJL+t8BDtPoagxe+gAD7Mkog3OZQmEHSNkoo1Cq6jpBr
         CdXl4cfII4lQGnOsMql5GN7NOEY39tk8//8//mOyICTwi1j0EsbXLtIV5gHZ1aQ+X6vo
         4QxGFKz1lDyrg+0AUCZUikye+4AL7T6Oh8d/qefAr04bM5qIsYBUXPzVKhsDRuAFMbBd
         miiw==
X-Gm-Message-State: AOAM532QXquTu3cg+jVJ4O2mnf98U7KUi7YwWgRnwtXTcuG+2NlxPTqE
        86yxLqTzyExCUp42KSPc5M4k7Q==
X-Google-Smtp-Source: ABdhPJzpj4inNHiYiuC/LsoKrrns2nC0r5IQ4v/0MbXa1bNf1SKc3VwcAlkUnq95FV8B+U8X7cTYAQ==
X-Received: by 2002:a17:902:8c89:: with SMTP id t9mr15877853plo.14.1593472788532;
        Mon, 29 Jun 2020 16:19:48 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.gmail.com with ESMTPSA id l134sm721299pga.50.2020.06.29.16.19.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 16:19:48 -0700 (PDT)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: meson: Align L2 cache-controller nodename with dtschema
Date:   Mon, 29 Jun 2020 16:19:45 -0700
Message-Id: <159347276726.1911.11463316462459083306.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200626080626.4080-1-krzk@kernel.org>
References: <20200626080626.4080-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, 26 Jun 2020 10:06:26 +0200, Krzysztof Kozlowski wrote:
> Fix dtschema validator warnings like:
>      l2-cache-controller@c4200000: $nodename:0:
>          'l2-cache-controller@c4200000' does not match '^(cache-controller|cpu)(@[0-9a-f,]+)*$'

Applied, thanks!

[1/1] ARM: dts: meson: Align L2 cache-controller nodename with dtschema
      commit: 54320dcaa2522db3222c02d68b52cfed32a2e95b

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>
