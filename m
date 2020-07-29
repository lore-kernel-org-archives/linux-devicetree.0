Return-Path: <SRS0=UHbD=BI=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA61AC433DF
	for <linux-devicetree@archiver.kernel.org>; Wed, 29 Jul 2020 08:41:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B44FE2076E
	for <linux-devicetree@archiver.kernel.org>; Wed, 29 Jul 2020 08:41:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OYYYKBNh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727885AbgG2IlD (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 29 Jul 2020 04:41:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726993AbgG2IlC (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 29 Jul 2020 04:41:02 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA1B9C061794
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2020 01:41:01 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id i92so1249021pje.0
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2020 01:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=UZ6MAhR5j6amGSoFFGPG4pk0azdkEksnZheJKcn2abA=;
        b=OYYYKBNhL9fF72pj0+bLFlk7Y5oNif9G8mquMQtqxeEELXBrS2SPrfcPZpogKcRn0N
         2HPWXia7c5PwiAMCkjbJtfvSdMUehP7GB5vgzl9r5HqIBT3sC3cpO68Z0lAesIPP9Yx2
         UahdJ+RiDKdIDsEOlhWfmu7Vm7K68mjNGVFYI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=UZ6MAhR5j6amGSoFFGPG4pk0azdkEksnZheJKcn2abA=;
        b=hRYEK0jHKs2gbbj+3d8+EMm/VHKcuaRpr9h0UdUDSnd/mP8udP/wJjmGI/WxJC+F1g
         QKsS94cPxX3xflPQqsYjJ9fNhwkdxZfNHu8CqKI2O7s1BbmeEyTw+p5P7+RdZzPfbgj5
         5dQ6+5oJInv8uYLCAXZhehzwjDvMyBSQZmQboTtrtbNnL3ANHxnmQ7EeMSGw3DbArsCC
         UBC4cvkAqqJmQdQjT3djvAOqww4exkn+IG4RcT5k35eJ4gmVQZPUOZg7XmYCHI4hPeY4
         2LGf0g0SBOipkItOQmMuPoVPq8Z24PrinFwX/mGICv/g1Pez8PowDC24p5lBQg/jTBAv
         atIA==
X-Gm-Message-State: AOAM5338IlyY+1AIrafoHJuPmv0mgQlqGrgmMXP/sCwEm3La5Y77lkNB
        SUG660F72kPzM9sk7QKX4E/xxQ==
X-Google-Smtp-Source: ABdhPJzrnA7zEGw1DgXocfYDrn7TERVujMt11CJIltoSmzrN2INTqf2WnQcYSHVJGV5yRbWBbVrDRw==
X-Received: by 2002:a17:90a:3fc7:: with SMTP id u7mr8565488pjm.231.1596012061371;
        Wed, 29 Jul 2020 01:41:01 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id z190sm1511032pfz.67.2020.07.29.01.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 01:41:00 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200728170317.v2.3.Idbfcd2e92d2fd89b6ed2e83211bd3e6c06852c33@changeid>
References: <20200728151258.1222876-1-campello@chromium.org> <20200728230520.2011240-1-campello@chromium.org> <20200728170317.v2.3.Idbfcd2e92d2fd89b6ed2e83211bd3e6c06852c33@changeid>
Subject: Re: [PATCH v2 03/14] iio: sx9310: Fix irq handling
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Jonathan Cameron <jic23@kernel.org>,
        Daniel Campello <campello@chromium.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Douglas Anderson <dianders@chromium.org>,
        Gwendal Grignou <gwendal@chromium.org>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        linux-iio@vger.kernel.org
To:     Daniel Campello <campello@chromium.org>,
        LKML <devicetree@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Date:   Wed, 29 Jul 2020 01:40:59 -0700
Message-ID: <159601205939.1360974.7963147221648753018@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Daniel Campello (2020-07-28 16:05:09)
> Fixes enable/disable irq handling at various points. The driver needs to
> only enable/disable irqs if there is an actual irq handler installed.
>=20
> Signed-off-by: Daniel Campello <campello@chromium.org>
> ---
>=20
> Changes in v2:
>  - Reordered error handling on sx9310_resume()
>=20
>  drivers/iio/proximity/sx9310.c | 26 ++++++++++++++++----------
>  1 file changed, 16 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/iio/proximity/sx9310.c b/drivers/iio/proximity/sx931=
0.c
> index 07895d4b935d12..108d82ba81146e 100644
> --- a/drivers/iio/proximity/sx9310.c
> +++ b/drivers/iio/proximity/sx9310.c
> @@ -376,13 +376,15 @@ static int sx9310_read_proximity(struct sx9310_data=
 *data,
>         if (ret < 0)
>                 goto out;
> =20
> -       ret =3D sx9310_enable_irq(data, SX9310_CONVDONE_IRQ);
> -       if (ret < 0)
> -               goto out_put_channel;
> +       if (data->client->irq) {
> +               ret =3D sx9310_enable_irq(data, SX9310_CONVDONE_IRQ);

I still think it makes more sense to push the if condition inside the
enable/disable irq functions so that the call sites read simpler.

> +               if (ret)
> +                       goto out_put_channel;
> +       }
> =20
>         mutex_unlock(&data->mutex);
> =20
> -       if (data->client->irq > 0) {
> +       if (data->client->irq) {
>                 ret =3D wait_for_completion_interruptible(&data->completi=
on);
>                 reinit_completion(&data->completion);
>         } else {
> @@ -401,9 +403,11 @@ static int sx9310_read_proximity(struct sx9310_data =
*data,
>         *val =3D sign_extend32(be16_to_cpu(rawval),
>                              (chan->address =3D=3D SX9310_REG_DIFF_MSB ? =
11 : 15));
> =20
> -       ret =3D sx9310_disable_irq(data, SX9310_CONVDONE_IRQ);
> -       if (ret < 0)
> -               goto out_put_channel;
> +       if (data->client->irq) {
> +               ret =3D sx9310_disable_irq(data, SX9310_CONVDONE_IRQ);
> +               if (ret)
> +                       goto out_put_channel;
> +       }
> =20
>         ret =3D sx9310_put_read_channel(data, chan->channel);
>         if (ret < 0)
> @@ -414,7 +418,8 @@ static int sx9310_read_proximity(struct sx9310_data *=
data,
>         return IIO_VAL_INT;
> =20
>  out_disable_irq:
> -       sx9310_disable_irq(data, SX9310_CONVDONE_IRQ);
> +       if (data->client->irq)
> +               sx9310_disable_irq(data, SX9310_CONVDONE_IRQ);

And so this isn't duplicated check.

>  out_put_channel:
>         sx9310_put_read_channel(data, chan->channel);
>  out:
