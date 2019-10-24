Return-Path: <SRS0=F2+Z=YR=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14E82CA9EAF
	for <linux-devicetree@archiver.kernel.org>; Thu, 24 Oct 2019 08:40:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DB7732166E
	for <linux-devicetree@archiver.kernel.org>; Thu, 24 Oct 2019 08:40:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="wLp4a/FK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729882AbfJXIkh (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 24 Oct 2019 04:40:37 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:32983 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727079AbfJXIkh (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 24 Oct 2019 04:40:37 -0400
Received: by mail-oi1-f194.google.com with SMTP id a15so19945345oic.0
        for <devicetree@vger.kernel.org>; Thu, 24 Oct 2019 01:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=5Y29lD+y9l/40N9G63aNd4c0N7+v5qWTjbp0NVdCeOg=;
        b=wLp4a/FKLuZENk8SpoANfK1nShox9EtxU3KWDa3FJ1zYjsrPl/BdiwePnYqSTdESIp
         CiZIk4b5RxbfIStHyryHPw6gkBsgMPb60+heqTDwReQhuAkSXvQN9/lxSuqzOBxl4l3W
         vBQw6+gBiCDheqvjQhPO9asq5PPkB3ajlVNQgAW9TRB3bI1jSqveF4LjCZRuAFJDLSnO
         3OPBUIT1hidybdTEUcY+y2kdNO2I4EM0Hf4GdCbrZ8Xdur4JTn/7mWSkYH88KlPzYWO7
         SDTkJ0NM2dzPfD3OegIKOvAMlU7exbrbYeuVMgt5yOBbBlQtC7k/9UIEY2V5yEJhcvNz
         W3Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=5Y29lD+y9l/40N9G63aNd4c0N7+v5qWTjbp0NVdCeOg=;
        b=GAsVXQlBGmhTGoWz2Xe1poJho2cz5/YMyQN3mLBOOEp8p4MemdzXm+qMSFl/PJtpkM
         7NyVhASOB004SS/gKOEHPuImyzVaWxkFEvmnkbmCJlf3NSVFGvs5D8ErqFVncH3a/HT5
         2qvTaqXt2Z/gt9Wk8O7jjmR2utmXoEO16P3ZT+kMGekcVGwuuqFuEwL7fyzzTarjKckG
         bEGw8njL8RTvnMhNGSwA0vQsjghM/ye5wgtN5y893rcXK3Vap502CCE9c+a7dvnDXVmK
         yVT3WK3DpZoqltmf1WTmP60OE7x0zhD3baqlcWpcM2ZINccnXaEOBBkqiGlAgZu2NnN2
         Zi2A==
X-Gm-Message-State: APjAAAXAWIMFfmvqXnxV+b2sxVqbvovTfI7ZIW6Eu4kH85f+i89qil/1
        gUjxYO2Vtq9OM5lwJIh2yu92vWUsUeTpEpid2xJv1g==
X-Google-Smtp-Source: APXvYqxTxGzNpy22nwQY93zxqZs/zaEL0qNI+Xe6geb5S+xcx7ydhArgCEHxPRxNlv3KpQyTiZzq5x90BHW+X8sV8rE=
X-Received: by 2002:aca:451:: with SMTP id 78mr2406191oie.170.1571906435377;
 Thu, 24 Oct 2019 01:40:35 -0700 (PDT)
MIME-Version: 1.0
References: <20191018082557.3696-1-bibby.hsieh@mediatek.com>
 <20191018082557.3696-2-bibby.hsieh@mediatek.com> <CAMpxmJW_HQnL8i5FnKcVUs=ZyrnaFe6X+oqG38-v=O05d5vNxw@mail.gmail.com>
 <CAAFQd5CA_53uDo6QdRcvqJ5shUG5K25f+WXCn9OYMHfSgwLMSA@mail.gmail.com>
In-Reply-To: <CAAFQd5CA_53uDo6QdRcvqJ5shUG5K25f+WXCn9OYMHfSgwLMSA@mail.gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 24 Oct 2019 10:40:24 +0200
Message-ID: <CAMpxmJWzEER4iBo9-WhmumuH1nmWYvy=xud+=7wzp3op8-P7uw@mail.gmail.com>
Subject: Re: [PATCH v2] dt-binding: eeprom: at24: add supply properties
To:     Tomasz Figa <tfiga@chromium.org>
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

czw., 24 pa=C5=BA 2019 o 09:02 Tomasz Figa <tfiga@chromium.org> napisa=C5=
=82(a):
>
> On Thu, Oct 24, 2019 at 3:22 PM Bartosz Golaszewski
> <bgolaszewski@baylibre.com> wrote:
> >
> > pt., 18 pa=C5=BA 2019 o 10:26 Bibby Hsieh <bibby.hsieh@mediatek.com> na=
pisa=C5=82(a):
> > >
> > > In some platforms, they disable the power-supply of eeprom and i2c du=
e
> > > to power consumption reduction.
> > >
> > > This patch add two supply properties: vcc-supply, i2c-supply.
> > >
> > > Changes since v1:
> > >  - change supply name
> > >  - rebase to next
> > >
> > > Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> > > ---
> > >  Documentation/devicetree/bindings/eeprom/at24.yaml | 8 ++++++++
> > >  1 file changed, 8 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/Doc=
umentation/devicetree/bindings/eeprom/at24.yaml
> > > index e8778560d966..578487a5d9b7 100644
> > > --- a/Documentation/devicetree/bindings/eeprom/at24.yaml
> > > +++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
> > > @@ -167,6 +167,14 @@ properties:
> > >      minimum: 1
> > >      maximum: 8
> > >
> > > +  vcc-supply:
> > > +    description:
> > > +      phandle of the regulator that provides the supply voltage.
> > > +
> > > +  i2c-sypply:
> > > +    description:
> > > +      phandle to the regulator that provides power to i2c.
> > > +
> >
> > Something was bothering me about this patch so I came back to take a
> > look. Can you explain what i2c actually stands for in this doc? I hope
> > I'm misinterpreting something and it isn't that the driver disables
> > the regulator powering the i2c bus controller?
>
> In our case it's the regulator that the I2C bus is pulled up to.
>

Then it has nothing to do with a generic EEPROM driver IMO. I think
you need to add the control for this regulator to your i2c controller
driver and create a power domain where the EEPROM would be lower in
hierarchy.

Bart

> Best regards,
> Tomasz
