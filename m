Return-Path: <SRS0=XaEl=A3=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2207DC433E1
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jul 2020 08:47:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E6A172078C
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jul 2020 08:47:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vGgDGorz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726332AbgGPIrn (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 16 Jul 2020 04:47:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727096AbgGPIrm (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 16 Jul 2020 04:47:42 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CB5DC08C5CE
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2020 01:47:42 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id z24so6202189ljn.8
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2020 01:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=92XopjWnoleG4glqsG4BU2p6Ba/zWqLgWpalogX+TCM=;
        b=vGgDGorzuOsneFcC3GpsD5YykNaUbLa2RmqVO839gEwfNOPrEWsw+JY2IAm6dSaLr7
         k3vylz47FrnNst/TJjyPiMQb1a9+kOmPpO14osAdLWkhcir/GAA4jdHXBlODomeo9DG7
         N7uN7ZsIsNVu3WtprIIdogMfWtMT6kR121fIeI8aY61Mgy3HW9FDwg48e/LmA+JEbSQW
         ZDujGl2IaFZl2dkLaTotWiouiUsrQTPvDH9zriM2NtdlBkuazB/5SXFRcQJ/catxZEfi
         j0VcnZBGwQXaRQFJA86ZN6hcssSICMTrrFR8sV9GOH+Z2yotj3brmFvCn+0YDgXp3XZU
         2BMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=92XopjWnoleG4glqsG4BU2p6Ba/zWqLgWpalogX+TCM=;
        b=bqfHXt6R1Y5BcubQ2xh1XtCS6g20ZohAvjX4EGJ7Q5/P5z6Gh/k25wI7+TFl4SvL6b
         FoMYCV5pMR+N8XkFWShnk1WLIF/cvQutoABKiTSvbfMFva/v+bU6VqpHvtrf+GDE1v2y
         gr/3IhER8ULTFuabhFu8MivNLYEKXiF/euns93Q/Z/ytU7xq5yCoZuEdmm7ro/xOA0gY
         s8S5YB39U2kpLCl5x3iI/Dyx46dT1oOCgPP7qSWyi/NhAUWb1Ahm07g4TdLHB05ZLhHJ
         ODZD7dukB5yhaK/yCXso5zuE4tA8U6Y8929VxzCjIpeVaqwM82HVT/CSWvRl+dwhXU+E
         mt4w==
X-Gm-Message-State: AOAM533Cf2QQHMssUv4Zedbf5lVZ3tCzMeC0TOcXygmIJDaKQoPh5xRy
        aQzUlMmOFENgLva+0cKlAjw61CapLp0qc6FR406TIg==
X-Google-Smtp-Source: ABdhPJy82hgoliVm6eopFXRyK6GD8v0CzkbH74FPpFZaLSVg+5+aHAZq1hO5uiZU7LO2CprZctMqX0Xm68KIEVQ/u6I=
X-Received: by 2002:a2e:9a4d:: with SMTP id k13mr1558882ljj.283.1594889260812;
 Thu, 16 Jul 2020 01:47:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200703080646.23233-1-computersforpeace@gmail.com>
In-Reply-To: <20200703080646.23233-1-computersforpeace@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Jul 2020 10:47:30 +0200
Message-ID: <CACRpkdar+aBBFn6SKJ1a90D-NT3F6qGvouzjt-jxaiR0VSuUOg@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: qcom: ipq4019: add open drain support
To:     Brian Norris <computersforpeace@gmail.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.or>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Jaiganesh Narayanan <njaigane@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Jul 3, 2020 at 10:06 AM Brian Norris
<computersforpeace@gmail.com> wrote:

> From: Jaiganesh Narayanan <njaigane@codeaurora.org>
>
> Signed-off-by: Jaiganesh Narayanan <njaigane@codeaurora.org>
> [ Brian: adapted from from the Chromium OS kernel used on IPQ4019-based
>   WiFi APs. ]
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Patch applied because this looks innocent and Rob
ACKed the binding.

If Bjorn opposes, I will simply pull the patch out again.

Yours,
Linus Walleij
