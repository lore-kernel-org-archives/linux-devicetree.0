Return-Path: <SRS0=+P9T=3M=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0190DC2D0DB
	for <linux-devicetree@archiver.kernel.org>; Thu, 23 Jan 2020 14:50:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C380D21835
	for <linux-devicetree@archiver.kernel.org>; Thu, 23 Jan 2020 14:50:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qNzbAggN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728057AbgAWOum (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 23 Jan 2020 09:50:42 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:34487 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728792AbgAWOum (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 23 Jan 2020 09:50:42 -0500
Received: by mail-lf1-f65.google.com with SMTP id l18so2518134lfc.1
        for <devicetree@vger.kernel.org>; Thu, 23 Jan 2020 06:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fNTKUOvPaK7NGZPdn9RrwLDwm3nxspv1+FNYwv3C3hM=;
        b=qNzbAggNf44Rjyi3xYv12GbLVPoWqZaEGnVV865MBvv6jFfDzRtp4lOna6Rgm4rgvc
         pXliObXDmabJwqfsEkby+uUceYrj9wJFfeWWmo7UIi7yjws0apqOXVdy6sq+tifkxkyJ
         WJ1w2CzfVPxAiHupGieQE0pSn3n43ScymKcvFNCn7HGnmo9TVWnuAL8CSvRgn37iGczT
         +QToDC6Zr4hjR2FvfO97FxNd9RacVRcMy+5gfNp8sdObik/cuPXSxrq5pSLv/lQBQcos
         Emm0PCLfAkk60QWURSKRv/BYfrvv/11/Cfrb785duxuKS4o1Nx6SQwiIUcp2P08VKKXW
         7ppQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fNTKUOvPaK7NGZPdn9RrwLDwm3nxspv1+FNYwv3C3hM=;
        b=PllueXGXEHpDI8N16FSzdOWK6fTGZpoJFJOOE+preafLVcJCn/xAxIjI/W4TiTmK6R
         sUA7n5z+HtifuQdxCO8e7ns+paIVgSdO7O2Hweo/Kt2soyD1kjOSPc1xiMwKaWt4dZzO
         MF9537jW22Z/PvkyratPM9Y/4+quLGi+4VX9N0R6dGDmPZDxGi8KzbI9mp504wtIFhPu
         caLiQ3Vji+/W/QdHpTRK0NcQvzAIpQeVSyEfJrtfpmCzGkzptKhkZ084UG5nxp3ONbB4
         DKzDZHWUXUYJJukHir+ngbKnikeULsxy+XZef/DPn0+AZX2BwBdA+vGslUVBTjuHaLVb
         9mcg==
X-Gm-Message-State: APjAAAWueDeh4t7Tp9zuzB3so8kfXKyCs5Kw8rLstqA1pWx94oTDerU4
        0+sKM/TCCRFUM8rXoYQJDrneXJeBzdolTFfRot9FMFvdPG4=
X-Google-Smtp-Source: APXvYqxGwUR1H9HYGs2wE0Gbmgjwgzwz74XfSo69PdeiRrNPsM7q47aeOmg84PC9sjlXyry/YWLldmwkbBajFIoCZ68=
X-Received: by 2002:ac2:4d04:: with SMTP id r4mr4985943lfi.77.1579791040844;
 Thu, 23 Jan 2020 06:50:40 -0800 (PST)
MIME-Version: 1.0
References: <1579052348-32167-1-git-send-email-Anson.Huang@nxp.com> <1579052348-32167-2-git-send-email-Anson.Huang@nxp.com>
In-Reply-To: <1579052348-32167-2-git-send-email-Anson.Huang@nxp.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 23 Jan 2020 15:50:30 +0100
Message-ID: <CACRpkdZ_v93Laaz-=1-CyOWPr86VAaeeArGRc5a18NgHNiuf=g@mail.gmail.com>
Subject: Re: [PATCH V9 2/3] pinctrl: freescale: Add i.MX8MP pinctrl driver support
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

> Add the pinctrl driver support for i.MX8MP.
>
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> Reviewed-by: Abel Vesa <abel.vesa@nxp.com>

Patch applied with Fabio's review tag.

Yours,
Linus Walleij
