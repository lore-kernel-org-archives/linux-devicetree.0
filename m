Return-Path: <SRS0=ig8w=Y5=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 696A0C5DF61
	for <linux-devicetree@archiver.kernel.org>; Tue,  5 Nov 2019 15:06:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3E67E21929
	for <linux-devicetree@archiver.kernel.org>; Tue,  5 Nov 2019 15:06:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vmLGemzH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731112AbfKEPGh (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 5 Nov 2019 10:06:37 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:45256 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731032AbfKEPGh (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 5 Nov 2019 10:06:37 -0500
Received: by mail-lj1-f195.google.com with SMTP id n21so8619769ljg.12
        for <devicetree@vger.kernel.org>; Tue, 05 Nov 2019 07:06:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XeLKSI0KpVKh7U51GFQKhu41G/kKMM6hiwNkiVQAYno=;
        b=vmLGemzHKaxLBgLOj8ysaBgUxFMaOKKjcTIanlNzhYP69lx4N1ogVqivjUM37D2rJU
         mqZpFLjzo/ZL8PcdliQcdNt45so0lInDzm5XPZpxb1dEXl776kPWKrmh47wo2KHWKBiS
         OihVcAcKa7ILvYycaHoOqrGsb/Xv569qGfL5cyivyxmpqWoV70XY2FaTfZ4Nn4xQiBsv
         7FcYcUKl5Yun5MQhkq6/S3MoubixSgNFspwkPZUoQQxzpKOqlkR4hn9SmDQqQpgZpaP4
         ea/FaQ/9Ig6WlPkVHuj6Fj2xBUe3a5dMC/UZ3Z/D2iXjk3U6bGdWAoxHw5RPFdN0or70
         1pFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XeLKSI0KpVKh7U51GFQKhu41G/kKMM6hiwNkiVQAYno=;
        b=CT3YBFxfzq0Gh1niHB6SJnLQP39tQXEXiKm2v3RUNNQp/7Hx/beUyB5J8JS4InGTb3
         BkyCftbxSX9W3im5J94q02Icxm6UwJQwNYTGbcYP6gY2wZfbs34PK8RVFpxROMz+5Uv+
         g4x0jgcgjJ3OaXXf3x+nhGiMJ+bHlyreJ8BThp3C529pnDwU0AxSDtjj79CKgiDQXZji
         w9ybT8aEDckNkB42rLN1lp/Xt8x90o+FDE0K2Q3kXWRmbYfU52MEha+uqmJ9TsYdjZrf
         KtMAatSI4nMLTvAGc6Z5L5fppd9EIR7hdauKXXsJJOuAwFLnUzVhCUbbtMI09TX3fMqJ
         /PCw==
X-Gm-Message-State: APjAAAXvWTBQj6ATVhtuqoCH1TwR7EbpRxheSgk8yAXs06Blehuwwqkp
        wwsxuJTSMmlSaUVNyxlL1r+RTBEPd8RfpU/OpQ7Dmg==
X-Google-Smtp-Source: APXvYqwnwnosIbALQWhH9iE66VbRevpNKoo2+AlOIGbO/YK+JvXEq7xF97GQzxccFEeM+dwg//oNT6x78p7b0HM0Jk0=
X-Received: by 2002:a2e:9a12:: with SMTP id o18mr16050255lji.191.1572966395420;
 Tue, 05 Nov 2019 07:06:35 -0800 (PST)
MIME-Version: 1.0
References: <20191104163834.8932-1-andrew.murray@arm.com> <20191104163834.8932-4-andrew.murray@arm.com>
In-Reply-To: <20191104163834.8932-4-andrew.murray@arm.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 5 Nov 2019 16:06:24 +0100
Message-ID: <CACRpkdYcUFkUUG8jQ=9i9LDpKbrzqNR0o_eLObijXn4YiBHOJw@mail.gmail.com>
Subject: Re: [PATCH v1 3/7] arm: dts: Use IRQ flags for legacy PCI IRQ interrupts
To:     Andrew Murray <andrew.murray@arm.com>
Cc:     Tsahee Zidenberg <tsahee@annapurnalabs.com>,
        Antoine Tenart <antoine.tenart@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Jesper Nilsson <jesper.nilsson@axis.com>,
        Lars Persson <lars.persson@axis.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, linux-arm-kernel@axis.com,
        MSM <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Nov 4, 2019 at 5:39 PM Andrew Murray <andrew.murray@arm.com> wrote:

> Replace magic numbers used to describe legacy PCI IRQ interrupts
> with #define.
>
> Signed-off-by: Andrew Murray <andrew.murray@arm.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thanks for just changing them all in one patch, it is swift and elegant
patching.

Yours,
Linus Walleij
