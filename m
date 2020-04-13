Return-Path: <SRS0=/QBj=55=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FCFCC2BBC7
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Apr 2020 22:23:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D631520678
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Apr 2020 22:23:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mEZwI6Ln"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728183AbgDMWXk (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 13 Apr 2020 18:23:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2389528AbgDMWXj (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Mon, 13 Apr 2020 18:23:39 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61920C0A3BE2
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2020 15:23:38 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id h25so10382230lja.10
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2020 15:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YO7GrPNetmdR0BRplZ8joqlR6+g0nmzlZ3ZAN/HxoxU=;
        b=mEZwI6LnrfdXvRaG0Kde9NnIgbjXuzg9iIGO1yT6N76afmjUaU4l/N2en41UcoCZ4C
         M4tKqZsZkitXLRTrRK5j2l/q7vES0G2bm07kqQVh17ZGSfiC4L5NQKfKPzacoZpJ11AK
         YgG2QfnAGzQGklzabiW73F6ijEmNEC/urcvrbGZGIAD3geFxngiCMDbYMnPehjzGbIia
         yJhWu74KvE3U35Sr6cbJzZpPdgavSAgZuKEqOeYoJkO/gQoUUIfwlArz/Sks63GxrJYo
         CrD62SgDIS69o4RWfithv7rfYu7o+KhaUp4J0rGQPN5KpSz3e/fb3a3v3dULUPtRh2/y
         AbyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YO7GrPNetmdR0BRplZ8joqlR6+g0nmzlZ3ZAN/HxoxU=;
        b=o+Ep4iNPGZGAMxflstK5jzJ0LKTnYO076RSWe1xqlLJhsPcs6sya2H9MG9wdJPlBW/
         QTo4QvTgs/2v3EHvNfWzhKjCBXvmtd1edvGyressinf4RIHoFhVH1yzha0GO48f8BEL4
         6+Aj7OKNC9i+WbMJ8ICrYl12Qgw43smDVr32NlytzNT00b+cN0Wsah8rxAZbxV5bgSj1
         xalmtVEg2sUxqOQoxUdOKBcV5XTzRBE5s795h59CVElEtfOwkLFy+aJWCv455CfjAaRP
         Jh9IylMBdM1G/OSyUNB3E0z8HnLrXPQuXX14YAOiCwmPtdJ6bgFWAJ2W5cHQ+WAlpsY/
         Rs/A==
X-Gm-Message-State: AGi0PuZ117kOS7a3Qs+ke1DG0pi8P6HBxrETxCXTF/24SEyYzMQh1Bn7
        7CFyZCy9NHJbbX0NYoM+A4O95esOma/kCPE1fxZ2u37w
X-Google-Smtp-Source: APiQypL6L1l9yVGcwlBWq8a8A43u6FR9g6WHFZ04KouAm0YqYK1D2zNeJ7aWgM6ye+HHxGJ5k6ZuxKrq3u+6pcLvFN4=
X-Received: by 2002:a05:651c:28a:: with SMTP id b10mr11979366ljo.223.1586816616804;
 Mon, 13 Apr 2020 15:23:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200406141350.162036-1-nick.reitemeyer@web.de>
In-Reply-To: <20200406141350.162036-1-nick.reitemeyer@web.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 14 Apr 2020 00:23:25 +0200
Message-ID: <CACRpkdY1p3jBzm6cTY9OJJRPmwhKQa=HGUFSXUFuTOD0FNdQNg@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: vendor-prefixes: Add Alps
To:     Nick Reitemeyer <nick.reitemeyer@web.de>
Cc:     Jonathan Cameron <jic23@kernel.org>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        linux-iio <linux-iio@vger.kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Apr 6, 2020 at 4:23 PM Nick Reitemeyer <nick.reitemeyer@web.de> wrote:

> Alps Electric Co., Ltd. is a japanese electronics company:
> https://www.alps.com/
>
> Signed-off-by: Nick Reitemeyer <nick.reitemeyer@web.de>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
