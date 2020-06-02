Return-Path: <SRS0=mVKz=7P=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED36DC433E0
	for <linux-devicetree@archiver.kernel.org>; Tue,  2 Jun 2020 11:57:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BECB6206E2
	for <linux-devicetree@archiver.kernel.org>; Tue,  2 Jun 2020 11:57:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k+9cCuBX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726110AbgFBL5e (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 2 Jun 2020 07:57:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725966AbgFBL5b (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 2 Jun 2020 07:57:31 -0400
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE20FC08C5C0
        for <devicetree@vger.kernel.org>; Tue,  2 Jun 2020 04:57:31 -0700 (PDT)
Received: by mail-oi1-x243.google.com with SMTP id j189so4290465oih.10
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2020 04:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Bnys2wOoEU1x/ikV5ijTNA/FpnweJ1oEqvvB7NUEA+A=;
        b=k+9cCuBX+07ki3h/U1eTOzlr6ODNPkXXcMKP6TfZD7xxmJxeBWW3n9KjD5Mg1xqfxl
         CqMnaNTwFk4x77rZ3i4IpXbcT3Lz0kMvuu5YL/MJ1IvMjZQqxUnWCDc5VhRoQRm9ETn/
         t9/MEFpNnEXCG0JRS0g0z25GDiOozWbkOTdxfYjCG5iAvZFoaBtC80XqC3qwp1Egq7Bj
         oXW7ASgx69H0zp0YNjuLPGrC0UFqf2u/Qphzr8zuZBi1hTWXjrU0MRk7pWYFRAyoxyV5
         MibIXAuxNYlXoDbaxIpKNnSPdw1PNSBNbD7I8rhM/2vJb17fdDmqsTVVpccOou9NM1ZX
         5zMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Bnys2wOoEU1x/ikV5ijTNA/FpnweJ1oEqvvB7NUEA+A=;
        b=HWe1YjUrQDOgWIT0aSLE680jgM2LYveV66G/4t9CRcZg7Spfsj0f3v6dGUiWsbHlwY
         Eo4nPvBz63lE1zFCUGFFxfBKGfG6C3DTNPzGFFRaBvw7IIKzVQuN/GBu9lPTfJfgB2YY
         /rT+3sjImEvyy6okJXHSQwnUfH0sTdTeZE2ibtCuaSYb3QmjlxRMRl7l1F+X75RoydqB
         i+VjjNbSgT2Bl5ZIF8WPKWq3B34GDgvBRmanGDNqtKvcngd6nNAcHffXgAzWS4we2PRL
         LC1yMEwCPmc57L3vTXH63q/ba+ltZvMWCu9gfWG3YN1VNUI9enPV8OklnwhT6BXupnWL
         IRlQ==
X-Gm-Message-State: AOAM533eyYF8caLTzGUPVhc5xD6rWKw0aded7YcQLLVr7Rm5TRee45N3
        oQ9Teo5BJqyllYBmIO+fHp8TwCQBgpIlDlDm6a/IPg==
X-Google-Smtp-Source: ABdhPJyF04o7i6kEvgUR2RRqw2rFPSQaTPQrgt/KTJQMMVnh2YChB0XvplTmPPHzK36jN1aEaoBMWgCgPKD1BB58jkU=
X-Received: by 2002:aca:50cf:: with SMTP id e198mr2811324oib.76.1591099050929;
 Tue, 02 Jun 2020 04:57:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200602100924.26256-1-sumit.semwal@linaro.org>
 <20200602100924.26256-2-sumit.semwal@linaro.org> <20200602112415.GD5684@sirena.org.uk>
In-Reply-To: <20200602112415.GD5684@sirena.org.uk>
From:   Sumit Semwal <sumit.semwal@linaro.org>
Date:   Tue, 2 Jun 2020 17:27:19 +0530
Message-ID: <CAO_48GHdhafjgLH1-3upZPXhNjKSt_bPAnPpjA+nhR2wrLbcZw@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] regulator: Allow regulators to verify enabled
 during enable()
To:     Mark Brown <broonie@kernel.org>
Cc:     agross@kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
        lgirdwood@gmail.com, robh+dt@kernel.org,
        Nisha Kumari <nishakumari@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, kgunda@codeaurora.org,
        Rajendra Nayak <rnayak@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Mark,

Thanks for the review!

On Tue, 2 Jun 2020 at 16:54, Mark Brown <broonie@kernel.org> wrote:
>
> On Tue, Jun 02, 2020 at 03:39:20PM +0530, Sumit Semwal wrote:
>
> > +
> > +             if (time_remaining <= 0) {
> > +                     rdev_err(rdev, "Enabled check failed.\n");
> > +                     return -ETIMEDOUT;
>
> s/failed/timed out/
Ack
>
> > + * @poll_enabled_time: Maximum time (in uS) to poll if the regulator is
> > + *                          actually enabled, after enable() call
> > + *
>
> This comment needs updating to reflect the new implementation.
Yes, I will update.

Best,
Sumit.
