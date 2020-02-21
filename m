Return-Path: <SRS0=98KY=4J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CECFC35646
	for <linux-devicetree@archiver.kernel.org>; Fri, 21 Feb 2020 14:45:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4F81820679
	for <linux-devicetree@archiver.kernel.org>; Fri, 21 Feb 2020 14:45:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZmmmuWIi"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728436AbgBUOpI (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 21 Feb 2020 09:45:08 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:40938 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728798AbgBUOpI (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 21 Feb 2020 09:45:08 -0500
Received: by mail-lj1-f195.google.com with SMTP id n18so2436682ljo.7
        for <devicetree@vger.kernel.org>; Fri, 21 Feb 2020 06:45:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=D7H0nLZLfPLMvCph5hwyr9duK+xVs3IbYudoH06c9do=;
        b=ZmmmuWIiC4m3STzQoVx5OWjfevcGXgj2dE2igO0Gwa28aZUoG6DI+0TmuYyHUEbKzu
         8Q0GomIcIIjcm+iWqGbPQznhzi51NLQkazdcpPB22p5nEFzNklowRDH1tz98tvinRyus
         JVJctZIvlJKR2qmTy19dI7mojx6df5HmJP2I1xiGALmaOWqG9/NXYRnkKNzlb+/eNaFS
         aJAWXlnWIk2/P+Yl+ejHtRvnAXRAWQjE2DSv3WG8sqjHHXbOq8cUH9Huyux8lvHqOl35
         stzBHXSqZFzKSVtnAvkIrQI8XKHEPQUBEeWlg5dGdsBb5H1IzhSyFkSgI2gmPTo82n+9
         EVmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D7H0nLZLfPLMvCph5hwyr9duK+xVs3IbYudoH06c9do=;
        b=nxVJEOtw97g7JSlGZVFd8VsvKniAyGw7HX7bWshyarRF1kZaeDLrDCHH+VQXdY/v2o
         ld2GrqNbM4w5o/7M3KsAiLTZYbpY5jeUZc/en3OvJTS1uvg84rBQYmn6PfBPIQHZuqN9
         nOoJJe8bf8ketND09I2AnsaOifHbWl5sxWXXfKw+/3HVa/+zc4Q+95lWb+wD7rm/ysNY
         qQT8G6MgwLP5fFGYH492I+IMSiHEKEG5EQGqfChYytJDGvGAyTFiNob985JkFV5UY/OJ
         277b1tPXFzT2nCNS+G/j+rD0yqPfMnuWAgMM7PTJBVm9nQmah1y8ZUlq+U0gbRv48CJt
         iJbg==
X-Gm-Message-State: APjAAAVw3BVCiCnHXmbS5XDipELZvvQCWV7mxexvNwP8T/iEsC4IRCFG
        A/gwZ51lim82+5WpjBahtA5XC8a7ki3+A14FzMHW5w==
X-Google-Smtp-Source: APXvYqyH1op228/uT3a0GVKtys5dZFCvQZ6VFBF+qI9pOeMLciTXqxLF8hf209U+UX9YSS8Q0rsF52Fv3M5LlI7ewKY=
X-Received: by 2002:a2e:9013:: with SMTP id h19mr23015684ljg.223.1582296306067;
 Fri, 21 Feb 2020 06:45:06 -0800 (PST)
MIME-Version: 1.0
References: <1582012300-30260-1-git-send-email-Anson.Huang@nxp.com> <1582012300-30260-3-git-send-email-Anson.Huang@nxp.com>
In-Reply-To: <1582012300-30260-3-git-send-email-Anson.Huang@nxp.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 21 Feb 2020 15:44:55 +0100
Message-ID: <CACRpkdaCC5-GWKyeoa8yS9JgHRvW_+AdqTYxy902TC48pMzXdg@mail.gmail.com>
Subject: Re: [PATCH V4 3/4] dt-bindings: pinctrl: Convert i.MX8MN to json-schema
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Sascha Hauer <kernel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        NXP Linux Team <Linux-imx@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Feb 18, 2020 at 8:57 AM Anson Huang <Anson.Huang@nxp.com> wrote:

> Convert the i.MX8MN pinctrl binding to DT schema format using json-schema
>
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
> Changes since V3:
>         - use uint32-matrix instead of uint32-array for fsl,pins.

Patch applied with Rob's Review tag.

Yours,
Linus Walleij
