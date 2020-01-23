Return-Path: <SRS0=+P9T=3M=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60730C33CB6
	for <linux-devicetree@archiver.kernel.org>; Thu, 23 Jan 2020 14:49:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 36F872073A
	for <linux-devicetree@archiver.kernel.org>; Thu, 23 Jan 2020 14:49:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mrGCJles"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728792AbgAWOtK (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 23 Jan 2020 09:49:10 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:45239 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728665AbgAWOtK (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 23 Jan 2020 09:49:10 -0500
Received: by mail-lf1-f67.google.com with SMTP id 203so2459417lfa.12
        for <devicetree@vger.kernel.org>; Thu, 23 Jan 2020 06:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BPPW9IU+ruAV1uOimTrGBs92WdNG36xmqhTz53FGFdY=;
        b=mrGCJles1c7f58DkPrSG6gSnjtp08QKxaeou5MDQFp9ZwRSjQ2cb36mHC/aMna475B
         a5JV6HMjF9u/6McqYd2t4tJqDpogKUq4BEwcERUaDcCQISLlkwKBK80W/XNvST7IK/mV
         bsYZJLqBEQVGDCva4J5hT3OYJqSkEJsTeqvGrja/0WYmmQ4z2spTq3/SdOc0wJtA761p
         UB+pYRTSmONEJoMt1rCoPqindyXeSYUUIhG6l8yvhvVK5oD7h4fF7RUXiMyJn6AS7D3p
         DNxkQthVpAqnV3SfxeQiT3Zl5r6NoTSyoyLdic80YG0GOOTUUiOv6Cp+b5CBp0SoUqTA
         bK0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BPPW9IU+ruAV1uOimTrGBs92WdNG36xmqhTz53FGFdY=;
        b=jYPxamtzGHUN89lFHCCUKDn821BOXrlOKytz9H/Rx6sFVoj2MeVXV069G7aDMuzgjY
         OowjMcb97GEsGEKkh5V9lWsFNq2CRKvDiRAjGZKk3wxZudmQw1RZw7fi63bYXfbvi91R
         Fu1YyPqDfTXkyim7zNwfw+eaZxswj5/H1LFylVu+PCFGY9Ey8p2609bC9Z89loTk5CXn
         M/etJRG1lx/+DoypJ1q4SxndNVItZ70b8FcXQAXHpmY/yhv+AmaI8Y4sv/PBOsKWx1md
         WJ5m0eKpVK1F5D/qNchrng45+g3RxKJYSgi8LlepIM7YBJfzCR18D/eS2la+hXyxhg9K
         Q7Uw==
X-Gm-Message-State: APjAAAWnLVGxy/1oyXTViGAnfisyqUg31I/sZdaGlaQ/nwVv1/Xunh1v
        VVXjWJNOumhoZuRCiyKpL8jR0YIgrPG0Y1rNdVxNKQ==
X-Google-Smtp-Source: APXvYqwviesfBDZBeKob892qIy6qBAac09CjXqBfPvQ19xi38mTIEOFcWe9pDLJSINtpV6mS8x6bctvvmZYw+cMcqCs=
X-Received: by 2002:ac2:4909:: with SMTP id n9mr4796395lfi.21.1579790948052;
 Thu, 23 Jan 2020 06:49:08 -0800 (PST)
MIME-Version: 1.0
References: <1579052348-32167-1-git-send-email-Anson.Huang@nxp.com>
In-Reply-To: <1579052348-32167-1-git-send-email-Anson.Huang@nxp.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 23 Jan 2020 15:48:57 +0100
Message-ID: <CACRpkdaX9amSA88=L7VSF9VDKxD_ed1gN4whJ3FriUwW1EB7jw@mail.gmail.com>
Subject: Re: [PATCH V9 1/3] dt-bindings: imx: Add pinctrl binding doc for i.MX8MP
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Sascha Hauer <kernel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Abel Vesa <abel.vesa@nxp.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Olof Johansson <olof@lixom.net>, maxime@cerno.tech,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
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

On Wed, Jan 15, 2020 at 2:43 AM Anson Huang <Anson.Huang@nxp.com> wrote:

> Add binding doc for i.MX8MP pinctrl driver.
>
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> Reviewed-by: Abel Vesa <abel.vesa@nxp.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> Changes since V8:
>         - the lisence should be GPL-2.0

Patch applied.

Yours,
Linus Walleij
