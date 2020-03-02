Return-Path: <SRS0=6Sr8=4T=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7E94C3F2CD
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Mar 2020 17:03:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 737A5217F4
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Mar 2020 17:03:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cJ0hC0VC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727202AbgCBRDy (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 2 Mar 2020 12:03:54 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:44023 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727195AbgCBRDy (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 2 Mar 2020 12:03:54 -0500
Received: by mail-lj1-f196.google.com with SMTP id e3so242894lja.10
        for <devicetree@vger.kernel.org>; Mon, 02 Mar 2020 09:03:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XPcMs7JIMlUv20DOzI5SHy+/OcC5LtbzMpMfGg1G0ug=;
        b=cJ0hC0VCK3d1FiWp4feDyo+RDpMW/ZDeST2Q91xPHabKlMNnRe8D201mgwNNbE7lQL
         0cw9MLzh4vP2ZsxpFjeALnYVPvRwRmtRkBdnxXsFswxCa1sRoR3qelbxqhSCYw1A4+fr
         Z3cUAFjpM+GQgVLk0KS02nfLnEIZQpVLncpRHhjGofnh/tR1OKKb3aZ/IBsMytcwcQAF
         m5f1rvnO+kJkTSVInjD3G/Ldkrzg8E0arhecej1RDFEfAjeh8p2AMPvX8jc7to1Q5k9X
         sFCzitDsQeI8HE7yZtEA7xsG8E4po1cSZdMnQESXZTe52IA/89HsBJ7krAp6nZ8R3lX1
         IXpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XPcMs7JIMlUv20DOzI5SHy+/OcC5LtbzMpMfGg1G0ug=;
        b=N1AsKC7POVCNSLoC9CKCc3t/ezTk0SEjyPpvAhUewC7asJA/wXVW+kX5oauNi14Wmx
         iayb/ySylksl7Ki6UWlDKCcXToheve5OZdunjts8+hI3kI1t+tZbt0SL9f/ZB21hpJ60
         Qsa77saTYKwP2C2qiRE93c2JgJADG8vn+qyox0HCBFafI/e6NJGtANn0F6GPJdJeg+b2
         ItDDwZaf+Z5mkWzgK0ZjLKYjrdNlzS82H9XwrlSdqLxlqBwxV7gKudor7FFz/qoa6/8m
         BDse4ArZju9s9e4P/76XKYmH9E+ceA+/nTe0FxwQd/RczbLLdouP2cR6BDa+vDu5JOjr
         UGvA==
X-Gm-Message-State: ANhLgQ34BxmzX5hjsdhlalTclur/fFkXI2Li40jzHVuWuD5wVmQdDlOZ
        rHk9xLiBJOt15zE+aBT/R2i558C0ve2zmbZ889c=
X-Google-Smtp-Source: ADFU+vuIGQKHZ0dTpeXvkF9hW60IlQJGMZOKf3tnAwmi+oSO9sl5g4yJgj5bBEEtpk0sSh9goqDfwGpv8iWBQKrJUHg=
X-Received: by 2002:a05:651c:cf:: with SMTP id 15mr368406ljr.288.1583168632297;
 Mon, 02 Mar 2020 09:03:52 -0800 (PST)
MIME-Version: 1.0
References: <20200302001150.27952-1-vitor@massaru.org>
In-Reply-To: <20200302001150.27952-1-vitor@massaru.org>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Mon, 2 Mar 2020 14:03:41 -0300
Message-ID: <CAOMZO5DQ=sg9Qf7N4N9S-5DpS4EQFG1w6ZqK0nS9P3M0ghSzDg@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: freescale: add gpio-fan/thermal support
 for Google i.MX 8MQ Phanbell
To:     Vitor Massaru Iha <vitor@massaru.org>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Marco Franchi <marco.franchi@nxp.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        lkcamp@lists.libreplanetbr.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Vitor,

Forgot to say in the previous revision, but the typical Subject pattern is:

arm64: dts: imx8mq-phanbell: Add gpio-fan/thermal support

On Sun, Mar 1, 2020 at 9:11 PM Vitor Massaru Iha <vitor@massaru.org> wrote:

>  &A53_0 {
> @@ -373,4 +383,58 @@
>                         MX8MQ_IOMUXC_GPIO1_IO02_WDOG1_WDOG_B 0xc6
>                 >;
>         };
> +
> +       pinctrl_gpio_fan: gpiofanp {

Please keep the pinctrl entries in alphabetical order.

> +               fsl,pins = <
> +                       MX8MQ_IOMUXC_NAND_CLE_GPIO3_IO5 0x01

This pad comes as 0x16 after POR, so please add it as:

MX8MQ_IOMUXC_NAND_CLE_GPIO3_IO5 0x16

> +&cpu_thermal {

Please put it prior to the &i2c1 node in order to keep the alphabetical order.

With these changes you can add:

Reviewed-by: Fabio Estevam <festevam@gmail.com>
