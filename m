Return-Path: <SRS0=98KY=4J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FCBDC35646
	for <linux-devicetree@archiver.kernel.org>; Fri, 21 Feb 2020 14:44:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 50DC624650
	for <linux-devicetree@archiver.kernel.org>; Fri, 21 Feb 2020 14:44:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="inQU1Tfp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728910AbgBUOoA (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 21 Feb 2020 09:44:00 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:42590 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728837AbgBUOoA (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 21 Feb 2020 09:44:00 -0500
Received: by mail-lj1-f193.google.com with SMTP id d10so2421575ljl.9
        for <devicetree@vger.kernel.org>; Fri, 21 Feb 2020 06:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zxyoG6nAOs3iDcNS4Z1SWTTrzy8IIEIHsRCmOX+8xu8=;
        b=inQU1TfpUZ0CBu0amQil1sCPaEvQ1X8UG63hrSvoCXKC9OkJUw4NMr6UZu1quhG+L9
         m8YCxsLYKkVSCb89IEHwGlTUj0tH/crnSogq6yuDyx0qPbP6ihLIMc/zM/wz7Jd5bfZX
         xqdCioCkyRNOG+0cX3werPRMLlItgEq+fIuGgib/XzcQgBpWVVecshjDu2aNJLc1l4yi
         TTCnHBUb9eqLDB5NnruRQGWv0DiUiWCHYv1y6fdAC6syv9Ba0POKaArPytKmQVSZhyHN
         9/f92rq53NN4462mByG3m2loQLus9vC/HY17sDr+Eczq05z38i4HtQGxUAhrVtZtf5sz
         50tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zxyoG6nAOs3iDcNS4Z1SWTTrzy8IIEIHsRCmOX+8xu8=;
        b=R5uRgVk5/1S+adGV/B9tYCVyPgvbmRul2Ld8jCfCfl8a+4/Lwm2Wz5FryewIdJ5k8F
         9ufV7IFVHe5Zo8k6boe3E9if1yXlg6ZpHiD/DAkqmpZ79fcp3neMzWxychYnjyYNldg6
         ZYW1imVTmLdSGGxggeeR2+ZhWHG7Ps63GH72J2xQ07loMskytIWwiOPCTSUpMDMX1bXf
         qFraKBwx1GzrR+QM6ipNZWtorS7IwXF311K3gUQsri2zxpMl/qwovK5ICTycolDzD0Tk
         I3SusAQvS4b8EKudL8+pzNMxhhKQHzvpvRMNzoWGPFyRG4oK6kHv4Wktpc27bWu5W7cL
         BRAg==
X-Gm-Message-State: APjAAAV/V3yGNFxcuTkb1PGn0XXJaVHgGofn9LplzY2rZ269RoLU5gtz
        SyZPQ6hVMyzupiR5a5i54pbd/8i68NmSXYZaSIP1Jg==
X-Google-Smtp-Source: APXvYqyb3t85xjKPwhD4gyHOTimxwHuO6OJKXBDhsaLSjnAYbEB8tiQngZaDfestVaUMXo0GwsmKGj6lvPD5AwNsoeE=
X-Received: by 2002:a2e:7d0c:: with SMTP id y12mr23189523ljc.39.1582296238375;
 Fri, 21 Feb 2020 06:43:58 -0800 (PST)
MIME-Version: 1.0
References: <1582012300-30260-1-git-send-email-Anson.Huang@nxp.com> <1582012300-30260-2-git-send-email-Anson.Huang@nxp.com>
In-Reply-To: <1582012300-30260-2-git-send-email-Anson.Huang@nxp.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 21 Feb 2020 15:43:47 +0100
Message-ID: <CACRpkdYuC4iiuKrRWnH6Rrr_AV+F54_AT9X9BdktPaaie5zy3w@mail.gmail.com>
Subject: Re: [PATCH V4 2/4] dt-bindings: pinctrl: Convert i.MX8MM to json-schema
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

> Convert the i.MX8MM pinctrl binding to DT schema format using json-schema
>
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
> Changes since V3:
>         - use uint32-matrix instead of uint32-array for fsl,pins.

Patch applied with Rob's Review tag.

Yours,
Linus Walleij
