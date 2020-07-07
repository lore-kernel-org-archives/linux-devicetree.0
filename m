Return-Path: <SRS0=wVrF=AS=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA492C433DF
	for <linux-devicetree@archiver.kernel.org>; Tue,  7 Jul 2020 12:14:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8CEC620739
	for <linux-devicetree@archiver.kernel.org>; Tue,  7 Jul 2020 12:14:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rqxTBsFk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726839AbgGGMO4 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 7 Jul 2020 08:14:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725944AbgGGMOz (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 7 Jul 2020 08:14:55 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 941F1C061755
        for <devicetree@vger.kernel.org>; Tue,  7 Jul 2020 05:14:55 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id h19so49639568ljg.13
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2020 05:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eRo4bLjP+Yo12cNu7ZB66B2EpLUC900siQn20zUwpBA=;
        b=rqxTBsFkNM2OgNp8euNVn2o6v7oMZsLp7LN5AYIkHREHJKtYg8+f2Jmb7KYPvSAQH0
         gdLHvBbaC5FGu7DzhsSLr3rpDTG0o4lWOyIqHnY9y8IRR1e2gfmGhNhEtvW8MLPnnRhu
         PWNs02d/R8Gs+0dG3pAw3do5FAHRK54GrvPItttQxJTn/flo6Bu5mRy31Qcf4uIWXtHg
         2minpABLSOxj/fN7N7UfZmmPrb0YZuDeV5uoz7bdXBZKJlrnMSFe38ndu5pOMkfdyb/T
         Wg2aZbEUm+i3eaYXsbNfIYinU9FHLPO9SDp58JZ6Buc8OMSBl6SUNr/FRJg9rq7iH+dL
         6rDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eRo4bLjP+Yo12cNu7ZB66B2EpLUC900siQn20zUwpBA=;
        b=Eri1LF+OGHnKyFBTpyUVKx5RUkRPcbDM+NEYeQlINJVC6mzmB4QSNoTdh7hPLFJ/mI
         f6lruKdhDYOPO7UcX22yZrr83AtsXlN2VvaTXDpPOyHRupVckOiQEeDskM+4AdSm3v6F
         kWsrOdBM+QHQLNVhtAQRO9BibSX4cb+DM7KOz9l7iBwSmZkXk7wsQ0fF7JPFHt9oIRIM
         rQTMxBOM/orGEAFtREKkPyaaGQTdbRI9G/t8sFayAMfuxIiGa9CEuItpE1b5tmQj9j2K
         K+JwWkLHxVrhsSQtJmWFwFVvmrlqPWybJkrtfZbp6OjBo6GMoIfQrVckRvJkoihebESI
         k/bQ==
X-Gm-Message-State: AOAM531HzylvicmJQPplyCW6S6RmjIA3oxS2TK2G8slUHDt5+tkLxI77
        CTePiVOYr0cQCCBKjQPjZQLVL5OWOCkovWZ71i9PDw==
X-Google-Smtp-Source: ABdhPJxROxZERlqmDaOPnpnwJeoX3qd+DaxnyCj28HvilR27eVAiv/MQjpUwXcKcaZyzM88dD9mvFlGHKk9DDqFIVM8=
X-Received: by 2002:a2e:810a:: with SMTP id d10mr24370039ljg.144.1594124094128;
 Tue, 07 Jul 2020 05:14:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200621193822.133683-1-nick.reitemeyer@web.de> <20200621193822.133683-2-nick.reitemeyer@web.de>
In-Reply-To: <20200621193822.133683-2-nick.reitemeyer@web.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Jul 2020 14:14:43 +0200
Message-ID: <CACRpkdYPXSaqYsP-DO=uRxzb4OJwk6Zy81=dTAmgZn5f8+3QvQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: ux500: samsung-golden: Add touchkey
To:     Nick Reitemeyer <nick.reitemeyer@web.de>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sun, Jun 21, 2020 at 9:40 PM Nick Reitemeyer <nick.reitemeyer@web.de> wrote:

> Adds support for the back and menu keys on golden.
>
> Signed-off-by: Nick Reitemeyer <nick.reitemeyer@web.de>

Patch applied!

Yours,
Linus Walleij
