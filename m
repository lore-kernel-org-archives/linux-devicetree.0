Return-Path: <SRS0=92uP=7A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C0ECC433DF
	for <linux-devicetree@archiver.kernel.org>; Mon, 18 May 2020 07:33:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 34386207D8
	for <linux-devicetree@archiver.kernel.org>; Mon, 18 May 2020 07:33:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H+oFxtUq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727117AbgERHdY (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 18 May 2020 03:33:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726729AbgERHdY (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 18 May 2020 03:33:24 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFBDBC061A0C
        for <devicetree@vger.kernel.org>; Mon, 18 May 2020 00:33:23 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id a4so7104619lfh.12
        for <devicetree@vger.kernel.org>; Mon, 18 May 2020 00:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6uhRFGDARrcoHPrKHMBYkaN/2j11MRjpDJJbVmx54CE=;
        b=H+oFxtUqptu6CrGRKkzcmJs+eMoraTQOATafIq2NDm8CwHwFmls5nvwqEoT+8/mmOE
         WU7jisauq4/IiaKjcokmWtKJ1DP0tvQIHBs2ljdiXl8qlGxOtvQEAa4lD7HDUDrqwTWo
         VnA6gPlW7BZEITXpxQXAFUfO8KJGhgyzDF2UXRCdOQb2doToExJaRRP+vFv2jjUUPojT
         48hRbviNApp8pFFIMOcAtQbGT6U+m0T/qRRWzR9Dw1pnv66azfT1YUY+BE6/qqXLbxuk
         l+jytCjh61iQMLKyg95PEYoavnodXi3brpiHHaRO7wI6myD90jtTysY/uu3Mf+GJycpC
         l10w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6uhRFGDARrcoHPrKHMBYkaN/2j11MRjpDJJbVmx54CE=;
        b=MgDzAB+RgN3y93nlUgRdoUu00nMSNH97Bw8KIZ9ushPe191sKFFSyvZziR0eOiL+we
         ATPR9r3WLI+D2MYJwuaPgOXcMA4kJnnNYHfe2GMUBoAc3UtDxVCaU+jyPQf5r0oSmN65
         eVoPXIHNGkM4G21GHBAidK0uLPsU2ssvdg2GnIPCOeXT1y5G0DkycCOqd4ofVSJnLDYi
         y41QmWOH3s/v45vsazhaTGBAnOlgj42lglIOAOkkvDy5rOhWpMcrNynPh8ATI9eacC4l
         WTT/fgZ45lA2HAeMF5IHNkjGqbresoSj6XgyqlU/qit3E6jMNUiIWiaBI4GG4yucoKVd
         tNrA==
X-Gm-Message-State: AOAM531MMXReNOlJOFlpY+pgggI73zLf2uOE8CKs1FfKtXEYI7F11u/S
        9+qiuvNUxahoOZ4RxiVuTCDcoKIvNGTzxcIzHJQeKw==
X-Google-Smtp-Source: ABdhPJzM1cLtBMnZR+j+nSiG3KeWErg7zOIoRWARiHZUlNStxktk9ge3qdAjjUUMvZG6fIllhCXtTAAglY/emlzid+o=
X-Received: by 2002:ac2:5a07:: with SMTP id q7mr3670246lfn.77.1589787202475;
 Mon, 18 May 2020 00:33:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200513125532.24585-1-lars.povlsen@microchip.com> <20200513125532.24585-8-lars.povlsen@microchip.com>
In-Reply-To: <20200513125532.24585-8-lars.povlsen@microchip.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 18 May 2020 09:33:11 +0200
Message-ID: <CACRpkdZP=E=LvEFW4b8HvXR3yYFMzALC5_abiJuoewod6V+Y4w@mail.gmail.com>
Subject: Re: [PATCH 07/14] dt-bindings: pinctrl: ocelot: Add Sparx5 SoC support
To:     Lars Povlsen <lars.povlsen@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc:     SoC Team <soc@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        Olof Johansson <olof@lixom.net>,
        Michael Turquette <mturquette@baylibre.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, May 13, 2020 at 2:56 PM Lars Povlsen <lars.povlsen@microchip.com> wrote:

> This adds documentation for the "compatible" value designated for Sparx5
>
> Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Signed-off-by: Lars Povlsen <lars.povlsen@microchip.com>

This patch applied to the pinctrl tree.

Yours,
Linus Walleij
