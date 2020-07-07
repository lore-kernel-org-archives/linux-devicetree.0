Return-Path: <SRS0=wVrF=AS=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CA67C433E0
	for <linux-devicetree@archiver.kernel.org>; Tue,  7 Jul 2020 11:59:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5E2882075B
	for <linux-devicetree@archiver.kernel.org>; Tue,  7 Jul 2020 11:59:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HKDcobdw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727058AbgGGL7H (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 7 Jul 2020 07:59:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725944AbgGGL7F (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 7 Jul 2020 07:59:05 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3297BC061755
        for <devicetree@vger.kernel.org>; Tue,  7 Jul 2020 04:59:05 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id g2so24558373lfb.0
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2020 04:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HTPmD5Tv5dUMriTVMEYPSE4aq44oEkYldNJx6iUd92U=;
        b=HKDcobdwR59Fn4UPxGHRQ0tpAtbpLCJNsZlPMJ/sOiZyRbiNswsgF9jOe/BAk8id8l
         /5EDjFn+j7IrqQI7DBI2n7Uq2bBWEf1LX5BO0SlioDHGovjRN/+aYEtpFSj1onhKowwd
         Jyzt+IOCjBFb2xLwG5Ql2hJk4eWSyQElpoG1w08NxiRQ4BjeE4juggLuIqQZrxnUm4AW
         wxJ5rCZerV2AejOoEFy2/ofH5gJdnEUHklmMBmyEWjepQYIJFNJR4M9pxxd22+ChBxqi
         z7Y0JHiZJBtFRhUTWf6BA4ruLd/6iHkPnoKgZc0WXt+PJk9Ns+TyOPs2bDd4yFIVnyF9
         qKqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HTPmD5Tv5dUMriTVMEYPSE4aq44oEkYldNJx6iUd92U=;
        b=qAl2/WoF/jQpWnbZmTPQ9i+/iXe+W+Vv1J+sVNsloAQG5Kcwg4CJQgkWeXrFzRsWO7
         Sg+aQ1tvqRHzj2gvsqXfwiGOrb51K0G0Pn10Y9lBiSsKf5zgg5f9/mQK9cf7Losf1KYm
         wMI6xSkhV8+v7gVN1gfw6qQTPWXtXxUIRLWAGbOMdRlgNC/i745RN3gx6OSD08LsSGjw
         e9Ap/0AZKvLOkmv5+IAeflewDIW62pBZ7NZEhYtYohHY7Sl3i4Imy5xfNfnug0YxQx2c
         8a6S29M+pDUyL/Zk4mF38bABMNyzhko3yus3rZYjowPsr38eX745P5f0e6EivkurcIXH
         s1DQ==
X-Gm-Message-State: AOAM533wXtH8xmQ7Lk7fUqWyypI9Sk1Pd+2BK5uGuqwiOA1cJhIdhe6M
        GZs308xDpPQCuaylMExdldR2U2jOB4fx1pylOgOWww==
X-Google-Smtp-Source: ABdhPJy0TxaIe1Wz0GdlFd5FdxpVp2FOvGGrBFkEn0oi3CjP4qg2V304qTt6rBtZAznq91V/ed9yiUW+UN8gJyowQaY=
X-Received: by 2002:a19:e05d:: with SMTP id g29mr32404950lfj.217.1594123143709;
 Tue, 07 Jul 2020 04:59:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200615133242.24911-1-lars.povlsen@microchip.com> <20200615133242.24911-6-lars.povlsen@microchip.com>
In-Reply-To: <20200615133242.24911-6-lars.povlsen@microchip.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Jul 2020 13:58:52 +0200
Message-ID: <CACRpkdaSVRg3F5FLKi=sGCFQDXXkiz2e1pT3H9dcoaPDSYKrXQ@mail.gmail.com>
Subject: Re: [PATCH v3 05/10] pinctrl: ocelot: Add Sparx5 SoC support
To:     Lars Povlsen <lars.povlsen@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc:     SoC Team <soc@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Stephen Boyd <sboyd@kernel.org>,
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

On Mon, Jun 15, 2020 at 3:33 PM Lars Povlsen <lars.povlsen@microchip.com> wrote:

> This add support for Sparx5 pinctrl, using the ocelot drives as
> basis. It adds pinconfig support as well, as supported by the
> platform.
>
> Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Signed-off-by: Lars Povlsen <lars.povlsen@microchip.com>

This one patch applied to the pinctrl tree.

Yours,
Linus Walleij
