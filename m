Return-Path: <SRS0=YUp6=BH=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05220C433ED
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Jul 2020 08:18:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D73A62250E
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Jul 2020 08:18:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mRFjYSup"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728105AbgG1ISN (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 28 Jul 2020 04:18:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727976AbgG1ISM (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 28 Jul 2020 04:18:12 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B736C0619D2
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2020 01:18:12 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id h19so20144652ljg.13
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2020 01:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=afN9owJVn9khLrk5jWz5DEIVJ98lhYCwTBibJb7loqo=;
        b=mRFjYSupoXR0XFvmFMkwtXGrXyUBHtmJKcaEdMJH5VxH2rkBVVDAf4HxakGAUipVow
         Q5ZlZrIdM0JftkLGg6uaoGNUSY+cwJ77bVgY80akUkSB947ydVQUshWLPCpHk8pjyqAx
         SJAdO3AhjVzvraV4ziXvgZPQMun83Y7qfIioBZfYbTZ5Ps9lSu8nPBStu2hYAwmm0YMq
         Gwa6h5UKFJ8AG4TrDmAAXJMAmP0XoFVm36oq/iHCnnstmWB2KP1SipH2U3EcyteA+RKm
         9N9/L954a21H/+FXSHyQpQBtNLqr7SE9yrmvahjN2Zvy4Bu+Hc8feBW12pfwktFI5U4a
         aF6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=afN9owJVn9khLrk5jWz5DEIVJ98lhYCwTBibJb7loqo=;
        b=A64+GA5Hop3qsfytV5eiG/t8vE0iMUx9k68NhRjDtgqZujPjJjm+ZYqeALUrN/apuf
         HVoxVRajKTvK8Goptmw+QrBPwGj8f5823OGu6Z32nnTub5cDNquPo52nLMEknwBiG1sz
         pmk0jcLUT5pS3wYOVNln1VVwxE9EfQ5Kk+bAq0xppUxo6bb+bhkl+F4sRKJph9tDd3mX
         aUd3WwUjbeGF5YDdKg+w0ng8GnhH09LtGaw7Mz8NMJFWjs1YBLoe2otbn+gLPwFXmpXK
         A63ur94iIFkqV0pge8ckB5cq8dVO3j57UHIjWU7W05Tld6MKs9bo/Dfj75tTnbaPQq+K
         MjMQ==
X-Gm-Message-State: AOAM5302kdx3Gxgneg6soyddeHaMv+/oe3ZbDpDs62fOYc8fhN+42AR6
        hVd0bDoSddAis4IfCIvAgZVmPkdv0JN7BC2VPdFQvA==
X-Google-Smtp-Source: ABdhPJxLzCKouWNzSG+h4CcFUhBlC/Zenvbz8WAoy+mp/kcKtWdhpbDb/CIitCOUbQvcACM1R/1X2U3858EvljGMEtA=
X-Received: by 2002:a2e:8597:: with SMTP id b23mr10817583lji.338.1595924289696;
 Tue, 28 Jul 2020 01:18:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200723013858.10766-1-Sergey.Semin@baikalelectronics.ru>
 <20200723013858.10766-5-Sergey.Semin@baikalelectronics.ru>
 <20200723100317.GJ3703480@smile.fi.intel.com> <20200724230342.bhdpc32rsjw7rzbl@mobilestation>
 <CAHp75Vdeg6v_yLYjxZPJM7SgDP-fou6SEuaE8+TFCNW4c2r_rA@mail.gmail.com> <20200727215010.qzhvavmskfoaapi5@mobilestation>
In-Reply-To: <20200727215010.qzhvavmskfoaapi5@mobilestation>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 28 Jul 2020 10:17:58 +0200
Message-ID: <CACRpkda5Ki+itbvLsxSLj4o1NRKdf9P48kbYXEgArDqcEcWA7w@mail.gmail.com>
Subject: Re: [PATCH 4/7] gpio: dwapb: Convert driver to using the
 GPIO-lib-based IRQ-chip
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Hoan Tran <hoan@os.amperecomputing.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Jul 27, 2020 at 11:50 PM Serge Semin
<Sergey.Semin@baikalelectronics.ru> wrote:

> It turns out my "mostly" was wrong in this matter. It's 4 out of 17 patches,
> which make the initialization in the same order as mine:

I'll think about fixing them up to all look the same at some point
if noone beats me to it. Sorry for the mess, I was just hacking
along to get this work item finalized.

Yours,
Linus Walleij
