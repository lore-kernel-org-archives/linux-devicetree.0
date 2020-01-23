Return-Path: <SRS0=+P9T=3M=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC08BC2D0DB
	for <linux-devicetree@archiver.kernel.org>; Thu, 23 Jan 2020 14:51:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AEDB62073A
	for <linux-devicetree@archiver.kernel.org>; Thu, 23 Jan 2020 14:51:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zHHe+/Kc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728803AbgAWOvs (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 23 Jan 2020 09:51:48 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:42616 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727307AbgAWOvs (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 23 Jan 2020 09:51:48 -0500
Received: by mail-lj1-f193.google.com with SMTP id y4so3726125ljj.9
        for <devicetree@vger.kernel.org>; Thu, 23 Jan 2020 06:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wpQpzwBJizxiZM4AGXXfpA6ecY69PSZfjTnWJHiGDa8=;
        b=zHHe+/KcMiM2OVqtuB66pI12fZZ+m42MLWk7c4e0dwk+4PVcDAQRQGkH2bom2snRGQ
         s+BsUvWWCWn/MTDjvUDExBq6c17YH5kx0F4CyCRcPZrbl/ZMpiu+YXXREZiuP9fjopAh
         6nzwPYR7jzYP/oLmPaeeXd80oppKKn5v+bFxr+JOdkrzoxP4QoNZX3OSQRYmjxTLSpIN
         yUkUlNtjQoav+EWcGkkpcxkEmCFm0rUVno0+e+/fbqaGdQVmakXRyM+6XPcgkluEwF6X
         h2FXrOfSJ2GEh5c6vvNjJv0+7qB0BJ5/fpXc/LPTa+mWWKNODEoyiZzCO5tRzLTQrV18
         FARA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wpQpzwBJizxiZM4AGXXfpA6ecY69PSZfjTnWJHiGDa8=;
        b=N6aHfrL1NAWt1Z+S2a0m3J49IpCTyemv5v2gw1NzDieF19W3ZYIn2ylJgG2mI6a3e+
         bz9jeUk1I40r02l3vYG2r82mpCxY4JbMTPqtaELNPTEFe0EPLP4na4t593J4WtO5f5Bb
         IbVy/1rA+OKI72RMt9mv6siRotzk3Gu3Auv+B/HLbu0rfqUy9/kQ9YUnN8mFGVj4DmTe
         AlSuoYVLs+VMKmRW8iYAeZhb4hsMfjiNQFSqSl6O7WnrAgq7dzf21Eq3ZLk5efxtnljF
         DNyEWMSOa1lFkZAH0/5vfYwYg5NpXwttKl+MP/FoEVK0RCt99PYWbYgtDNITWm3nBGi6
         UBbA==
X-Gm-Message-State: APjAAAUqkgL8xkjXQTy2AOJtomspuKwtb3mzxHI3zoqeHdqQBzr/+yUZ
        LwTUTt5uc0pBFZlf71doCV6nwWjcWU2amRgkv+BStw==
X-Google-Smtp-Source: APXvYqyoaYqckC3ntGOF9x1FJqnlzYv1mgmrXUtrx2aG4vyVoA1H0f/fn7kbACbF5D4nDS8JX1hzZHSRQ8oee+Zg/Dg=
X-Received: by 2002:a2e:9143:: with SMTP id q3mr23150980ljg.199.1579791106444;
 Thu, 23 Jan 2020 06:51:46 -0800 (PST)
MIME-Version: 1.0
References: <1579052348-32167-1-git-send-email-Anson.Huang@nxp.com> <1579052348-32167-3-git-send-email-Anson.Huang@nxp.com>
In-Reply-To: <1579052348-32167-3-git-send-email-Anson.Huang@nxp.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 23 Jan 2020 15:51:35 +0100
Message-ID: <CACRpkdb5JEBqncC9gfPxM_TL4Prmiu5ZSn0kXt9mHBBp49p4Aw@mail.gmail.com>
Subject: Re: [PATCH V9 3/3] arm64: defconfig: Select CONFIG_PINCTRL_IMX8MP by default
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

> Enable CONFIG_PINCTRL_IMX8MP by default to support i.MX8MP
> pinctrl driver.
>
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> Reviewed-by: Abel Vesa <abel.vesa@nxp.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Please merge this one patch through the ARM SoC tree.
If don't know who collects the Freescale/iMX patches for
ARM SoC right now....

Yours,
Linus Walleij
