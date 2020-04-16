Return-Path: <SRS0=e4CZ=6A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9C0FC2BB85
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Apr 2020 09:42:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9A57021BE5
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Apr 2020 09:42:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GBO7Wy48"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503833AbgDPJmU (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 16 Apr 2020 05:42:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2503627AbgDPJmL (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Thu, 16 Apr 2020 05:42:11 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9636C061A0C
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2020 02:42:10 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id v9so7032935ljk.12
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2020 02:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=S+O7/evWJtIotBVQwpT2KqWk5rAQTrvcTqRSVKK6/9k=;
        b=GBO7Wy481+gwjzwWz6sPoxZqqVNth7p+TZXxXv9ZXZIuibsA7jpbfZ1R3Cltai4VE/
         T+Q6VWM8Q2rrpO4h9z7LSUUwDtPWLvpo/tgRtXFb00mvUDeFrnFf3yC1N4qAdzPUpqFm
         TdzpB+TgGyDntlMspEHwiEwmi7RkyzWoWHzpYbd4IXYRJiHIeQBBKmZLQ1gv3hnKR3O3
         ++3rNzyQ1L2/scInVP4zfxYgBan9tmTDcBBBpC/4+rNQU9yfyEWL/aRb4X2ZbPezw6N2
         vuVncMTVvXO7PsbL+fsmN08ROgpRe4jFNxIaEcMzDulqNGg4CKbv36dRq7yPUXGY+LDk
         i9Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S+O7/evWJtIotBVQwpT2KqWk5rAQTrvcTqRSVKK6/9k=;
        b=t/kKjKaSvm9QKMm2BAJU4j5dnikeJITjtrb4PVM91F1VJ/teLYsV0sNMHOXpu84Ybw
         oAve8t5m3NwsJL+bY5HLCYnZrPE8TZGgrC4Ct4ie32baVPQ+KVxYCRWVuGVdekedFtuo
         pbHjiz3QbvO7AZKLtrN35k39S1Wj0k20mjwtA8nR5QgjksB0+ELVF1rXT2waBengEJPy
         6L5H78p+Wjrj5N19cbB9kZ3ir3CqIOPfVyfGOFsjKnxooSwdV6Dz3KhtG/Z98+w6hAE5
         pSNaHHbssVLRDtTiiDHhz4Ffv0cDZxgvg5Uq6cHKU41eMu8qcUxxDyg5PhaS1G1ywXjw
         VdGg==
X-Gm-Message-State: AGi0PuZPr5HQg9FJmZoE53Oc/0qPtksiCAfxKsJ4qgiEUOE4ArqUmnc1
        TEBZBu0tj1q+g9HEHTzRjAPYIzslr6QByhK/vsohHg==
X-Google-Smtp-Source: APiQypLpGxFP3d0tO0AVQPx+QFHPQbTiqjrHkFQRQ+jm2jkrid0OXVlkJQdGNnguZKq4zibPaNOzMTt/O2P/KsUiIa0=
X-Received: by 2002:a2e:9605:: with SMTP id v5mr5725065ljh.258.1587030129422;
 Thu, 16 Apr 2020 02:42:09 -0700 (PDT)
MIME-Version: 1.0
References: <1585306559-13973-1-git-send-email-Anson.Huang@nxp.com> <1585306559-13973-3-git-send-email-Anson.Huang@nxp.com>
In-Reply-To: <1585306559-13973-3-git-send-email-Anson.Huang@nxp.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Apr 2020 11:41:58 +0200
Message-ID: <CACRpkda4Bng5HqUdFCL4a+GMzyK-SqcfuDLjOaebS4ghtL4FsQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: defconfig: Enable CONFIG_PINCTRL_IMX8DXL by default
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Sascha Hauer <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Guenter Roeck <linux@roeck-us.net>,
        Greg KH <gregkh@linuxfoundation.org>,
        Peng Fan <peng.fan@nxp.com>, Andy Duan <fugang.duan@nxp.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Leo Li <leoyang.li@nxp.com>, Olof Johansson <olof@lixom.net>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        NXP Linux Team <Linux-imx@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Mar 27, 2020 at 12:03 PM Anson Huang <Anson.Huang@nxp.com> wrote:

> Enable CONFIG_PINCTRL_IMX8DXL by default to support i.MX8DXL
> pinctrl driver.
>
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Please merge this through the SoC tree.

Yours,
Linus Walleij
