Return-Path: <SRS0=12Nb=ZV=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31921C432C3
	for <linux-devicetree@archiver.kernel.org>; Fri, 29 Nov 2019 08:26:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 043E021781
	for <linux-devicetree@archiver.kernel.org>; Fri, 29 Nov 2019 08:26:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x2h/3aiI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726805AbfK2IZ7 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 29 Nov 2019 03:25:59 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:36983 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726778AbfK2IZ7 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 29 Nov 2019 03:25:59 -0500
Received: by mail-lj1-f196.google.com with SMTP id u17so3662857lja.4
        for <devicetree@vger.kernel.org>; Fri, 29 Nov 2019 00:25:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rjwO1FwEHwaRe98ERPpJb4XhcKjr+G42GNFc2FaNjPY=;
        b=x2h/3aiIvlsEahqJZ/3btpCdFt4VmD5TTiD8V3r9A2XcxM+kI1n2O1vDNFBYlvTc4C
         w03cOACsyuypSasUEovKSkK/gGhjMthY2sd9WW6J6zzIDOjiv7jea8myB4sLc32X3Ku2
         3nMKKMhEsspzTb1EznV4qpbStmbAZAZLqa6q59CBYHkXtJLQjkZnU2cxccmLf6c4Fp2P
         6J4x1pyWdOvEQgZpQU1+NGwmCl00WWd0yeemqpqhQbgDhb8A1vjdMsCfCfE4Qlg6ZJV/
         +YGEUzgyDtGQYsg283APPSsnaZGLJfNBSW8zIJvjX+n2sWC1PAMmgDXuUOEMBB5l6J70
         WqFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rjwO1FwEHwaRe98ERPpJb4XhcKjr+G42GNFc2FaNjPY=;
        b=F0qjUMMHMyBr7ogayCzmrZezYb4oQ73aWCvMMeHweBow1WFuM74maMlRvZwAl41SPl
         6kdPyAeqURciD2EaQ/cDbvnU/u2/0F0UXmI9stgs0A0WRRby2MgyA+mEMDRykEnrGXTy
         cCwEay8bKcpt2LBJugZUGdIXgV8AT8GCmxjkE+Vax+cFuA4qg5stO+9Oq0hS5/dCNiQ7
         3hAlaAElcG8wd5UeOERvtkpqFqpy/2FrvIm0GndFZouBYHWZGpxqZboSJJj2C9f9PncP
         90vEdaniPG1tMNiRh2lWzE271OjLgwJ19Fy9bTGm/+Pa4nZg4LbOwfVYQfrS0nmHwSGW
         OEFA==
X-Gm-Message-State: APjAAAUgUpttc5EjoCekXIpyIZUsNeRDvFDROLV70QJ/A+qy5nhZZ5yb
        Apg1nvDJUFx541WYu533zb056UsuTIRIqxMjho43YA==
X-Google-Smtp-Source: APXvYqxPEF84EN3dLF+KpgUma2Eg2Jv1hy3/PNjxMNx7d9TCfClYT8X1c071v7TmAfiER5FyEPDqCKtqjr2DW1EP2Ek=
X-Received: by 2002:a05:651c:102a:: with SMTP id w10mr7850453ljm.77.1575015956975;
 Fri, 29 Nov 2019 00:25:56 -0800 (PST)
MIME-Version: 1.0
References: <20191127135932.7223-1-m.felsch@pengutronix.de> <20191127135932.7223-6-m.felsch@pengutronix.de>
In-Reply-To: <20191127135932.7223-6-m.felsch@pengutronix.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 29 Nov 2019 09:25:45 +0100
Message-ID: <CACRpkdb9iXneW3BUj6RfODYnL7DwMwbGbPwXgQ4Z5YTj7MgGcw@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] regulator: da9062: add gpio based regulator
 dis-/enable support
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Support Opensource <support.opensource@diasemi.com>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, stwiss.opensource@diasemi.com,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Nov 27, 2019 at 2:59 PM Marco Felsch <m.felsch@pengutronix.de> wrote:

> Each regulator can be enabeld/disabled by the internal pmic state
> machine or by a gpio input signal. Typically the OTP configures the
> regulators to be enabled/disabled on a specific sequence number which is
> most the time fine. Sometimes we need to reconfigure that due to a PCB
> bug. This patch adds the support to disable/enable the regulator based
> on a gpio input signal.
>
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>

Overall I think this is fine, it's a solid use case that need to be
supported.

> +       struct reg_field ena_gpi;

Maybe just add some doc comment to this struct member?

IIUC it is a general purpose input that can be configured
such that it will enable one of the DA9062 regulators when
asserted. (Correct?)

Yours,
Linus Walleij
