Return-Path: <SRS0=bA0P=AA=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C46B8C433E0
	for <linux-devicetree@archiver.kernel.org>; Fri, 19 Jun 2020 20:20:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A4EB720720
	for <linux-devicetree@archiver.kernel.org>; Fri, 19 Jun 2020 20:20:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="R/Z5ulzL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389361AbgFSUU0 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 19 Jun 2020 16:20:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391915AbgFSUUZ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 19 Jun 2020 16:20:25 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 791E5C06174E
        for <devicetree@vger.kernel.org>; Fri, 19 Jun 2020 13:20:23 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id s1so12964503ljo.0
        for <devicetree@vger.kernel.org>; Fri, 19 Jun 2020 13:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=from:subject:to:cc:organization:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=E7L9r0z3/t6FzQeUpWNZ1H0U1n9mxr0xJxprU/23UXA=;
        b=R/Z5ulzLOEi4Zu98oH9KytyUWyT0BLLPsu82Xx1VGBwKKHVvsVWE8eN3tYi4dpDJUH
         v2PqoCJBmR9q3ghNgQGWlOzWLttFwuyLjMio1ugoptNHAlXWkqR+kUKAmAzzgv4BIcQE
         V8bcO4aN6I+Ov3Boh8Lp8OFLo0rc7rUYK53S9RFgrVqYrTeZUnWIaGjbnsQfNYTt5O7S
         S5/+E9yuXeL/PuzQFXHS5exqZs9+I1rY/Wxp5r1g5AkQuEZBZZaJ+np8sU/LVRPKW4d7
         9y72XLlpQTvyBJef7mBoaf46RzCOJ8ZWFQUeEFmo8mf8L+CfskZVJ6dvREukt3lJidci
         0kGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:organization:message-id:date
         :user-agent:mime-version:content-language:content-transfer-encoding;
        bh=E7L9r0z3/t6FzQeUpWNZ1H0U1n9mxr0xJxprU/23UXA=;
        b=t5hy/ao36FkBNJhWzGVnY0BvzdatB+ucJ/Il30AC2xDQvjqo/plmlsqC4vF/lsO3Tt
         JynxWSCxqOuDxqqbis1kvJ9jLMk5Ibo09wqfLmquRbg463DSoq5fWYXYLffpYxB/rYo1
         tfpNzQ7XxQSmHuju/IHoD5cPiZ8YXZH1P9AqsVCjxymHsZmCytTxu0iiX7cU5sy1n5m3
         6XSlNhFmJOqQqBn6GJEFp6C7q5nMItewv2L1BH4MXO80ro/etnsjYTsTsttO/13Bllc0
         G4Y0FBdAMxKpb0c31oV5Z1T2kAwlL2OYuCboj4B3RZpCAUJhmz2IIDXmVBu5jJCcCasl
         hPOQ==
X-Gm-Message-State: AOAM532jy5ceMDHhGK2tO0E6xBiaQyHNoKjNZmyYW//189IBS1znbgm1
        pb32Yte8YhFmpAV65G+SygDPx48JsEM=
X-Google-Smtp-Source: ABdhPJy9WBcdq8Qh7iQJJdk5T+VHTJmTWSXfO00qnlKV96pTDYj7e/D/mGxz/LSoxOtW4KOj1sqrZg==
X-Received: by 2002:a2e:9bc6:: with SMTP id w6mr2821858ljj.429.1592598021989;
        Fri, 19 Jun 2020 13:20:21 -0700 (PDT)
Received: from wasted.cogentembedded.com ([2a00:1fa0:441c:ac8f:7564:6e7d:9e36:7ded])
        by smtp.gmail.com with ESMTPSA id t16sm1318040ljj.57.2020.06.19.13.20.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 19 Jun 2020 13:20:21 -0700 (PDT)
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v2 0/2] Add R8A77970 RPC-IF support
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>
Organization: Cogent Embedded
Message-ID: <13425133-eedf-081f-4ed7-cd9012ce7d6d@cogentembedded.com>
Date:   Fri, 19 Jun 2020 23:20:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hello!

Here's the set of 2 patches against Geert's 'renesas-devel.git' repo's
'renesas-devel-2020-06-15-v5.8-rc1' tag. I'm adding the RPC-IF device node
for R8A77970 (based on the RPC-IF driver) and describing the QSPI flashes
connected to RPC-IF on the Eagle and V3M Starter Kit boards. Feel free to
merge the 1st patch back to the R8A77980 patch from which the former one
was split.

[1/2] arm64: dts: renesas: r8a77970: add RPC-IF support
[2/2] arm64: dts: renesas: r8a77980: eagle/v3msk: add QSPI flash support

WBR, Sergei
