Return-Path: <SRS0=e4CZ=6A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C5E9C3815B
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Apr 2020 11:42:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3A94221D94
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Apr 2020 11:42:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GG/A2srh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505821AbgDPLl7 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 16 Apr 2020 07:41:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2505770AbgDPK6T (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 16 Apr 2020 06:58:19 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78704C0258D4
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2020 03:57:42 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id u6so5705691ljl.6
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2020 03:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hFUPXxI7jgn/ktPgVbzarMZTHyOx1Nmg/5SBKx4pX4g=;
        b=GG/A2srh1ACSKZdgHLplfZ/jUi+xHfqSi5dZn0vX/6LIw14wKAv/iShVBee6mNV5+s
         h/hhCCKNTZ8wtmb9f1Jt173dqX4oF1+DkWJ4ACKhY9XBPC+ndcyHKHhegZ2z25zLjqdM
         Ehvs/TadXFAZKCdBTBOGRjR6Via/IMCITluuyqfnu9qgdMAWwwr94JMRJ9PXzHSHwoKG
         slfZgsRKpMg6Si96q2oW1y8x5M9cUVH+dIgZOVHSUa6+BYV9cJG+7SHeLLyODLsXz/eJ
         SW7YYs6U9T6bf5huPX/Aij1ZcFiQbMPt4YrItZjEd+w3gVbfCsBZyy0qZEzTaFACpgdW
         5xUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hFUPXxI7jgn/ktPgVbzarMZTHyOx1Nmg/5SBKx4pX4g=;
        b=Yozmc+bAbM++aTLcZQysFcvkFizHMLSqWJTz0i0C7tTMJDGJzKpQM4Bc6OzGQ4H6je
         Wu06fhe1Y83hS5Gb03rhgEU1B0+O5z3CElb9tnyIntoXZJg9yZgy8n25ULJxfHDljz7C
         6rFYhW/BY1cQI0fIeUn+v5Sk9DQ09ELnZXgM5os7rSlBJ+Q17laXZOinKAS6H+95bPfu
         SE2lBItrO82boK2Raw+EYeWIS55qqjGPAPjfaXJ7SWsiJtOrJbTKt4QAoc7c8ZHkHd8u
         i9HcdCkRVM7m3im5N0O2fHdiDGpKlmZvVVO+JvAMc0UCsFTjfRLXQtbriMfhexCKQHU5
         VcNQ==
X-Gm-Message-State: AGi0PuZmsMB+Xfzs1sCYRAsyAQSC5hSE8pkKcamupKKy9w2xJnXqMgGJ
        xVoxPvEGbzZwo5F1NTTiZSRz5duI4frI8axcq+ayTg==
X-Google-Smtp-Source: APiQypIW5KNqgRNJ9hqsEXxDLzCkOX0q/HE89bJBbc8uzjThgdcyvk1104plBxo1ff06jPElEWcriKNEBaC2qQTgiy0=
X-Received: by 2002:a2e:5048:: with SMTP id v8mr5610475ljd.99.1587034660887;
 Thu, 16 Apr 2020 03:57:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200409043851.31217-1-paweldembicki@gmail.com>
In-Reply-To: <20200409043851.31217-1-paweldembicki@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Apr 2020 12:57:29 +0200
Message-ID: <CACRpkdYKB0CHgOQ0DEhYoy16n3tSZ=DZ0WvL-GhAVCq0Jk8s2w@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: vendor-prefixes: Add Check Point
To:     Pawel Dembicki <paweldembicki@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Maxime Ripard <mripard@kernel.org>,
        Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        Mark Brown <broonie@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Pawel,

On Thu, Apr 9, 2020 at 6:39 AM Pawel Dembicki <paweldembicki@gmail.com> wrote:

>    "^ceva,.*":
>      description: Ceva, Inc.
>    "^chipidea,.*":
> +    description: Check Point Software Technologies Ltd.
> +  "^checkpoint,.*":
>      description: Chipidea, Inc
>    "^chipone,.*":
>      description: ChipOne

This is wrong, you inserted your new vendor between the regexp
and description for chipidea and flipped the two lines in your
match.

Yours,
Linus Walleij
