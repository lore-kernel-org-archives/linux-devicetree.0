Return-Path: <SRS0=7bfi=7X=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E846C433DF
	for <linux-devicetree@archiver.kernel.org>; Wed, 10 Jun 2020 09:55:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2C948206F7
	for <linux-devicetree@archiver.kernel.org>; Wed, 10 Jun 2020 09:55:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KZ3GCV4o"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727984AbgFJJzr (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 10 Jun 2020 05:55:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726134AbgFJJzq (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 10 Jun 2020 05:55:46 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F272C08C5C1
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2020 02:55:45 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id x27so1069643lfg.9
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2020 02:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IyM/A+avhJkkQHOLp+OvMDI3GG+kxptVRDbu3u0LPow=;
        b=KZ3GCV4oQ8GoZhjx2pBRStzJRFJC/aeLvAH56Ms+z3A6pyxZAqr26DULM6tE604ET4
         Neju+GKK0TxS2BEBiYqrK8ZAAy43gpWB8HQ971utdGJQuFszPl9QZgYYUU0sHCWRnhbd
         6GIHn8MU1axUgQbHaAfMzacFuagYyooDoAmkS8bnScg9G7g+StfE3LYW19Uxic9LK6On
         7FiJDSQEmMhNB5t1sCQgPq+qJ/bSCma6+45ICCeJpUzctEGgFrve+wbAlwsfoxQLe6yE
         B2GSy1pb47oGu2/e3pTl0eh75S/BCedvE9mxxYG9LjtQNOPinBsLstTJ4vPT9T8lwVVt
         vW3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IyM/A+avhJkkQHOLp+OvMDI3GG+kxptVRDbu3u0LPow=;
        b=Iwq1MKkcN/QWCehh0z1BdD+nr1rJgbEo4pkiUoMe1IjVCy2Gnh9H2M6eFsm37r1USE
         4phR6iwt4fUo/0AITW46/PxF2g76vbxpSkjsj2RYjDJWU2hq7ZYqm4gQziZFsYQwUO/2
         DGYUx9dXYY50z4zELPfKNggx5NjLB0bYf9Ti7XXoiXxsioVzEbMk88M+wXsdQS8b4m6V
         H4XBkgJbRtmyvc3pw9TUgXCgv3ItW5BCCQazvlbgHUSYl5H9z1Zy2VidD0mu4rw/F4PJ
         +4w0Env415IkSTCxDE6Rjm0S2D986JGbsnN357yE45NjGh11mybY1jV35MuiwMrQMfz/
         B8AQ==
X-Gm-Message-State: AOAM530moYaVo8ZFmo4/OIFsHigZ57XC2hcKtnZSE0mLI5GPqcP4oSLC
        HZvnmaKd2FTN7745nfj38WTtahdq2nOe57d5ZydsQw==
X-Google-Smtp-Source: ABdhPJw06BW9DC3WVHZ8QRBMneGYcET56eTT8DIAMhEVt8P5RXWMTPAIOnCaPj54gMD05QlYQar3OpWGUm5iy7QPfE0=
X-Received: by 2002:ac2:5a07:: with SMTP id q7mr1267243lfn.77.1591782943164;
 Wed, 10 Jun 2020 02:55:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200605224403.181015-1-sebastian.reichel@collabora.com> <20200605224403.181015-7-sebastian.reichel@collabora.com>
In-Reply-To: <20200605224403.181015-7-sebastian.reichel@collabora.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 10 Jun 2020 11:55:32 +0200
Message-ID: <CACRpkdZchnn8EG6HOo_QD=veHJzb_Vy5F2Ma0cEOZUjcZwHPYg@mail.gmail.com>
Subject: Re: [PATCHv2 6/6] power: supply: gpio-charger: drop legacy GPIO support
To:     Sebastian Reichel <sebastian.reichel@collabora.com>
Cc:     Sebastian Reichel <sre@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Emil Velikov <emil.velikov@collabora.com>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Russell King <linux@armlinux.org.uk>,
        Linux PM list <linux-pm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        kernel@collabora.com,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sat, Jun 6, 2020 at 12:44 AM Sebastian Reichel
<sebastian.reichel@collabora.com> wrote:

> All board files have been converted to use boardfile GPIO
> descriptor tables, so GPIO support can be removed from
> platform data.
>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Thanks so much for doing this!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
