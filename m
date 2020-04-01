Return-Path: <SRS0=fmve=5R=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 180D6C43331
	for <linux-devicetree@archiver.kernel.org>; Wed,  1 Apr 2020 22:35:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D9A3120772
	for <linux-devicetree@archiver.kernel.org>; Wed,  1 Apr 2020 22:35:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lNqO4gQE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732619AbgDAWfE (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 1 Apr 2020 18:35:04 -0400
Received: from mail-ua1-f74.google.com ([209.85.222.74]:44335 "EHLO
        mail-ua1-f74.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732560AbgDAWfE (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 1 Apr 2020 18:35:04 -0400
Received: by mail-ua1-f74.google.com with SMTP id d2so445516uak.11
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2020 15:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=9KR01r6gih4jhYYFHW4WFEV8YGH4JU+wPB7AaAwETRc=;
        b=lNqO4gQEsLC49pzkLSU8cnCQVc6iGeRg/6Wz0ziknQhxjWSurZeQBfYQlziEv+BmA5
         eeOBjThcv4ld4rS6Q8KVb3RF8Suz8cSz6BsFatMUWiPPWf1yT0TEG1b83HHhncC5wqqx
         rnEkUvYYnHSEG9AKwfqswxBOXy+436Cpz8O34nI/jSRBSp3H1Ae1aqULuU2ANA4AI1vn
         2BUubrAQ4f7W8hBFDf52veqo/LjbYA1DdGTTY2YhWZ+5qK4RKEe6ISrRXOdkwxU8se8v
         Txq8J87+3hHsgFggYKO0efyeOIHqFwT7P+Npg9I5l1QhPprBCK0qV0erj+QUayOlqOLE
         rpGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=9KR01r6gih4jhYYFHW4WFEV8YGH4JU+wPB7AaAwETRc=;
        b=sIOqQm695NTWsc9e6f7boGs55cLmFu5ylR3nnwYp9Iq7gfGRg2Q38H+XcG3cIWKO/F
         QZb1SfvS9Diycdty+FiXMwIC1FUWuxR2zHYDVl/lJafPWalR3kaqK7uLg8hXz8SEGT/z
         YBgk4H6jO+TjxOeTXYKrfnuhK8K1FaG247fRL+8H/+f9UCdlTkfVynABjX4IvjESL4+k
         XZTI+eqKVIT3pdNZUWrAzZq57GpkOShTOpf3qEFA/WThTbLaQ4Mynjs6pURger3yvTYh
         UZnqgOldeU18CFKUR0rBQOCWCtZUEB0RPbUUUdqX/uBnHqAJq85UADFk9/32nA91l30Q
         s5Kg==
X-Gm-Message-State: AGi0PubbsPF8LBZ2CtMP+nofwMdIQ+vVlSkeKr3BVS0UDBSw5SmFTy04
        yabhy4xDlj/qgEwDG+VP6SrhUzwcyZAPTaIf6r0=
X-Google-Smtp-Source: APiQypIWtlrEX6Rjcp+suO+gRNYCoxIEp2c68OatrHaYVJczhIM61LZa5Bdjbebhzf0H9aK6vvFmnQPHyJtBYCNyfPY=
X-Received: by 2002:ac5:cce8:: with SMTP id k8mr148063vkn.5.1585780503181;
 Wed, 01 Apr 2020 15:35:03 -0700 (PDT)
Date:   Wed,  1 Apr 2020 15:35:00 -0700
In-Reply-To: <20200401.113627.1377328159361906184.davem@davemloft.net>
Message-Id: <20200401223500.224253-1-ndesaulniers@google.com>
Mime-Version: 1.0
References: <20200401.113627.1377328159361906184.davem@davemloft.net>
X-Mailer: git-send-email 2.26.0.rc2.310.g2932bb562d-goog
Subject: Re: [PATCH net-next v6 00/11] net: ethernet: ti: add networking
 support for k3 am65x/j721e soc
From:   Nick Desaulniers <ndesaulniers@google.com>
To:     davem@davemloft.net
Cc:     arnd@arndb.de, devicetree@vger.kernel.org,
        grygorii.strashko@ti.com, kishon@ti.com, kuba@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        m-karicheri2@ti.com, netdev@vger.kernel.org, nsekhar@ti.com,
        olof@lixom.net, olteanv@gmail.com, peter.ujfalusi@ti.com,
        robh@kernel.org, rogerq@ti.com, t-kristo@ti.com,
        clang-built-linux@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

>> I think the ARM64 build is now also broken on Linus' master branch,
>> after the net-next merge? I am not quite sure if the device tree
>> patches were supposed to land in mainline the way they did.
>
>There's a fix in my net tree and it will go to Linus soon.
>
>There is no clear policy for dt change integration, and honestly
>I try to deal with the situation on a case by case basis.

Yep, mainline aarch64-linux-gnu- builds are totally hosed.  DTC fails the build
very early on:
https://travis-ci.com/github/ClangBuiltLinux/continuous-integration/jobs/311246218
https://travis-ci.com/github/ClangBuiltLinux/continuous-integration/jobs/311246270
There was no failure in -next, not sure how we skipped our canary in the coal
mine.
