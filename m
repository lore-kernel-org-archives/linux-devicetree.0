Return-Path: <SRS0=mbMJ=64=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E09C5C433DF
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 May 2020 08:32:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C472620675
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 May 2020 08:32:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xHi/CO+k"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726340AbgENIb6 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 14 May 2020 04:31:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726317AbgENIb0 (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Thu, 14 May 2020 04:31:26 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ACC1C061A0C
        for <devicetree@vger.kernel.org>; Thu, 14 May 2020 01:31:26 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id l19so2516742lje.10
        for <devicetree@vger.kernel.org>; Thu, 14 May 2020 01:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ch5Lo0qUlNLfqqdr8oPDugFIwsbkUAsTV/pjrrFuHLo=;
        b=xHi/CO+kw7Zb1AKTwwXYOr5rqnL21pX27PIcAoZpAyWED1KbMsgJJ+aHzrEV/Isbwh
         cCj8ce0L7btUVbF3US3EeioBiXXi2iCdmOyXoxSJCWosyCfLczsKK9alpmOGav2v80w+
         vuDG2+aAvxzcOE2K3TrrYIvY0mqmBU/BMbT7IEB1scIBSlpp8HiBHlfn8UCnFVtjjBns
         DbfLyYIf6KoVVieHkBEAcyIGtiD44sr1xCf8Lwsd64ayvLqSzC2AAnY/k71w+wMolPqK
         JyDlDZKYHbrozYowGa+UzXmNfLBfNgsdCqJb+BahKwZn8S+ATnRlB96BNNSEyPU6wjca
         s33g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ch5Lo0qUlNLfqqdr8oPDugFIwsbkUAsTV/pjrrFuHLo=;
        b=EfZGhqLuWcBEtp4DdVMV0/O3qOLoJfNhIS3CgLvUQ3Kz3qLiTAJPsjkA0uSYTmZ/wb
         V/FuNx9W8CZ2+xtPC8+BrVdY3s6J6ikYrDhfwcvtckd2viTa/Fjp59MXDR1GTcmNKD4/
         ZBvnGVSYJndECNCwBrakDLDXcwBjE1P9tITDIq/7ouUKnuM3xBchlQrQPT05UOVkThcY
         NSF4CwmU8kyDaq72i7BZZYL1HouZP/ADSzT3q3qOMUXyKW7yGPpGu80nvEHcqLHp1e43
         dgkFs3ZUOS9haeLSpSWngb/sl2f0C7J07fSP+L2dual8+6wBcowI60kDpdXdlrMERSnk
         ndSA==
X-Gm-Message-State: AOAM531gAZhqm92g2M1J5g9tUfXvR5PfROrFshUIyPi5gmBVLumDxKmH
        +QiTQhjfcpDpEpHBpkgx/Cr6/jc1OC06IccQJAL5lA==
X-Google-Smtp-Source: ABdhPJxYkw641+rzOfo0jk8kZqtPycWY4TTgsg+FJ176sdZrmEbUxUP61n/P+mU74fyLtp+Q1AgVt3G79WECR07lQH0=
X-Received: by 2002:a2e:b609:: with SMTP id r9mr1982744ljn.125.1589445084550;
 Thu, 14 May 2020 01:31:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200508132943.9826-1-Sergey.Semin@baikalelectronics.ru>
 <20200508132943.9826-12-Sergey.Semin@baikalelectronics.ru>
 <CACRpkdY=wkgnYPcqSzyzNpS6ckJZs-9kXfTfdwa1E+POzOBQGA@mail.gmail.com> <20200513001347.dyt357erev7vzy3l@mobilestation>
In-Reply-To: <20200513001347.dyt357erev7vzy3l@mobilestation>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 14 May 2020 10:31:13 +0200
Message-ID: <CACRpkdZTH1DNHvi4r48nLNWp4rqyYDZTzT12hw0eTNcYmgSr3Q@mail.gmail.com>
Subject: Re: [PATCH 11/17] spi: dw: Fix native CS being unset
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Serge Semin <fancer.lancer@gmail.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Mark Brown <broonie@kernel.org>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Georgy Vlasov <Georgy.Vlasov@baikalelectronics.ru>,
        Ramil Zaripov <Ramil.Zaripov@baikalelectronics.ru>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Allison Randal <allison@lohutok.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Rob Herring <robh+dt@kernel.org>, linux-mips@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Alexios Zavras <alexios.zavras@intel.com>,
        Thor Thayer <thor.thayer@linux.intel.com>,
        "wuxu.wu" <wuxu.wu@huawei.com>,
        Xinwei Kong <kong.kongxinwei@hisilicon.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        linux-spi <linux-spi@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, May 13, 2020 at 2:13 AM Serge Semin
<Sergey.Semin@baikalelectronics.ru> wrote:

> > This is the correct fix now but I an afraid not correct before
> > commit 3e5ec1db8bfe.
>
> Sorry, but that's "enable" flag propagation from basic spi_set_cs() to the HW CS
> setting callback is a nightmare. In Russia there is a common saying for such
> cases, which can be translated as "you can't figure it out without a bottle of
> vodka".)
>
> Actually the fix is correct no matter whether commit 3e5ec1db8bfe is applied or
> not. At least I don't see a connection between them.

OK that seems to hold given the resoning below so:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

> > What I can't help but asking is: can the native chip select even
> > handle active high chip select if not backed by a GPIO?
> > Which register would set that polarity?
>
> No. DW APB SSI doesn't support active-high mode of the native CS's.

We had some related discussion what to do with this case
when a controller can support active high CS if and only if
it is using a GPIO instead of the native CS. We didn't really
figure it out, I suppose ideally we should use two flags in the
master but that exercise is for another day.

Yours.
Linus Walleij
