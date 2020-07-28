Return-Path: <SRS0=YUp6=BH=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DF5BC433E0
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Jul 2020 21:24:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 163B62065C
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Jul 2020 21:24:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="l6hUntl9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729332AbgG1VYJ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 28 Jul 2020 17:24:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729243AbgG1VYJ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 28 Jul 2020 17:24:09 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E650CC061794
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2020 14:24:08 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id w9so22086727ejc.8
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2020 14:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=A40P7qvWDr7hSDOUUBLZppAbSNbGdWqbtbvvJ8/dneg=;
        b=l6hUntl9Y1jAFAvRM3OZ07jD1ncrYLjRRWnW80nV17Xay1+XqKIYJY8f4s7XOS7gvf
         LBoRYt9/GuIYjVwqGCaSfSzZRvzCBPQtJSGB3HyLhDgUeQLBCkzsPt5zUnFzQLQxBuOF
         i7m583btWK9pCPqDWcZPEummRV7tcoi+UVTBc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A40P7qvWDr7hSDOUUBLZppAbSNbGdWqbtbvvJ8/dneg=;
        b=aAH1izsy5+9woxG8kmPITyZJLnW53NwYrwHyFG3ydP3txu730ahWqwoSs2NnHvO1xc
         0PfMk0O5tL6y+xUvxkEFfW0hd4+GjkxawTS56iMOdcxGOaVHAFzWAlKj7gnqndhut68D
         hWilXsonrEcOAWTLEUqfxYErvq2mX7XumJhic8BaUCmn8dtvmPKK23lioiKIYFo9RQWb
         AZMa1oSN2QDLC2sg8uaJr3vuKEKnErRbypaY25B1GzoKmgnqCgyDcWmyusCD7yrqhPE6
         nax6EJW/FKsUmtSJ6f3XH0ZjQLrDbhs5ZEBqa2/+l3EBQAoyDfJ2N4CyuAy+myE8+RNe
         X1TQ==
X-Gm-Message-State: AOAM531GD42l/Kn5J2sx9XZf1ltAH2hZh056hNDZuwkC6T2Qo78WvuGG
        tJq/9RdURFehvnbLdkMh9DhbCLTULfs=
X-Google-Smtp-Source: ABdhPJyPUGlaSsI5ZcBJw4Qxl6PSY40+NxdylQvUMCOh7u94QedffhlzqOkwQ8aZArACd0Xm0Z2dJQ==
X-Received: by 2002:a17:906:57da:: with SMTP id u26mr28203090ejr.157.1595971447001;
        Tue, 28 Jul 2020 14:24:07 -0700 (PDT)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com. [209.85.221.45])
        by smtp.gmail.com with ESMTPSA id bw7sm9779028ejb.5.2020.07.28.14.24.06
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2020 14:24:06 -0700 (PDT)
Received: by mail-wr1-f45.google.com with SMTP id f18so19643064wrs.0
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2020 14:24:06 -0700 (PDT)
X-Received: by 2002:a5d:6641:: with SMTP id f1mr26569681wrw.307.1595971445556;
 Tue, 28 Jul 2020 14:24:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200724183954.1.I2e29ae25368ba8a72a9e44121cfbc36ead8ecc6b@changeid>
 <20200728151258.1222876-1-campello@chromium.org> <20200728091057.10.Ibe84fae61cd914c116e6d59ffeb644f1cbecd601@changeid>
 <159596523705.1360974.7169089810545711557@swboyd.mtv.corp.google.com>
In-Reply-To: <159596523705.1360974.7169089810545711557@swboyd.mtv.corp.google.com>
From:   Daniel Campello <campello@chromium.org>
Date:   Tue, 28 Jul 2020 15:23:29 -0600
X-Gmail-Original-Message-ID: <CAHcu+VbYrbWStNNaidDygY=d4f6F5tXUxWtsuH0x3oVeELGWVA@mail.gmail.com>
Message-ID: <CAHcu+VbYrbWStNNaidDygY=d4f6F5tXUxWtsuH0x3oVeELGWVA@mail.gmail.com>
Subject: Re: [PATCH 10/15] iio: sx9310: Simplify error return handling
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     LKML <devicetree@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Enrico Granata <egranata@chromium.org>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        linux-iio <linux-iio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Jul 28, 2020 at 1:40 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Daniel Campello (2020-07-28 08:12:53)
> > @@ -368,13 +368,13 @@ static int sx9310_wait_for_sample(struct sx9310_data *data)
> >  static int sx9310_read_proximity(struct sx9310_data *data,
> >                                  const struct iio_chan_spec *chan, int *val)
> >  {
> > -       int ret = 0;
> > +       int ret;
> >         __be16 rawval;
> >
> >         mutex_lock(&data->mutex);
> >
> >         ret = sx9310_get_read_channel(data, chan->channel);
> > -       if (ret < 0)
> > +       if (ret)
> >                 goto out;
> >
> >         if (data->client->irq) {
> > @@ -394,11 +394,11 @@ static int sx9310_read_proximity(struct sx9310_data *data,
> >
> >         mutex_lock(&data->mutex);
> >
> > -       if (ret < 0)
> > +       if (ret)
> >                 goto out_disable_irq;
>
> Why is this condition checked after grabbing the mutex? Shouldn't it be
> checked before grabbing the mutex? Or is that supposed to be a
> mutex_unlock()?
We acquire the lock before jumping to out_disable_irq which is before
a mutex_unlock()
>
> >
> >         ret = sx9310_read_prox_data(data, chan, &rawval);
> > -       if (ret < 0)
> > +       if (ret)
> >                 goto out_disable_irq;
> >
> >         *val = sign_extend32(be16_to_cpu(rawval),
