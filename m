Return-Path: <SRS0=v2WM=2N=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A15EC2D0D2
	for <linux-devicetree@archiver.kernel.org>; Mon, 23 Dec 2019 20:18:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 01CAF20828
	for <linux-devicetree@archiver.kernel.org>; Mon, 23 Dec 2019 20:18:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RSMz3A1S"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727008AbfLWUSv (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 23 Dec 2019 15:18:51 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:40063 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726787AbfLWUSv (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 23 Dec 2019 15:18:51 -0500
Received: by mail-lj1-f195.google.com with SMTP id u1so18861479ljk.7
        for <devicetree@vger.kernel.org>; Mon, 23 Dec 2019 12:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=z2qy0HoCvQDusZ0cpEpbripvXNYqU63hvnwRNfm9upQ=;
        b=RSMz3A1SOXYb7Hu9oRtHEalCQM8Rghlg/pAjw/0nJkr3StHbJ37dfMS+us8W9kfQs4
         lSUJ5TohPdq5iPf3Pxfxr+VJUVDuZ/PDFAsRNqVyuu9QOcb/nMd9VI/ftbHNsPdmw5E2
         s23QxeugWiuS90095GgPpRgEvsgKStcQSu2PTqKeOw9s++p8dOvtHpm4Rpc1oE/gaAQr
         LUAl76WqVWuYZv5R2z2vvggRb1G13iB1irTjx7KaFLKJN37gRxlQNs3bpItZOZqf0cMg
         g3o16VDVPd2wK5KWd6C8W3wlIn41G2LpqgdH5TQvEtdxyrI+rPIAl1nGuVoSASJRU1Ky
         y2tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=z2qy0HoCvQDusZ0cpEpbripvXNYqU63hvnwRNfm9upQ=;
        b=L8cTzEXCJJVsbqWJlkpgFS+ZI0s11Zd4iP+vMhhVX/pbGHECSGfSCxzRDafxKA/3GF
         vRNMKJieztGNrEOI6m6PD3hI+N752pMpwvm7uundrBfs+QrZa2EpJtSZ8krxejSZQMOg
         k48mkGvg0bmZWo2AKKvrYcP5AqdTldQO8QHoH6+B4+IEHbusG++lEMFOH+UQ0axhHK7y
         Su4ahP/uBFRg3Z5vhgO/i1RX984Xgph5favKDOGqAsWgQ/yBHOnFAq9nKEZq+y25uBzw
         eCKpzusk4Vj7P+3i3mugsdxP+xEOh9gUfePHuIbRt3UVt5RdIIcB2xDfKLcGwaPKAeU5
         tr/g==
X-Gm-Message-State: APjAAAVMU4ycmX+I/GEQkv3Ghq1HH9HFj8KlFRSE7ZGgFwW0xm8jnusq
        4l0lb4GBxKEdNY1qBNXPGMnxHY6TRjh70+zkrCBOwA==
X-Google-Smtp-Source: APXvYqy1C/z6EbqtgNvxWXaICZhucKvxW5JW9qpj2yI5BD7LALc/EnJkEqdFyCydrR+zs66VVtn8FomzII1Ag/3TrfE=
X-Received: by 2002:a2e:844e:: with SMTP id u14mr19072068ljh.183.1577132328976;
 Mon, 23 Dec 2019 12:18:48 -0800 (PST)
MIME-Version: 1.0
References: <20191211213819.14024-1-linus.walleij@linaro.org>
 <20191211213819.14024-4-linus.walleij@linaro.org> <20191223172821.17f058ab@archlinux>
In-Reply-To: <20191223172821.17f058ab@archlinux>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 23 Dec 2019 21:18:37 +0100
Message-ID: <CACRpkdbOq1-_C+n-zC8oE8wCNDxF=ip-2bDmAB_qRY5Vif7rxA@mail.gmail.com>
Subject: Re: [PATCH 4/4] iio: accel: bma180: BMA254 support
To:     Jonathan Cameron <jic23@kernel.org>
Cc:     linux-iio <linux-iio@vger.kernel.org>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        Oleksandr Kravchenko <o.v.kravchenko@globallogic.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Dec 23, 2019 at 6:28 PM Jonathan Cameron <jic23@kernel.org> wrote:
> On Wed, 11 Dec 2019 22:38:19 +0100
> Linus Walleij <linus.walleij@linaro.org> wrote:
>
> > This adds support for the BMA254 variant of this
> > accelerometer. The only difference for the simple IIO
> > driver is that values are 12 bit and the temperature
> > offset differs by 1 degree.
> >
> > Cc: Peter Meerwald <pmeerw@pmeerw.net>
> > Cc: Oleksandr Kravchenko <o.v.kravchenko@globallogic.com>
> > Cc: devicetree@vger.kernel.org
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>
> I'm never keen on wildcards, and there is a bma253.
>
> So please go back to using explicit part numbers.
> If you feel a need to indicate a particular structure
> applies to multiple devices, then use a comment to do so.

Actually when writing the patch I had the datasheets for
BMA250, BMA253 and BMA255 at hand as well.

The cases where I have labeled variables "25x" is where the
models are identical, so as to make things easier for people
that want to add support for BMA253 and BMA255.

What about copy/paste the previous paragraph into the
commit message and call it a day?

Or do you prefer that I edit that comment into the driver
file and resend? Either works with me.

Yours,
Linus Walleij
