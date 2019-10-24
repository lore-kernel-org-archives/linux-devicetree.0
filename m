Return-Path: <SRS0=F2+Z=YR=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2FC5CA9EAF
	for <linux-devicetree@archiver.kernel.org>; Thu, 24 Oct 2019 07:02:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9403E21655
	for <linux-devicetree@archiver.kernel.org>; Thu, 24 Oct 2019 07:02:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JKPsHkAt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406819AbfJXHCD (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 24 Oct 2019 03:02:03 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:39719 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406799AbfJXHCD (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 24 Oct 2019 03:02:03 -0400
Received: by mail-ed1-f67.google.com with SMTP id l25so6537013edt.6
        for <devicetree@vger.kernel.org>; Thu, 24 Oct 2019 00:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=r1ealINk/vBRs5MHLxZSAqk1WNqkm8mFEDI5kSywayY=;
        b=JKPsHkAtPtqdS4hoUEvmPxLvcGdqwQdaJIuY4oHxot8PcoK8c6dIW5R9L1oqyL3MW5
         V9jc3MkFg+uou+UOTA7wWD7qZ1+ohFI39luRmS5AUloEQtWrLJg5WtXqLd++nEpOxQAM
         QxyQrvmD/GQpM7AW99oufP2zUm6K/3fsH6oYc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=r1ealINk/vBRs5MHLxZSAqk1WNqkm8mFEDI5kSywayY=;
        b=QVbQeyBBY2A7VcZvAvUGvLuVUDMVSjTdAjidOKo8GC4qpcEUDpyl0pFc8WG1Ss9bYK
         GvYUH2HF18LJZ7CNnGQoVcZwre1CPLRiZT67P/sFTc5eJk3X0weprSNl5abti9SqQJ5i
         3cbua3kCRT6l/uvcXp4gk71dvZgefBgWn9jh5D/HEV0l0y9x0Hsh5lWHDZPegjPCZi1o
         RadAPU108EUvnPpkZ8H++PeW/kZi6yQERRVXuByJNZLcCtuhebgveOfz9n/Y2TtgJfBq
         86PHQAfCEDkmdwkDGB5qkmfA5XxODRPdywnmMxwv1IcbbeuUIZ7nJUykTghTxIDVYDtR
         iVnA==
X-Gm-Message-State: APjAAAUpHcLT9wgOMSeDqmOW90d+WeWlua8dHenS01m7bIUSC9JIyQWs
        thOSYodcnTfw1ph342udjgOEh+MuWriQJQ==
X-Google-Smtp-Source: APXvYqxbBTyOzw9vcTwHoErs6CbcFuTXhzxuli0jhiL17j7c8MNf+1/6ewHo9H9eb2wze07OS5aybQ==
X-Received: by 2002:a17:906:31c1:: with SMTP id f1mr6061709ejf.242.1571900521234;
        Thu, 24 Oct 2019 00:02:01 -0700 (PDT)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com. [209.85.128.47])
        by smtp.gmail.com with ESMTPSA id i5sm806376edv.29.2019.10.24.00.01.59
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Oct 2019 00:02:00 -0700 (PDT)
Received: by mail-wm1-f47.google.com with SMTP id w9so190621wmm.5
        for <devicetree@vger.kernel.org>; Thu, 24 Oct 2019 00:01:59 -0700 (PDT)
X-Received: by 2002:a1c:a516:: with SMTP id o22mr3591177wme.116.1571900519274;
 Thu, 24 Oct 2019 00:01:59 -0700 (PDT)
MIME-Version: 1.0
References: <20191018082557.3696-1-bibby.hsieh@mediatek.com>
 <20191018082557.3696-2-bibby.hsieh@mediatek.com> <CAMpxmJW_HQnL8i5FnKcVUs=ZyrnaFe6X+oqG38-v=O05d5vNxw@mail.gmail.com>
In-Reply-To: <CAMpxmJW_HQnL8i5FnKcVUs=ZyrnaFe6X+oqG38-v=O05d5vNxw@mail.gmail.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 24 Oct 2019 16:01:47 +0900
X-Gmail-Original-Message-ID: <CAAFQd5CA_53uDo6QdRcvqJ5shUG5K25f+WXCn9OYMHfSgwLMSA@mail.gmail.com>
Message-ID: <CAAFQd5CA_53uDo6QdRcvqJ5shUG5K25f+WXCn9OYMHfSgwLMSA@mail.gmail.com>
Subject: Re: [PATCH v2] dt-binding: eeprom: at24: add supply properties
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Bibby Hsieh <bibby.hsieh@mediatek.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-devicetree <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Oct 24, 2019 at 3:22 PM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
>
> pt., 18 pa=C5=BA 2019 o 10:26 Bibby Hsieh <bibby.hsieh@mediatek.com> napi=
sa=C5=82(a):
> >
> > In some platforms, they disable the power-supply of eeprom and i2c due
> > to power consumption reduction.
> >
> > This patch add two supply properties: vcc-supply, i2c-supply.
> >
> > Changes since v1:
> >  - change supply name
> >  - rebase to next
> >
> > Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> > ---
> >  Documentation/devicetree/bindings/eeprom/at24.yaml | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/Docum=
entation/devicetree/bindings/eeprom/at24.yaml
> > index e8778560d966..578487a5d9b7 100644
> > --- a/Documentation/devicetree/bindings/eeprom/at24.yaml
> > +++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
> > @@ -167,6 +167,14 @@ properties:
> >      minimum: 1
> >      maximum: 8
> >
> > +  vcc-supply:
> > +    description:
> > +      phandle of the regulator that provides the supply voltage.
> > +
> > +  i2c-sypply:
> > +    description:
> > +      phandle to the regulator that provides power to i2c.
> > +
>
> Something was bothering me about this patch so I came back to take a
> look. Can you explain what i2c actually stands for in this doc? I hope
> I'm misinterpreting something and it isn't that the driver disables
> the regulator powering the i2c bus controller?

In our case it's the regulator that the I2C bus is pulled up to.

Best regards,
Tomasz
