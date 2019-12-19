Return-Path: <SRS0=R1yt=2J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8137C43603
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Dec 2019 08:35:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 98EC624672
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Dec 2019 08:35:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B6XbgDX1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726633AbfLSIfU (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 19 Dec 2019 03:35:20 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:33322 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726620AbfLSIfU (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 19 Dec 2019 03:35:20 -0500
Received: by mail-lj1-f193.google.com with SMTP id p8so5289295ljg.0
        for <devicetree@vger.kernel.org>; Thu, 19 Dec 2019 00:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TAoklvrDj2FXXnEjYzoBMnCun02TkYPTQ8a5p79Mfxk=;
        b=B6XbgDX1w5gegqEuEFrSRvmuFJiRJW1pormXwOJI+tuXvRxnzb24ChC5YDTJFY118x
         KSvb9Cq4KlAlA4iUmp1UfVohfwnAmcwjk3KoePyzp015V81NcVhD3rGwy5Gf3xo9H73t
         C8fHnzxnVBd69Sx9CszFQl1VM2Ui4tgBaXyOQv/JcD/f0N8ekBqQbMxiAegdIOLGneKV
         jI4zpuBROHGjFMNWSxZQKffJpdCJ1vqsZCA6U2HPcmhIDC2DxEDcRJxYVobG8dUU7V7H
         +ZG/9WfD9979bx1dvpxpSyd77v2W/NT2Y2z2aoMZy6Tz32knOeHtV8IV9M5wkPEhq5C8
         w3Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TAoklvrDj2FXXnEjYzoBMnCun02TkYPTQ8a5p79Mfxk=;
        b=uVFPUFxrd7j4oIdRtDiQI/EnLBXTs9BCBkVRpUKpkHauWagqH4SMjizbUoxgW+uGuG
         x4Mq1g7Vjw3/5NF7NTfwTeu7znSvZU2MWCNKNC4qGX1D4q5lDPpjx/vr50f8FYp73dLg
         T0xVEPtQaZZTDStYlvTe7Vlv7dgV4ItBHeLpIZ18RdjGdWJbtoNEl0Fk2GLWcANs/dZQ
         bCio9h+OMHKCsUKhP8vGDlcc6H3Jw3V9wZd+FHNGo4CJUP6+EvJWrFFcDueSMHszkMf+
         AR5aOGSZw7zJNpFyEvdI6CX+xKCcsRxlRd4v9Wbur99HcECrFg6wyNb3JL65Eqk4EvPJ
         Kdmw==
X-Gm-Message-State: APjAAAXT7zurowFO8Ik/820PwtMoJqunhHp6Pse0JYErqC9BAQRadM//
        5gvGn5QGGTaKE+YehCVIy6Vm1zXUL4LOWkBvKmmjZA==
X-Google-Smtp-Source: APXvYqwd7eUldyVpHzhhNPvPXO+3TWrMWzvrI9RTEi+X0qvW1Mki8vx6zZFbw/xtwDd1awpUn8/jTDBHHvuXdkNEJxk=
X-Received: by 2002:a2e:9ec4:: with SMTP id h4mr5177759ljk.77.1576744518396;
 Thu, 19 Dec 2019 00:35:18 -0800 (PST)
MIME-Version: 1.0
References: <20191219041039.23396-1-dan@dlrobertson.com> <20191219041039.23396-4-dan@dlrobertson.com>
In-Reply-To: <20191219041039.23396-4-dan@dlrobertson.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 19 Dec 2019 09:35:06 +0100
Message-ID: <CACRpkdbJJWRvTUGmJ9dsb=n8j-hxuoZtLK17fRy5FtxsV-wifQ@mail.gmail.com>
Subject: Re: [PATCH v7 3/3] iio: (bma400) basic regulator support
To:     Dan Robertson <dan@dlrobertson.com>
Cc:     Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Hartmut Knaack <knaack.h@gmx.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Joe Perches <joe@perches.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Dec 19, 2019 at 5:27 AM Dan Robertson <dan@dlrobertson.com> wrote:

> Add support for the VDD and VDDIO regulators using the regulator
> framework.
>
> Signed-off-by: Dan Robertson <dan@dlrobertson.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
