Return-Path: <SRS0=R1yt=2J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCB00C2D0C1
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Dec 2019 21:41:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8F7522467B
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Dec 2019 21:41:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UXcQVrIG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726986AbfLSVle (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 19 Dec 2019 16:41:34 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:41288 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726880AbfLSVlc (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 19 Dec 2019 16:41:32 -0500
Received: by mail-lj1-f193.google.com with SMTP id h23so7825708ljc.8
        for <devicetree@vger.kernel.org>; Thu, 19 Dec 2019 13:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ASudMKT9RvM8+uOEJ+om2HEpPLO01yunBeLwD2PFAJc=;
        b=UXcQVrIGeuZxPW+wBt70BmOeFM34wTHIaDD0QSufDB+hpWy60xAnbwPJzGMxZPXXTh
         Bvo8xVwa12ZkQ98lNPHyUhNhqkyPhh0MIfsaBBppOcWPWZTk2unZdTF49txMzJY3pHCD
         YxHDMEoyLpEkPOpdFmf/K3MonB5D7tmCbAN8kHT74gEBRwDcUB8IFxHMaMXJw7WUtcz3
         +XHy8aT9jY6xESdx5KtiAOTv1zlbyPbECB2s9vvieBjnb2sKKBAWjoVIOiF0jHW9D+FO
         hbJU/6H/5NVBmZHwpJjIPmmCajp+Vkm1VSI5ttRddK13sa9OsU5HRyIcUFtY30Eo5+Tf
         ZKSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ASudMKT9RvM8+uOEJ+om2HEpPLO01yunBeLwD2PFAJc=;
        b=QGZC12u/1/aDDMUBrEpe4DkrL3XxLZ7+BHubKtHMZmSAlLCH+b6ToaxOMB++0HSMiZ
         iU2rcNjCSNg+eYAV+0Dg1KeOVuHdtScOpps/oTtyWeA4Qm94qAvqBrnZxee10pOKB4FT
         ZQwIRVoqjuxZWJTegwVmlkXYf5FQSmIh6nwxKo0zInqZEAwCEgxwB0BDjP8FxYBfvx0a
         cdqhVm4RN1XC7L4pduuLxxlZuOld+mBE8ydVKYkip+UqjnjxONv50vTdsTEdPNCy1iMk
         xJcsq3V39uH5vFgDwkqe7DKgNGtFWT45KT4TmotLDMlogGSpEYkbMmhfNyoCzF6gAMjS
         nNGg==
X-Gm-Message-State: APjAAAVYGopev6mm1JmbUPimLa2An24ZQJ+b+j1KiqOL8EMpIn5kkEZM
        qqBBMD8+GEKumsj4Y6/dHRhGRLH9JPl5R2b6Y3edBA==
X-Google-Smtp-Source: APXvYqy9XFc6i9Ei1l8/pgiZ7fRlyEwn/IPd/gtw9jl+Fsj13MvpzMQ1Czzx4p0iNxwBYpWYIGIEHFQfXkyLyoBw2Kg=
X-Received: by 2002:a2e:9ec4:: with SMTP id h4mr7762896ljk.77.1576791690711;
 Thu, 19 Dec 2019 13:41:30 -0800 (PST)
MIME-Version: 1.0
References: <20191219041039.23396-1-dan@dlrobertson.com> <20191219041039.23396-4-dan@dlrobertson.com>
 <CAHp75VeU07TsV2NC5Myvmi7Q6tARbmt9=wQDRnXFqaX2G2Luiw@mail.gmail.com>
In-Reply-To: <CAHp75VeU07TsV2NC5Myvmi7Q6tARbmt9=wQDRnXFqaX2G2Luiw@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 19 Dec 2019 22:41:19 +0100
Message-ID: <CACRpkdbTissSRyJ5uh8X6RFTM+VSSML-JmtOC_i8_UY0VTVRAA@mail.gmail.com>
Subject: Re: [PATCH v7 3/3] iio: (bma400) basic regulator support
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Dan Robertson <dan@dlrobertson.com>,
        Jonathan Cameron <jic23@kernel.org>,
        linux-iio <linux-iio@vger.kernel.org>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        devicetree <devicetree@vger.kernel.org>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Joe Perches <joe@perches.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Dec 19, 2019 at 12:06 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Thu, Dec 19, 2019 at 6:28 AM Dan Robertson <dan@dlrobertson.com> wrote:
> >
> > Add support for the VDD and VDDIO regulators using the regulator
> > framework.
> ...
>
> > +       data->vdd_supply = devm_regulator_get(data->dev, "vdd");
>
> > +       data->vddio_supply = devm_regulator_get(data->dev, "vddio");
>
> devm_regulator_bulk_get() ?

I always thought to use regulator_bulk* maybe 3 regulators and
definitely for more that 4 as it also clouds the view bit and is not
as straightforward to read as the single functions, but I suppose
it is a bit subjective :)

Linus Walleij
