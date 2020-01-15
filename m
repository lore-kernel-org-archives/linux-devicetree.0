Return-Path: <SRS0=kWYo=3E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D7B7C33CB1
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jan 2020 13:23:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6A78C24679
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jan 2020 13:23:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FeBXywdc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726483AbgAONXf (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Jan 2020 08:23:35 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:35491 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726418AbgAONXf (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 15 Jan 2020 08:23:35 -0500
Received: by mail-lj1-f193.google.com with SMTP id j1so18535931lja.2
        for <devicetree@vger.kernel.org>; Wed, 15 Jan 2020 05:23:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cvu9eNQm8Fqp7yqoiO0Eg3cYEaQpDgDeASdv6EDKHDk=;
        b=FeBXywdclmpumyiY8AaSvPG2sflC5GIFQPGxS0tclLyaRoR7MtRrr77mv97btXlf6K
         i9ucWvcyKqSdsfiK1G/o834+A8xIg9OgyXmVlYZgjwuv5nuEujiGrtXmTR5t6hkfVVfW
         8aWMSIwDMPDtPmG1soj1ne3UGKydg5wQRpexej3uTo/LlFPvsxbHtxyMv/BzgiGwuxjS
         84gUSp5izBj4xspxwK2+67+2spA8127WmW7SFzx4BWRf6MAgfdmV4Wo5OEn1YzQcQKfS
         rY6+3eoh2KNA2mg2aOpRv7w2sNxFtFQxE9PcC5+I8EY0PNe9p287+uUOrncWHaF/BajF
         ndqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cvu9eNQm8Fqp7yqoiO0Eg3cYEaQpDgDeASdv6EDKHDk=;
        b=k2ky6SG9T/LZgu3XW6vvMrCyv8aT0ylfi4Yu0lyJCR3VDnrW7/2TuPoM7jnIlYR8Oi
         jOFW1MCF5DldnDnr9DVLc2kDDBFBfpWWJfpANqtscNZ7l8AOn8K45XsSby0OjxPe7rBu
         KICQxe+0dG+/QvBvgJSD625JwTe9oEj9uF0x3CDQgWrE2YV92ooH9LgjrnHK3HjXjwlV
         MImZgqP1E+c8i5SlMkl2EO8yzOOL0vUwHyrPmv9W5ZOlbVOkXpKEa1sPrjRroUNotchz
         G3uBI5rayoDsX9BHoa7XFXzM4aVbKlBSEfNckSY2of/HpKZYDCX5nKxt82tm5hDRHrOO
         TBAA==
X-Gm-Message-State: APjAAAX88qsUYy/IJxwW0m1+dWoHshLI8LbT95Ug22mueupyWZl5/7ZM
        i/tyb1jHNmz1/eKiN23YJ7VzmOZwf32NOxuWKSR5mQ==
X-Google-Smtp-Source: APXvYqzU8Jv6fm21Tu9Rpsr7UPGXoPRMVTBScqqJAJfziGSJNsqhmRW3iBPEyc5EmHD9qO4S8yzzNBA7PCNgR4QemhA=
X-Received: by 2002:a2e:3609:: with SMTP id d9mr1641890lja.188.1579094613876;
 Wed, 15 Jan 2020 05:23:33 -0800 (PST)
MIME-Version: 1.0
References: <1579052348-32167-1-git-send-email-Anson.Huang@nxp.com> <1579052348-32167-2-git-send-email-Anson.Huang@nxp.com>
In-Reply-To: <1579052348-32167-2-git-send-email-Anson.Huang@nxp.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 15 Jan 2020 14:23:22 +0100
Message-ID: <CACRpkdYakDK0Zp_StJ+J5UV7PRjHEnWPmZGpGpeXMZyPtUmv1g@mail.gmail.com>
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

Hi Anson,

On Wed, Jan 15, 2020 at 2:43 AM Anson Huang <Anson.Huang@nxp.com> wrote:
>
> Add the pinctrl driver support for i.MX8MP.
>
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> Reviewed-by: Abel Vesa <abel.vesa@nxp.com>
> ---
> No change.

Can this patch be applied independently of the rest of the patches?

In that case I am just waiting for a review from one of the Freescale
pin control maintainers then I can merge this.

Yours,
Linus Walleij
